export interface SocketMessageEvent {
  data: unknown;
}

export interface TurnSocket {
  readonly readyState: number;
  send(data: string): void;
  close(code?: number, reason?: string): void;
  addEventListener(
    type: "open" | "message" | "close" | "error",
    listener: (event: SocketMessageEvent) => void,
  ): void;
}

export type TurnSocketFactory = (url: string) => TurnSocket;

export const SOCKET_CONNECTING = 0;
export const SOCKET_OPEN = 1;

export function browserSocketFactory(url: string): TurnSocket {
  let finalUrl = url;
  if (typeof window !== "undefined") {
    const loc = window.location;
    const wsProto = loc.protocol === "https:" ? "wss:" : "ws:";
    const backendPort = "8001";
    if (finalUrl.startsWith("/")) {
      finalUrl = `${wsProto}//${loc.hostname}:${backendPort}${finalUrl}`;
    } else if (loc.port && loc.port !== backendPort && finalUrl.includes(`:${loc.port}`)) {
      finalUrl = finalUrl.replace(`:${loc.port}`, `:${backendPort}`);
    }
  }
  return new WebSocket(finalUrl) as unknown as TurnSocket;
}
