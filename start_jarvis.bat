@echo off
REM Windows launcher for JARVIS
setlocal ENABLEDELAYEDEXPANSION
cd /d "%~dp0"

set PYTHONIOENCODING=utf-8
set JARVIS_CLI=1
set JARVIS_SKIP_CLAP_GATE=1

set SYSTEM_PYTHON=python
where %SYSTEM_PYTHON% >nul 2>nul
if errorlevel 1 (
  set SYSTEM_PYTHON=py
)

if not exist ".venv\Scripts\python.exe" (
  echo [JARVIS] Creating virtual environment in .venv...
  %SYSTEM_PYTHON% -m venv .venv
  echo [JARVIS] Installing dependencies...
  ".venv\Scripts\python.exe" -m pip install --upgrade pip
  ".venv\Scripts\python.exe" -m pip install -r requirements.txt
)

if not exist ".env" (
  if exist ".env.example" (
    echo [JARVIS] Creating .env from .env.example...
    copy /Y .env.example .env >nul
  )
)

echo [JARVIS] Starting JARVIS UI...
".venv\Scripts\python.exe" main.py
if errorlevel 1 (
  echo.
  echo [JARVIS] Error starting program. Press any key to exit.
  pause
)
endlocal
