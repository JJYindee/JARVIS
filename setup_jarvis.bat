@echo off
setlocal
cd /d "%~dp0"
set PYTHONIOENCODING=utf-8

set PYTHON_BIN=python
where %PYTHON_BIN% >nul 2>nul
if errorlevel 1 (
  set PYTHON_BIN=py
)

%PYTHON_BIN% scripts\setup_jarvis.py
if errorlevel 1 (
  echo.
  echo [JARVIS] Setup failed.
  pause
  exit /b 1
)
echo.
echo [JARVIS] Setup completed! Double-click start_jarvis.bat to launch.
pause
