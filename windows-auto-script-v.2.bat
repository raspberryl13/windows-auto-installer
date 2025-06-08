@echo off
REM Installing Chocolatey and various programs
echo Script started at %DATE% %TIME% > C:\install_log.txt

REM Install Chocolatey
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))" >> C:\install_log.txt 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Failed to install Chocolatey. Check C:\install_log.txt for details. >> C:\install_log.txt
    pause
    exit /b %ERRORLEVEL%
)
SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

REM Install wget (mandatory for custom downloads)
echo Installing wget...
echo Installing wget... >> C:\install_log.txt
choco install wget -y >> C:\install_log.txt 2>&1

REM Install 7zip (mandatory for archive extraction)
echo Installing 7zip...
echo Installing 7zip... >> C:\install_log.txt
choco install 7zip -y >> C:\install_log.txt 2>&1

REM Install fastfetch
echo Installing fastfetch...
echo Installing fastfetch... >> C:\install_log.txt
choco install fastfetch -y >> C:\install_log.txt 2>&1

REM Collect user input for all optional programs
echo Collecting user input for installations...
echo Collecting user input for installations. >> C:\install_log.txt

:nano
set /P NANO=Would you like to install nano (Y/N)? 
If /I "%NANO%"=="y" set NANO_INSTALL=1
If /I "%NANO%"=="n" set NANO_INSTALL=0
If /I "%NANO%" NEQ "y" If /I "%NANO%" NEQ "n" (echo Incorrect input & goto nano)

:vim
set /P VIM=Would you like to install vim (Y/N)? 
If /I "%VIM%"=="y" set VIM_INSTALL=1
If /I "%VIM%"=="n" set VIM_INSTALL=0
If /I "%VIM%" NEQ "y" If /I "%VIM%" NEQ "n" (echo Incorrect input & goto vim)

:chocolateygui
set /P CHOCOLATEYGUI=Would you like to install Chocolatey GUI (Y/N)? 
If /I "%CHOCOLATEYGUI%"=="y" set CHOCOLATEYGUI_INSTALL=1
If /I "%CHOCOLATEYGUI%"=="n" set CHOCOLATEYGUI_INSTALL=0
If /I "%CHOCOLATEYGUI%" NEQ "y" If /I "%CHOCOLATEYGUI%" NEQ "n" (echo Incorrect input & goto chocolateygui)

:git
set /P GIT=Would you like to install Git (Y/N)? 
If /I "%GIT%"=="y" set GIT_INSTALL=1
If /I "%GIT%"=="n" set GIT_INSTALL=0
If /I "%GIT%" NEQ "y" If /I "%GIT%" NEQ "n" (echo Incorrect input & goto git)

:pandoc
set /P PANDOC=Would you like to install Pandoc (Y/N)? 
If /I "%PANDOC%"=="y" set PANDOC_INSTALL=1
If /I "%PANDOC%"=="n" set PANDOC_INSTALL=0
If /I "%PANDOC%" NEQ "y" If /I "%PANDOC%" NEQ "n" (echo Incorrect input & goto pandoc)

:vmwareworkstation
set /P VMWARE=Would you like to install VMware Workstation (restart required) (Y/N)? 
If /I "%VMWARE%"=="y" set VMWARE_INSTALL=1
If /I "%VMWARE%"=="n" set VMWARE_INSTALL=0
If /I "%VMWARE%" NEQ "y" If /I "%VMWARE%" NEQ "n" (echo Incorrect input & goto vmwareworkstation)

:rufus
set /P RUFUS=Would you like to install Rufus (Y/N)? 
If /I "%RUFUS%"=="y" set RUFUS_INSTALL=1
If /I "%RUFUS%"=="n" set RUFUS_INSTALL=0
If /I "%RUFUS%" NEQ "y" If /I "%RUFUS%" NEQ "n" (echo Incorrect input & goto rufus)

:niubi
set /P NIUBI=Would you like to install NIUBI Partition Manager (Y/N)? 
If /I "%NIUBI%"=="y" set NIUBI_INSTALL=1
If /I "%NIUBI%"=="n" set NIUBI_INSTALL=0
If /I "%NIUBI%" NEQ "y" If /I "%NIUBI%" NEQ "n" (echo Incorrect input & goto niubi)

:firefox
set /P FIREFOX=Would you like to install Firefox (Y/N)? 
If /I "%FIREFOX%"=="y" set FIREFOX_INSTALL=1
If /I "%FIREFOX%"=="n" set FIREFOX_INSTALL=0
If /I "%FIREFOX%" NEQ "y" If /I "%FIREFOX%" NEQ "n" (echo Incorrect input & goto firefox)

:vivaldi
set /P VIVALDI=Would you like to install Vivaldi (Y/N)? 
If /I "%VIVALDI%"=="y" set VIVALDI_INSTALL=1
If /I "%VIVALDI%"=="n" set VIVALDI_INSTALL=0
If /I "%VIVALDI%" NEQ "y" If /I "%VIVALDI%" NEQ "n" (echo Incorrect input & goto vivaldi)

:chromium
set /P CHROMIUM=Would you like to install Chromium (Y/N)? 
If /I "%CHROMIUM%"=="y" set CHROMIUM_INSTALL=1
If /I "%CHROMIUM%"=="n" set CHROMIUM_INSTALL=0
If /I "%CHROMIUM%" NEQ "y" If /I "%CHROMIUM%" NEQ "n" (echo Incorrect input & goto chromium)

:brave
set /P BRAVE=Would you like to install Brave (Y/N)? 
If /I "%BRAVE%"=="y" set BRAVE_INSTALL=1
If /I "%BRAVE%"=="n" set BRAVE_INSTALL=0
If /I "%BRAVE%" NEQ "y" If /I "%BRAVE%" NEQ "n" (echo Incorrect input & goto brave)

:googlechrome
set /P CHROME=Would you like to install Google Chrome (Y/N)? 
If /I "%CHROME%"=="y" set CHROME_INSTALL=1
If /I "%CHROME%"=="n" set CHROME_INSTALL=0
If /I "%CHROME%" NEQ "y" If /I "%CHROME%" NEQ "n" (echo Incorrect input & goto googlechrome)

:torbrowser
set /P TOR=Would you like to install Tor Browser (Y/N)? 
If /I "%TOR%"=="y" set TOR_INSTALL=1
If /I "%TOR%"=="n" set TOR_INSTALL=0
If /I "%TOR%" NEQ "y" If /I "%TOR%" NEQ "n" (echo Incorrect input & goto torbrowser)

:librewolf
set /P LIBREWOLF=Would you like to install LibreWolf (Y/N)? 
If /I "%LIBREWOLF%"=="y" set LIBREWOLF_INSTALL=1
If /I "%LIBREWOLF%"=="n" set LIBREWOLF_INSTALL=0
If /I "%LIBREWOLF%" NEQ "y" If /I "%LIBREWOLF%" NEQ "n" (echo Incorrect input & goto librewolf)

:protonvpn
set /P PROTONVPN=Would you like to install ProtonVPN (Y/N)? 
If /I "%PROTONVPN%"=="y" set PROTONVPN_INSTALL=1
If /I "%PROTONVPN%"=="n" set PROTONVPN_INSTALL=0
If /I "%PROTONVPN%" NEQ "y" If /I "%PROTONVPN%" NEQ "n" (echo Incorrect input & goto protonvpn)

:protonmailbridge
set /P PROTONMAIL=Would you like to install ProtonMail Bridge (Y/N)? 
If /I "%PROTONMAIL%"=="y" set PROTONMAIL_INSTALL=1
If /I "%PROTONMAIL%"=="n" set PROTONMAIL_INSTALL=0
If /I "%PROTONMAIL%" NEQ "y" If /I "%PROTONMAIL%" NEQ "n" (echo Incorrect input & goto protonmailbridge)

:protondrive
set /P PROTONDRIVE=Would you like to install Proton Drive (Y/N)? 
If /I "%PROTONDRIVE%"=="y" set PROTONDRIVE_INSTALL=1
If /I "%PROTONDRIVE%"=="n" set PROTONDRIVE_INSTALL=0
If /I "%PROTONDRIVE%" NEQ "y" If /I "%PROTONDRIVE%" NEQ "n" (echo Incorrect input & goto protondrive)

:protonpass
set /P PROTONPASS=Would you like to install Proton Pass (Y/N)? 
If /I "%PROTONPASS%"=="y" set PROTONPASS_INSTALL=1
If /I "%PROTONPASS%"=="n" set PROTONPASS_INSTALL=0
If /I "%PROTONPASS%" NEQ "y" If /I "%PROTONPASS%" NEQ "n" (echo Incorrect input & goto protonpass)

:synologydrive
set /P SYNOLOGYDRIVE=Would you like to install Synology Drive (Y/N)? 
If /I "%SYNOLOGYDRIVE%"=="y" set SYNOLOGYDRIVE_INSTALL=1
If /I "%SYNOLOGYDRIVE%"=="n" set SYNOLOGYDRIVE_INSTALL=0
If /I "%SYNOLOGYDRIVE%" NEQ "y" If /I "%SYNOLOGYDRIVE%" NEQ "n" (echo Incorrect input & goto synologydrive)

:transgui
set /P TRANSGUI=Would you like to install Transmission-Qt (Y/N)? 
If /I "%TRANSGUI%"=="y" set TRANSGUI_INSTALL=1
If /I "%TRANSGUI%"=="n" set TRANSGUI_INSTALL=0
If /I "%TRANSGUI%" NEQ "y" If /I "%TRANSGUI%" NEQ "n" (echo Incorrect input & goto transgui)

:signal
set /P SIGNAL=Would you like to install Signal (Y/N)? 
If /I "%SIGNAL%"=="y" set SIGNAL_INSTALL=1
If /I "%SIGNAL%"=="n" set SIGNAL_INSTALL=0
If /I "%SIGNAL%" NEQ "y" If /I "%SIGNAL%" NEQ "n" (echo Incorrect input & goto signal)

:telegram
set /P TELEGRAM=Would you like to install Telegram (Y/N)? 
If /I "%TELEGRAM%"=="y" set TELEGRAM_INSTALL=1
If /I "%TELEGRAM%"=="n" set TELEGRAM_INSTALL=0
If /I "%TELEGRAM%" NEQ "y" If /I "%TELEGRAM%" NEQ "n" (echo Incorrect input & goto telegram)

:thunderbird
set /P THUNDERBIRD=Would you like to install Thunderbird (Y/N)? 
If /I "%THUNDERBIRD%"=="y" set THUNDERBIRD_INSTALL=1
If /I "%THUNDERBIRD%"=="n" set THUNDERBIRD_INSTALL=0
If /I "%THUNDERBIRD%" NEQ "y" If /I "%THUNDERBIRD%" NEQ "n" (echo Incorrect input & goto thunderbird)

:libreoffice
set /P LIBREOFFICE=Would you like to install LibreOffice (Y/N)? 
If /I "%LIBREOFFICE%"=="y" set LIBREOFFICE_INSTALL=1
If /I "%LIBREOFFICE%"=="n" set LIBREOFFICE_INSTALL=0
If /I "%LIBREOFFICE%" NEQ "y" If /I "%LIBREOFFICE%" NEQ "n" (echo Incorrect input & goto libreoffice)

:msoffice
set /P MSOFFICE=Would you like to install Microsoft Office 365 (requires sub.) (Y/N)? 
If /I "%MSOFFICE%"=="y" set MSOFFICE_INSTALL=1
If /I "%MSOFFICE%"=="n" set MSOFFICE_INSTALL=0
If /I "%MSOFFICE%" NEQ "y" If /I "%MSOFFICE%" NEQ "n" (echo Incorrect input & goto msoffice)

:synologynote
set /P SYNOLOGYNOTE=Would you like to install Synology Note Station Client (Y/N)? 
If /I "%SYNOLOGYNOTE%"=="y" set SYNOLOGYNOTE_INSTALL=1
If /I "%SYNOLOGYNOTE%"=="n" set SYNOLOGYNOTE_INSTALL=0
If /I "%SYNOLOGYNOTE%" NEQ "y" If /I "%SYNOLOGYNOTE%" NEQ "n" (echo Incorrect input & goto synologynote)

:trilium
set /P TRILIUM=Would you like to install Trilium Notes (Y/N)? 
If /I "%TRILIUM%"=="y" set TRILIUM_INSTALL=1
If /I "%TRILIUM%"=="n" set TRILIUM_INSTALL=0
If /I "%TRILIUM%" NEQ "y" If /I "%TRILIUM%" NEQ "n" (echo Incorrect input & goto trilium)

:joplin
set /P JOPLIN=Would you like to install Joplin (Y/N)? 
If /I "%JOPLIN%"=="y" set JOPLIN_INSTALL=1
If /I "%JOPLIN%"=="n" set JOPLIN_INSTALL=0
If /I "%JOPLIN%" NEQ "y" If /I "%JOPLIN%" NEQ "n" (echo Incorrect input & goto joplin)

:okular
set /P OKULAR=Would you like to install Okular (Y/N)? 
If /I "%OKULAR%"=="y" set OKULAR_INSTALL=1
If /I "%OKULAR%"=="n" set OKULAR_INSTALL=0
If /I "%OKULAR%" NEQ "y" If /I "%OKULAR%" NEQ "n" (echo Incorrect input & goto okular)

:vscode
set /P VSCODE=Would you like to install Visual Studio Code (Y/N)? 
If /I "%VSCODE%"=="y" set VSCODE_INSTALL=1
If /I "%VSCODE%"=="n" set VSCODE_INSTALL=0
If /I "%VSCODE%" NEQ "y" If /I "%VSCODE%" NEQ "n" (echo Incorrect input & goto vscode)

:vscodium
set /P VSCODIUM=Would you like to install VSCodium (Y/N)? 
If /I "%VSCODIUM%"=="y" set VSCODIUM_INSTALL=1
If /I "%VSCODIUM%"=="n" set VSCODIUM_INSTALL=0
If /I "%VSCODIUM%" NEQ "y" If /I "%VSCODIUM%" NEQ "n" (echo Incorrect input & goto vscodium)

:pycharm
set /P PYCHARM=Would you like to install PyCharm Community (Y/N)? 
If /I "%PYCHARM%"=="y" set PYCHARM_INSTALL=1
If /I "%PYCHARM%"=="n" set PYCHARM_INSTALL=0
If /I "%PYCHARM%" NEQ "y" If /I "%PYCHARM%" NEQ "n" (echo Incorrect input & goto pycharm)

:intellij
set /P INTELLIJ=Would you like to install IntelliJ IDEA Community (Y/N)? 
If /I "%INTELLIJ%"=="y" set INTELLIJ_INSTALL=1
If /I "%INTELLIJ%"=="n" set INTELLIJ_INSTALL=0
If /I "%INTELLIJ%" NEQ "y" If /I "%INTELLIJ%" NEQ "n" (echo Incorrect input & goto intellij)

:thonny
set /P THONNY=Would you like to install Thonny (Y/N)? 
If /I "%THONNY%"=="y" set THONNY_INSTALL=1
If /I "%THONNY%"=="n" set THONNY_INSTALL=0
If /I "%THONNY%" NEQ "y" If /I "%THONNY%" NEQ "n" (echo Incorrect input & goto thonny)

:graphviz
set /P GRAPHVIZ=Would you like to install Graphviz (Y/N)? 
If /I "%GRAPHVIZ%"=="y" set GRAPHVIZ_INSTALL=1
If /I "%GRAPHVIZ%"=="n" set GRAPHVIZ_INSTALL=0
If /I "%GRAPHVIZ%" NEQ "y" If /I "%GRAPHVIZ%" NEQ "n" (echo Incorrect input & goto graphviz)

:unity
set /P UNITY=Would you like to install Unity (Y/N)? 
If /I "%UNITY%"=="y" set UNITY_INSTALL=1
If /I "%UNITY%"=="n" set UNITY_INSTALL=0
If /I "%UNITY%" NEQ "y" If /I "%UNITY%" NEQ "n" (echo Incorrect input & goto unity)

:python3
set /P PYTHON3=Would you like to install Python 3 (Y/N)? 
If /I "%PYTHON3%"=="y" set PYTHON3_INSTALL=1
If /I "%PYTHON3%"=="n" set PYTHON3_INSTALL=0
If /I "%PYTHON3%" NEQ "y" If /I "%PYTHON3%" NEQ "n" (echo Incorrect input & goto python3)

:miniconda3
set /P MINICONDA3=Would you like to install Miniconda3 (Y/N)? 
If /I "%MINICONDA3%"=="y" set MINICONDA3_INSTALL=1
If /I "%MINICONDA3%"=="n" set MINICONDA3_INSTALL=0
If /I "%MINICONDA3%" NEQ "y" If /I "%MINICONDA3%" NEQ "n" (echo Incorrect input & goto miniconda3)

:openjdk
set /P OPENJDK=Would you like to install OpenJDK (Y/N)? 
If /I "%OPENJDK%"=="y" set OPENJDK_INSTALL=1
If /I "%OPENJDK%"=="n" set OPENJDK_INSTALL=0
If /I "%OPENJDK%" NEQ "y" If /I "%OPENJDK%" NEQ "n" (echo Incorrect input & goto openjdk)

:gnucobol
set /P GNUCOBOL=Would you like to install GnuCOBOL (Y/N)? 
If /I "%GNUCOBOL%"=="y" set GNUCOBOL_INSTALL=1
If /I "%GNUCOBOL%"=="n" set GNUCOBOL_INSTALL=0
If /I "%GNUCOBOL%" NEQ "y" If /I "%GNUCOBOL%" NEQ "n" (echo Incorrect input & goto gnucobol)

:kate
set /P KATE=Would you like to install Kate (Y/N)? 
If /I "%KATE%"=="y" set KATE_INSTALL=1
If /I "%KATE%"=="n" set KATE_INSTALL=0
If /I "%KATE%" NEQ "y" If /I "%KATE%" NEQ "n" (echo Incorrect input & goto kate)

:notepadplusplus
set /P NOTEPADPP=Would you like to install Notepad++ (Y/N)? 
If /I "%NOTEPADPP%"=="y" set NOTEPADPP_INSTALL=1
If /I "%NOTEPADPP%"=="n" set NOTEPADPP_INSTALL=0
If /I "%NOTEPADPP%" NEQ "y" If /I "%NOTEPADPP%" NEQ "n" (echo Incorrect input & goto notepadplusplus)

:qownnotes
set /P QOWNNOTES=Would you like to install QOwnNotes (Y/N)? 
If /I "%QOWNNOTES%"=="y" set QOWNNOTES_INSTALL=1
If /I "%QOWNNOTES%"=="n" set QOWNNOTES_INSTALL=0
If /I "%QOWNNOTES%" NEQ "y" If /I "%QOWNNOTES%" NEQ "n" (echo Incorrect input & goto qownnotes)

:ghostwriter
set /P GHOSTWRITER=Would you like to install GhostWriter (Y/N)? 
If /I "%GHOSTWRITER%"=="y" set GHOSTWRITER_INSTALL=1
If /I "%GHOSTWRITER%"=="n" set GHOSTWRITER_INSTALL=0
If /I "%GHOSTWRITER%" NEQ "y" If /I "%GHOSTWRITER%" NEQ "n" (echo Incorrect input & goto ghostwriter)

:darktable
set /P DARKTABLE=Would you like to install Darktable (Y/N)? 
If /I "%DARKTABLE%"=="y" set DARKTABLE_INSTALL=1
If /I "%DARKTABLE%"=="n" set DARKTABLE_INSTALL=0
If /I "%DARKTABLE%" NEQ "y" If /I "%DARKTABLE%" NEQ "n" (echo Incorrect input & goto darktable)

:gimp
set /P GIMP=Would you like to install GIMP (Y/N)? 
If /I "%GIMP%"=="y" set GIMP_INSTALL=1
If /I "%GIMP%"=="n" set GIMP_INSTALL=0
If /I "%GIMP%" NEQ "y" If /I "%GIMP%" NEQ "n" (echo Incorrect input & goto gimp)

:paintdotnet
set /P PAINTNET=Would you like to install paint.net (Y/N)? 
If /I "%PAINTNET%"=="y" set PAINTNET_INSTALL=1
If /I "%PAINTNET%"=="n" set PAINTNET_INSTALL=0
If /I "%PAINTNET%" NEQ "y" If /I "%PAINTNET%" NEQ "n" (echo Incorrect input & goto paintdotnet)

:librecad
set /P LIBRECAD=Would you like to install LibreCAD (Y/N)? 
If /I "%LIBRECAD%"=="y" set LIBRECAD_INSTALL=1
If /I "%LIBRECAD%"=="n" set LIBRECAD_INSTALL=0
If /I "%LIBRECAD%" NEQ "y" If /I "%LIBRECAD%" NEQ "n" (echo Incorrect input & goto librecad)

:blender
set /P BLENDER=Would you like to install Blender (Y/N)? 
If /I "%BLENDER%"=="y" set BLENDER_INSTALL=1
If /I "%BLENDER%"=="n" set BLENDER_INSTALL=0
If /I "%BLENDER%" NEQ "y" If /I "%BLENDER%" NEQ "n" (echo Incorrect input & goto blender)

:audacity
set /P AUDACITY=Would you like to install Audacity (Y/N)? 
If /I "%AUDACITY%"=="y" set AUDACITY_INSTALL=1
If /I "%AUDACITY%"=="n" set AUDACITY_INSTALL=0
If /I "%AUDACITY%" NEQ "y" If /I "%AUDACITY%" NEQ "n" (echo Incorrect input & goto audacity)

:lmms
set /P LMMS=Would you like to install LMMS (Y/N)? 
If /I "%LMMS%"=="y" set LMMS_INSTALL=1
If /I "%LMMS%"=="n" set LMMS_INSTALL=0
If /I "%LMMS%" NEQ "y" If /I "%LMMS%" NEQ "n" (echo Incorrect input & goto lmms)

:handbrake
set /P HANDBRAKE=Would you like to install HandBrake (Y/N)? 
If /I "%HANDBRAKE%"=="y" set HANDBRAKE_INSTALL=1
If /I "%HANDBRAKE%"=="n" set HANDBRAKE_INSTALL=0
If /I "%HANDBRAKE%" NEQ "y" If /I "%HANDBRAKE%" NEQ "n" (echo Incorrect input & goto handbrake)

:losslesscut
set /P LOSSLESSCUT=Would you like to install LosslessCut (Y/N)? 
If /I "%LOSSLESSCUT%"=="y" set LOSSLESSCUT_INSTALL=1
If /I "%LOSSLESSCUT%"=="n" set LOSSLESSCUT_INSTALL=0
If /I "%LOSSLESSCUT%" NEQ "y" If /I "%LOSSLESSCUT%" NEQ "n" (echo Incorrect input & goto losslesscut)

:coretemp
set /P CORETEMP=Would you like to install Core Temp (Y/N)? 
If /I "%CORETEMP%"=="y" set CORETEMP_INSTALL=1
If /I "%CORETEMP%"=="n" set CORETEMP_INSTALL=0
If /I "%CORETEMP%" NEQ "y" If /I "%CORETEMP%" NEQ "n" (echo Incorrect input & goto coretemp)

:cpuz
set /P CPUZ=Would you like to install CPU-Z (Y/N)? 
If /I "%CPUZ%"=="y" set CPUZ_INSTALL=1
If /I "%CPUZ%"=="n" set CPUZ_INSTALL=0
If /I "%CPUZ%" NEQ "y" If /I "%CPUZ%" NEQ "n" (echo Incorrect input & goto cpuz)

:hwmonitor
set /P HWMONITOR=Would you like to install HWMonitor (Y/N)? 
If /I "%HWMONITOR%"=="y" set HWMONITOR_INSTALL=1
If /I "%HWMONITOR%"=="n" set HWMONITOR_INSTALL=0
If /I "%HWMONITOR%" NEQ "y" If /I "%HWMONITOR%" NEQ "n" (echo Incorrect input & goto hwmonitor)

:gpuz
set /P GPUZ=Would you like to install GPU-Z (Y/N)? 
If /I "%GPUZ%"=="y" set GPUZ_INSTALL=1
If /I "%GPUZ%"=="n" set GPUZ_INSTALL=0
If /I "%GPUZ%" NEQ "y" If /I "%GPUZ%" NEQ "n" (echo Incorrect input & goto gpuz)

:mysqlworkbench
set /P MYSQLWORKBENCH=Would you like to install MySQL Workbench (Y/N)? 
If /I "%MYSQLWORKBENCH%"=="y" set MYSQLWORKBENCH_INSTALL=1
If /I "%MYSQLWORKBENCH%"=="n" set MYSQLWORKBENCH_INSTALL=0
If /I "%MYSQLWORKBENCH%" NEQ "y" If /I "%MYSQLWORKBENCH%" NEQ "n" (echo Incorrect input & goto mysqlworkbench)

:mediainfo
set /P MEDIAINFO=Would you like to install MediaInfo (Y/N)? 
If /I "%MEDIAINFO%"=="y" set MEDIAINFO_INSTALL=1
If /I "%MEDIAINFO%"=="n" set MEDIAINFO_INSTALL=0
If /I "%MEDIAINFO%" NEQ "y" If /I "%MEDIAINFO%" NEQ "n" (echo Incorrect input & goto mediainfo)

:mkvtoolnix
set /P MKVTOOLNIX=Would you like to install MKVToolNix (Y/N)? 
If /I "%MKVTOOLNIX%"=="y" set MKVTOOLNIX_INSTALL=1
If /I "%MKVTOOLNIX%"=="n" set MKVTOOLNIX_INSTALL=0
If /I "%MKVTOOLNIX%" NEQ "y" If /I "%MKVTOOLNIX%" NEQ "n" (echo Incorrect input & goto mkvtoolnix)

:mpv
set /P MPV=Would you like to install MPV (Y/N)? 
If /I "%MPV%"=="y" set MPV_INSTALL=1
If /I "%MPV%"=="n" set MPV_INSTALL=0
If /I "%MPV%" NEQ "y" If /I "%MPV%" NEQ "n" (echo Incorrect input & goto mpv)

:vlc
set /P VLC=Would you like to install VLC (Y/N)? 
If /I "%VLC%"=="y" set VLC_INSTALL=1
If /I "%VLC%"=="n" set VLC_INSTALL=0
If /I "%VLC%" NEQ "y" If /I "%VLC%" NEQ "n" (echo Incorrect input & goto vlc)

:obsstudio
set /P OBSSTUDIO=Would you like to install OBS Studio (Y/N)? 
If /I "%OBSSTUDIO%"=="y" set OBSSTUDIO_INSTALL=1
If /I "%OBSSTUDIO%"=="n" set OBSSTUDIO_INSTALL=0
If /I "%OBSSTUDIO%" NEQ "y" If /I "%OBSSTUDIO%" NEQ "n" (echo Incorrect input & goto obsstudio)

:kdenlive
set /P KDENLIVE=Would you like to install Kdenlive (Y/N)? 
If /I "%KDENLIVE%"=="y" set KDENLIVE_INSTALL=1
If /I "%KDENLIVE%"=="n" set KDENLIVE_INSTALL=0
If /I "%KDENLIVE%" NEQ "y" If /I "%KDENLIVE%" NEQ "n" (echo Incorrect input & goto kdenlive)

:lmstudio
set /P LMSTUDIO=Would you like to install LM Studio (Y/N)? 
If /I "%LMSTUDIO%"=="y" set LMSTUDIO_INSTALL=1
If /I "%LMSTUDIO%"=="n" set LMSTUDIO_INSTALL=0
If /I "%LMSTUDIO%" NEQ "y" If /I "%LMSTUDIO%" NEQ "n" (echo Incorrect input & goto lmstudio)

:crystaldiskmark
set /P CRYSTALDISKMARK=Would you like to install CrystalDiskMark (Y/N)? 
If /I "%CRYSTALDISKMARK%"=="y" set CRYSTALDISKMARK_INSTALL=1
If /I "%CRYSTALDISKMARK%"=="n" set CRYSTALDISKMARK_INSTALL=0
If /I "%CRYSTALDISKMARK%" NEQ "y" If /I "%CRYSTALDISKMARK%" NEQ "n" (echo Incorrect input & goto crystaldiskmark)

:geekbench6
set /P GEEKBENCH6=Would you like to install Geekbench 6 (Y/N)? 
If /I "%GEEKBENCH6%"=="y" set GEEKBENCH6_INSTALL=1
If /I "%GEEKBENCH6%"=="n" set GEEKBENCH6_INSTALL=0
If /I "%GEEKBENCH6%" NEQ "y" If /I "%GEEKBENCH6%" NEQ "n" (echo Incorrect input & goto geekbench6)

:heavenbenchmark
set /P HEAVEN=Would you like to install Heaven Benchmark (Y/N)? 
If /I "%HEAVEN%"=="y" set HEAVEN_INSTALL=1
If /I "%HEAVEN%"=="n" set HEAVEN_INSTALL=0
If /I "%HEAVEN%" NEQ "y" If /I "%HEAVEN%" NEQ "n" (echo Incorrect input & goto heavenbenchmark)

:superposition
set /P SUPERPOSITION=Would you like to install Unigine Superposition (Y/N)? 
If /I "%SUPERPOSITION%"=="y" set SUPERPOSITION_INSTALL=1
If /I "%SUPERPOSITION%"=="n" set SUPERPOSITION_INSTALL=0
If /I "%SUPERPOSITION%" NEQ "y" If /I "%SUPERPOSITION%" NEQ "n" (echo Incorrect input & goto superposition)

:valley
set /P VALLEY=Would you like to install Valley Benchmark (Y/N)? 
If /I "%VALLEY%"=="y" set VALLEY_INSTALL=1
If /I "%VALLEY%"=="n" set VALLEY_INSTALL=0
If /I "%VALLEY%" NEQ "y" If /I "%VALLEY%" NEQ "n" (echo Incorrect input & goto valley)

:ultradefrag
set /P ULTRADEFRAG=Would you like to install UltraDefrag (Y/N)? 
If /I "%ULTRADEFRAG%"=="y" set ULTRADEFRAG_INSTALL=1
If /I "%ULTRADEFRAG%"=="n" set ULTRADEFRAG_INSTALL=0
If /I "%ULTRADEFRAG%" NEQ "y" If /I "%ULTRADEFRAG%" NEQ "n" (echo Incorrect input & goto ultradefrag)

:ccleaner
set /P CCLEANER=Would you like to install CCleaner (Y/N)? 
If /I "%CCLEANER%"=="y" set CCLEANER_INSTALL=1
If /I "%CCLEANER%"=="n" set CCLEANER_INSTALL=0
If /I "%CCLEANER%" NEQ "y" If /I "%CCLEANER%" NEQ "n" (echo Incorrect input & goto ccleaner)

:ventoy
set /P VENTOY=Would you like to install Ventoy (Y/N)? 
If /I "%VENTOY%"=="y" set VENTOY_INSTALL=1
If /I "%VENTOY%"=="n" set VENTOY_INSTALL=0
If /I "%VENTOY%" NEQ "y" If /I "%VENTOY%" NEQ "n" (echo Incorrect input & goto ventoy)

:openhardwaremonitor
set /P OPENHWMONITOR=Would you like to install Open Hardware Monitor (Y/N)? 
If /I "%OPENHWMONITOR%"=="y" set OPENHWMONITOR_INSTALL=1
If /I "%OPENHWMONITOR%"=="n" set OPENHWMONITOR_INSTALL=0
If /I "%OPENHWMONITOR%" NEQ "y" If /I "%OPENHWMONITOR%" NEQ "n" (echo Incorrect input & goto openhardwaremonitor)

:steam
set /P STEAM=Would you like to install Steam (Y/N)? 
If /I "%STEAM%"=="y" set STEAM_INSTALL=1
If /I "%STEAM%"=="n" set STEAM_INSTALL=0
If /I "%STEAM%" NEQ "y" If /I "%STEAM%" NEQ "n" (echo Incorrect input & goto steam)

:amazongames
set /P AMAZONGAMES=Would you like to install Amazon Games (Y/N)? 
If /I "%AMAZONGAMES%"=="y" set AMAZONGAMES_INSTALL=1
If /I "%AMAZONGAMES%"=="n" set AMAZONGAMES_INSTALL=0
If /I "%AMAZONGAMES%" NEQ "y" If /I "%AMAZONGAMES%" NEQ "n" (echo Incorrect input & goto amazongames)

:epicgameslauncher
set /P EPICGAMES=Would you like to install Epic Games Launcher (Y/N)? 
If /I "%EPICGAMES%"=="y" set EPICGAMES_INSTALL=1
If /I "%EPICGAMES%"=="n" set EPICGAMES_INSTALL=0
If /I "%EPICGAMES%" NEQ "y" If /I "%EPICGAMES%" NEQ "n" (echo Incorrect input & goto epicgameslauncher)

:goggalaxy
set /P GOGGALAXY=Would you like to install GOG Galaxy (Y/N)? 
If /I "%GOGGALAXY%"=="y" set GOGGALAXY_INSTALL=1
If /I "%GOGGALAXY%"=="n" set GOGGALAXY_INSTALL=0
If /I "%GOGGALAXY%" NEQ "y" If /I "%GOGGALAXY%" NEQ "n" (echo Incorrect input & goto goggalaxy)

:supertuxkart
set /P SUPERTUXKART=Would you like to install SuperTuxKart (Y/N)? 
If /I "%SUPERTUXKART%"=="y" set SUPERTUXKART_INSTALL=1
If /I "%SUPERTUXKART%"=="n" set SUPERTUXKART_INSTALL=0
If /I "%SUPERTUXKART%" NEQ "y" If /I "%SUPERTUXKART%" NEQ "n" (echo Incorrect input & goto supertuxkart)

:sauerbraten
set /P SAUERBRATEN=Would you like to install Sauerbraten (Y/N)? 
If /I "%SAUERBRATEN%"=="y" set SAUERBRATEN_INSTALL=1
If /I "%SAUERBRATEN%"=="n" set SAUERBRATEN_INSTALL=0
If /I "%SAUERBRATEN%" NEQ "y" If /I "%SAUERBRATEN%" NEQ "n" (echo Incorrect input & goto sauerbraten)

:chessx
set /P CHESSX=Would you like to install ChessX (Y/N)? 
If /I "%CHESSX%"=="y" set CHESSX_INSTALL=1
If /I "%CHESSX%"=="n" set CHESSX_INSTALL=0
If /I "%CHESSX%" NEQ "y" If /I "%CHESSX%" NEQ "n" (echo Incorrect input & goto chessx)

REM Perform installations
echo Beginning installations...
echo Beginning installations. >> C:\install_log.txt

REM Utils
if "%NANO_INSTALL%"=="1" (
    echo Installing nano...
    echo Installing nano... >> C:\install_log.txt
    choco install nano -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing nano. >> C:\install_log.txt
)

if "%VIM_INSTALL%"=="1" (
    echo Installing vim...
    echo Installing vim... >> C:\install_log.txt
    choco install vim --params "'/NoDesktopShortcuts'" -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing vim. >> C:\install_log.txt
)

if "%CHOCOLATEYGUI_INSTALL%"=="1" (
    echo Installing Chocolatey GUI...
    echo Installing Chocolatey GUI... >> C:\install_log.txt
    choco install chocolateygui -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Chocolatey GUI. >> C:\install_log.txt
)

if "%GIT_INSTALL%"=="1" (
    echo Installing Git...
    echo Installing Git... >> C:\install_log.txt
    choco install git.install -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Git. >> C:\install_log.txt
)

if "%PANDOC_INSTALL%"=="1" (
    echo Installing Pandoc...
    echo Installing Pandoc... >> C:\install_log.txt
    choco install pandoc -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Pandoc. >> C:\install_log.txt
)

REM VMware Workstation
if "%VMWARE_INSTALL%"=="1" (
    echo Installing VMware Workstation...
    echo Installing VMware Workstation... >> C:\install_log.txt
    set "RANDSTR=%RANDOM%%RANDOM%"
    set "TEMPFOLDER=C:\VMWare_WorkstationInstaller_%RANDSTR%"
    mkdir "%TEMPFOLDER%" >> C:\install_log.txt 2>&1
    cd "%TEMPFOLDER%" >> C:\install_log.txt 2>&1
    echo Downloading VMware Workstation to %TEMPFOLDER%... >> C:\install_log.txt
    wget https://archive.org/download/vmware-workstation-pro-17.5.2/VMware-workstation-full-17.5.2-23775571.exe >> C:\install_log.txt 2>&1
    echo Running VMware Workstation silent installer... >> C:\install_log.txt
    VMware-workstation-full-17.5.2-23775571.exe /s /v /qn EULAS_AGREED=1 >> C:\install_log.txt 2>&1
    echo Cleaning up... >> C:\install_log.txt
    cd \
    rd /S /Q "%TEMPFOLDER%" >> C:\install_log.txt 2>&1
    echo VMware Workstation installation complete. >> C:\install_log.txt
) else (
    echo Not installing VMware Workstation. >> C:\install_log.txt
)

REM Rufus
if "%RUFUS_INSTALL%"=="1" (
    echo Installing Rufus...
    echo Installing Rufus... >> C:\install_log.txt
    choco install rufus -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Rufus. >> C:\install_log.txt
)

REM NIUBI Partition Manager
if "%NIUBI_INSTALL%"=="1" (
    echo Installing NIUBI Partition Manager...
    echo Installing NIUBI Partition Manager... >> C:\install_log.txt
    set "RANDSTR=%RANDOM%%RANDOM%"
    set "TEMPFOLDER=C:\NPE_freeInstaller_%RANDSTR%"
    mkdir "%TEMPFOLDER%" >> C:\install_log.txt 2>&1
    cd "%TEMPFOLDER%" >> C:\install_log.txt 2>&1
    echo Downloading NIUBI installer to %TEMPFOLDER%... >> C:\install_log.txt
    wget https://www.hdd-tool.com/download/NPE_free.exe >> C:\install_log.txt 2>&1
    echo Running NIUBI silent installer... >> C:\install_log.txt
    NPE_free.exe /S >> C:\install_log.txt 2>&1
    echo Cleaning up... >> C:\install_log.txt
    cd \
    rd /S /Q "%TEMPFOLDER%" >> C:\install_log.txt 2>&1
    echo NIUBI installation complete. >> C:\install_log.txt
) else (
    echo Not installing NIUBI Partition Manager. >> C:\install_log.txt
)

REM Browsers
if "%FIREFOX_INSTALL%"=="1" (
    echo Installing Firefox...
    echo Installing Firefox... >> C:\install_log.txt
    choco install firefox -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Firefox. >> C:\install_log.txt
)

if "%VIVALDI_INSTALL%"=="1" (
    echo Installing Vivaldi...
    echo Installing Vivaldi... >> C:\install_log.txt
    choco install vivaldi -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Vivaldi. >> C:\install_log.txt
)

if "%CHROMIUM_INSTALL%"=="1" (
    echo Installing Chromium...
    echo Installing Chromium... >> C:\install_log.txt
    choco install chromium -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Chromium. >> C:\install_log.txt
)

if "%BRAVE_INSTALL%"=="1" (
    echo Installing Brave...
    echo Installing Brave... >> C:\install_log.txt
    choco install brave -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Brave. >> C:\install_log.txt
)

if "%CHROME_INSTALL%"=="1" (
    echo Installing Google Chrome...
    echo Installing Google Chrome... >> C:\install_log.txt
    choco install googlechrome -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Google Chrome. >> C:\install_log.txt
)

if "%TOR_INSTALL%"=="1" (
    echo Installing Tor Browser...
    echo Installing Tor Browser... >> C:\install_log.txt
    choco install tor-browser -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Tor Browser. >> C:\install_log.txt
)

if "%LIBREWOLF_INSTALL%"=="1" (
    echo Installing LibreWolf...
    echo Installing LibreWolf... >> C:\install_log.txt
    choco install librewolf -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing LibreWolf. >> C:\install_log.txt
)

REM Internet
if "%PROTONVPN_INSTALL%"=="1" (
    echo Installing ProtonVPN...
    echo Installing ProtonVPN... >> C:\install_log.txt
    choco install protonvpn -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing ProtonVPN. >> C:\install_log.txt
)

if "%PROTONMAIL_INSTALL%"=="1" (
    echo Installing ProtonMail Bridge...
    echo Installing ProtonMail Bridge... >> C:\install_log.txt
    choco install protonmailbridge -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing ProtonMail Bridge. >> C:\install_log.txt
)

if "%PROTONDRIVE_INSTALL%"=="1" (
    echo Installing Proton Drive...
    echo Installing Proton Drive... >> C:\install_log.txt
    choco install protondrive -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Proton Drive. >> C:\install_log.txt
)

if "%PROTONPASS_INSTALL%"=="1" (
    echo Installing Proton Pass...
    echo Installing Proton Pass... >> C:\install_log.txt
    choco install protonpass -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Proton Pass. >> C:\install_log.txt
)

if "%SYNOLOGYDRIVE_INSTALL%"=="1" (
    echo Installing Synology Drive...
    echo Installing Synology Drive... >> C:\install_log.txt
    choco install synologydrive -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Synology Drive. >> C:\install_log.txt
)

if "%TRANSGUI_INSTALL%"=="1" (
    echo Installing Transmission-Qt...
    echo Installing Transmission-Qt... >> C:\install_log.txt
    choco install transgui -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Transmission-Qt. >> C:\install_log.txt
)

REM Communication
if "%SIGNAL_INSTALL%"=="1" (
    echo Installing Signal...
    echo Installing Signal... >> C:\install_log.txt
    choco install signal -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Signal. >> C:\install_log.txt
)

if "%TELEGRAM_INSTALL%"=="1" (
    echo Installing Telegram...
    echo Installing Telegram... >> C:\install_log.txt
    choco install telegram -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Telegram. >> C:\install_log.txt
)

if "%THUNDERBIRD_INSTALL%"=="1" (
    echo Installing Thunderbird...
    echo Installing Thunderbird... >> C:\install_log.txt
    choco install thunderbird -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Thunderbird. >> C:\install_log.txt
)

REM Office
if "%LIBREOFFICE_INSTALL%"=="1" (
    echo Installing LibreOffice...
    echo Installing LibreOffice... >> C:\install_log.txt
    choco install libreoffice-still -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing LibreOffice. >> C:\install_log.txt
)

if "%MSOFFICE_INSTALL%"=="1" (
    echo Installing Microsoft Office 365...
    echo Installing Microsoft Office ILLER... >> C:\install_log.txt
    set "RANDSTR=%RANDOM%%RANDOM%"
    set "TEMPFOLDER=C:\Microsoft_OfficeInstaller_%RANDSTR%"
    mkdir "%TEMPFOLDER%" >> C:\install_log.txt 2>&1
    cd "%TEMPFOLDER%" >> C:\install_log.txt 2>&1
    echo Downloading Microsoft Office to %TEMPFOLDER%... >> C:\install_log.txt
    wget https://archive.org/download/office-setup_202110/OfficeSetup.exe >> C:\install_log.txt 2>&1
    echo Running Microsoft Office installer... >> C:\install_log.txt
    OfficeSetup.exe >> C:\install_log.txt 2>&1
    echo Cleaning up... >> C:\install_log.txt
    cd \
    rd /S /Q "%TEMPFOLDER%" >> C:\install_log.txt 2>&1
    echo Microsoft Office installation complete. >> C:\install_log.txt
) else (
    echo Not installing Microsoft Office. >> C:\install_log.txt
)

if "%SYNOLOGYNOTE_INSTALL%"=="1" (
    echo Installing Synology Note Station Client...
    echo Installing Synology Note Station Client... >> C:\install_log.txt
    choco install synology-note-station-client -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Synology Note Station Client. >> C:\install_log.txt
)

if "%TRILIUM_INSTALL%"=="1" (
    echo Installing Trilium Notes...
    echo Installing Trilium Notes... >> C:\install_log.txt
    choco install trilium-notes -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Trilium Notes. >> C:\install_log.txt
)

if "%JOPLIN_INSTALL%"=="1" (
    echo Installing Joplin...
    echo Installing Joplin... >> C:\install_log.txt
    choco install joplin -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Joplin. >> C:\install_log.txt
)

if "%OKULAR_INSTALL%"=="1" (
    echo Installing Okular...
    echo Installing Okular... >> C:\install_log.txt
    choco install okular -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Okular. >> C:\install_log.txt
)

REM Programming
if "%VSCODE_INSTALL%"=="1" (
    echo Installing Visual Studio Code...
    echo Installing Visual Studio Code... >> C:\install_log.txt
    choco install vscode --params "/NoDesktopIcon /NoAddToPath" -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Visual Studio Code. >> C:\install_log.txt
)

if "%VSCODIUM_INSTALL%"=="1" (
    echo Installing VSCodium...
    echo Installing VSCodium... >> C:\install_log.txt
    choco install vscodium --params "/NoDesktopIcon /NoAddToPath" -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing VSCodium. >> C:\install_log.txt
)

if "%PYCHARM_INSTALL%"=="1" (
    echo Installing PyCharm Community...
    echo Installing PyCharm Community... >> C:\install_log.txt
    choco install pycharm-community -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing PyCharm Community. >> C:\install_log.txt
)

if "%INTELLIJ_INSTALL%"=="1" (
    echo Installing IntelliJ IDEA Community...
    echo Installing IntelliJ IDEA Community... >> C:\install_log.txt
    choco install intellijidea-community -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing IntelliJ IDEA Community. >> C:\install_log.txt
)

if "%THONNY_INSTALL%"=="1" (
    echo Installing Thonny...
    echo Installing Thonny... >> C:\install_log.txt
    choco install thonny -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Thonny. >> C:\install_log.txt
)

if "%GRAPHVIZ_INSTALL%"=="1" (
    echo Installing Graphviz...
    echo Installing Graphviz... >> C:\install_log.txt
    choco install graphviz -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Graphviz. >> C:\install_log.txt
)

if "%UNITY_INSTALL%"=="1" (
    echo Installing Unity...
    echo Installing Unity... >> C:\install_log.txt
    choco install unity -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Unity. >> C:\install_log.txt
)

if "%PYTHON3_INSTALL%"=="1" (
    echo Installing Python 3...
    echo Installing Python 3... >> C:\install_log.txt
    choco install python3 -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Python 3. >> C:\install_log.txt
)

if "%MINICONDA3_INSTALL%"=="1" (
    echo Installing Miniconda3...
    echo Installing Miniconda3... >> C:\install_log.txt
    choco install miniconda3 -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Miniconda3. >> C:\install_log.txt
)

if "%OPENJDK_INSTALL%"=="1" (
    echo Installing OpenJDK...
    echo Installing OpenJDK... >> C:\install_log.txt
    choco install openjdk -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing OpenJDK. >> C:\install_log.txt
)

if "%GNUCOBOL_INSTALL%"=="1" (
    echo Installing GnuCOBOL...
    echo Installing GnuCOBOL... >> C:\install_log.txt
    choco install gnucobol -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing GnuCOBOL. >> C:\install_log.txt
)

if "%KATE_INSTALL%"=="1" (
    echo Installing Kate...
    echo Installing Kate... >> C:\install_log.txt
    choco install kate -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Kate. >> C:\install_log.txt
)

if "%NOTEPADPP_INSTALL%"=="1" (
    echo Installing Notepad++...
    echo Installing Notepad++... >> C:\install_log.txt
    choco install notepadplusplus -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Notepad++. >> C:\install_log.txt
)

if "%QOWNNOTES_INSTALL%"=="1" (
    echo Installing QOwnNotes...
    echo Installing QOwnNotes... >> C:\install_log.txt
    choco install qownnotes -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing QOwnNotes. >> C:\install_log.txt
)

if "%GHOSTWRITER_INSTALL%"=="1" (
    echo Installing GhostWriter...
    echo Installing GhostWriter... >> C:\install_log.txt
    choco install ghostwriter -y >> C:\install_log.txt 2>&1
    set "RANDSTR=%RANDOM%%RANDOM%"
    set "TEMPFOLDER=C:\GhostWriterInstaller_%RANDSTR%"
    mkdir "%TEMPFOLDER%" >> C:\install_log.txt 2>&1
    cd "%TEMPFOLDER%" >> C:\install_log.txt 2>&1
    echo Downloading GhostWriter to %TEMPFOLDER%... >> C:\install_log.txt
    wget https://github.com/KDE/ghostwriter/releases/download/2.1.6/ghostwriter_2.1.6_win64_portable.zip >> C:\install_log.txt 2>&1
    echo Extracting GhostWriter with 7zip... >> C:\install_log.txt
    7z x ghostwriter_2.1.6_win64_portable.zip >> C:\install_log.txt 2>&1
    takeown /F "C:\Program Files (x86)\ghostwriter" /R /A >> C:\install_log.txt 2>&1
    rd /s /q "C:\Program Files (x86)\ghostwriter" >> C:\install_log.txt 2>&1
    cd .. >> C:\install_log.txt 2>&1
    move "%TEMPFOLDER%" "C:\Program Files (x86)\ghostwriter" >> C:\install_log.txt 2>&1
    echo GhostWriter installation complete. >> C:\install_log.txt
) else (
    echo Not installing GhostWriter. >> C:\install_log.txt
)

REM Editing
if "%DARKTABLE_INSTALL%"=="1" (
    echo Installing Darktable...
    echo Installing Darktable... >> C:\install_log.txt
    choco install darktable -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Darktable. >> C:\install_log.txt
)

if "%GIMP_INSTALL%"=="1" (
    echo Installing GIMP...
    echo Installing GIMP... >> C:\install_log.txt
    choco install gimp -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing GIMP. >> C:\install_log.txt
)

if "%PAINTNET_INSTALL%"=="1" (
    echo Installing paint.net...
    echo Installing paint.net... >> C:\install_log.txt
    choco install paint.net -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing paint.net. >> C:\install_log.txt
)

if "%LIBRECAD_INSTALL%"=="1" (
    echo Installing LibreCAD...
    echo Installing LibreCAD... >> C:\install_log.txt
    choco install librecad -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing LibreCAD. >> C:\install_log.txt
)

if "%BLENDER_INSTALL%"=="1" (
    echo Installing Blender...
    echo Installing Blender... >> C:\install_log.txt
    choco install blender -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Blender. >> C:\install_log.txt
)

if "%AUDACITY_INSTALL%"=="1" (
    echo Installing Audacity...
    echo Installing Audacity... >> C:\install_log.txt
    choco install audacity -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Audacity. >> C:\install_log.txt
)

if "%LMMS_INSTALL%"=="1" (
    echo Installing LMMS...
    echo Installing LMMS... >> C:\install_log.txt
    choco install lmms -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing LMMS. >> C:\install_log.txt
)

if "%HANDBRAKE_INSTALL%"=="1" (
    echo Installing HandBrake...
    echo Installing HandBrake... >> C:\install_log.txt
    choco install handbrake -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing HandBrake. >> C:\install_log.txt
)

if "%LOSSLESSCUT_INSTALL%"=="1" (
    echo Installing LosslessCut...
    echo Installing LosslessCut... >> C:\install_log.txt
    choco install lossless-cut -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing LosslessCut. >> C:\install_log.txt
)

REM System Tools
if "%CORETEMP_INSTALL%"=="1" (
    echo Installing Core Temp...
    echo Installing Core Temp... >> C:\install_log.txt
    choco install coretemp -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Core Temp. >> C:\install_log.txt
)

if "%CPUZ_INSTALL%"=="1" (
    echo Installing CPU-Z...
    echo Installing CPU-Z... >> C:\install_log.txt
    choco install cpu-z -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing CPU-Z. >> C:\install_log.txt
)

if "%HWMONITOR_INSTALL%"=="1" (
    echo Installing HWMonitor...
    echo Installing HWMonitor... >> C:\install_log.txt
    choco install hwmonitor -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing HWMonitor. >> C:\install_log.txt
)

if "%GPUZ_INSTALL%"=="1" (
    echo Installing GPU-Z...
    echo Installing GPU-Z... >> C:\install_log.txt
    choco install gpu-z -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing GPU-Z. >> C:\install_log.txt
)

if "%MYSQLWORKBENCH_INSTALL%"=="1" (
    echo Installing MySQL Workbench...
    echo Installing MySQL Workbench... >> C:\install_log.txt
    choco install mysql.workbench -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing MySQL Workbench. >> C:\install_log.txt
)

if "%MEDIAINFO_INSTALL%"=="1" (
    echo Installing MediaInfo...
    echo Installing MediaInfo... >> C:\install_log.txt
    choco install mediainfo -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing MediaInfo. >> C:\install_log.txt
)

if "%MKVTOOLNIX_INSTALL%"=="1" (
    echo Installing MKVToolNix...
    echo Installing MKVToolNix... >> C:\install_log.txt
    choco install mkvtoolnix -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing MKVToolNix. >> C:\install_log.txt
)

if "%MPV_INSTALL%"=="1" (
    echo Installing MPV...
    echo Installing MPV... >> C:\install_log.txt
    choco install mpvio -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing MPV. >> C:\install_log.txt
)

if "%VLC_INSTALL%"=="1" (
    echo Installing VLC...
    echo Installing VLC... >> C:\install_log.txt
    choco install vlc -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing VLC. >> C:\install_log.txt
)

if "%OBSSTUDIO_INSTALL%"=="1" (
    echo Installing OBS Studio...
    echo Installing OBS Studio... >> C:\install_log.txt
    choco install obs-studio -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing OBS Studio. >> C:\install_log.txt
)

if "%KDENLIVE_INSTALL%"=="1" (
    echo Installing Kdenlive...
    echo Installing Kdenlive... >> C:\install_log.txt
    choco install kdenlive -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Kdenlive. >> C:\install_log.txt
)

if "%LMSTUDIO_INSTALL%"=="1" (
    echo Installing LM Studio...
    echo Installing LM Studio... >> C:\install_log.txt
    choco install lm-studio -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing LM Studio. >> C:\install_log.txt
)

if "%CRYSTALDISKMARK_INSTALL%"=="1" (
    echo Installing CrystalDiskMark...
    echo Installing CrystalDiskMark... >> C:\install_log.txt
    choco install crystaldiskmark -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing CrystalDiskMark. >> C:\install_log.txt
)

if "%GEEKBENCH6_INSTALL%"=="1" (
    echo Installing Geekbench 6...
    echo Installing Geekbench 6... >> C:\install_log.txt
    choco install geekbench6 -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Geekbench 6. >> C:\install_log.txt
)

if "%HEAVEN_INSTALL%"=="1" (
    echo Installing Heaven Benchmark...
    echo Installing Heaven Benchmark... >> C:\install_log.txt
    choco install heaven-benchmark -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Heaven Benchmark. >> C:\install_log.txt
)

if "%SUPERPOSITION_INSTALL%"=="1" (
    echo Installing Superposition...
    echo Installing Superposition... >> C:\install_log.txt
    set "RANDSTR=%RANDOM%%RANDOM%"
    set "TEMPFOLDER=C:\Unigine_SuperpositionInstaller_%RANDSTR%"
    mkdir "%TEMPFOLDER%" >> C:\install_log.txt 2>&1
    cd "%TEMPFOLDER%" >> C:\install_log.txt 2>&1
    echo Downloading Superposition to %TEMPFOLDER%... >> C:\install_log.txt
    wget https://assets.unigine.com/d/Unigine_Superposition-1.1.exe >> C:\install_log.txt 2>&1
    echo Running Unigine Superposition silent installer... >> C:\install_log.txt
    Unigine_Superposition-1.1.exe /silent >> C:\install_log.txt 2>&1
    echo Cleaning up... >> C:\install_log.txt
    cd \
    rd /S /Q "%TEMPFOLDER%" >> C:\install_log.txt 2>&1
    echo Superposition installation complete. >> C:\install_log.txt
) else (
    echo Not installing Superposition. >> C:\install_log.txt
)

if "%VALLEY_INSTALL%"=="1" (
    echo Installing Valley Benchmark...
    echo Installing Valley Benchmark... >> C:\install_log.txt
    choco install valley-benchmark -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Valley Benchmark. >> C:\install_log.txt
)

if "%ULTRADEFRAG_INSTALL%"=="1" (
    echo Installing UltraDefrag...
    echo Installing UltraDefrag... >> C:\install_log.txt
    choco install ultradefrag --params "/NoShellExtension" -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing UltraDefrag. >> C:\install_log.txt
)

if "%CCLEANER_INSTALL%"=="1" (
    echo Installing CCleaner...
    echo Installing CCleaner... >> C:\install_log.txt
    choco install ccleaner -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing CCleaner. >> C:\install_log.txt
)

if "%VENTOY_INSTALL%"=="1" (
    echo Installing Ventoy...
    echo Installing Ventoy... >> C:\install_log.txt
    choco install ventoy -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Ventoy. >> C:\install_log.txt
)

if "%OPENHWMONITOR_INSTALL%"=="1" (
    echo Installing Open Hardware Monitor...
    echo Installing Open Hardware Monitor... >> C:\install_log.txt
    choco install openhardwaremonitor -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Open Hardware Monitor. >> C:\install_log.txt
)

REM Games
if "%STEAM_INSTALL%"=="1" (
    echo Installing Steam...
    echo Installing Steam... >> C:\install_log.txt
    choco install steam -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Steam. >> C:\install_log.txt
)

if "%AMAZONGAMES_INSTALL%"=="1" (
    echo Installing Amazon Games...
    echo Installing Amazon Games... >> C:\install_log.txt
    choco install amazongames -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Amazon Games. >> C:\install_log.txt
)

if "%EPICGAMES_INSTALL%"=="1" (
    echo Installing Epic Games Launcher...
    echo Installing Epic Games Launcher... >> C:\install_log.txt
    choco install epicgameslauncher -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Epic Games Launcher. >> C:\install_log.txt
)

if "%GOGGALAXY_INSTALL%"=="1" (
    echo Installing GOG Galaxy...
    echo Installing GOG Galaxy... >> C:\install_log.txt
    choco install goggalaxy -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing GOG Galaxy. >> C:\install_log.txt
)

if "%SUPERTUXKART_INSTALL%"=="1" (
    echo Installing SuperTuxKart...
    echo Installing SuperTuxKart... >> C:\install_log.txt
    choco install supertuxkart -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing SuperTuxKart. >> C:\install_log.txt
)

if "%SAUERBRATEN_INSTALL%"=="1" (
    echo Installing Sauerbraten...
    echo Installing Sauerbraten... >> C:\install_log.txt
    choco install sauerbraten -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing Sauerbraten. >> C:\install_log.txt
)

if "%CHESSX_INSTALL%"=="1" (
    echo Installing ChessX...
    echo Installing ChessX... >> C:\install_log.txt
    choco install chessx -y >> C:\install_log.txt 2>&1
) else (
    echo Not installing ChessX. >> C:\install_log.txt
)

REM Completion
echo.
echo Installation completed.
echo Installation completed. >> C:\install_log.txt
echo Press any key to close.
pause >nul