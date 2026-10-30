@echo off
title DeepTutor Real-Time Log Monitor
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0monitor_logs.ps1"
pause
