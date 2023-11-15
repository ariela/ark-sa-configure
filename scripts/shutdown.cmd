@ECHO OFF

@REM �E�B���h�E�^�C�g���ݒ�
TITLE ARK: Survival Ascended Shutdown

@REM �ϐ��W�J
SETLOCAL enabledelayedexpansion
for /f "tokens=1,* delims==" %%a in (setting.ini) do (
    SET %%a=%%b
)

@REM �X�N���v�g���s�p�X�̎擾
SET SCRIPT_PATH=%~dp0

@REM ====1====+====2====+====3====+====4====+====5====+====6====+====7====+====8====+====9====+====0
@REM �V���b�g�_�E������
@REM ====1====+====2====+====3====+====4====+====5====+====6====+====7====+====8====+====9====+====0
tasklist | find "ArkAscendedServer.exe" > NUL
if %ERRORLEVEL% == 0 (
    ECHO �T�[�o�[�V���b�g�_�E���������J�n
    CALL :RCON "ServerChat Shutdown after %SHUTDOWN_WAIT_MINUTES% minutes."

    FOR /l %%n IN (5, -1, 2) DO (
        ECHO * �ċN���܂ł��� %%n ��
        CALL :RCON "ServerChat Server shutdown in %%n minutes."
        timeout /t 60 /nobreak > NUL
    )

    FOR /l %%n IN (60, -15, 30) DO (
        ECHO * �ċN���܂ł��� %%n �b
        CALL :RCON "ServerChat Server shutdown in %%n seconds."
        timeout /t 15 /nobreak > NUL
    )

    FOR /l %%n IN (15, -1, 1) DO (
        ECHO * �ċN���܂ł��� %%n �b
        CALL :RCON "ServerChat Server shutdown in %%n seconds."
        timeout /t 1 /nobreak > NUL
    )

    ECHO * �T�[�o�[�̃V���b�g�_�E�������s
    CALL :RCON "DoExit"
)

@REM ====1====+====2====+====3====+====4====+====5====+====6====+====7====+====8====+====9====+====0
@REM RCON���s�֐�
@REM ====1====+====2====+====3====+====4====+====5====+====6====+====7====+====8====+====9====+====0
:RCON
%RCON_PATH%\rcon.exe -a 127.0.0.1:%RCON_SERVER_PORT% -p %SERVER_ADMIN_PASSWORD% "%~1" > NUL
exit /b %ERRORLEVEL%
