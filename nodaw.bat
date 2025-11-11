@echo off
set CMD=%1
set IN=%2
set OUT=%3
if "%CMD%"=="" (
  powershell -ExecutionPolicy Bypass -File "%~dp0..\bin\nodaw.ps1" --help
  exit /b 0
)
powershell -ExecutionPolicy Bypass -File "%~dp0..\bin\nodaw.ps1" %CMD% "%IN%" "%OUT%"
