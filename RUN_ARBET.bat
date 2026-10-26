@echo off
setlocal
cd /d "%~dp0"
title ARBET Live Score Alert

echo ========================================
echo       ARBET Live Score Alert Bot
echo ========================================
echo.

where node >nul 2>nul
if errorlevel 1 (
  echo ERROR: Node.js is not installed or not in PATH.
  echo Install the LTS version from https://nodejs.org/ then reopen this file.
  pause
  exit /b 1
)

if not exist ".env" (
  echo ERROR: .env file not found in this folder.
  echo Copy .env.example to .env and fill in your Telegram bot token and chat ID.
  pause
  exit /b 1
)

if not exist "node_modules" (
  echo Installing required packages for the first run...
  call npm install
  if errorlevel 1 (
    echo ERROR: npm install failed. Check your internet connection and Node.js installation.
    pause
    exit /b 1
  )
)

echo.
echo Starting ARBET monitor. Keep this window open while it runs.
echo Dashboard: http://127.0.0.1:3000
echo Press Ctrl+C to stop the bot.
echo.
call npm start
set "BOT_EXIT=%ERRORLEVEL%"
echo.
if not "%BOT_EXIT%"=="0" echo The bot stopped with exit code %BOT_EXIT%.
pause
exit /b %BOT_EXIT%
