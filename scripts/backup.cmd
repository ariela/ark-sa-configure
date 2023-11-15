@ECHO OFF


@REM �E�B���h�E�^�C�g���ݒ�
TITLE ARK: Survival Ascended Backup

@REM �ϐ��W�J
SETLOCAL enabledelayedexpansion
for /f "tokens=1,* delims==" %%a in (setting.ini) do (
    SET %%a=%%b
)

@REM �X�N���v�g���s�p�X�̎擾
SET SCRIPT_PATH=%~dp0

@REM ====1====+====2====+====3====+====4====+====5====+====6====+====7====+====8====+====9====+====0
@REM �o�b�N�A�b�v��t�H���_���쐬����
@REM ====1====+====2====+====3====+====4====+====5====+====6====+====7====+====8====+====9====+====0
MKDIR "%PATH_BACKUP%\%MAP_NAME%"

@REM ====1====+====2====+====3====+====4====+====5====+====6====+====7====+====8====+====9====+====0
@REM �o�b�N�A�b�v����
@REM ====1====+====2====+====3====+====4====+====5====+====6====+====7====+====8====+====9====+====0
ECHO �f�[�^��ۑ���
CALL :RCON "SaveWorld"
timeout /t 5 /nobreak > NUL

SET MAP_DATA_PATH=%PATH_SERVER%\ShooterGame\Saved\SavedArks\%MAP_NAME%
SET TIME2=%time: =0%
SET year=%date:~0,4%
SET month=%date:~5,2%
SET day=%date:~8,2%
SET hour=%TIME2:~0,2%
SET minute=%TIME2:~3,2%

ECHO �o�b�N�A�b�v�f�[�^�̈��k�t�@�C�����쐬��
powershell compress-archive %MAP_DATA_PATH%\*.arkprofile,%MAP_DATA_PATH%\*.arktribe,%MAP_DATA_PATH%\%MAP_NAME%.ark %PATH_BACKUP%\%MAP_NAME%\%MAP_NAME%-%year%%month%%day%-%hour%%minute%.zip

@REM ====1====+====2====+====3====+====4====+====5====+====6====+====7====+====8====+====9====+====0
@REM RCON���s�֐�
@REM ====1====+====2====+====3====+====4====+====5====+====6====+====7====+====8====+====9====+====0
:RCON
%RCON_PATH%\rcon.exe -a 127.0.0.1:%RCON_SERVER_PORT% -p %SERVER_ADMIN_PASSWORD% "%~1" > NUL
exit /b %ERRORLEVEL%
