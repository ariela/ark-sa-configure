@ECHO OFF

@REM �E�B���h�E�^�C�g���ݒ�
TITLE ARK: Survival Ascended Save Data Backup

@REM �X�N���v�g���s�p�X�̎擾
SET SCRIPT_PATH=%~dp0

@REM ====1====+====2====+====3====+====4====+====5====+====6====+====7====+====8====+====9====+====0
@REM �ݒ荀��
@REM ====1====+====2====+====3====+====4====+====5====+====6====+====7====+====8====+====9====+====0
@REM ARK SA�̃C���X�g�[������Ă���f�B���N�g��
SET PATH_ARKSA=%ProgramFiles(x86)%\Steam\steamapps\common\ARK Survival Ascended

@REM �o�b�N�A�b�v�t�@�C���̕ۑ���f�B���N�g��
SET PATH_BACKUP=%APPDATA%\ArkSEClientBackup

@REM ====1====+====2====+====3====+====4====+====5====+====6====+====7====+====8====+====9====+====0
@REM �o�b�N�A�b�v��t�H���_���쐬����
@REM ====1====+====2====+====3====+====4====+====5====+====6====+====7====+====8====+====9====+====0
MKDIR "%PATH_BACKUP%"

@REM �o�b�N�A�b�v�t�@�C�����쐬
SET TIME2=%time: =0%
SET year=%date:~0,4%
SET month=%date:~5,2%
SET day=%date:~8,2%
SET hour=%TIME2:~0,2%
SET minute=%TIME2:~3,2%
SET PATH_BACKUP_ARCHIVE=%PATH_BACKUP%\ClientUserFile-%year%%month%%day%-%hour%%minute%.zip
ECHO �o�b�N�A�b�v�̕ۑ���́u%PATH_BACKUP_ARCHIVE%�v�ł��B

@REM �Z�[�u�f�B���N�g���ֈړ����ď��������s
SET PATH_SAVE=%PATH_ARKSA%\ShooterGame\Saved
pushd %PATH_SAVE%
powershell compress-archive ".\LocalProfiles\PlayerLocalData.arkprofile,.\Config\Windows\GameUserSettings.ini,.\Config\Windows\Input.ini" "%PATH_BACKUP_ARCHIVE%"
popd
