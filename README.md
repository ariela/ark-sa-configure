# ARK: Survival Ascended Dedicated Server 管理用
## ほぼ標準設定ファイル
`/default` に配置しているのはほぼデフォルト設定のiniファイル

## 管理用スクリプト
NITRADOではなく、個人のマシンでサーバーを作成しているときに使えるスクリプト

| ファイル名 | 用途 |
|------------|------|
| /scripts/install.cmd | 自動バックアップと自動再起動のタスクを登録する |
| /scripts/backup.vbs | 自動バックアップタスク実行用のラッパースクリプト |
| /scripts/restart.vbs | 自動再起動タスク実行用のラッパースクリプト |
| /scripts/backup.cmd | バックアップ処理を実行するバッチ |
| /scripts/start.cmd | サーバーを起動するためのバッチ |
| /scripts/shutdown.cmd | サーバーを停止するためのバッチ（一定時間待って終了）|
| /scripts/restart.cmd | サーバーを再起動するためのバッチ（shutdown.cmd → start.cmdを実行）|
| /scripts/setting.ini | サーバー情報等を定義するファイル |
| /scripts/task-asa-backup.xml | 自動バックアップタスク タスクスケジューラ登録用定義 |
| /scripts/task-asa-restart.xml | 自動再起動タスク タスクスケジューラ登録用定義 |
