@echo off

echo ����h�����߂ɃG�N�X�v���[���[���I�����܂��B
taskkill /f /im explorer.exe
echo.

echo �u�d���v�����v���u���p�t�H�[�}���X�v�ɕύX���Ă��܂��B
powercfg -SETACTIVE SCHEME_MIN
echo.

echo �u�����X�^�[�g�A�b�v�v���u�����v�ɕύX���Ă��܂��B
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d "00000000" /f
echo.

echo �u�x�~��ԁv���u�L���v�ɕύX���Ă��܂��B
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" /v "ShowHibernateOption" /t REG_DWORD /d "00000001" /f
echo.

echo �u�f�B�X�v���C�̓d����؂�v���u�K�p���Ȃ��v�ɕύX���Ă��܂��B(�d���ɐڑ�)
powercfg /x monitor-timeout-ac 0
echo.

echo �u�f�B�X�v���C�̓d����؂�v���u�K�p���Ȃ��v�ɕύX���Ă��܂��B(�o�b�e���[�쓮)
powercfg /x monitor-timeout-dc 0
echo.

echo �u�R���s���[�^���X���[�v��Ԃɂ���v���u�K�p���Ȃ��v�ɕύX���Ă��܂��B(�d���ɐڑ�)
powercfg /x standby-timeout-ac 0
echo.

echo �u�R���s���[�^���X���[�v��Ԃɂ���v���u�K�p���Ȃ��v�ɕύX���Ă��܂��B(�o�b�e���[�쓮)
powercfg /x standby-timeout-dc 0
echo.

echo �u�Ƃ��ǂ��X�^�[�g��ʂɂ������߂�\������v���u�����v�ɕύX���Ă��܂��B
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d "00000000" /f
echo.

echo �u�X�^�[�g��ʂ܂��̓^�X�N �o�[�̃W�����v ���X�g�ɍŋߊJ�������ڂ�\������v���u�����v�ɕύX���Ă��܂��B
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d "00000000" /f
echo.

echo �u�^�C���ʒm���I�t�ɂ���v���u�L���v�ɕύX���Ă��܂��B
reg add "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotificationss" /v "NoTileApplicationNotification" /t REG_DWORD /d "00000001" /f
echo.

echo �u���O�I�����Ƀ^�C���ʒm���폜����v���u�L���v�ɕύX���Ă��܂��B
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v "ClearTilesOnExit" /t REG_DWORD /d "00000001" /f
echo.

echo �u����T�C���C���̃A�j���[�V������\������v�𖳌��ɕύX���Ă��܂��B
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableFirstLogonAnimation" /t REG_DWORD /d "00000000" /f
echo.

echo �u�G�N�X�v���[���ŊJ���v���uPC�v�ɕύX���Ă��܂��B
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d "00000001" /f
echo.

echo �u�ŋߎg�����t�@�C�����N�C�b�N �A�N�Z�X�ɕ\������v���u�����v�ɕύX���Ă��܂��B
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /t REG_DWORD /d "00000000" /f
echo.

echo �u�悭�g���t�H���_�[���N�C�b�N �A�N�Z�X�ɕ\������v���u�����v�ɕύX���Ă��܂��B
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /t REG_DWORD /d "00000000" /f
echo.

echo �u�ŋߊJ�����v���O�������u�X�^�[�g�v���j���[�ɕۑ����\������v���u�����v�ɕύX���Ă��܂��B
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d "00000000" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist" /f
echo.

echo �u���ׂẴt�H���_�[��\���v���u�L���v�ɕύX���Ă��܂��B
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "NavPaneShowAllFolders" /t REG_DWORD /d "00000001" /f

echo �u�B���t�@�C���A�B���t�H���_�[�A����щB���h���C�u��\������v���u�L���v�ɕύX���Ă��܂��B
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d "00000001" /f
echo.

echo �u�o�^����Ă���g���q�͕\�����Ȃ��v���u�����v�ɕύX���Ă��܂��B
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d "00000000" /f
echo.

echo �u�^�X�N�o�[�{�^������������v���u�������Ȃ��v�ɕύX���Ă��܂��B
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarGlomLevel" /t REG_DWORD /d "00000002" /f
echo.

echo �uCortana�A�C�R����\���v���u�L���v�ɕύX���Ă��܂��B
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d "00000001" /f
echo.

echo �uCortana�v���u�����v�ɕύX���Ă��܂��B
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "00000000" /f
echo.

echo �u�A�C�R���̎�������v�A�u�A�C�R���𓙊Ԋu�ɐ���v���u�L���v�ɕύX���Ă��܂��B
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\Shell\Bags\1\Desktop" /v "FFlags" /t REG_DWORD /d "1075839525" /f
echo.

echo �u�����Đ��ɂ���ă��[�U�[�̑I����e���L������Ȃ��悤�ɂ��܂��B�v���u�L���v�ɕύX���Ă��܂��B
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "DontSetAutoplayCheckbox" /t REG_DWORD /d "00000001" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "DontSetAutoplayCheckbox" /t REG_DWORD /d "00000001" /f
echo.

echo �u.iso�t�@�C�����J������̃v���O�����v���u�G�N�X�v���[���[�v�ɕύX���Ă��܂��B
assoc .iso=explorer
echo.

echo Internet Explorer�́u�����ݒ�_�C�A���O�{�b�N�X��\�����Ȃ��v���u�L���v�ɕύX���Ă��܂��B
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Internet Explorer\Main" /v "DisableFirstRunCustomize" /t REG_DWORD /d "00000001" /f
echo.

echo Windows Media Player�́u�����ݒ�_�C�A���O �{�b�N�X��\�����Ȃ��v���u�L���v�ɕύX���Ă��܂��B
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsMediaPlayer" /v "GroupPrivacyAcceptance" /t REG_DWORD /d "00000001" /f
echo.

echo �u�ڍ׃u�[�g�I�v�V�����v���u�L���v�ɕύX���Ă��܂��B
bcdedit /set {default} bootmenupolicy legacy
echo.

shutdown /r /t 0

exit
