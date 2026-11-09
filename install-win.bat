@echo off
chcp 65001 >nul
REM ========================================================
REM Antigravity 2.29+ zh-Hant-TW package - install
REM ========================================================
title Antigravity 2.29+ 繁體中文套件安裝程式

echo.
echo ========================================================
echo   Antigravity 2.29+ 繁體中文（臺灣）中文化套件
echo ========================================================
echo.

REM 檢查 Node.js
echo [1/3 檢查環境] 正在檢查 Node.js...
node -v >nul 2>nul
if errorlevel 1 (
    echo.
    echo [錯誤] 找不到 Node.js！
    echo   請先安裝 Node.js LTS：https://nodejs.org/
    echo   安裝後請重新開啟此安裝程式。
    echo.
    pause
    exit /b 1
)

REM 檢查並自動安裝 @electron/asar
if not exist "%~dp0node_modules\@electron\asar\bin\asar.js" (
    echo [準備依賴] 正在自動安裝 @electron/asar 工具...
    call npm install --no-fund --no-audit
    if errorlevel 1 (
        echo.
        echo [錯誤] npm install 失敗，請確認網路連線。
        echo.
        pause
        exit /b 1
    )
)

echo.
echo [2/3 注入中文化] 正在套用 Antigravity 2.29+ 繁體中文語系...
node "%~dp0localization_engine.js" %*

if errorlevel 1 (
    echo.
    echo [錯誤] 中文化注入過程發生異常。
    echo.
    pause
    exit /b 1
)

echo.
echo ========================================================
echo [3/3 安裝完成] Antigravity 2.29+ 繁體中文套件已成功套用！
echo.
echo [提示] 請手動重啟 Antigravity（關閉後重新開啟軟體），
echo        開啟後即可看到完整的繁體中文介面。
echo ========================================================
echo.
pause
