# ARK: Survival Ascended ユーザー設定データ バックアップスクリプト

## 機能
ARK: Survival Ascended の設定ファイルと入力設定ファイルをバックアップします。

## インストール
ダウンロードした `ArkSAClientBackup.exe` を実行します。
実行すると `C:\ArkSAClientBackup` にスクリプトが展開され、フォルダが開かれます。

開いたウィンドウにある `install.cmd` をダブルクリックしインストールを行うと1時間毎にバックアップを取得します。

手動で実行したい場合はデスクトップなどに`client_backup.cmd` のショートカットを作成し、バックアップを作成したい際に起動します。


## アンインストール
`C:\ArkSAClientBackup` ディレクトリを削除してください。
自動バックアップを実施している場合はスタートメニューから`taskschd.msc`を開き、`ASA 設定バックアップ`を右クリック→削除でタスクを削除してください。

## バックアップ先
デフォルトの場合、`%APPDATA%\ArkSEClientBackup` 以下に圧縮ファイルの形式で保存されます。`%APPDATA%`は`C:\Users\＜ユーザー名＞\AppData\Roaming`を表しています。

## リストア方法
リストアしたい日時の圧縮ファイルを開き、下記場所のファイルに上書きします。

| ファイル名 | 上書き先ディレクトリ |
|-----------|---------|
| PlayerLocalData.arkprofile | C:\Program Files (x86)\Steam\steamapps\common\ARK Survival Ascended\ShooterGame\Saved\LocalProfiles |
| GameUserSettings.ini | C:\Program Files (x86)\Steam\steamapps\common\ARK Survival Ascended\ShooterGame\Saved\Config\Windows |
| Input.ini | C:\Program Files (x86)\Steam\steamapps\common\ARK Survival Ascended\ShooterGame\Saved\Config\Windows |
