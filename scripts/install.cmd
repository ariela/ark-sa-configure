@ECHO OFF

@REM 管理者権限を取得する
net session >NUL 2>nul
if %errorlevel% neq 0 (
    @powershell start-process %~0 -verb runas
    exit
)

@REM スクリプト実行パスの取得
SET SCRIPT_PATH=%~dp0

ECHO タスクスケジュール登録
SCHTASKS /Create /RU %USERNAME% /TN "ASA バックアップ" /XML %SCRIPT_PATH%\task-asa-backup.xml
SCHTASKS /Create /RU %USERNAME% /TN "ASA 再起動" /XML %SCRIPT_PATH%\task-asa-restart.xml

PAUSE