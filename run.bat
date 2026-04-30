@echo off
setlocal

cd /d "%~dp0"

where py >nul 2>nul
if %errorlevel%==0 (
    set "PYTHON_CMD=py -3"
) else (
    where python >nul 2>nul
    if errorlevel 1 (
        echo Python을 찾을 수 없습니다.
        echo https://www.python.org/downloads/ 에서 Python을 설치하고
        echo 설치 화면에서 "Add python.exe to PATH"를 체크해 주세요.
        pause
        exit /b 1
    )
    set "PYTHON_CMD=python"
)

if not exist ".venv\Scripts\python.exe" (
    echo 가상환경을 생성합니다...
    %PYTHON_CMD% -m venv .venv
    if errorlevel 1 goto error
)

if not exist ".venv\.srtgo-installed" (
    echo 필요한 패키지를 설치합니다...
    ".venv\Scripts\python.exe" -m pip install -e .
    if errorlevel 1 goto error
    echo installed > ".venv\.srtgo-installed"
)

".venv\Scripts\srtgo.exe"
goto end

:error
echo.
echo 실행 준비 중 오류가 발생했습니다.
echo 인터넷 연결, Python 설치 여부를 확인한 뒤 다시 실행해 주세요.

:end
pause
