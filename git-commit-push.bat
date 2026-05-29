@echo off
chcp 65001 >nul
title Git 一键提交推送

echo ========================================
echo   Git 一键提交 + 推送
echo ========================================
echo.

:: 检查 git 是否安装
where git >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo [错误] 未找到 git，请先安装 Git for Windows
    pause
    exit /b 1
)

:: 检查是否有远程仓库
git remote -v | findstr origin >nul
if %ERRORLEVEL% NEQ 0 (
    echo [错误] 未配置远程仓库 (origin)，请先 git remote add
    pause
    exit /b 1
)

:: 显示当前状态
echo [信息] 当前仓库状态：
git status --short
echo.

:: 判断是否有变更（含未追踪文件）
git status --porcelain | findstr . >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo [提示] 工作区干净，没有需要提交的变更。
    echo        若要强制推送空提交，请使用: git commit --allow-empty
    pause
    exit /b 0
)

:: 暂存所有变更
echo [操作] 暂存所有变更...
git add -A
if %ERRORLEVEL% NEQ 0 (
    echo [错误] git add 失败
    pause
    exit /b 1
)

:: 构造提交信息
set "MSG=%~1"
if "%MSG%"=="" (
    for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /value ^| find "="') do set DT=%%I
    if not "%DT%"=="" (
        set "MSG=日常同步 %DT:~0,4%-%DT:~4,2%-%DT:~6,2% %DT:~8,2%:%DT:~10,2%"
    ) else (
        set "MSG=日常同步"
    )
)

:: 提交
echo [操作] 提交变更...
git commit -m "%MSG%"
if %ERRORLEVEL% NEQ 0 (
    echo [错误] git commit 失败（可能是提交信息为空）
    pause
    exit /b 1
)

:: 推送到远程
echo [操作] 推送到远程 (origin)...
git push origin
if %ERRORLEVEL% NEQ 0 (
    echo [错误] git push 失败，请检查网络/认证
    pause
    exit /b 1
)

echo.
echo ========================================
echo   ✓ 完成！变更已提交并推送到远程
echo   提交信息: %MSG%
echo ========================================
pause
