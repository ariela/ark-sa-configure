@ECHO OFF

@REM �Ǘ��Ҍ������擾����
net session >NUL 2>nul
if %errorlevel% neq 0 (
    @powershell start-process %~0 -verb runas
    exit
)

@REM �X�N���v�g���s�p�X�̎擾
SET SCRIPT_PATH=%~dp0

ECHO �^�X�N�X�P�W���[���o�^
SCHTASKS /Create /RU %USERNAME% /TN "ASA �ݒ�o�b�N�A�b�v" /XML %SCRIPT_PATH%\task.xml

PAUSE