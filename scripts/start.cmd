@ECHO OFF

@REM �E�B���h�E�^�C�g���ݒ�
TITLE ARK: Survival Ascended Start

@REM �ϐ��W�J
SETLOCAL enabledelayedexpansion
for /f "tokens=1,* delims==" %%a in (setting.ini) do (
    SET %%a=%%b
)

@REM �X�N���v�g���s�p�X�̎擾
SET SCRIPT_PATH=%~dp0

@REM ====1====+====2====+====3====+====4====+====5====+====6====+====7====+====8====+====9====+====0
@REM �N������
@REM ====1====+====2====+====3====+====4====+====5====+====6====+====7====+====8====+====9====+====0
tasklist | find "ArkAscendedServer.exe" > NUL
if %ERRORLEVEL% == 1 (
    @REM ====1====+====2====+====3====+====4====+====5====+====6====+====7====+====8====+====9====+====0
    @REM �T�[�o�[�̍X�V�E�`�F�b�N����
    @REM ====1====+====2====+====3====+====4====+====5====+====6====+====7====+====8====+====9====+====0
    cd %PATH_STEAMCMD%
    steamcmd.exe +force_install_dir "%PATH_SERVER%" +login anonymous +app_update 2430930 validate +quit

    @REM ====1====+====2====+====3====+====4====+====5====+====6====+====7====+====8====+====9====+====0
    @REM �T�[�o�[�̋N������
    @REM ====1====+====2====+====3====+====4====+====5====+====6====+====7====+====8====+====9====+====0
    cd %PATH_SERVER%\ShooterGame\Binaries\Win64
    echo �T�[�o�[�N��������
    timeout /t 1 /nobreak > NUL
    start ArkAscendedServer.exe %MAP_NAME%?listen?SessionName=%SERVER_NAME%?ServerPassword=%SERVER_PASSWORD%?ServerAdminPassword=%SERVER_ADMIN_PASSWORD%?Port=7777?QueryPort=27015?MaxPlayers=%MAX_PLAYERS% -WinLiveMaxPlayers=%MAX_PLAYERS% -servergamelog --mods=928793
)
