@echo off
chcp 65001 >nul
cd /d "%~dp0"
set "PYTHONPATH=%~dp0.pylibs"
set PYTHONIOENCODING=utf-8
set PY=D:\dev\python\python.exe
echo 正在启动 桌面便签 Lite（保留控制台，方便看报错）...
"%PY%" "%~dp0main.py" %*
echo.
echo 退出代码: %ERRORLEVEL%
pause
