@ECHO OFF
rem 23:15 2019/5/11
cd /d "%~dp0"
Rd "%WinDir%\system32\test_permissions" >NUL 2>NUL
Md "%WinDir%\System32\test_permissions" 2>NUL||(Echo ��ʹ���Ҽ�����Ա������У�&&Pause >nul&&Exit)
Rd "%WinDir%\System32\test_permissions" 2>NUL
SetLocal EnableDelayedExpansion
TITLE Windows ��������
COLOR 0a

rem gpedit.msc C:\WINDOWS\system32\GroupPolicy

call :Bcdedit
call :Chrome
call :Clipboard
call :ControlPanelRegedit
call :Desktop
call :DesktopIE
rem call :DesktopIEBank
call :Explorer
call :ExplorerUpdate
call :FileTypes
call :FixCHM
call :InputMethodCHS
call :InternetExplorer
call :LRCfile
call :MicrosoftEdge
call :NetFX35
rem call :NetReset
call :NetShare
call :Notepad
call :Notepad2
call :PhotoViewer
call :Powercfg
call :RightMenuAdd
call :RightMenuDel
call :RightMenuShift
call :RightMenuSysTools
call :Service
call :StartUp
call :SystemRestore
call :Taskbar
call :Taskschd
call :WMPlayer
call :WindowsDefender
call :WindowsLog
call :WindowsUAC
call :SoftSN
call :GpUpdate
call :IconUpdate
call :OneDrive
call :WindowsUpdateClr
call :Wsreset
exit

:Bcdedit
echo �����͹��ϻָ������������ÿ�������ɨ��ȴ�ʱ��Ϊ1��
chkntfs /t:1
echo �����͹��ϻָ������������ÿ�����ʾ����ϵͳ�б�ʱ��2��
bcdedit /timeout 2
echo ��ֹ���ֳ����̨���º�������
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "SunJavaUpdateSched" /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "OneDrive" /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "Vivaldi Update Notifier" /f >nul 2>nul
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "IgfxTray" /f >nul 2>nul
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "Persistence" /f >nul 2>nul
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "RtHDVCpl" /f >nul 2>nul
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "StartCCC" /f >nul 2>nul
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "SunJavaUpdateSched" /f >nul 2>nul
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "WindowsWelcomeCenter" /f >nul 2>nul
goto :eof

:Chrome
echo MHT�ļ� �򿪷�ʽ���Chrome��
reg add "HKCR\.mht" /ve /d "ChromeHTML" /f
echo PDF�ļ� �򿪷�ʽ���Chrome��
reg add "HKCR\.pdf" /ve /d "ChromeHTML" /f
goto :eof

:Clipboard
echo ��ռ�����
mshta vbscript:clipboardData.SetData("text","")(close)
goto :eof

:ControlPanelRegedit
echo �ڿ��������� �༭ע��� ��
reg add "HKCR\CLSID\{19260817-d95d-4dff-8b2b-a530db6ed982}" /ve /d "�༭ע���" /f
reg add "HKCR\CLSID\{19260817-d95d-4dff-8b2b-a530db6ed982}" /v "InfoTip" /d "��ע���༭��" /f
reg add "HKCR\CLSID\{19260817-d95d-4dff-8b2b-a530db6ed982}" /v "System.ControlPanel.Category" /d "5" /f
reg add "HKCR\CLSID\{19260817-d95d-4dff-8b2b-a530db6ed982}\DefaultIcon" /ve /d "%%SystemRoot%%\regedit.exe" /f
reg add "HKCR\CLSID\{19260817-d95d-4dff-8b2b-a530db6ed982}\Shell\Open\command" /ve /d "regedit" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\{19260817-d95d-4dff-8b2b-a530db6ed982}" /ve /d "���ע���༭��" /f
goto :eof

:Desktop
echo ��������ʾ �����-�˵��ԣ��ҵĵ��ԣ�
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /f /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 0
echo ��������ʾ �����ļ���-�û����ҵ��ĵ���
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /f /v "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" /t REG_DWORD /d 0
echo ɾ������Microsoft Edge��ݷ�ʽ
set "reg=HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders"
for /f "tokens=2*" %%a in ('reg query "%reg%" /v desktop') do set "desktop=%%b"
del /f /q "%desktop%\Microsoft Edge.lnk" >nul 2>nul
goto :eof

:DesktopIE
echo �����洴���๦��Internet Explorer��ݷ�ʽ
reg delete "HKCR\CLSID\{00000000-0000-0000-0000-000000000000}" /f > NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{00000000-0000-0000-0000-000000000000}" /ve /d "Internet Explorer" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000000}" /v "InfoTip" /d "@C:\Windows\System32\ieframe.dll,-881" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000000}" /v "LocalizedString" /d "@C:\Windows\System32\ieframe.dll,-880" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000000}\DefaultIcon" /ve /d "C:\Windows\System32\ieframe.dll,-190" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000000}\shell" /ve /d "Open" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000000}\shell\010" /ve /d "���Ӱ��(&B)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000000}\shell\010\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"https://www.mianbao.com/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000000}\shell\011" /ve /d "����ֱ��(&L)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000000}\shell\011\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"http://www.cietv.com/live/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000000}\shell\012" /ve /d "CCTV(&1)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000000}\shell\012\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"http://tv.cctv.com/live/cctv5/" /f
rem reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000000}\shell\013" /ve /d "97��ӰԺ(&5)" /f
rem reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000000}\shell\013\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"https://www.55xia.com/" /f
rem reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000000}\shell\020" /ve /d "֧����(&Z)" /f
rem reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000000}\shell\020\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"https://www.alipay.com/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000000}\shell\1Nohome" /ve /d "�򿪿հ���ҳ(&O)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000000}\shell\1Nohome\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"-nohome" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000000}\shell\2Private" /ve /d "��˽���ģʽ(&P)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000000}\shell\2Private\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"-private" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000000}\shell\3NoAddOns" /ve /d "�޼���������(&E)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000000}\shell\3NoAddOns\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"-extoff" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000000}\shell\4History" /ve /d "ɾ����ʷ��¼(&S)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000000}\shell\4History\Command" /ve /d "\"C:\Windows\System32\rundll32.exe\"InetCpl.cpl,ClearMyTracksByProcess 255" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000000}\shell\5Clean" /ve /d "ɾ����ʱ�ļ�(&T)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000000}\shell\5Clean\Command" /ve /d "\"C:\Windows\System32\rundll32.exe\"InetCpl.cpl,ClearMyTracksByProcess 8" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000000}\shell\6Set" /ve /d "Internet ����(&R)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000000}\shell\6Set\Command" /ve /d "\"C:\Windows\System32\rundll32.exe\"C:\Windows\System32\shell32.dll,Control_RunDLL C:\Windows\System32\inetcpl.cpl" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000000}\shell\7Connection" /ve /d "������������(&X)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000000}\shell\7Connection\Command" /ve /d "\"C:\Windows\System32\rundll32.exe\"C:\Windows\System32\shell32.dll,Control_RunDLL C:\Windows\System32\Inetcpl.cpl,,4" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000000}\shell\8Net" /ve /d "��������ѡ��(&N)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000000}\shell\8Net\Command" /ve /d "\"C:\Windows\System32\rundll32.exe\"C:\Windows\System32\shell32.dll,Control_RunDLL C:\Windows\System32\ncpa.cpl" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000000}\shell\9Hosts" /ve /d "�� HOSTS (&H)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000000}\shell\9Hosts\Command" /ve /d "\"C:\Windows\notepad.exe\"%windir%\system32\drivers\etc\hosts" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000000}\ShellFolder" /ve /d "C:\Windows\System32\ieframe.dll,-190" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000000}\ShellFolde r" /v "HideAsDeletePerUser" /d "" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000000}\ShellFolder" /v "Attributes" /t REG_DWORD /d 0 /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000000}\ShellFolder" /v "HideFolderVerbs" /d "" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000000}\ShellFolder" /v "WantsParseDisplayName" /d "" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000000}\ShellFolder" /v "HideOnDesktopPerUser" /d "" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000000}\ShellFolder" /v "ParseDisplayNameNeedsURL" /d "" /f
goto :eof

:DesktopIEBank
echo �����洴���๦����������IE��ݷ�ʽ
reg delete "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}" /f > NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{00000000-0000-0000-0000-000000000001}" /ve /d "��������" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}" /v "InfoTip" /d "�������У��Ҽ�ֱ��" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}" /v "LocalizedString" /d "��������" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\DefaultIcon" /ve /d "C:\Windows\System32\ieframe.dll,88" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell" /ve /d "Open" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell\010" /ve /d "��������(&I)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell\010\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"https://www.icbc.com.cn/icbc/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell\011" /ve /d "��������(&C)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell\011\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"http://www.ccb.com/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell\012" /ve /d "�й�����(&B)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell\012\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"http://www.boc.cn/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell\013" /ve /d "ũҵ����(&A)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell\013\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"http://www.abchina.com/cn/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell\020" /ve /d "��ͨ����(&J)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell\020\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"http://www.bankcomm.com/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell\021" /ve /d "��������(&Z)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell\021\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"http://www.cmbchina.com/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell\022" /ve /d "��ҵ����(&D)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell\022\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"https://www.cib.com.cn/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell\023" /ve /d "�ַ�����(&F)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell\023\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"http://www.spdb.com.cn/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell\024" /ve /d "�ʴ�����(&Y)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell\024\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"http://www.psbc.com/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell\025" /ve /d "��������(&M)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell\025\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"http://www.cmbc.com.cn/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell\026" /ve /d "��������(&X)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell\026\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"http://www.citicbank.com/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell\027" /ve /d "�������(&G)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell\027\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"http://www.cebbank.com/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell\028" /ve /d "ƽ������(&P)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell\028\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"http://bank.pingan.com/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell\030" /ve /d "�й�����(&U)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell\030\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"http://cn.unionpay.com/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell\031" /ve /d "������ͨ" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell\031\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"https://www.americanexpress.com.cn/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell\032" /ve /d "JCB(&J)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell\032\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"http://www.jcbcard.cn/cs/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell\033" /ve /d "���´￨(&M)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell\033\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"https://www.mastercard.com.cn/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell\034" /ve /d "Visa(&V)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell\034\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"https://www.visa.com.cn/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell\035" /ve /d "�������Ų�ѯ(&X)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell\035\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"https://ipcrs.pbccrc.org.cn/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell\036" /ve /d "������ɲ�ѯ(&X)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell\036\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"http://xukezheng.cbrc.gov.cn/ilicence/licence/licenceQuery.jsp" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell\037" /ve /d "֧����ɲ�ѯ(&X)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\shell\037\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"http://www.pbc.gov.cn/zhengwugongkai/127924/128041/2951606/1923625/1923629/index.html" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\ShellFolder" /ve /d "C:\Windows\System32\ieframe.dll,-190" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\ShellFolde r" /v "HideAsDeletePerUser" /d "" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\ShellFolder" /v "Attributes" /t REG_DWORD /d 0 /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\ShellFolder" /v "HideFolderVerbs" /d "" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\ShellFolder" /v "WantsParseDisplayName" /d "" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\ShellFolder" /v "HideOnDesktopPerUser" /d "" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-000000000001}\ShellFolder" /v "ParseDisplayNameNeedsURL" /d "" /f
goto :eof

:Explorer
echo �ҵĵ���ȡ����ʾ7���ļ���
rem "3D����"
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /f > NUL 2>&1
rem "��Ƶ"
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" /f > NUL 2>&1
rem "ͼƬ"
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" /f > NUL 2>&1
rem "�ĵ�"
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}" /f > NUL 2>&1
rem "����"
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}" /f > NUL 2>&1
rem "����"
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" /f > NUL 2>&1
rem "����"
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}" /f > NUL 2>&1
echo ���ڡ����ٷ��ʡ�����ʾ�����ļ���
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /t REG_DWORD /d 0 /f
echo ���ڡ����ٷ��ʡ�����ʾ���ʹ�õ��ļ���ɾ�����ʼ�¼��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /t REG_DWORD /d 0 /f
del /f /s /q "%userprofile%\recent\*.*" > NUL 2>&1
echo �ڱ���������ʾ����·��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState" /v "FullPath" /t REG_DWORD /d 1 /f
echo ������ݷ�ʽ����ʾ����ݷ�ʽ������
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v link /d "00000000" /t REG_BINARY /f
echo ��ʾ��֪�ļ����͵���չ��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f
reg add "HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "HideFileExt" /t REG_DWORD /d 0
echo �ر����ص� thumbs.db �ļ��е�����ͼ����
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "DisableThumbsDBOnNetworkFolders" /t REG_DWORD /d 1 /f
echo �ر�����ͼ�Ļ���
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoThumbnailCache" /t REG_DWORD /d 1 /f
echo ǿ����ʾָ���ļ����ͣ�bat,cmd,reg,exe������չ��
reg add "HKCR\batfile" /v "AlwaysShowExt" /d "" /f
reg add "HKCR\cmdfile" /v "AlwaysShowExt" /d "" /f
reg add "HKCR\exefile" /v "AlwaysShowExt" /d "" /f
reg add "HKCR\regfile" /v "AlwaysShowExt" /d "" /f
echo �رղ�����Ƶ��Ƶ�����ļ�ͼƬԤ��
rem reg delete "HKCR\.avi\ShellEx" /f >nul 2>nul
rem reg delete "HKCR\.m4a\ShellEx" /f >nul 2>nul
rem reg delete "HKCR\.mkv\ShellEx" /f >nul 2>nul
rem reg delete "HKCR\.mov\ShellEx" /f >nul 2>nul
rem reg delete "HKCR\.mp3\ShellEx" /f >nul 2>nul
rem reg delete "HKCR\.mp4\ShellEx" /f >nul 2>nul
reg delete "HKCR\.3gp\ShellEx" /f >nul 2>nul
reg delete "HKCR\.ape\ShellEx" /f >nul 2>nul
reg delete "HKCR\.flac\ShellEx" /f >nul 2>nul
reg delete "HKCR\.m4v\ShellEx" /f >nul 2>nul
reg delete "HKCR\.mpeg\ShellEx" /f >nul 2>nul
reg delete "HKCR\.mpg\ShellEx" /f >nul 2>nul
reg delete "HKCR\.rmvb\ShellEx" /f >nul 2>nul
reg delete "HKCR\.wmv\ShellEx" /f >nul 2>nul
goto :eof

:ExplorerUpdate
echo �޸�Winɾ���ļ���ˢ�²���ʱ������
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Update" /v "UpdateMode" /t REG_DWORD /d 0 /f
echo �˵������ٶ��Ż���Ĭ��ֵ400��
reg add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /d "100" /f
goto :eof

:FileTypes
::��ֹ �����ظ��ָ�Ĭ������
rem Microsoft.3DBuilder��File Types: .stl, .3mf, .obj, .wrl, .ply, .fbx, .3ds, .dae, .dxf, .bmp, .jpg, .png, .tga
reg add "HKCU\SOFTWARE\Classes\AppXvhc4p7vz4b485xfp46hhk3fq3grkdgjg" /v "NoOpenWith" /d "" /f

rem Microsoft Edge��
rem File Types: .htm, .html
reg add "HKCU\SOFTWARE\Classes\AppX4hxtad77fbk3jkkeerkrm0ze94wjf3s9" /v "NoOpenWith" /d "" /f
rem File Types: .pdf
reg add "HKCU\SOFTWARE\Classes\AppXd4nrz8ff68srnhf9t5a8sbjyar1cr723" /v "NoOpenWith" /d "" /f
rem File Types: .svg
reg add "HKCU\SOFTWARE\Classes\AppXde74bfzw9j31bzhcvsrxsyjnhhbq66cs" /v "NoOpenWith" /d "" /f
rem File Types: .xml
reg add "HKCU\SOFTWARE\Classes\AppXcc58vyzkbjbs4ky0mxrmxf8278rk9b3t" /v "NoOpenWith" /d "" /f

rem Microsoft Photos��
rem File Types: .3g2,.3gp, .3gp2, .3gpp, .asf, .avi, .m2t, .m2ts, .m4v, .mkv .mov, .mp4, mp4v, .mts, .tif, .tiff, .wmv
reg add "HKCU\SOFTWARE\Classes\AppXk0g4vb8gvt7b93tg50ybcy892pge6jmt" /v "NoOpenWith" /d "" /f
rem File Types: Most Image File Types
reg add "HKCU\SOFTWARE\Classes\AppX43hnxtbyyps62jhe9sqpdzxn1790zetc" /v "NoOpenWith" /d "" /f
rem File Types: .raw, .rwl, .rw2 and others
reg add "HKCU\SOFTWARE\Classes\AppX9rkaq77s0jzh1tyccadx9ghba15r6t3h" /v "NoOpenWith" /d "" /f

rem Zune Music��File Types: .aac, .adt, .adts ,.amr, .flac, .m3u, .m4a, .m4r, .mp3, .mpa, .wav, .wma, .wpl, .zpl
reg add "HKCU\SOFTWARE\Classes\AppXqj98qxeaynz6dv4459ayz6bnqxbyaqcs" /v "NoOpenWith" /d "" /f

rem Zune Video��File Types: .3g2,.3gp, .3gpp, .avi, .divx, .m2t, .m2ts, .m4v, .mkv, .mod, .mov, .mp4, mp4v, .mpe, .mpeg, .mpg, .mpv2, .mts, .tod, .ts, .tts, .wm, .wmv, .xvid
reg add "HKCU\SOFTWARE\Classes\AppX6eg8h5sxqq90pv53845wmnbewywdqq5h" /v "NoOpenWith" /d "" /f
goto :eof

:FixCHM
echo Fix CHM
regsvr32 /s hhctrl.ocx
regsvr32 /s itircl.dll
regsvr32 /s itss.dll
goto :eof

:GpUpdate
gpupdate /force
RunDll32.exe USER32.DLL,UpdatePerUserSystemParameters
ping -n 3 127.0.0.1>nul
taskkill /f /im explorer.exe && start %systemroot%\explorer
goto :eof

:IconUpdate
taskkill /f /im explorer.exe > NUL 2>&1
echo ����ϵͳͼ�껺�����ݿ�
attrib -h -s -r "%userprofile%\AppData\Local\IconCache.db" > NUL 2>&1
del /f "%userprofile%\AppData\Local\IconCache.db" > NUL 2>&1
attrib -h -s -r "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\*.*" > NUL 2>&1
del /f "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\*.db" > NUL 2>&1
start explorer
goto :eof

:InputMethodCHS
echo ΢��ƴ��Ĭ��ΪӢ������
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "Default Mode" /t REG_DWORD /d 1 /f
echo �رմ����л�ȡ��ѡ�ʣ��ر�΢��ƴ���Ƽ��㣩
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "Enable Cloud Candidate" /t REG_DWORD /d 0 /f
echo �رմ����л�ȡ��ֽ
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "EnableLiveSticker" /t REG_DWORD /d 0 /f
echo �ر�ģ����
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "Enable Fuzzy Input" /t REG_DWORD /d 0 /f
echo �ر���ʾ�´��ȴ���������ʾ
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "Enable Hot And Popular Word Search" /t REG_DWORD /d 0 /f
goto :eof

:InternetExplorer
echo Internet Explorer ���� IE �״������Զ�������
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "RunOnceHasShown" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "RunOnceComplete" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "DisableFirstRunCustomize" /t REG_DWORD /d 1 /f
echo Internet Explorer �������Ͻǵ�Ц��������ť
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions" /v "NoHelpItemSendFeedback" /t REG_DWORD /d 1 /f
echo Internet Explorer ����������
reg add "HKCU\Software\Microsoft\Internet Explorer\Toolbar" /v "Locked" /t REG_DWORD /d 1 /f
echo Internet Explorer �رն��ѡ�ʱ����������
reg add "HKCU\Software\Microsoft\Internet Explorer\TabbedBrowsing" /v "WarnOnClose" /t REG_DWORD /d 0 /f
echo Internet Explorer ��������ӵ�ǰ���ڵ���ѡ�������
reg add "HKCU\Software\Microsoft\Internet Explorer\TabbedBrowsing" /v "ShortcutBehavior" /t REG_DWORD /d 1 /f
echo Internet Explorer ��ͬʱ������Ŀ������ 10
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "MaxConnectionsPerServer" /t REG_DWORD /d 10 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "MaxConnectionsPer1_0Server" /t REG_DWORD /d 10 /f
echo ���ñ����Զ���ɹ���
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "Use FormSuggest" /d "yes" /f
echo ����IE��ҳ Start Page
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "Start Page" /d "https://www.baidu.com/?tn=simple" /f
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "Search Page" /d "https://www.baidu.com/" /f
echo ����IE���������ʱ�򿪵���ҳ
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Start Page" /d "about:blank" /f
echo ����IEĬ����ҳ Default_Page_URL
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Default_Page_URL" /d "about:blank" /f
echo ����Ĭ������
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Default_Search_URL" /d "https://www.baidu.com/s?tn=baiduhome&wd=%s" /f
echo ����Ĭ������ҳ��
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Search Page" /d "https://www.baidu.com/" /f
echo IE����Ĭ����������Ϊ�ٶ�
reg add "HKCU\Software\Microsoft\Internet Explorer\SearchScopes" /v "DefaultScope" /d "{64AF4D11-6492-4C25-B014-B6C6CEE3B0C5}" /f
echo IEĬ�����������������
reg add "HKCU\Software\Microsoft\Internet Explorer\SearchScopes\{64AF4D11-6492-4C25-B014-B6C6CEE3B0C5}" /v "DisplayName" /d "�ٶ�" /f
reg add "HKCU\Software\Microsoft\Internet Explorer\SearchScopes\{64AF4D11-6492-4C25-B014-B6C6CEE3B0C5}" /v "URL" /d "https://www.baidu.com/s?tn=baiduhome&wd={searchTerms}" /f
reg add "HKCU\Software\Microsoft\Internet Explorer\SearchScopes\{64AF4D11-6492-4C25-B014-B6C6CEE3B0C5}" /v "SuggestionsURL_JSON" /d "http://suggestion.baidu.com/su?wd={searchTerms}&action=opensearch&ie=utf-8" /f
reg add "HKCU\Software\Microsoft\Internet Explorer\SearchScopes\{64AF4D11-6492-4C25-B014-B6C6CEE3B0C5}" /v "FaviconURLFallback" /d "http://www.baidu.com/favicon.ico" /f
reg add "HKCU\Software\Microsoft\Internet Explorer\SearchScopes\{64AF4D11-6492-4C25-B014-B6C6CEE3B0C5}" /v "ShowSearchSuggestions" /t REG_DWORD /d 1 /f
echo IE�����������
reg add "HKCU\Software\Microsoft\Internet Explorer\SearchScopes\{64AF4D11-6492-4C25-B014-B6C6CEE3B0C5}" /v "SortIndex" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Internet Explorer\SearchScopes\jd" /v "SortIndex" /t REG_DWORD /d 2 /f
reg add "HKCU\Software\Microsoft\Internet Explorer\SearchScopes\taobao" /v "SortIndex" /t REG_DWORD /d 3 /f
reg add "HKCU\Software\Microsoft\Internet Explorer\SearchScopes\sogou" /v "SortIndex" /t REG_DWORD /d 4 /f
reg add "HKCU\Software\Microsoft\Internet Explorer\SearchScopes\so" /v "SortIndex" /t REG_DWORD /d 5 /f
echo IEɾ��������������
reg delete "HKLM\SOFTWARE\Microsoft\Internet Explorer\SearchScopes" /f >nul 2>nul
echo IE���������������
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\jd" /v "DisplayName" /d "����" /f
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\jd" /v "URL" /d "https://search.jd.com/Search?keyword={searchTerms}" /f
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\jd" /v "FaviconURLFallback" /d "https://www.jd.com/favicon.ico" /f
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\taobao" /v "DisplayName" /d "�Ա�" /f
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\taobao" /v "URL" /d "https://s.taobao.com/search?q={searchTerms}" /f
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\taobao" /v "FaviconURLFallback" /d "https://www.taobao.com/favicon.ico" /f
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\sogou" /v "DisplayName" /d "΢��" /f
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\sogou" /v "URL" /d "http://weixin.sogou.com/weixin?type=2&ie=utf8&query={searchTerms}" /f
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\sogou" /v "FaviconURLFallback" /d "https://weixin.sogou.com/favicon.ico" /f
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\so" /v "DisplayName" /d "360" /f
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\so" /v "URL" /d "http://www.so.com/s?q={searchTerms}&ie=utf-8" /f
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\so" /v "SuggestionsURL_JSON" /d "http://sug.so.360.cn/suggest?word={searchTerms}&encodein=utf-8&encodeout=utf-8&outfmt=json" /f
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\so" /v "FaviconURL" /d "http://www.so.com/favicon.ico" /f
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\so" /v "ShowSearchSuggestions" /t REG_DWORD /d 1 /f
echo ���á�ActiveX�ؼ�����JAVEС����ű�������ű�����
rem https://blog.csdn.net/wangqiulin123456/article/details/17068649
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1001" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1004" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1200" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1201" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1208" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "120B" /t REG_DWORD /d 3 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1400" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1402" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1405" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1406" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1607" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1806" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "2201" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "2300" /t REG_DWORD /d 0 /f
echo ���û������
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1609" /t REG_DWORD /d 0 /f
echo �رմ� ������ �ļ��ġ���ȫ���桱��Internetѡ�����Ӧ�ó���Ͳ���ȫ�ļ�ʱ����ʾ��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1806" /t REG_DWORD /d 0 /f
echo ������� ������վ�㣨���ؾ�������
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range1" /v "file" /t REG_DWORD /d 2 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range1" /v ":Range" /d "10.*.*.*" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range2" /v "file" /t REG_DWORD /d 2 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range2" /v ":Range" /d "192.168.*.*" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range3" /v "file" /t REG_DWORD /d 2 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range3" /v ":Range" /d "169.254.*.*" /f
echo �ر�IE�İ�ȫ���ü�鹦��
reg add "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Security" /v "DisableSecuritySettingsCheck" /t REG_DWORD /d 1 /f
echo Internet Explorer �����渽����������Ϣ���ļ�����������
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "SaveZoneInformation" /t REG_DWORD /d 1 /f
echo �ر�IE��Smartscreenɸѡ��
reg add "HKCU\Software\Microsoft\Internet Explorer\PhishingFilter" /v "EnabledV9" /t REG_DWORD /d 0 /f
echo ����IEĬ������Ŀ¼
reg delete "HKCU\Software\Microsoft\Internet Explorer\Main" /v "Default Download Directory" /f
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "Default Download Directory" /d "D:\Ѹ������" /t REG_SZ /f
echo 127.0.0.1 ieonline.microsoft.com
SET NEWLINE=^& echo.
attrib -r %WINDIR%\system32\drivers\etc\hosts
FIND /C /I "geo2.adobe.com" %WINDIR%\system32\drivers\etc\hosts >nul
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 geo2.adobe.com>>%WINDIR%\system32\drivers\etc\hosts
FIND /C /I "get3.adobe.com" %WINDIR%\system32\drivers\etc\hosts >nul
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 get3.adobe.com>>%WINDIR%\system32\drivers\etc\hosts
FIND /C /I "ieonline.microsoft.com" %WINDIR%\system32\drivers\etc\hosts >nul
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 ieonline.microsoft.com>>%WINDIR%\system32\drivers\etc\hosts
attrib +r %WINDIR%\system32\drivers\etc\hosts
ipconfig /flushdns >nul
goto :eof

:LRCfile
echo ���LRC��ʸ�ʽʶ��
reg add "HKCR\.lrc" /ve /d "lrcfile" /f
reg add "HKCR\.lrc" /v "PerceivedType" /d "text" /f
reg add "HKCR\lrcfile" /ve /d "lrc ���" /f
reg add "HKCR\lrcfile\DefaultIcon" /ve /d "imageres.dll,17" /f
reg add "HKCR\lrcfile\shell" /f
reg add "HKCR\lrcfile\shell\open" /f
reg add "HKCR\lrcfile\shell\open\command" /ve /d "NOTEPAD.EXE %%1" /f
goto :eof

:MicrosoftEdge
echo ��ֹMicrosoft Edge���״����С���ӭҳ��
reg add "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge" /v "PreventFirstRunPage" /t REG_DWORD /d 0 /f
echo �ر�Adobe Flash���㼴��
reg add "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Security" /v "FlashClickToRunMode" /t REG_DWORD /d 0 /f
echo ʹ��Microsoft�������б�
reg add "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\BrowserEmulation" /v "MSCompatibilityMode" /t REG_DWORD /d 1 /f
echo ������ʾ��EDGE��ΪĬ�����������ʾ
reg add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main" /v "DisallowDefaultBrowserPrompt" /t REG_DWORD /d 1 /f
echo �ر�Edge�����ʱ��ʾ��Ҫ�ر����б�ǩҳ�𣿡�
reg add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main" /v "AskToCloseAllTabs" /t REG_DWORD /d 0 /f
echo �������Ĳ˵�����ʾ���鿴Դ�����ļ����͡����Ԫ�ء�
reg add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\F12" /v "ShowPageContextMenuEntryPoints" /t REG_DWORD /d 1 /f
echo �ر� MicrosoftEdge SmartScreen
reg add "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter" /v "EnabledV9" /t REG_DWORD /d 0 /f
echo ��ֹ�����˻��д���Microsoft Edge��ݷ�ʽ
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "DisableEdgeDesktopShortcutCreation" /t REG_DWORD /d 1 /f
echo ���� Internet Explorer�� Microsoft edge�ղؼ�ͬ����ϵͳĬ�ϲ�ͬ��,�����½΢���ʺŲ���IE��EDGEͬ����
rem %localappdata%/Packages\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\AC\MicrosoftEdge\User\Default\Favorites
reg add "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /v "SyncFavoritesBetweenIEAndMicrosoftEdge" /t REG_DWORD /d "1" /f
goto :eof

:NetFX35
OptionalFeatures.exe
goto :eof

:NetReset
echo ������������
netsh advfirewall reset
netsh int ip reset
netsh winhttp reset proxy
netsh winsock reset
ipconfig /flushdns
echo ��������Ż�
echo ���� Receive Window Auto-Tuning Level�����մ����Զ����ڼ���
rem ��    ԭ netsh int tcp set global autotuninglevel=normal
rem �鿴״̬ netsh interface tcp show global
netsh int tcp set global autotuninglevel=disabled
goto :eof

:NetShare
echo ����ھ������ڿ��Կ����Է��������ܷ��ʣ��Ҳ�������·�������⡣����guest�˻����ʡ�
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "AllowInsecureGuestAuth" /t REG_DWORD /d 1 /f
goto :eof

:Notepad
echo ���±�ʼ����ʾ״̬��
reg add "HKCU\Software\Microsoft\NotePad" /v "StatusBar" /t REG_DWORD /d 1 /f
echo ���±������Զ�����
reg add "HKCU\Software\Microsoft\NotePad" /v "fwrap" /t REG_DWORD /d 1 /f
echo ����Ҽ����ļ����ü��±���
rem ��97��imageres.dll,289
reg add "HKCR\*\shell\Noteped" /ve /d "�ü��±���" /f
reg add "HKCR\*\shell\Noteped" /v "icon" /d "SHELL32.dll,70" /f
reg add "HKCR\*\shell\Noteped\command" /ve /d "Notepad.exe %%1" /f
goto :eof

:Notepad2
echo ����Notepad2��ϵͳ
copy /y "Notepad2.exe" "%SystemRoot%" >nul 2>nul
echo ��Notepad�ٳ�ΪNotepad2
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe" /f >nul 2>nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe" /v "Debugger" /d "\"C:\Windows\Notepad2.exe\" /z" /f >nul 2>nul
goto :eof

:OneDrive
echo ж��OneDrive
rem https://go.microsoft.com/fwlink/?linkid=844652
taskkill /f /im OneDrive.exe > NUL 2>&1
%SYSTEMROOT%\SysWOW64\OneDriveSetup.exe /uninstall
rd /s /q "%UserProfile%\OneDrive" > NUL 2>&1
rd /s /q "%LocalAppData%\Microsoft\OneDrive" > NUL 2>&1
rd /s /q "%ProgramData%\Microsoft OneDrive" > NUL 2>&1
rd /s /q "C:\OneDriveTemp" > NUL 2>&1
reg delete "HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f > NUL 2>&1
reg delete "HKCR\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f > NUL 2>&1
reg delete "HKEY_USERS\DEFAULT\Software\Microsoft\Windows\CurrentVersion\Run" /f > NUL 2>&1
goto :eof

:PhotoViewer
echo ���� Windows ��Ƭ�鿴��
reg add "HKCU\Software\Classes\.bmp" /ve /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKCU\Software\Classes\.gif" /ve /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKCU\Software\Classes\.ico" /ve /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKCU\Software\Classes\.jpe" /ve /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKCU\Software\Classes\.jpeg" /ve /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKCU\Software\Classes\.jpg" /ve /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKCU\Software\Classes\.png" /ve /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKCU\Software\Classes\.tga" /ve /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKCU\Software\Classes\.tif" /ve /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKCU\Software\Classes\.tiff" /ve /d "PhotoViewer.FileAssoc.Tiff" /f
goto :eof

:Powercfg
echo �ر�����
powercfg -h off
echo ���õ�Դ�ƻ��������ܡ�
powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
rem echo ����׿Խ��Դģʽ
rem powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
echo ���õ�Դ�ƻ���׿Խ���ܡ�
powercfg -setactive e9a42b02-d5df-448d-aa00-03f14749eb61
echo ������Ļ�Զ��ر�ʱ��Ϊ��5����
powercfg -x -monitor-timeout-ac 5
goto :eof

:RightMenuAdd
echo ��ӣ��ļ���ע��(��)DLL/OCX�ļ�
reg add "HKCR\dllfile\shell\ע�� DLL\Command" /ve /d "Regsvr32 \\\"%%1\\\"" /f
reg add "HKCR\dllfile\shell\ע�� DLL\Command" /ve /d "Regsvr32 /u \\\"%%1\\\"" /f
reg add "HKCR\ocxfile\shell\ע�� OCX\Command" /ve /d "Regsvr32 \\\"%%1\\\"" /f
reg add "HKCR\ocxfile\shell\ע�� OCX\Command" /ve /d "Regsvr32 /u \\\"%%1\\\"" /f
echo ��ӣ��½���������bat
reg add "HKCR\.bat" /ve /d "batfile" /f
reg add "HKCR\.bat\PersistentHandler" /ve /d "{5e941d80-bf96-11cd-b579-08002b30bfeb}" /f
reg add "HKCR\.bat\ShellNew" /v "NullFile" /d "" /f
goto :eof

:RightMenuDel
echo �����ļ����½�
rem .BMP�ļ�
reg delete "HKCR\.bmp\ShellNew" /f > NUL 2>&1
rem .��ϵ�� 
reg delete "HKCR\.contact\ShellNew" /f > NUL 2>&1
rem .RTF�ļ�
reg delete "HKCR\.rtf\ShellNew" /f > NUL 2>&1
rem .rar�ļ�
reg delete "HKLM\SOFTWARE\Classes\.rar\ShellNew" /f > NUL 2>&1
rem .zip�ļ�
reg delete "HKLM\SOFTWARE\Classes\.zip\ShellNew" /f > NUL 2>&1
echo �����Ҽ������͵�
rem ѹ��(zipped)�ļ���
del /f "%AppData%\Microsoft\Windows\SendTo\Compressed (zipped) Folder.ZFSendToTarget" > NUL 2>&1
rem �����ռ���
del /f "%AppData%\Microsoft\Windows\SendTo\Fax Recipient.lnk" > NUL 2>&1
rem �ʼ��ռ���
del /f "%AppData%\Microsoft\Windows\SendTo\Mail Recipient.MAPIMail" > NUL 2>&1
rem �ĵ�
del /f "%AppData%\Microsoft\Windows\SendTo\�ĵ�.mydocs" > NUL 2>&1
echo ��������վ�Ҽ����̶�����ʼ��Ļ
reg delete "HKLM\SOFTWARE\Classes\Folder\shellex\ContextMenuHandlers\PintoStartScreen" /f > NUL 2>&1
echo �����ļ������������ѽ��
reg delete "HKCR\Msi.Package\shellex\ContextMenuHandlers\Compatibility" /f > NUL 2>&1
reg delete "HKCR\exefile\shellex\ContextMenuHandlers\Compatibility" /f > NUL 2>&1
echo �����ļ�������
reg delete "HKCR\*\shellex\ContextMenuHandlers\ModernSharing" /f > NUL 2>&1
echo �����ļ�����ԭ��ǰ�İ汾
reg delete "HKCR\Drive\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f > NUL 2>&1
reg delete "HKCR\Directory\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f > NUL 2>&1
reg delete "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f > NUL 2>&1
echo ���������ļ��У����̶������ٷ��ʡ�
reg delete "HKCR\Folder\shell\pintohome" /f > NUL 2>&1
echo ���������ļ��У�������Bitlocker���Ҽ��˵�
reg delete "HKCR\Drive\shell\encrypt-bde" /f > NUL 2>&1
reg delete "HKCR\Drive\shell\encrypt-bde-elev" /f > NUL 2>&1
echo ���������ļ��У����������Ȩ�ޡ�����������
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{F81E9010-6EA4-11CE-A7FF-00AA003CA9F6}" /d "" /f > NUL 2>&1
echo �����ļ��У�ʹ�� VLC media player ����
reg delete "HKCR\Directory\shell\AddToPlaylistVLC" /f > NUL 2>&1
reg delete "HKCR\Directory\shell\PlayWithVLC" /f > NUL 2>&1
echo ����WinRAR �Ҽ� �Ҽ����
reg add "HKCU\Software\WinRAR\Setup\MenuItems" /v "EmailArc" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\WinRAR\Setup\MenuItems" /v "EmailOpt" /t REG_DWORD /d 0 /f
echo ����ͼƬ/�����Ҽ��˵��еġ�Windows Media Player��ѡ��
reg delete "HKCR\SystemFileAssociations\audio\shell" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\Directory.Audio\shell" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\Directory.Image\shell" /f > NUL 2>&1
echo �����ļ���ͼƬ������������ת
reg delete "HKCR\SystemFileAssociations\.bmp\ShellEx\ContextMenuHandlers\ShellImagePreview" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.gif\ShellEx\ContextMenuHandlers\ShellImagePreview" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.ico\ShellEx\ContextMenuHandlers\ShellImagePreview" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.jpeg\ShellEx\ContextMenuHandlers\ShellImagePreview" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.jpg\ShellEx\ContextMenuHandlers\ShellImagePreview" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.png\ShellEx\ContextMenuHandlers\ShellImagePreview" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.psd\ShellEx\ContextMenuHandlers\ShellImagePreview" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.tif\ShellEx\ContextMenuHandlers\ShellImagePreview" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.tiff\ShellEx\ContextMenuHandlers\ShellImagePreview" /f > NUL 2>&1
echo �����ļ���ͼ����Ƶ����Ƶ��������ʽ�Ҽ������ŵ��豸
reg delete "HKCR\SystemFileAssociations\image\shellex\ContextMenuHandlers\PlayTo" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\audio\shellex\ContextMenuHandlers\PlayTo" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\video\shellex\ContextMenuHandlers\PlayTo" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.mkv\shellex\ContextMenuHandlers\PlayTo" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.mp4\shellex\ContextMenuHandlers\PlayTo" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.m4v\shellex\ContextMenuHandlers\PlayTo" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\Directory.Audio\shellex\ContextMenuHandlers\PlayTo" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\Directory.Image\shellex\ContextMenuHandlers\PlayTo" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\Directory.Video\shellex\ContextMenuHandlers\PlayTo" /f > NUL 2>&1
echo �����ļ���ͼƬ��ʹ�û�ͼ3D���б༭
reg delete "HKCR\SystemFileAssociations\.bmp\Shell\3D Edit" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.jpg\Shell\3D Edit" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.png\Shell\3D Edit" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.tif\Shell\3D Edit" /f > NUL 2>&1
echo ���أ�ͼƬ�Ҽ����༭ (��Shift��ʾ)
reg add "HKCR\SystemFileAssociations\image\shell\edit" /v "Extended" /d "" /f
echo ���أ�ͼƬ�Ҽ�������Ϊ���汳�� (��Shift��ʾ)
reg add "HKCR\SystemFileAssociations\.jpg\Shell\setdesktopwallpaper" /v "Extended" /d "" /f
reg add "HKCR\SystemFileAssociations\.png\Shell\setdesktopwallpaper" /v "Extended" /d "" /f
reg add "HKCR\SystemFileAssociations\.bmp\Shell\setdesktopwallpaper" /v "Extended" /d "" /f
reg add "HKCR\SystemFileAssociations\.tif\Shell\setdesktopwallpaper" /v "Extended" /d "" /f
reg add "HKCR\SystemFileAssociations\.gif\Shell\setdesktopwallpaper" /v "Extended" /d "" /f
echo ���أ������ļ���ʽ���Ҽ�����ӡ (��Shift��ʾ)
reg add "HKCR\SystemFileAssociations\image\shell\print" /v "Extended" /d "" /f
reg add "HKCR\batfile\shell\print" /v "Extended" /d "" /f
reg add "HKCR\cmdfile\shell\print" /v "Extended" /d "" /f
reg add "HKCR\regfile\shell\print" /v "Extended" /d "" /f
reg add "HKCR\txtfile\shell\print" /v "Extended" /d "" /f
echo ����opendlg
reg delete "HKCR\Unknown\shell\opendlg" /f > NUL 2>&1
reg delete "HKCR\Unknown\shell\opendlg\command" /f > NUL 2>&1
reg delete "HKLM\SOFTWARE\Classes\Folder\shell\pintostartscreen" /f > NUL 2>&1
reg delete "HKLM\SOFTWARE\Classes\Folder\shell\pintostartscreen\command" /f > NUL 2>&1
echo �����Կ���
rem reg delete "HKCR\Directory\Background\ShellEx\ContextMenuHandlers\ACE" /f > NUL 2>&1
rem reg delete "HKCR\Directory\Background\ShellEx\ContextMenuHandlers\NvCplDesktopContext" /f > NUL 2>&1
reg delete "HKCR\Directory\Background\ShellEx\ContextMenuHandlers\igfxDTCM" /f > NUL 2>&1
reg delete "HKCR\Directory\Background\ShellEx\ContextMenuHandlers\igfxOSP" /f > NUL 2>&1
reg delete "HKCR\Directory\Background\ShellEx\ContextMenuHandlers\igfxcui" /f > NUL 2>&1
echo ����Dell Display Manager
reg delete "HKCR\DesktopBackground\Shell\DDM" /f > NUL 2>&1
echo �����ϴ���WPS�ĵ�
reg delete "HKCR\*\shellex\ContextMenuHandlers\qingshellext" /f > NUL 2>&1
echo �����ϴ����ٶ�����
reg delete "HKCR\*\shellex\ContextMenuHandlers\YunShellExt" /f > NUL 2>&1
goto :eof

:RightMenuShift
echo ���:��ʾ/�����ļ� (��Shift��ʾ)
>"%windir%\SuperHidden.vbs" echo Dim WSHShell
>>"%windir%\SuperHidden.vbs" echo Set WSHShell = WScript.CreateObject("WScript.Shell")
>>"%windir%\SuperHidden.vbs" echo sTitle1 = "SSH=0"
>>"%windir%\SuperHidden.vbs" echo sTitle2 = "SSH=1"
>>"%windir%\SuperHidden.vbs" echo if WSHShell.RegRead("HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ShowSuperHidden") = 1 then
>>"%windir%\SuperHidden.vbs" echo WSHShell.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ShowSuperHidden", "0", "REG_DWORD"
>>"%windir%\SuperHidden.vbs" echo WSHShell.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Hidden", "2", "REG_DWORD"
>>"%windir%\SuperHidden.vbs" echo WSHShell.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\HideFileExt", "1", "REG_DWORD"
>>"%windir%\SuperHidden.vbs" echo WSHShell.SendKeys "{F5}"
>>"%windir%\SuperHidden.vbs" echo else
>>"%windir%\SuperHidden.vbs" echo WSHShell.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ShowSuperHidden", "1", "REG_DWORD"
>>"%windir%\SuperHidden.vbs" echo WSHShell.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Hidden", "1", "REG_DWORD"
>>"%windir%\SuperHidden.vbs" echo WSHShell.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\HideFileExt", "0", "REG_DWORD"
>>"%windir%\SuperHidden.vbs" echo WSHShell.SendKeys "{F5}"
>>"%windir%\SuperHidden.vbs" echo end if
>>"%windir%\SuperHidden.vbs" echo Set WSHShell = Nothing
>>"%windir%\SuperHidden.vbs" echo WScript.Quit(0)
reg add "HKCR\Directory\Background\shell\0SuperHidden" /ve /d "��ʾ/�����ļ�"(H)"" /f
reg add "HKCR\Directory\Background\shell\0SuperHidden" /v "Extended" /d "" /f
reg add "HKCR\Directory\Background\shell\0SuperHidden" /v "icon" /d "shell32.dll,4" /f
reg add "HKCR\Directory\Background\shell\0SuperHidden\Command" /ve /d "WScript.exe C:\windows\SuperHidden.vbs" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSuperHidden" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d 2 /f
echo ��ֹ���֡����û���ڸû�ִ��windows�ű�������Ȩ�ޡ�����ϵͳ����Ա��ϵ����������
regsvr32 /s scrrun.dll
reg add "HKLM\SOFTWARE\Microsoft\Windows Script Host\Settings" /v "Enabled" /t REG_DWORD /d 1 /f
echo ���:����Աȡ������Ȩ(��ȡTrustedInstallerȨ��) (��Shift��ʾ)
reg add "HKCR\*\shell\runas" /ve /d "����Աȡ������Ȩ" /f
reg add "HKCR\*\shell\runas" /v "HasLUAShield" /d "" /f
reg add "HKCR\*\shell\runas" /v "NoWorkingDirectory" /d "" /f
reg add "HKCR\*\shell\runas" /v "Extended" /d "" /f
reg add "HKCR\*\shell\runas" /v "Icon" /d "imageres.dll,1" /f
reg add "HKCR\*\shell\runas\command" /ve /d "cmd.exe /c takeown /f \"%%1\" && icacls \"%%1\" /grant administrators:F" /f
reg add "HKCR\*\shell\runas\command" /v "IsolatedCommand" /d "cmd.exe /c takeown /f \"%%1\" && icacls \"%%1\" /grant administrators:F" /f
reg add "HKCR\Directory\shell\runas" /ve /d "����Աȡ������Ȩ" /f
reg add "HKCR\Directory\shell\runas" /v "HasLUAShield" /d "" /f
reg add "HKCR\Directory\shell\runas" /v "NoWorkingDirectory" /d "" /f
reg add "HKCR\Directory\shell\runas" /v "Extended" /d "" /f
reg add "HKCR\Directory\shell\runas" /v "Icon" /d "imageres.dll,1" /f
reg add "HKCR\Directory\shell\runas\command" /ve /d "cmd.exe /c takeown /f \"%%1\" /r /d y && icacls \"%%1\" /grant administrators:F /t" /f
reg add "HKCR\Directory\shell\runas\command" /v "IsolatedCommand" /d "cmd.exe /c takeown /f \"%%1\" /r /d y && icacls \"%%1\" /grant administrators:F /t" /f
reg add "HKCR\exefile\shell\runas2" /ve /d "����Աȡ������Ȩ" /f
reg add "HKCR\exefile\shell\runas2" /v "HasLUAShield" /d "" /f
reg add "HKCR\exefile\shell\runas2" /v "NoWorkingDirectory" /d "" /f
reg add "HKCR\exefile\shell\runas2" /v "Extended" /d "" /f
reg add "HKCR\exefile\shell\runas2" /v "Icon" /d "imageres.dll,1" /f
reg add "HKCR\exefile\shell\runas2\command" /ve /d "cmd.exe /c takeown /f \"%%1\" && icacls \"%%1\" /grant administrators:F" /f
reg add "HKCR\exefile\shell\runas2\command" /v "IsolatedCommand" /d "cmd.exe /c takeown /f \"%%1\" && icacls \"%%1\" /grant administrators:F" /f
echo ��ӣ��ļ���ѡ�� (��Shift��ʾ)
reg add "HKCR\Directory\Background\shell\�ļ���ѡ��" /ve /d "�ļ���ѡ��" /f
reg add "HKCR\Directory\Background\shell\�ļ���ѡ��" /v "Extended" /d "" /f
reg add "HKCR\Directory\Background\shell\�ļ���ѡ��" /v "icon" /d "SHELL32.dll,4" /f
reg add "HKCR\Directory\Background\shell\�ļ���ѡ��\command" /ve /d "rundll32.exe shell32.dll,Options_RunDLL 7" /f
echo ��ӣ��ļ��У�CMD����ͨ�� (��Shift��ʾ)
reg add "HKCR\folder\shell\cmd" /ve /d "�ڴ˴���������ʾ��" /f
reg add "HKCR\folder\shell\cmd" /v "icon" /d "shell32.dll,71" /f
reg add "HKCR\folder\shell\cmd" /v "Extended" /d "" /f
reg add "HKCR\folder\shell\cmd\command" /ve /d "cmd.exe /s /k pushd \"%%V\"" /f
echo ��ӣ��ļ��У������ļ���·�� (��Shift��ʾ)
reg add "HKCR\Directory\shell\copypath" /ve /d "�����ļ���·��" /f
reg add "HKCR\Directory\shell\copypath" /v "Extended" /d "" /f
reg add "HKCR\Directory\shell\copypath" /v "icon" /d "SHELL32.dll,4" /f
reg add "HKCR\Directory\shell\copypath\command" /ve /d "mshta vbscript:clipboarddata.setdata"(\"text\",\"%%1\")""(close)"" /f
echo ��ӣ��ļ��������ļ�·�� (��Shift��ʾ)
reg add "HKCR\*\shell\copypath" /ve /d "�����ļ�·��" /f
reg add "HKCR\*\shell\copypath" /v "Extended" /d "" /f
reg add "HKCR\*\shell\copypath" /v "icon" /d "SHELL32.dll,4" /f
reg add "HKCR\*\shell\copypath\command" /ve /d "mshta vbscript:clipboarddata.setdata"(\"text\",\"%%1\")""(close)"" /f
goto :eof

:RightMenuSysTools
echo ���ϵͳ���߳�����
reg delete "HKCR\DesktopBackground\Shell\SysTools" /f > NUL 2>&1
reg add "HKCR\DesktopBackground\Shell\SysTools" /v "SubCommands" /d "" /f
reg add "HKCR\DesktopBackground\Shell\SysTools" /v "Icon" /d "SHELL32.dll,76" /f
reg add "HKCR\DesktopBackground\Shell\SysTools" /v "MUIVerb" /d "ϵͳ����" /f
reg add "HKCR\DesktopBackground\Shell\SysTools" /v "Position" /d "Bottom" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\00SnippingTool" /ve /d "��ͼ����" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\00SnippingTool" /v "icon" /d "SnippingTool.exe" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\00SnippingTool\command" /ve /d "SnippingTool.exe" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\01Paint" /ve /d "��ͼ" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\01Paint" /v "icon" /d "mspaint.exe" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\01Paint\command" /ve /d "mspaint.exe" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\02Calculator" /ve /d "������" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\02Calculator" /v "icon" /d "calc.exe" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\02Calculator\command" /ve /d "calc.exe" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\1Devmgmt" /ve /d "�豸������" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\1Devmgmt" /v "icon" /d "DevicePairingWizard.exe" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\1Devmgmt\command" /ve /d "mmc.exe devmgmt.msc" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\2Appwiz" /ve /d "��ӻ�ɾ������" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\2Appwiz" /v "icon" /d "wusa.exe" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\2Appwiz\command" /ve /d "control appwiz.cpl" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\3ComputerDefaults" /ve /d "Ĭ��Ӧ��" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\3ComputerDefaults" /v "icon" /d "ComputerDefaults.exe" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\3ComputerDefaults\command" /ve /d "ComputerDefaults.exe" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\4CompMgmt" /ve /d "����" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\4CompMgmt" /v "icon" /d "CompMgmtLauncher.exe" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\4CompMgmt\command" /ve /d "CompMgmtLauncher.exe" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\4ControlPanel" /ve /d "�������" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\4ControlPanel" /v "icon" /d "shell32.dll,21" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\4ControlPanel\command" /ve /d "rundll32.exe shell32.dll,Control_RunDLL" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\5Gpedit" /ve /d "�����" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\5Gpedit" /v "icon" /d "SecEdit.exe" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\5Gpedit\command" /ve /d "mmc.exe gpedit.msc" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\6Secpol" /ve /d "���ذ�ȫ����" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\6Secpol" /v "icon" /d "wlrmdr.exe" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\6Secpol\command" /ve /d "mmc.exe secpol.msc" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\7Regedit" /ve /d "ע���" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\7Regedit" /v "icon" /d "Regedit.exe" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\7Regedit\command" /ve /d "Regedit.exe" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\90Shutdown" /ve /d "ʮ��ػ�" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\90Shutdown" /v "icon" /d "shell32.dll,215" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\90Shutdown\command" /ve /d "Shutdown -s -hybrid -f -t 10" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\91Restart" /ve /d "��������" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\91Restart" /v "icon" /d "shell32.dll,112" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\91Restart\command" /ve /d "Shutdown -r -f -t 0" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\92ShutdownOff" /ve /d "ȡ���ػ�" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\92ShutdownOff" /v "icon" /d "shell32.dll,215" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\92ShutdownOff\command" /ve /d "Shutdown -a" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\93RestartExplorer" /ve /d "������Դ������" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\93RestartExplorer" /v "icon" /d "shell32.dll,238" /f
reg add "HKCR\DesktopBackground\Shell\SysTools\Shell\93RestartExplorer\Command" /ve /d "tskill explorer" /f
echo �޸��Ҽ����½�������
reg add "HKEY_CLASSES_ROOT\Directory\Background\shellex\ContextMenuHandlers\New" /ve /d "{D969A300-E7FF-11d0-A93B-00A0C90F2719}" /t REG_SZ /f
goto :eof

:Service
rem ����������֣�WinĬ�Ͻ��õķ���AppVClient NetTcpPortSharing ssh-agent RemoteRegistry RemoteAccess shpamsvc tzautoupdate UevAgentService
rem ����ʹ�������Ϣ���ռ��ʹ���
echo Connected User Experiences and Telemetry
sc config DiagTrack start=disabled
echo Data Sharing Service
sc config DsSvc start=disabled
echo Diagnostic Execution Service
sc config diagsvc start=disabled
echo ������Ϸ��� Diagnostic Policy Service
sc config DPS start=disabled
echo Diagnostic Service Host
sc config WdiServiceHost start=disabled
echo Diagnostic System Host
sc config WdiSystemHost start=disabled
echo dmwappushsvc
sc config dmwappushservice start=disabled
echo Microsoft (R) ������ı�׼�ռ�������
sc config diagnosticshub.standardcollector.service start=disabled
echo "Performance Logs & Alerts"
sc config pla start=disabled
echo Problem Reports and Solutions Control Panel Support
sc config wercplsupport start=disabled

echo ����Զ���޸�ע���
sc config RemoteRegistry start=disabled
echo ���ó������������ Program Compatibility Assistant Service
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisablePCA" /d 1 /t REG_DWORD /f >nul 2>nul
sc config PcaSvc start=disabled

echo ���� Hyper-V
rem To disable: 
bcdedit /set hypervisorlaunchtype off
rem To enable: bcdedit /set hypervisorlaunchtype auto
sc config HvHost start=disabled
sc config vmickvpexchange start=disabled
sc config vmicguestinterface start=disabled
sc config vmicshutdown start=disabled
sc config vmicheartbeat start=disabled
sc config vmicvmsession start=disabled
sc config vmictimesync start=disabled
sc config vmicvss start=disabled
sc config vmicrdv start=disabled

echo Xbox Accessory Management Service
sc config XboxGipSvc start=disabled
echo Xbox Live �����֤������
sc config XblAuthManager start=disabled
echo Xbox Live �������
sc config XboxNetApiSvc start=disabled
echo Xbox Live ��Ϸ����
sc config XblGameSave start=disabled
echo ���� XBOX GameDVR
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v "value" /t REG_DWORD /d 0 /f > NUL 2>&1

echo Fax
sc config Fax start=disabled
echo Distributed Link Tracking Client
sc config TrkWks start=disabled
echo Downloaded Maps Manager
sc config MapsBroker start=disabled
echo Geolocation Service
sc config lfsvc start=disabled
echo Phone Service
sc config PhoneSvc start=disabled

echo Remote Registry(Զ���޸�ע���)
sc config RemoteRegistry start=disabled
echo Superfetch
sc config SysMain start=disabled
echo Windows Media Player Network Sharing Service
sc config WMPNetworkSvc start=disabled
echo Windows Search
taskkill /f /im SearchUI.exe > NUL 2>&1
sc config WSearch start=disabled
echo Windows ����֪ͨϵͳ����
sc config WpnService start=disabled
echo ������ʾ����
sc config RetailDemo start=disabled

echo ���ڷ���
sc config QQMusicService start=disabled > NUL 2>&1
sc config QiyiService start=disabled > NUL 2>&1
sc config wpscloudsvr start=disabled > NUL 2>&1
goto :eof

:StartUp
echo ����������
del /f /q "%ProgramData%\Microsoft\Windows\Start Menu\Programs\StartUp\*.lnk" 1>nul 2>nul
del /f /q "%AppData%\Microsoft\Windows\Start Menu\Programs\Startup\*.lnk" 1>nul 2>nul
echo ���Ĭ��������
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /f
taskmgr
goto :eof

:SystemRestore
echo �ر�ϵͳ������ɾ����ԭ��
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore" /v "DisableSR" /d 1 /t REG_DWORD /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "RPSessionInterval" /d 0 /t REG_DWORD /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer" /v "LimitSystemRestoreCheckpointing" /d 1 /t REG_DWORD /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SPP\Clients" /f > NUL 2>&1
rem SystemPropertiesProtection.exe
goto :eof

:Taskbar
echo ���ļ���Դ������ʱ ��Ϊ���ҵĵ���
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d 1 /f
echo �����������е�Cortana
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 0 /f
echo �����������ϵ�����
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v "PeopleBand" /t REG_DWORD /d 0 /f
rem echo �������������½ǲ�������ͼ�꣺�ر��Ҳ�֪ͨ������
rem reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /t REG_DWORD /d 1 /f
echo ������ʱ�侫ȷ����
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSecondsInSystemClock" /t REG_DWORD /d 1 /f
echo ����������ռ��ʱ���ϲ���������ť�����Ӳ��ϲ�
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarGlomLevel" /t REG_DWORD /d 2 /f
echo ����������
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSizeMove" /t REG_DWORD /d 0 /f
echo ���� ϵͳ���̼����ͼ��
echo y|reg delete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v IconStreams > NUL 2>&1
echo y|reg delete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v PastIconsStream > NUL 2>&1
goto :eof

:Taskschd
rem ����ƻ�������� %windir%\system32\taskschd.msc /s start taskschd.msc /s
echo Microsoft �ͻ�������Ƽƻ�
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319 64"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319 64 Critical"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319 Critical"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Application Experience\ProgramDataUpdater"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Application Experience\StartupAppTask"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Autochk\Proxy"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\CloudExperienceHost\CreateObjectTask"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Diagnosis\Scheduled\RecommendedTroubleshootingScanner"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Diagnosis\Scheduled"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\DiskFootprint\Diagnostics"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Feedback\Siuf\DmClient"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\FileHistory\File History (maintenance mode)"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Location\Notifications"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Location\WindowsActionDialog"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Maintenance\WinSAT"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Maps\MapsToastTask"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Maps\MapsUpdateTask"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\MemoryDiagnostic\ProcessMemoryDiagnosticEvents"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\MemoryDiagnostic\RunFullMemoryDiagnostic"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Mobile Broadband Accounts\MNO Metadata Parser"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\RetailDemo\CleanupOfflineContent"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\WDI\ResolutionHost"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Windows Error Reporting\QueueReporting"
echo Windows Defender
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Windows Defender\Windows Defender Cleanup"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Windows Defender\Windows Defender Verification"
echo �������Ż�����Ƭ����
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Defrag\ScheduledDefrag"
echo �Զ���������
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\DiskCleanup\SilentCleanup"
echo XblGameSaveTask
SCHTASKS /Change /Disable /TN "\Microsoft\XblGameSave\XblGameSaveTask"
echo Adobe
SCHTASKS /Change /DISABLE /TN "\AdobeAAMUpdater-1.0-%computername%-%username%" > NUL 2>&1
echo ASUS
SCHTASKS /Change /DISABLE /TN "\ASUS\Ez Update" > NUL 2>&1
echo GoogleUpdate
SCHTASKS /Change /DISABLE /TN "\GoogleUpdateTaskMachineUA" > NUL 2>&1
SCHTASKS /Change /DISABLE /TN "\GoogleUpdateTaskMachineCore" > NUL 2>&1
echo Officeң�����ĺ�̨����
SCHTASKS /Change /DISABLE /TN "\Microsoft\Office\OfficeTelemetryAgentFallBack"
SCHTASKS /Change /DISABLE /TN "\Microsoft\Office\OfficeTelemetryAgentLogOn"
SCHTASKS /Change /DISABLE /TN "\Microsoft\Office\Office 15 Subscription Heartbeat" > NUL 2>&1
SCHTASKS /Change /DISABLE /TN "\Microsoft\Office\OfficeTelemetryAgentLogOn2016" > NUL 2>&1
SCHTASKS /Change /DISABLE /TN "\Microsoft\Office\OfficeTelemetryAgentFallBack2016" > NUL 2>&1
goto :eof

:WMPlayer
echo Windows Media Player ����ʾ�״�ʹ�öԻ���
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsMediaPlayer" /v "GroupPrivacyAcceptance" /t REG_DWORD /d 1 /f > NUL 2>&1
goto :eof

:WindowsDefender
echo ɾ����ȫ���Ŀ�������
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "SecurityHealth" /f >nul 2>nul
echo ����Windows Defender ��ȫ���ķ���
reg add "HKLM\SYSTEM\ControlSet001\Services\SecurityHealthService" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SecurityHealthService" /v "Start" /t REG_DWORD /d 4 /f
echo ��δ��װͨ��΢��ע���ɱ�������¹ر�Windows Security Center
reg add "HKLM\SOFTWARE\Microsoft\Security Center\Feature" /v "DisableAvCheck" /t REG_DWORD /d 1 /f
echo �ر� Windows Defender ����������
taskkill /f /im MSASCuil.exe >nul 2>nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /d 1 /t REG_DWORD /f
echo ���������������ʼ�ձ�������״̬
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "ServiceKeepAlive" /t REG_DWORD /d 0 /f
echo �ر� Windows Defender SmartScreen
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d 0 /f
echo ����Windows Defender SmartScreen Ӧ�ð�װ����
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\SmartScreen" /v "ConfigureAppInstallControlEnabled" /t REG_DWORD /d 0 /f
echo �ر�ʵʱ����
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t REG_DWORD /d 1 /f
echo ������Ϊ����
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableBehaviorMonitoring" /t REG_DWORD /d 1 /f
echo ����ɨ�����������ļ��͸���
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableIOAVProtection" /t REG_DWORD /d 1 /f
echo ��ֹ�����ļ��ͳ���
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableOnAccessProtection" /t REG_DWORD /d 1 /f
echo ��ֹ�ڴ�ʵʱ����ʱ��������ɨ��
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableScanOnRealtimeEnable" /t REG_DWORD /d 1 /f
echo ���ö������ɾ�����ߵ�Windows����
reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontOfferThroughWUAU" /t REG_DWORD /d 1 /f
echo �����ļ���ʹ��Windows Defenderɨ��
reg delete "HKCR\Drive\ShellEx\ContextMenuHandlers\EPP" /f > NUL 2>&1
reg delete "HKCR\Directory\ShellEx\ContextMenuHandlers\EPP" /f > NUL 2>&1
reg delete "HKCR\*\ShellEx\ContextMenuHandlers\EPP" /f > NUL 2>&1

call :GpUpdate
goto :eof

:WindowsLog
echo ���ô��󱨸�(Windows Error Reporting Service)
sc config WerSvc start= disabled
echo ����WfpDiag.ETL��־
netsh wfp set options netevents = off
echo ����Dirty shutdown event��־
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Reliability" /v "TimeStampInterval" /t REG_DWORD /d 0 /f
echo ����ϵͳ��־
reg add "HKCU\Software\Policies\Microsoft\Windows\Windows Error Reporting" /v "LoggingDisabled" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d 1 /f
echo �����˺ŵ�¼��־����
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "ReportBootOk" /d "0" /f
goto :eof

:WindowsUAC
echo �ر��û��˻����ƣ�UAC��
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d 0 /f
echo ����ļ���ק�޷��򿪵�����
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d 0 /f
echo ȥ��UACС����
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 77 /d "%systemroot%\system32\imageres.dll,197" /t reg_sz /f
echo �رմ� ���� �ļ��ġ���ȫ���桱
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /v "ModRiskFileTypes" /d ".7z;.cab;.bat;.chm;.cmd;.exe;.js;.msi;.rar;.reg;.vbs;.zip;.txt" /f
goto :eof

:WindowsUpdateClr
echo Windows��������
net stop wuauserv
del /s /q /f %windir%\SoftwareDistribution\Download\*.*
del /s /q /f %windir%\SoftwareDistribution\DataStore\*.*
net start wuauserv
start ms-settings:windowsupdate
goto :eof

:Wsreset
echo ����Ӧ���̵껺��
wsreset
goto :eof

:SoftSN
echo CollageIt
rem http://www.collageitfree.com/download/CollageIt.exe
reg add "HKCU\Software\PearlMountain\CollageIt" /v "RegCode" /d "CLGIT-0252A-0D167-1578C-0AB4F" /f
echo Driver Magician
rem http://www.drivermagician.com/DriverMagician.exe
reg add "HKCU\Software\Driver Magician" /v "serialnumber" /d "6FL51dEf88-D88D2" /f
reg add "HKCU\Software\Driver Magician" /v "username" /d "Driver Magician" /f
echo EasyBoot
reg add "HKCU\Software\EasyBoot Systems\EasyBoot\3.0" /v "UserName" /d "�л����񹲺͹�" /f
reg add "HKCU\Software\EasyBoot Systems\EasyBoot\3.0" /v "Registration" /d "771f3d7a0f2f6c481f73351609687f15" /f
echo EasyBoot-UltraISO
reg add "HKCU\Software\EasyBoot Systems\UltraISO\5.0" /v "UserName" /d "����" /f
reg add "HKCU\Software\EasyBoot Systems\UltraISO\5.0" /v "Registration" /d "69414b170e136f766a32471009176109" /f
echo gBurner
rem http://www.gburner.com/download.htm
reg add "HKCU\Software\gBurner" /v "USER" /t REG_BINARY /d "0007674275726e65723b74c6223b171dcc8490c50338d7262d" /f
echo PowerISO
rem http://www.poweriso.com/download.php
reg add "HKCU\Software\PowerISO" /v "USER" /t REG_BINARY /d "0008506f77657249534fe66a84c1ce846925c12fb7f5f28e2b0c" /f
echo Teleport Pro
rem http://www.tenmax.com/teleport/pro/download.htm  http://www.tenmax.com/Teleport_Pro_Installer.exe
reg add "HKCU\Software\Tennyson Maxwell\Teleport Pro\User" /v "Name" /d "Teleport Pro" /f
reg add "HKCU\Software\Tennyson Maxwell\Teleport Pro\User" /v "Registration" /t REG_DWORD /d 597602693 /f
echo TurboLaunch
rem http://www.savardsoftware.com/turbolaunch/
reg add "HKCU\Software\TurboLaunch" /v "RegistrationCode" /d "BHYQKB-DQJ5ZW-DD171G" /f
reg add "HKCU\Software\TurboLaunch" /v "RegistrationName" /d "TurboLaunch" /f
reg add "HKCU\Software\TurboLaunch" /v "ShowSplashScreen" /t REG_DWORD /d 0 /f
echo WPS2000
reg add "HKCU\Software\Kingsoft\WPS2000\Registration" /v "User" /d "WPS User" /f
reg add "HKCU\Software\Kingsoft\WPS2000\Registration" /v "Company" /d "WPS" /f
reg add "HKCU\Software\Kingsoft\WPS2000\Registration" /v "Serial" /d "KSW00-00000-00000" /f
echo ZD Soft\Screen Recorder
rem http://www.zdsoft.com/download/SRSetup.exe
reg add "HKCU\Software\ZD Soft\Screen Recorder\7CCC341F9C9547828A0C2D346BDB4BD8" /v "Name" /d "Screen Recorder" /f
reg add "HKCU\Software\ZD Soft\Screen Recorder\7CCC341F9C9547828A0C2D346BDB4BD8" /v "Email" /d "screenrecorder@zdsoft.com" /f
reg add "HKCU\Software\ZD Soft\Screen Recorder\7CCC341F9C9547828A0C2D346BDB4BD8" /v "Key" /d "6C8J0-JNB6V-E5VEF-V02JX-BF6J0" /f
echo XnView
rem https://www.xnview.com/en/xnviewmp/#downloads
reg add "HKLM\SOFTWARE\WOW6432Node\XnView" /v "LicenseName" /d "XnView" /f
reg add "HKLM\SOFTWARE\WOW6432Node\XnView" /v "LicenseNumber" /d "1765133585" /f
goto :eof
