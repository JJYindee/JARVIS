@echo off
REM Windows launcher for JARVIS
setlocal ENABLEDELAYEDEXPANSION
cd /d "%~dp0"

set PYTHONIOENCODING=utf-8
set JARVIS_CLI=1
set JARVIS_SKIP_CLAP_GATE=1

set PYTHON_BIN=python
where %PYTHON_BIN% >nul 2>nul
if errorlevel 1 (
  set PYTHON_BIN=py
)

if not exist ".venv\Scripts\python.exe" (
  echo [JARVIS] Creating virtual environment in .venv...
  %PYTHON_BIN% -m venv .venv
)

call .venv\Scripts\activate.bat

if not exist ".env" (
  if exist ".env.example" (
    echo [JARVIS] Creating .env from .env.example...
    copy /Y .env.example .env >nul
  )
)

echo [JARVIS] Starting JARVIS UI...
python main.py
if errorlevel 1 (
  echo.
  echo [JARVIS] Error starting program. Press any key to exit.
  pause
)
endlocal
