@ECHO OFF

@REM ウィンドウタイトル設定
TITLE ARK: Survival Ascended Save Data Backup

@REM スクリプト実行パスの取得
SET SCRIPT_PATH=%~dp0

@REM ====1====+====2====+====3====+====4====+====5====+====6====+====7====+====8====+====9====+====0
@REM 設定項目
@REM ====1====+====2====+====3====+====4====+====5====+====6====+====7====+====8====+====9====+====0
@REM ARK SAのインストールされているディレクトリ
SET PATH_ARKSA=%ProgramFiles(x86)%\Steam\steamapps\common\ARK Survival Ascended

@REM バックアップファイルの保存先ディレクトリ
SET PATH_BACKUP=%APPDATA%\ArkSEClientBackup

@REM ====1====+====2====+====3====+====4====+====5====+====6====+====7====+====8====+====9====+====0
@REM バックアップ先フォルダを作成する
@REM ====1====+====2====+====3====+====4====+====5====+====6====+====7====+====8====+====9====+====0
MKDIR "%PATH_BACKUP%"

@REM バックアップファイル名作成
SET TIME2=%time: =0%
SET year=%date:~0,4%
SET month=%date:~5,2%
SET day=%date:~8,2%
SET hour=%TIME2:~0,2%
SET minute=%TIME2:~3,2%
SET PATH_BACKUP_ARCHIVE=%PATH_BACKUP%\ClientUserFile-%year%%month%%day%-%hour%%minute%.zip
ECHO バックアップの保存先は「%PATH_BACKUP_ARCHIVE%」です。

@REM セーブディレクトリへ移動して処理を実行
SET PATH_SAVE=%PATH_ARKSA%\ShooterGame\Saved
pushd %PATH_SAVE%
powershell compress-archive ".\LocalProfiles\PlayerLocalData.arkprofile,.\Config\Windows\GameUserSettings.ini,.\Config\Windows\Input.ini" "%PATH_BACKUP_ARCHIVE%"
popd
