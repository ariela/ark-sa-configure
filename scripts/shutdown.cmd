@ECHO OFF

@REM ウィンドウタイトル設定
TITLE ARK: Survival Ascended Shutdown

@REM 変数展開
SETLOCAL enabledelayedexpansion
for /f "tokens=1,* delims==" %%a in (setting.ini) do (
    SET %%a=%%b
)

@REM スクリプト実行パスの取得
SET SCRIPT_PATH=%~dp0

@REM ====1====+====2====+====3====+====4====+====5====+====6====+====7====+====8====+====9====+====0
@REM シャットダウン処理
@REM ====1====+====2====+====3====+====4====+====5====+====6====+====7====+====8====+====9====+====0
tasklist | find "ArkAscendedServer.exe" > NUL
if %ERRORLEVEL% == 0 (
    ECHO サーバーシャットダウン処理を開始
    CALL :RCON "ServerChat Shutdown after %SHUTDOWN_WAIT_MINUTES% minutes."

    FOR /l %%n IN (5, -1, 2) DO (
        ECHO * 再起動まであと %%n 分
        CALL :RCON "ServerChat Server shutdown in %%n minutes."
        timeout /t 60 /nobreak > NUL
    )

    FOR /l %%n IN (60, -15, 30) DO (
        ECHO * 再起動まであと %%n 秒
        CALL :RCON "ServerChat Server shutdown in %%n seconds."
        timeout /t 15 /nobreak > NUL
    )

    FOR /l %%n IN (15, -1, 1) DO (
        ECHO * 再起動まであと %%n 秒
        CALL :RCON "ServerChat Server shutdown in %%n seconds."
        timeout /t 1 /nobreak > NUL
    )

    ECHO * サーバーのシャットダウンを実行
    CALL :RCON "DoExit"
)

@REM ====1====+====2====+====3====+====4====+====5====+====6====+====7====+====8====+====9====+====0
@REM RCON実行関数
@REM ====1====+====2====+====3====+====4====+====5====+====6====+====7====+====8====+====9====+====0
:RCON
%RCON_PATH%\rcon.exe -a 127.0.0.1:%RCON_SERVER_PORT% -p %SERVER_ADMIN_PASSWORD% "%~1" > NUL
exit /b %ERRORLEVEL%
