# Real-time Log Monitor for DeepTutor
$Host.UI.RawUI.WindowTitle = "DeepTutor Real-Time Log Monitor"
Clear-Host
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "       DEEPTUTOR REAL-TIME PROCESS & LOG MONITOR          " -ForegroundColor Yellow
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "Memantau log aktivitas backend, LLM call, dan error..." -ForegroundColor Gray
Write-Host "Tekan Ctrl + C untuk keluar.`n" -ForegroundColor DarkGray

$LogPath = Join-Path $PSScriptRoot "data\user\logs\deeptutor.jsonl"
$TaskLog = "C:\Users\Isparmo\.gemini\antigravity-ide\brain\6e744561-624a-4ab9-9b10-62bab1a9a29a\.system_generated\tasks\task-506.log"

# Function to parse and format log line
function Format-LogLine($line) {
    if ([string]::IsNullOrWhiteSpace($line)) { return }
    
    # Check if JSON log from deeptutor.jsonl
    if ($line.Trim().StartsWith("{") -and $line.Trim().EndsWith("}")) {
        try {
            $obj = $line | ConvertFrom-Json
            $time = if ($obj.timestamp) { ([datetime]$obj.timestamp).ToLocalTime().ToString("HH:mm:ss") } else { "NOW" }
            $lvl = $obj.level
            $logger = $obj.logger
            $msg = $obj.message

            switch ($lvl) {
                "ERROR" {
                    Write-Host "[$time] [ERROR] " -ForegroundColor Red -NoNewline
                    Write-Host "($logger) $msg" -ForegroundColor Red
                    if ($obj.exception) {
                        Write-Host "    └─ $($obj.exception.Split("`n")[0])" -ForegroundColor DarkRed
                    }
                }
                "WARNING" {
                    if ($msg -match "429" -or $msg -match "quota" -or $msg -match "RateLimit") {
                        Write-Host "[$time] [QUOTA EXCEEDED / 429] " -ForegroundColor Magenta -NoNewline
                        Write-Host "$msg" -ForegroundColor Magenta
                    } elseif ($msg -match "retrying in") {
                        Write-Host "[$time] [RETRY BACKOFF] " -ForegroundColor Yellow -NoNewline
                        Write-Host "$msg" -ForegroundColor Yellow
                    } else {
                        Write-Host "[$time] [WARN] " -ForegroundColor Yellow -NoNewline
                        Write-Host "($logger) $msg" -ForegroundColor DarkYellow
                    }
                }
                "INFO" {
                    Write-Host "[$time] [INFO] " -ForegroundColor Green -NoNewline
                    Write-Host "($logger) $msg" -ForegroundColor Gray
                }
                default {
                    Write-Host "[$time] [$lvl] ($logger) $msg" -ForegroundColor White
                }
            }
            return
        } catch {}
    }

    # Raw console lines
    if ($line -match "429" -or $line -match "RESOURCE_EXHAUSTED" -or $line -match "RateLimitError") {
        Write-Host "[API QUOTA 429] $line" -ForegroundColor Magenta
    } elseif ($line -match "error" -or $line -match "Exception" -or $line -match "Traceback") {
        Write-Host "[ERROR] $line" -ForegroundColor Red
    } elseif ($line -match "WARNING") {
        Write-Host "[WARN]  $line" -ForegroundColor Yellow
    } elseif ($line -match "WebSocket") {
        Write-Host "[WS]    $line" -ForegroundColor Cyan
    } elseif ($line -match "POST" -or $line -match "GET") {
        Write-Host "[HTTP]  $line" -ForegroundColor DarkCyan
    } else {
        Write-Host "        $line" -ForegroundColor DarkGray
    }
}

# Show initial 15 lines if exists
if (Test-Path $LogPath) {
    Write-Host "--- Riwayat Log Terakhir (deeptutor.jsonl) ---" -ForegroundColor DarkCyan
    Get-Content $LogPath -Tail 15 | ForEach-Object { Format-LogLine $_ }
    Write-Host "------------------------------------------------`n" -ForegroundColor DarkCyan
}

# Live streaming monitor
if (Test-Path $TaskLog) {
    Write-Host "[*] Memulai pemantauan live log server...`n" -ForegroundColor Green
    Get-Content $TaskLog -Tail 10 -Wait | ForEach-Object { Format-LogLine $_ }
} elseif (Test-Path $LogPath) {
    Write-Host "[*] Memulai pemantauan live log deeptutor.jsonl...`n" -ForegroundColor Green
    Get-Content $LogPath -Wait | ForEach-Object { Format-LogLine $_ }
} else {
    Write-Host "[!] File log belum ditemukan. Menunggu aktivitas..." -ForegroundColor Yellow
}
