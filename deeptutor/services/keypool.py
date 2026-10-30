import logging
from threading import Lock
from time import monotonic

logger = logging.getLogger(__name__)


def _mask(key: str) -> str:
    """Mask key for safe logging (e.g., sk-1234...abcd)."""
    if not key or len(key) <= 8:
        return "***"
    return f"{key[:6]}...{key[-4:]}"


def parse_key_list(value: str | list[str] | None) -> list[str]:
    """Parse a single key, comma/semicolon/newline-separated keys, or list of keys into a clean list."""
    if not value:
        return []
    if isinstance(value, str):
        # Support comma, semicolon, or newline separated strings
        raw_parts = [
            p.strip()
            for p in value.replace("\r", "\n").replace(";", ",").replace("\n", ",").split(",")
        ]
        return [p for p in raw_parts if p]
    if isinstance(value, (list, tuple)):
        result: list[str] = []
        for item in value:
            result.extend(parse_key_list(item))
        return result
    return []


class KeyPool:
    """Rotate keys and cool a key after HTTP 429 responses."""

    def __init__(self, keys: list[str] | str, cooldown_s: int = 60) -> None:
        self._keys = parse_key_list(keys)
        if not self._keys:
            raise ValueError("KeyPool requires at least one non-empty key")
        self._cooldown_s = max(0, cooldown_s)
        self._next_index = 0
        self._strikes = {key: 0 for key in self._keys}
        self._cooldown_until = {key: 0.0 for key in self._keys}
        self._lock = Lock()
        if len(self._keys) > 1:
            logger.info("KeyPool initialized with %d keys for round-robin rotation", len(self._keys))

    def __len__(self) -> int:
        """Return the number of configured keys."""
        return len(self._keys)

    def next(self) -> str:
        """Return the next key, preferring one that is not cooling down."""
        with self._lock:
            now = monotonic()
            for offset in range(len(self._keys)):
                index = (self._next_index + offset) % len(self._keys)
                key = self._keys[index]
                if self._cooldown_until[key] > now:
                    continue
                if self._cooldown_until[key]:
                    self._cooldown_until[key] = 0.0
                    self._strikes[key] = 0
                self._next_index = (index + 1) % len(self._keys)
                if len(self._keys) > 1:
                    logger.debug(
                        "KeyPool selected key %s (slot %d/%d)",
                        _mask(key),
                        index + 1,
                        len(self._keys),
                    )
                return key
            best = min(self._keys, key=lambda candidate: self._cooldown_until[candidate])
            return best

    def mark_429(self, key: str) -> None:
        """Record a rate limit; starts cooldown."""
        with self._lock:
            if key not in self._strikes:
                return
            self._strikes[key] += 1
            # If multiple keys exist, cooldown immediately on 429 so round-robin moves to next key
            cooldown = self._cooldown_s
            self._cooldown_until[key] = monotonic() + cooldown
            logger.warning(
                "KeyPool marked 429 for key %s (strike %d); cooling down for %ds",
                _mask(key),
                self._strikes[key],
                cooldown,
            )


def primary_api_key(value: str | list[str] | None) -> str | None:
    """The one key to use where a pool cannot be rotated."""
    keys = parse_key_list(value)
    return keys[0] if keys else None


__all__ = ["KeyPool", "parse_key_list", "primary_api_key"]

