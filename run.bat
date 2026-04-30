@echo off
setlocal

pushd "%~dp0"
if errorlevel 1 goto error

set "PYTHON_CMD="

where py >nul 2>nul
if not errorlevel 1 set "PYTHON_CMD=py -3"

if "%PYTHON_CMD%"=="" (
    where python >nul 2>nul
    if not errorlevel 1 set "PYTHON_CMD=python"
)

if "%PYTHON_CMD%"=="" (
    echo Python was not found.
    echo Install Python from https://www.python.org/downloads/
    echo Make sure to check "Add python.exe to PATH" during installation.
    pause
    exit /b 1
)

if not exist ".venv\Scripts\python.exe" (
    echo Creating virtual environment...
    %PYTHON_CMD% -m venv .venv
    if errorlevel 1 goto error
)

if not exist ".venv\.traingo-installed" (
    echo Installing required packages...
    ".venv\Scripts\python.exe" -m pip install -e .
    if errorlevel 1 goto error
    echo installed > ".venv\.traingo-installed"
)

".venv\Scripts\srtgo.exe"
goto end

:error
echo.
echo Setup failed.
echo Check your internet connection and Python installation, then try again.

:end
popd
pause
