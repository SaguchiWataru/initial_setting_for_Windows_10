# Windowsの初期設定を自動で行うbatファイル

## 作成した理由

Windowsをリカバリーした際に、初期設定を行う手間を省くために作成しました。  

## 仕様

設定内容は以下の通りです
- 干渉防止
  - エクスプローラーの終了
- 電源オプション
  - 「電源プラン」を「高パフォーマンス」に変更
  - 「高速スタートアップ」を「無効」に変更
  - 「休止状態」を「有効」に変更
  - 「ディスプレイの電源を切る」を「適用しない」に変更
  - 「ディスプレイの電源を切る」を「適用しない」に変更
  - 「コンピュータをスリープ状態にする」を「適用しない」に変更
  - 「コンピュータをスリープ状態にする」を「適用しない」に変更
- スタートメニュー
  - 「ときどきスタート画面におすすめを表示する」を「無効」に変更
  - 「スタート画面またはタスク バーのジャンプ リストに最近開いた項目を表示する」を「無効」に変更
- タスクバー
  - 「タイル通知をオフにする」を「有効」に変更
  - 「ログオン時にタイル通知を削除する」を「有効」に変更
  - 「タスクバーボタンを結合する」を「結合しない」に変更
  - 「Cortanaアイコンを表示」を「有効」に変更
  - 「Cortana」を「無効」に変更
- エクスプローラー
  - 「エクスプローラで開く」を「PC」に変更
  - 「最近使ったファイルをクイック アクセスに表示する」を「無効」に変更
  - 「よく使うフォルダーをクイック アクセスに表示する」を「無効」に変更
  - 「最近開いたプログラムを「スタート」メニューに保存し表示する」を「無効」に変更
  - 「すべてのフォルダーを表示」を「有効」に変更
  - 「隠しファイル、隠しフォルダー、および隠しドライブを表示する」を「有効」に変更
  - 「登録されている拡張子は表示しない」を「無効」に変更
  - 「アイコンの自動整列」、「アイコンを等間隔に整列」を「有効」に変更
- 既定のプログラム
  - 「自動再生によってユーザーの選択内容が記憶されないようにします。」を「有効」に変更
  - 「.isoファイルを開く既定のプログラム」を「エクスプローラー」に変更
- 各種初期設定
  - 「初回サインインのアニメーションを表示する」を無効に変更
  - Internet Explorerの「初期設定ダイアログボックスを表示しない」を「有効」に変更
  - Windows Media Playerの「初期設定ダイアログ ボックスを表示しない」を「有効」に変更
- ブート
  - 「詳細ブートオプション」を「有効」に変更
- 反映
  - 再起動

OOBEの応答ファイルは、使用しているパソコンのメーカーやリカバリーメディアOSのバージョンがバラバラなので作っていません。

## ソースコード

すべての項目を反映させるには、管理者権限で実行してください。  
細心の注意を払って作成しましたが、不具合や損害を保証するものではありません。  
※Windows 10 以外のOSで実行しないでください。  

```initial_setting_for_Windows_10.bat
@echo off

echo 干渉を防ぐためにエクスプローラーを終了します。
taskkill /f /im explorer.exe
echo.

echo 「電源プラン」を「高パフォーマンス」に変更しています。
powercfg -SETACTIVE SCHEME_MIN
echo.

echo 「高速スタートアップ」を「無効」に変更しています。
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d "00000000" /f
echo.

echo 「休止状態」を「有効」に変更しています。
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" /v "ShowHibernateOption" /t REG_DWORD /d "00000001" /f
echo.

echo 「ディスプレイの電源を切る」を「適用しない」に変更しています。(電源に接続)
powercfg /x monitor-timeout-ac 0
echo.

echo 「ディスプレイの電源を切る」を「適用しない」に変更しています。(バッテリー駆動)
powercfg /x monitor-timeout-dc 0
echo.

echo 「コンピュータをスリープ状態にする」を「適用しない」に変更しています。(電源に接続)
powercfg /x standby-timeout-ac 0
echo.

echo 「コンピュータをスリープ状態にする」を「適用しない」に変更しています。(バッテリー駆動)
powercfg /x standby-timeout-dc 0
echo.

echo 「ときどきスタート画面におすすめを表示する」を「無効」に変更しています。
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d "00000000" /f
echo.

echo 「スタート画面またはタスク バーのジャンプ リストに最近開いた項目を表示する」を「無効」に変更しています。
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d "00000000" /f
echo.

echo 「タイル通知をオフにする」を「有効」に変更しています。
reg add "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotificationss" /v "NoTileApplicationNotification" /t REG_DWORD /d "00000001" /f
echo.

echo 「ログオン時にタイル通知を削除する」を「有効」に変更しています。
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v "ClearTilesOnExit" /t REG_DWORD /d "00000001" /f
echo.

echo 「初回サインインのアニメーションを表示する」を無効に変更しています。
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableFirstLogonAnimation" /t REG_DWORD /d "00000000" /f
echo.

echo 「エクスプローラで開く」を「PC」に変更しています。
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d "00000001" /f
echo.

echo 「最近使ったファイルをクイック アクセスに表示する」を「無効」に変更しています。
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /t REG_DWORD /d "00000000" /f
echo.

echo 「よく使うフォルダーをクイック アクセスに表示する」を「無効」に変更しています。
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /t REG_DWORD /d "00000000" /f
echo.

echo 「最近開いたプログラムを「スタート」メニューに保存し表示する」を「無効」に変更しています。
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d "00000000" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist" /f
echo.

echo 「すべてのフォルダーを表示」を「有効」に変更しています。
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "NavPaneShowAllFolders" /t REG_DWORD /d "00000001" /f

echo 「隠しファイル、隠しフォルダー、および隠しドライブを表示する」を「有効」に変更しています。
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d "00000001" /f
echo.

echo 「登録されている拡張子は表示しない」を「無効」に変更しています。
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d "00000000" /f
echo.

echo 「タスクバーボタンを結合する」を「結合しない」に変更しています。
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarGlomLevel" /t REG_DWORD /d "00000002" /f
echo.

echo 「Cortanaアイコンを表示」を「有効」に変更しています。
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d "00000001" /f
echo.

echo 「Cortana」を「無効」に変更しています。
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "00000000" /f
echo.

echo 「アイコンの自動整列」、「アイコンを等間隔に整列」を「有効」に変更しています。
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\Shell\Bags\1\Desktop" /v "FFlags" /t REG_DWORD /d "1075839525" /f
echo.

echo 「自動再生によってユーザーの選択内容が記憶されないようにします。」を「有効」に変更しています。
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "DontSetAutoplayCheckbox" /t REG_DWORD /d "00000001" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "DontSetAutoplayCheckbox" /t REG_DWORD /d "00000001" /f
echo.

echo 「.isoファイルを開く既定のプログラム」を「エクスプローラー」に変更しています。
assoc .iso=explorer
echo.

echo Internet Explorerの「初期設定ダイアログボックスを表示しない」を「有効」に変更しています。
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Internet Explorer\Main" /v "DisableFirstRunCustomize" /t REG_DWORD /d "00000001" /f
echo.

echo Windows Media Playerの「初期設定ダイアログ ボックスを表示しない」を「有効」に変更しています。
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsMediaPlayer" /v "GroupPrivacyAcceptance" /t REG_DWORD /d "00000001" /f
echo.

echo 「詳細ブートオプション」を「有効」に変更しています。
bcdedit /set {default} bootmenupolicy legacy
echo.

shutdown /r /t 0

exit
```

## ダウンロード

すべての項目を反映させるには、管理者権限で実行してください。  
細心の注意を払って作成しましたが、不具合や損害を保証するものではありません。  
※Windows 10 以外のOSで実行しないでください。  

[initial_setting_for_Windows_10.bat](https://github.com/SaguchiWataru/initial_setting_for_Windows_10/raw/master/sources/initial_setting_for_Windows_10.bat)  

## 最後に

この記事を最後まで読んでいただきありがとうございます。  
もしも、企業の方で僕に興味を持って頂けた方がいらっしゃったら幸いです。  
最近は、[AtCoder](https://atcoder.jp/users/K019C1053)というプログラミングコンテストに毎週参加しています。  
プログラミングのレベルを他の人と相対的に可視化できるサイトなので、よろしければご確認ください。  
[K019C1053のコンテスト実績](https://atcoder.jp/users/K019C1053)  
K019C1053は、日本工学院専門学校の佐口航の学籍番号です。  

2023年卒業予定です！  
