@echo off
REM Installing Chocolatey
echo Script started at %DATE% %TIME% > C:\install_log.txt
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))" >> C:\install_log.txt 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Failed to install Chocolatey. Check C:\install_log.txt for details. >> C:\install_log.txt
    pause
    exit /b %ERRORLEVEL%
)
SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

REM Utils
choco install wget -y >> C:\install_log.txt 2>&1
choco install nano -y >> C:\install_log.txt 2>&1
choco install vim --params "'/NoDesktopShortcuts'" -y >> C:\install_log.txt 2>&1
choco install chocolateygui -y >> C:\install_log.txt 2>&1
choco install git.install -y >> C:\install_log.txt 2>&1
choco install pandoc -y >> C:\install_log.txt 2>&1
choco install fastfetch -y >> C:\install_log.txt 2>&1

:vmwareworkstation
set /P INPUT=Would you like to install WMWare Workstation (restart required) (Y/N)?
If /I "%INPUT%"=="y" goto yvmwareworkstation
If /I "%INPUT%"=="n" goto nvmwareworkstation
echo Incorrect input & goto vmwareworkstation
:yvmwareworkstation
echo Installing VMWare Workstation. >> C:\install_log.txt
REM Generate random string for temp folder
set "RANDSTR=%RANDOM%%RANDOM%"
set "TEMPFOLDER=C:\VMWare_WorkstationInstaller_%RANDSTR%"
mkdir "%TEMPFOLDER%" >> C:\install_log.txt 2>&1
cd "%TEMPFOLDER%" >> C:\install_log.txt 2>&1
echo Downloading VMWare Workstation to %TEMPFOLDER%... >> C:\install_log.txt
wget https://archive.org/download/vmware-workstation-pro-17.5.2/VMware-workstation-full-17.5.2-23775571.exe >> C:\install_log.txt 2>&1
echo Running Unigine Superposition silent installer... >> C:\install_log.txt
VMware-workstation-full-17.5.2-23775571.exe /s /v /qn EULAS_AGREED=1 >> C:\install_log.txt 2>&1
echo Cleaning up... >> C:\install_log.txt
cd \
rd /S /Q "%TEMPFOLDER%" >> C:\install_log.txt 2>&1
echo VMWare Workstation installation complete. >> C:\install_log.txt
goto zvmwareworkstation
:nvmwareworkstation
echo Not installing VMWare Workstation. >> C:\install_log.txt
goto zvmwareworkstation
:zvmwareworkstation

:rufus
set /P INPUT=Would you like to install Rufus (Y/N)?
If /I "%INPUT%"=="y" goto yrufus
If /I "%INPUT%"=="n" goto nrufus
echo Incorrect input & goto rufus
:yrufus
echo Installing Rufus. >> C:\install_log.txt
choco install rufus -y >> C:\install_log.txt 2>&1
goto zrufus
:nrufus
echo Not installing Rufus. >> C:\install_log.txt
goto zrufus
:zrufus

:niubi
set /P INPUT=Would you like to install NIUBI Partition Manager (Y/N)?
If /I "%INPUT%"=="y" goto yniubi
If /I "%INPUT%"=="n" goto nniubi
echo Incorrect input & goto niubi
:yniubi
echo Installing NIUBI Partition Manager. >> C:\install_log.txt
REM Generate random string for temp folder
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
goto zniubi
:nniubi
echo Not installing NIUBI Partition Manager. >> C:\install_log.txt
goto zniubi
:zniubi

REM Browsers
:firefox
set /P INPUT=Would you like to install Firefox (Y/N)?
If /I "%INPUT%"=="y" goto yfirefox
If /I "%INPUT%"=="n" goto nfirefox
echo Incorrect input & goto firefox
:yfirefox
echo Installing Firefox. >> C:\install_log.txt
choco install firefox -y >> C:\install_log.txt 2>&1
goto zfirefox
:nfirefox
echo Not installing Firefox. >> C:\install_log.txt
goto zfirefox
:zfirefox

:vivaldi
set /P INPUT=Would you like to install Vivaldi (Y/N)?
If /I "%INPUT%"=="y" goto yvivaldi
If /I "%INPUT%"=="n" goto nvivaldi
echo Incorrect input & goto vivaldi
:yvivaldi
echo Installing Vivaldi. >> C:\install_log.txt
choco install vivaldi -y >> C:\install_log.txt 2>&1
goto zvivaldi
:nvivaldi
echo Not installing Vivaldi. >> C:\install_log.txt
goto zvivaldi
:zvivaldi

:chromium
set /P INPUT=Would you like to install Chromium (Y/N)?
If /I "%INPUT%"=="y" goto ychromium
If /I "%INPUT%"=="n" goto nchromium
echo Incorrect input & goto chromium
:ychromium
echo Installing Chromium. >> C:\install_log.txt
choco install chromium -y >> C:\install_log.txt 2>&1
goto zchromium
:nchromium
echo Not installing Chromium. >> C:\install_log.txt
goto zchromium
:zchromium

:brave
set /P INPUT=Would you like to install Brave (Y/N)?
If /I "%INPUT%"=="y" goto ybrave
If /I "%INPUT%"=="n" goto nbrave
echo Incorrect input & goto brave
:ybrave
echo Installing Brave. >> C:\install_log.txt
choco install brave -y >> C:\install_log.txt 2>&1
goto zbrave
:nbrave
echo Not installing Brave. >> C:\install_log.txt
goto zbrave
:zbrave

:googlechrome
set /P INPUT=Would you like to install Google Chrome (Y/N)?
If /I "%INPUT%"=="y" goto ygooglechrome
If /I "%INPUT%"=="n" goto ngooglechrome
echo Incorrect input & goto googlechrome
:ygooglechrome
echo Installing Google Chrome. >> C:\install_log.txt
choco install googlechrome -y >> C:\install_log.txt 2>&1
goto zgooglechrome
:ngooglechrome
echo Not installing Google Chrome. >> C:\install_log.txt
goto zgooglechrome
:zgooglechrome

:torbrowser
set /P INPUT=Would you like to install Tor Browser (Y/N)?
If /I "%INPUT%"=="y" goto ytorbrowser
If /I "%INPUT%"=="n" goto ntorbrowser
echo Incorrect input & goto torbrowser
:ytorbrowser
echo Installing Tor Browser. >> C:\install_log.txt
choco install tor-browser -y >> C:\install_log.txt 2>&1
goto ztorbrowser
:ntorbrowser
echo Not installing Tor Browser. >> C:\install_log.txt
goto ztorbrowser
:ztorbrowser

:librewolf
set /P INPUT=Would you like to install LibreWolf (Y/N)?
If /I "%INPUT%"=="y" goto ylibrewolf
If /I "%INPUT%"=="n" goto nlibrewolf
echo Incorrect input & goto librewolf
:ylibrewolf
echo Installing LibreWolf. >> C:\install_log.txt
choco install librewolf -y >> C:\install_log.txt 2>&1
goto zlibrewolf
:nlibrewolf
echo Not installing LibreWolf. >> C:\install_log.txt
goto zlibrewolf
:zlibrewolf

REM Internet
:protonvpn
set /P INPUT=Would you like to install ProtonVPN (Y/N)?
If /I "%INPUT%"=="y" goto yprotonvpn
If /I "%INPUT%"=="n" goto nprotonvpn
echo Incorrect input & goto protonvpn
:yprotonvpn
echo Installing ProtonVPN. >> C:\install_log.txt
choco install protonvpn -y >> C:\install_log.txt 2>&1
goto zprotonvpn
:nprotonvpn
echo Not installing ProtonVPN. >> C:\install_log.txt
goto zprotonvpn
:zprotonvpn

:protonmailbridge
set /P INPUT=Would you like to install ProtonMail Bridge (Y/N)?
If /I "%INPUT%"=="y" goto yprotonmailbridge
If /I "%INPUT%"=="n" goto nprotonmailbridge
echo Incorrect input & goto protonmailbridge
:yprotonmailbridge
echo Installing ProtonMail Bridge. >> C:\install_log.txt
choco install protonmailbridge -y >> C:\install_log.txt 2>&1
goto zprotonmailbridge
:nprotonmailbridge
echo Not installing ProtonMail Bridge. >> C:\install_log.txt
goto zprotonmailbridge
:zprotonmailbridge

:protondrive
set /P INPUT=Would you like to install Proton Drive (Y/N)?
If /I "%INPUT%"=="y" goto yprotondrive
If /I "%INPUT%"=="n" goto nprotondrive
echo Incorrect input & goto protondrive
:yprotondrive
echo Installing Proton Drive. >> C:\install_log.txt
choco install protondrive -y >> C:\install_log.txt 2>&1
goto zprotondrive
:nprotondrive
echo Not installing Proton Drive. >> C:\install_log.txt
goto zprotondrive
:zprotondrive

:protonpass
set /P INPUT=Would you like to install Proton Pass (Y/N)?
If /I "%INPUT%"=="y" goto yprotonpass
If /I "%INPUT%"=="n" goto nprotonpass
echo Incorrect input & goto protonpass
:yprotonpass
echo Installing Proton Pass. >> C:\install_log.txt
choco install protonpass -y >> C:\install_log.txt 2>&1
goto zprotonpass
:nprotonpass
echo Not installing Proton Pass. >> C:\install_log.txt
goto zprotonpass
:zprotonpass

:synologydrive
set /P INPUT=Would you like to install Synology Drive (Y/N)?
If /I "%INPUT%"=="y" goto ysynologydrive
If /I "%INPUT%"=="n" goto nsynologydrive
echo Incorrect input & goto synologydrive
:ysynologydrive
echo Installing Synology Drive. >> C:\install_log.txt
choco install synologydrive -y >> C:\install_log.txt 2>&1
goto zsynologydrive
:nsynologydrive
echo Not installing Synology Drive. >> C:\install_log.txt
goto zsynologydrive
:zsynologydrive

:transgui
set /P INPUT=Would you like to install Transmission-Qt (Y/N)?
If /I "%INPUT%"=="y" goto ytransgui
If /I "%INPUT%"=="n" goto ntransgui
echo Incorrect input & goto transgui
:ytransgui
echo Installing Transmission-Qt. >> C:\install_log.txt
choco install transgui -y >> C:\install_log.txt 2>&1
goto ztransgui
:ntransgui
echo Not installing Transmission-Qt. >> C:\install_log.txt
goto ztransgui
:ztransgui

REM Communication
:signal
set /P INPUT=Would you like to install Signal (Y/N)?
If /I "%INPUT%"=="y" goto ysignal
If /I "%INPUT%"=="n" goto nsignal
echo Incorrect input & goto signal
:ysignal
echo Installing Signal. >> C:\install_log.txt
choco install signal -y >> C:\install_log.txt 2>&1
goto zsignal
:nsignal
echo Not installing Signal. >> C:\install_log.txt
goto zsignal
:zsignal

:telegram
set /P INPUT=Would you like to install Telegram (Y/N)?
If /I "%INPUT%"=="y" goto ytelegram
If /I "%INPUT%"=="n" goto ntelegram
echo Incorrect input & goto telegram
:ytelegram
echo Installing Telegram. >> C:\install_log.txt
choco install telegram -y >> C:\install_log.txt 2>&1
goto ztelegram
:ntelegram
echo Not installing Telegram. >> C:\install_log.txt
goto ztelegram
:ztelegram

:thunderbird
set /P INPUT=Would you like to install Thunderbird (Y/N)?
If /I "%INPUT%"=="y" goto ythunderbird
If /I "%INPUT%"=="n" goto nthunderbird
echo Incorrect input & goto thunderbird
:ythunderbird
echo Installing Thunderbird. >> C:\install_log.txt
choco install thunderbird -y >> C:\install_log.txt 2>&1
goto zthunderbird
:nthunderbird
echo Not installing Thunderbird. >> C:\install_log.txt
goto zthunderbird
:zthunderbird

REM Office
:libreoffice
set /P INPUT=Would you like to install LibreOffice (Y/N)?
If /I "%INPUT%"=="y" goto ylibreoffice
If /I "%INPUT%"=="n" goto nlibreoffice
echo Incorrect input & goto libreoffice
:ylibreoffice
echo Installing LibreOffice. >> C:\install_log.txt
choco install libreoffice-still -y >> C:\install_log.txt 2>&1
goto zlibreoffice
:nlibreoffice
echo Not installing LibreOffice. >> C:\install_log.txt
goto zlibreoffice
:zlibreoffice

:msoffice
set /P INPUT=Would you like to install Microsoft Office 365 (requires sub.) (Y/N)?
If /I "%INPUT%"=="y" goto ymsoffice
If /I "%INPUT%"=="n" goto nmsoffice
echo Incorrect input & goto vmsoffice
:ymsoffice
echo Installing Microsoft Office 365. >> C:\install_log.txt
REM Generate random string for temp folder
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
goto zmsoffice
:nmsoffice
echo Not installing Microsoft Office. >> C:\install_log.txt
goto zmsoffice
:zmsoffice

:synologynote
set /P INPUT=Would you like to install Synology Note Station Client (Y/N)?
If /I "%INPUT%"=="y" goto ysynologynote
If /I "%INPUT%"=="n" goto nsynologynote
echo Incorrect input & goto synologynote
:ysynologynote
echo Installing Synology Note Station Client. >> C:\install_log.txt
choco install synology-note-station-client -y >> C:\install_log.txt 2>&1
goto zsynologynote
:nsynologynote
echo Not installing Synology Note Station Client. >> C:\install_log.txt
goto zsynologynote
:zsynologynote

:trilium
set /P INPUT=Would you like to install Trilium Notes (Y/N)?
If /I "%INPUT%"=="y" goto ytrilium
If /I "%INPUT%"=="n" goto ntrilium
echo Incorrect input & goto trilium
:ytrilium
echo Installing Trilium Notes. >> C:\install_log.txt
choco install trilium-notes -y >> C:\install_log.txt 2>&1
goto ztrilium
:ntrilium
echo Not installing Trilium Notes. >> C:\install_log.txt
goto ztrilium
:ztrilium

:joplin
set /P INPUT=Would you like to install Joplin (Y/N)?
If /I "%INPUT%"=="y" goto yjoplin
If /I "%INPUT%"=="n" goto njoplin
echo Incorrect input & goto joplin
:yjoplin
echo Installing Joplin. >> C:\install_log.txt
choco install joplin -y >> C:\install_log.txt 2>&1
goto zjoplin
:njoplin
echo Not installing Joplin. >> C:\install_log.txt
goto zjoplin
:zjoplin

:okular
set /P INPUT=Would you like to install Okular (Y/N)?
If /I "%INPUT%"=="y" goto yokular
If /I "%INPUT%"=="n" goto nokular
echo Incorrect input & goto okular
:yokular
echo Installing Okular. >> C:\install_log.txt
choco install okular -y >> C:\install_log.txt 2>&1
goto zokular
:nokular
echo Not installing Okular. >> C:\install_log.txt
goto zokular
:zokular

REM Programming
:vscode
set /P INPUT=Would you like to install Visual Studio Code (Y/N)?
If /I "%INPUT%"=="y" goto yvscode
If /I "%INPUT%"=="n" goto nvscode
echo Incorrect input & goto vscode
:yvscode
echo Installing Visual Studio Code. >> C:\install_log.txt
choco install vscode --params "/NoDesktopIcon /NoAddToPath" -y >> C:\install_log.txt 2>&1
goto zvscode
:nvscode
echo Not installing Visual Studio Code. >> C:\install_log.txt
goto zvscode
:zvscode

:vscodium
set /P INPUT=Would you like to install VSCodium (Y/N)?
If /I "%INPUT%"=="y" goto yvscodium
If /I "%INPUT%"=="n" goto nvscodium
echo Incorrect input & goto vscodium
:yvscodium
echo Installing VSCodium. >> C:\install_log.txt
choco install vscodium --params "/NoDesktopIcon /NoAddToPath" -y >> C:\install_log.txt 2>&1
goto zvscodium
:nvscodium
echo Not installing VSCodium. >> C:\install_log.txt
goto zvscodium
:zvscodium

:pycharm
set /P INPUT=Would you like to install PyCharm Community (Y/N)?
If /I "%INPUT%"=="y" goto ypycharm
If /I "%INPUT%"=="n" goto npycharm
echo Incorrect input & goto pycharm
:ypycharm
echo Installing PyCharm Community. >> C:\install_log.txt
choco install pycharm-community -y >> C:\install_log.txt 2>&1
goto zpycharm
:npycharm
echo Not installing PyCharm Community. >> C:\install_log.txt
goto zpycharm
:zpycharm

:intellij
set /P INPUT=Would you like to install IntelliJ IDEA Community (Y/N)?
If /I "%INPUT%"=="y" goto yintellij
If /I "%INPUT%"=="n" goto nintellij
echo Incorrect input & goto intellij
:yintellij
echo Installing IntelliJ IDEA Community. >> C:\install_log.txt
choco install intellijidea-community -y >> C:\install_log.txt 2>&1
goto zintellij
:nintellij
echo Not installing IntelliJ IDEA Community. >> C:\install_log.txt
goto zintellij
:zintellij

:thonny
set /P INPUT=Would you like to install Thonny (Y/N)?
If /I "%INPUT%"=="y" goto ythonny
If /I "%INPUT%"=="n" goto nthonny
echo Incorrect input & goto thonny
:ythonny
echo Installing Thonny. >> C:\install_log.txt
choco install thonny -y >> C:\install_log.txt 2>&1
goto zthonny
:nthonny
echo Not installing Thonny. >> C:\install_log.txt
goto zthonny
:zthonny

:graphviz
set /P INPUT=Would you like to install Graphviz (Y/N)?
If /I "%INPUT%"=="y" goto ygraphviz
If /I "%INPUT%"=="n" goto ngraphviz
echo Incorrect input & goto graphviz
:ygraphviz
echo Installing Graphviz. >> C:\install_log.txt
choco install graphviz -y >> C:\install_log.txt 2>&1
goto zgraphviz
:ngraphviz
echo Not installing Graphviz. >> C:\install_log.txt
goto zgraphviz
:zgraphviz

:unity
set /P INPUT=Would you like to install Unity (Y/N)?
If /I "%INPUT%"=="y" goto yunity
If /I "%INPUT%"=="n" goto nunity
echo Incorrect input & goto unity
:yunity
echo Installing Unity. >> C:\install_log.txt
choco install unity -y >> C:\install_log.txt 2>&1
goto zunity
:nunity
echo Not installing Unity. >> C:\install_log.txt
goto zunity
:zunity

:python3
set /P INPUT=Would you like to install Python 3 (Y/N)?
If /I "%INPUT%"=="y" goto ypython3
If /I "%INPUT%"=="n" goto npython3
echo Incorrect input & goto python3
:ypython3
echo Installing Python 3. >> C:\install_log.txt
choco install python3 -y >> C:\install_log.txt 2>&1
goto zpython3
:npython3
echo Not installing Python 3. >> C:\install_log.txt
goto zpython3
:zpython3

:miniconda3
set /P INPUT=Would you like to install Miniconda3 (Y/N)?
If /I "%INPUT%"=="y" goto yminiconda3
If /I "%INPUT%"=="n" goto nminiconda3
echo Incorrect input & goto miniconda3
:yminiconda3
echo Installing Miniconda3. >> C:\install_log.txt
choco install miniconda3 -y >> C:\install_log.txt 2>&1
goto zminiconda3
:nminiconda3
echo Not installing Miniconda3. >> C:\install_log.txt
goto zminiconda3
:zminiconda3

:openjdk
set /P INPUT=Would you like to install OpenJDK (Y/N)?
If /I "%INPUT%"=="y" goto yopenjdk
If /I "%INPUT%"=="n" goto nopenjdk
echo Incorrect input & goto openjdk
:yopenjdk
echo Installing OpenJDK. >> C:\install_log.txt
choco install openjdk -y >> C:\install_log.txt 2>&1
goto zopenjdk
:nopenjdk
echo Not installing OpenJDK. >> C:\install_log.txt
goto zopenjdk
:zopenjdk

:gnucobol
set /P INPUT=Would you like to install GnuCOBOL (Y/N)?
If /I "%INPUT%"=="y" goto ygnucobol
If /I "%INPUT%"=="n" goto ngnucobol
echo Incorrect input & goto gnucobol
:ygnucobol
echo Installing GnuCOBOL. >> C:\install_log.txt
choco install gnucobol -y >> C:\install_log.txt 2>&1
goto zgnucobol
:ngnucobol
echo Not installing GnuCOBOL. >> C:\install_log.txt
goto zgnucobol
:zgnucobol

:kate
set /P INPUT=Would you like to install Kate (Y/N)?
If /I "%INPUT%"=="y" goto ykate
If /I "%INPUT%"=="n" goto nkate
echo Incorrect input & goto kate
:ykate
echo Installing Kate. >> C:\install_log.txt
choco install kate -y >> C:\install_log.txt 2>&1
goto zkate
:nkate
echo Not installing Kate. >> C:\install_log.txt
goto zkate
:zkate

:notepadplusplus
set /P INPUT=Would you like to install Notepad++ (Y/N)?
If /I "%INPUT%"=="y" goto ynotepadplusplus
If /I "%INPUT%"=="n" goto nnotepadplusplus
echo Incorrect input & goto notepadplusplus
:ynotepadplusplus
echo Installing Notepad++. >> C:\install_log.txt
choco install notepadplusplus -y >> C:\install_log.txt 2>&1
goto znotepadplusplus
:nnotepadplusplus
echo Not installing Notepad++. >> C:\install_log.txt
goto znotepadplusplus
:znotepadplusplus

:qownnotes
set /P INPUT=Would you like to install QOwnNotes (Y/N)?
If /I "%INPUT%"=="y" goto yqownnotes
If /I "%INPUT%"=="n" goto nqownnotes
echo Incorrect input & goto qownnotes
:yqownnotes
echo Installing QOwnNotes. >> C:\install_log.txt
choco install qownnotes -y >> C:\install_log.txt 2>&1
goto zqownnotes
:nqownnotes
echo Not installing QOwnNotes. >> C:\install_log.txt
goto zqownnotes
:zqownnotes

:ghostwriter
set /P INPUT=Would you like to install GhostWriter (Y/N)?
If /I "%INPUT%"=="y" goto yghostwriter
If /I "%INPUT%"=="n" goto nghostwriter
echo Incorrect input & goto ghostwriter
:yghostwriter
REM Installing GhostWriter 1.5
echo Installing ghostwriter. >> C:\install_log.txt
choco install ghostwriter >> C:\install_log.txt 2>&1
REM Updating to 2.1.6 latest version
REM Generate random string for temp folder
set "RANDSTR=%RANDOM%%RANDOM%"
set "TEMPFOLDER=C:\GhostWriterInstaller_%RANDSTR%"
mkdir "%TEMPFOLDER%" >> C:\install_log.txt 2>&1
cd "%TEMPFOLDER%" >> C:\install_log.txt 2>&1
echo Downloading GhostWriter to %TEMPFOLDER%... >> C:\install_log.txt
wget https://github.com/KDE/ghostwriter/releases/download/2.1.6/ghostwriter_2.1.6_win64_portable.zip >> C:\install_log.txt
tar -xf ghostwriter_2.1.6_win64_portable.zip >> C:\install_log.txt
takeown /F "C:\Program Files (x86)\ghostwriter" /R /A
rd /s /q "C:\Program Files (x86)\ghostwriter" >> C:\install_log.txt
cd .. >> C:\install_log.txt
move %TEMPFOLDER% "C:\Program Files (x86)\ghostwriter"
goto zghostwriter
:nghostwriter
echo Not installing GhostWriter. >> C:\install_log.txt
goto zghostwriter
:zghostwriter

REM Editing
:darktable
set /P INPUT=Would you like to install Darktable (Y/N)?
If /I "%INPUT%"=="y" goto ydarktable
If /I "%INPUT%"=="n" goto ndarktable
echo Incorrect input & goto darktable
:ydarktable
echo Installing Darktable. >> C:\install_log.txt
choco install darktable -y >> C:\install_log.txt 2>&1
goto zdarktable
:ndarktable
echo Not installing Darktable. >> C:\install_log.txt
goto zdarktable
:zdarktable

:gimp
set /P INPUT=Would you like to install GIMP (Y/N)?
If /I "%INPUT%"=="y" goto ygimp
If /I "%INPUT%"=="n" goto ngimp
echo Incorrect input & goto gimp
:ygimp
echo Installing GIMP. >> C:\install_log.txt
choco install gimp -y >> C:\install_log.txt 2>&1
goto zgimp
:ngimp
echo Not installing GIMP. >> C:\install_log.txt
goto zgimp
:zgimp

:paintdotnet
set /P INPUT=Would you like to install paint.net (Y/N)?
If /I "%INPUT%"=="y" goto ypaintdotnet
If /I "%INPUT%"=="n" goto npaintdotnet
echo Incorrect input & goto paintdotnet
:ypaintdotnet
echo Installing paint.net. >> C:\install_log.txt
choco install paint.net -y >> C:\install_log.txt 2>&1
goto zpaintdotnet
:npaintdotnet
echo Not installing paint.net. >> C:\install_log.txt
goto zpaintdotnet
:zpaintdotnet

:librecad
set /P INPUT=Would you like to install LibreCAD (Y/N)?
If /I "%INPUT%"=="y" goto ylibrecad
If /I "%INPUT%"=="n" goto nlibrecad
echo Incorrect input & goto librecad
:ylibrecad
echo Installing LibreCAD. >> C:\install_log.txt
choco install librecad -y >> C:\install_log.txt 2>&1
goto zlibrecad
:nlibrecad
echo Not installing LibreCAD. >> C:\install_log.txt
goto zlibrecad
:zlibrecad

:blender
set /P INPUT=Would you like to install Blender (Y/N)?
If /I "%INPUT%"=="y" goto yblender
If /I "%INPUT%"=="n" goto nblender
echo Incorrect input & goto blender
:yblender
echo Installing Blender. >> C:\install_log.txt
choco install blender -y >> C:\install_log.txt 2>&1
goto zblender
:nblender
echo Not installing Blender. >> C:\install_log.txt
goto zblender
:zblender

:audacity
set /P INPUT=Would you like to install Audacity (Y/N)?
If /I "%INPUT%"=="y" goto yaudacity
If /I "%INPUT%"=="n" goto naudacity
echo Incorrect input & goto audacity
:yaudacity
echo Installing Audacity. >> C:\install_log.txt
choco install audacity -y >> C:\install_log.txt 2>&1
goto zaudacity
:naudacity
echo Not installing Audacity. >> C:\install_log.txt
goto zaudacity
:zaudacity

:lmms
set /P INPUT=Would you like to install LMMS (Y/N)?
If /I "%INPUT%"=="y" goto ylmms
If /I "%INPUT%"=="n" goto nlmms
echo Incorrect input & goto lmms
:ylmms
echo Installing LMMS. >> C:\install_log.txt
choco install lmms -y >> C:\install_log.txt 2>&1
goto zlmms
:nlmms
echo Not installing LMMS. >> C:\install_log.txt
goto zlmms
:zlmms

:handbrake
set /P INPUT=Would you like to install HandBrake (Y/N)?
If /I "%INPUT%"=="y" goto yhandbrake
If /I "%INPUT%"=="n" goto nhandbrake
echo Incorrect input & goto handbrake
:yhandbrake
echo Installing HandBrake. >> C:\install_log.txt
choco install handbrake -y >> C:\install_log.txt 2>&1
goto zhandbrake
:nhandbrake
echo Not installing HandBrake. >> C:\install_log.txt
goto zhandbrake
:zhandbrake

:losslesscut
set /P INPUT=Would you like to install LosslessCut (Y/N)?
If /I "%INPUT%"=="y" goto ylosslesscut
If /I "%INPUT%"=="n" goto nlosslesscut
echo Incorrect input & goto losslesscut
:ylosslesscut
echo Installing LosslessCut. >> C:\install_log.txt
choco install lossless-cut -y >> C:\install_log.txt 2>&1
goto zlosslesscut
:nlosslesscut
echo Not installing LosslessCut. >> C:\install_log.txt
goto zlosslesscut
:zlosslesscut

REM System Tools
:coretemp
set /P INPUT=Would you like to install Core Temp (Y/N)?
If /I "%INPUT%"=="y" goto ycoretemp
If /I "%INPUT%"=="n" goto ncoretemp
echo Incorrect input & goto coretemp
:ycoretemp
echo Installing Core Temp. >> C:\install_log.txt
choco install coretemp -y >> C:\install_log.txt 2>&1
goto zcoretemp
:ncoretemp
echo Not installing Core Temp. >> C:\install_log.txt
goto zcoretemp
:zcoretemp

:cpuz
set /P INPUT=Would you like to install CPU-Z (Y/N)?
If /I "%INPUT%"=="y" goto ycpuz
If /I "%INPUT%"=="n" goto ncpuz
echo Incorrect input & goto cpuz
:ycpuz
echo Installing CPU-Z. >> C:\install_log.txt
choco install cpu-z -y >> C:\install_log.txt 2>&1
goto zcpuz
:ncpuz
echo Not installing CPU-Z. >> C:\install_log.txt
goto zcpuz
:zcpuz

:hwmonitor
set /P INPUT=Would you like to install HWMonitor (Y/N)?
If /I "%INPUT%"=="y" goto yhwmonitor
If /I "%INPUT%"=="n" goto nhwmonitor
echo Incorrect input & goto hwmonitor
:yhwmonitor
echo Installing HWMonitor. >> C:\install_log.txt
choco install hwmonitor -y >> C:\install_log.txt 2>&1
goto zhwmonitor
:nhwmonitor
echo Not installing HWMonitor. >> C:\install_log.txt
goto zhwmonitor
:zhwmonitor

:gpuz
set /P INPUT=Would you like to install GPU-Z (Y/N)?
If /I "%INPUT%"=="y" goto ygpuz
If /I "%INPUT%"=="n" goto ngpuz
echo Incorrect input & goto gpuz
:ygpuz
echo Installing GPU-Z. >> C:\install_log.txt
choco install gpu-z -y >> C:\install_log.txt 2>&1
goto zgpuz
:ngpuz
echo Not installing GPU-Z. >> C:\install_log.txt
goto zgpuz
:zgpuz

:mysqlworkbench
set /P INPUT=Would you like to install MySQL Workbench (Y/N)?
If /I "%INPUT%"=="y" goto ymysqlworkbench
If /I "%INPUT%"=="n" goto nmysqlworkbench
echo Incorrect input & goto mysqlworkbench
:ymysqlworkbench
echo Installing MySQL Workbench. >> C:\install_log.txt
choco install mysql.workbench -y >> C:\install_log.txt 2>&1
goto zmysqlworkbench
:nmysqlworkbench
echo Not installing MySQL Workbench. >> C:\install_log.txt
goto zmysqlworkbench
:zmysqlworkbench

:mediainfo
set /P INPUT=Would you like to install MediaInfo (Y/N)?
If /I "%INPUT%"=="y" goto ymediainfo
If /I "%INPUT%"=="n" goto nmediainfo
echo Incorrect input & goto mediainfo
:ymediainfo
echo Installing MediaInfo. >> C:\install_log.txt
choco install mediainfo -y >> C:\install_log.txt 2>&1
goto zmediainfo
:nmediainfo
echo Not installing MediaInfo. >> C:\install_log.txt
goto zmediainfo
:zmediainfo

:mkvtoolnix
set /P INPUT=Would you like to install MKVToolNix (Y/N)?
If /I "%INPUT%"=="y" goto ymkvtoolnix
If /I "%INPUT%"=="n" goto nmkvtoolnix
echo Incorrect input & goto mkvtoolnix
:ymkvtoolnix
echo Installing MKVToolNix. >> C:\install_log.txt
choco install mkvtoolnix -y >> C:\install_log.txt 2>&1
goto zmkvtoolnix
:nmkvtoolnix
echo Not installing MKVToolNix. >> C:\install_log.txt
goto zmkvtoolnix
:zmkvtoolnix

:mpv
set /P INPUT=Would you like to install MPV (Y/N)?
If /I "%INPUT%"=="y" goto ympv
If /I "%INPUT%"=="n" goto nmpv
echo Incorrect input & goto mpv
:ympv
echo Installing MPV. >> C:\install_log.txt
choco install mpvio -y >> C:\install_log.txt 2>&1
goto zmpv
:nmpv
echo Not installing MPV. >> C:\install_log.txt
goto zmpv
:zmpv

:vlc
set /P INPUT=Would you like to install VLC (Y/N)?
If /I "%INPUT%"=="y" goto yvlc
If /I "%INPUT%"=="n" goto nvlc
echo Incorrect input & goto vlc
:yvlc
echo Installing VLC. >> C:\install_log.txt
choco install vlc -y >> C:\install_log.txt 2>&1
goto zvlc
:nvlc
echo Not installing VLC. >> C:\install_log.txt
goto zvlc
:zvlc

:obsstudio
set /P INPUT=Would you like to install OBS Studio (Y/N)?
If /I "%INPUT%"=="y" goto yobsstudio
If /I "%INPUT%"=="n" goto nobsstudio
echo Incorrect input & goto obsstudio
:yobsstudio
echo Installing OBS Studio. >> C:\install_log.txt
choco install obs-studio -y >> C:\install_log.txt 2>&1
goto zobsstudio
:nobsstudio
echo Not installing OBS Studio. >> C:\install_log.txt
goto zobsstudio
:zobsstudio

:kdenlive
set /P INPUT=Would you like to install Kdenlive (Y/N)?
If /I "%INPUT%"=="y" goto ykdenlive
If /I "%INPUT%"=="n" goto nkdenlive
echo Incorrect input & goto kdenlive
:ykdenlive
echo Installing Kdenlive. >> C:\install_log.txt
choco install kdenlive -y >> C:\install_log.txt 2>&1
goto zkdenlive
:nkdenlive
echo Not installing Kdenlive. >> C:\install_log.txt
goto zkdenlive
:zkdenlive

:lmstudio
set /P INPUT=Would you like to install LM Studio (Y/N)?
If /I "%INPUT%"=="y" goto ylmstudio
If /I "%INPUT%"=="n" goto nlmstudio
echo Incorrect input & goto lmstudio
:ylmstudio
echo Installing LM Studio. >> C:\install_log.txt
choco install lm-studio -y >> C:\install_log.txt 2>&1
goto zlmstudio
:nlmstudio
echo Not installing LM Studio. >> C:\install_log.txt
goto zlmstudio
:zlmstudio

:crystaldiskmark
set /P INPUT=Would you like to install CrystalDiskMark (Y/N)?
If /I "%INPUT%"=="y" goto ycrystaldiskmark
If /I "%INPUT%"=="n" goto ncrystaldiskmark
echo Incorrect input & goto crystaldiskmark
:ycrystaldiskmark
echo Installing CrystalDiskMark. >> C:\install_log.txt
choco install crystaldiskmark -y >> C:\install_log.txt 2>&1
goto zcrystaldiskmark
:ncrystaldiskmark
echo Not installing CrystalDiskMark. >> C:\install_log.txt
goto zcrystaldiskmark
:zcrystaldiskmark

:geekbench6
set /P INPUT=Would you like to install Geekbench 6 (Y/N)?
If /I "%INPUT%"=="y" goto ygeekbench6
If /I "%INPUT%"=="n" goto ngeekbench6
echo Incorrect input & goto geekbench6
:ygeekbench6
echo Installing Geekbench 6. >> C:\install_log.txt
choco install geekbench6 -y >> C:\install_log.txt 2>&1
goto zgeekbench6
:ngeekbench6
echo Not installing Geekbench 6. >> C:\install_log.txt
goto zgeekbench6
:zgeekbench6

:heavenbenchmark
set /P INPUT=Would you like to install Heaven Benchmark (Y/N)?
If /I "%INPUT%"=="y" goto yheavenbenchmark
If /I "%INPUT%"=="n" goto nheavenbenchmark
echo Invalid input & goto heavenbenchmark
:yheavenbenchmark
echo Installing Heaven Benchmark. >> C:\install_log.txt
choco install heaven-benchmark -y >> C:\install_log.txt 2>&1
goto zheavenbenchmark
:nheavenbenchmark
echo Not installing Heaven Benchmark. >> C:\install_log.txt
goto zheavenbenchmark
:zheavenbenchmark

:superposition
set /P INPUT=Would you like to install Unigine Superposition (Y/N)?
If /I "%INPUT%"=="y" goto ysuperposition
If /I "%INPUT%"=="n" goto nsuperposition
echo Incorrect input & goto nsuperposition
:ysuperposition
echo Installing Superposition. >> C:\install_log.txt
REM Generate random string for temp folder
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
goto zsuperposition
:nsuperposition
echo Not installing Superposition. >> C:\install_log.txt
goto zsuperposition
:zsuperposition

:valley
set /P INPUT=Would you like to install Valley Benchmark (Y/N)?
If /I "%INPUT%"=="y" goto yvalley
If /I "%INPUT%"=="n" goto nvalley
echo Invalid input & goto valley
:yvalley
echo Installing Valley benchmark. >> C:\install_log.txt
choco install valley-benchmark -y >> C:\install_log.txt 2>&1
goto zvalley
:nvalley
echo Not installed Valley benchmark. >> C:\install_log.txt
goto zvalley
:zvalley

:ultradefrag
set /P INPUT=Would you like to install UltraDefrag (Y/N)?
If /I "%INPUT%"=="y" goto yultradefrag
If /I "%INPUT%"=="n" goto nultradefrag
echo Invalid input & goto ultradefrag
:yultradefrag
echo Installing UltraDefrag. >> C:\install_log.txt
choco install ultradefrag --params "/NoShellExtension" -y >> C:\install_log.txt 2>&1
goto zultradefrag
:nultradefrag
echo Not installing UltraDefrag. >> C:\install_log.txt
goto zultradefrag
:zultradefrag

:ccleaner
set /P INPUT=Would you like to install CCleaner (Y/N)?
If /I "%INPUT%"=="y" goto yccleaner
If /I "%INPUT%"=="n" goto nccleaner
echo Incorrect input & goto nccleaner
:yccleaner
echo Installing CCleaner. >> C:\install_log.txt
choco install ccleaner -y >> C:\install_log.txt 2>&1
goto zccleaner
:nccleaner
echo Not installing CCleaner. >> C:\install_log.txt
goto zccleaner
:zccleaner

:ventoy
set /P INPUT=Would you like to install Ventoy (Y/N)?
If /I "%INPUT%"=="y" goto yventoy
If /I "%INPUT%"=="n" goto nventoy
echo Invalid input & goto ventoy
:yventoy
echo Installing Ventoy. >> C:\install_log.txt
choco install ventoy -y >> C:\install_log.txt 2>&1
goto zventoy
:nventoy
echo Not installing Ventoy. >> C:\install_log.txt
goto zventoy
:zventoy

:openhardwaremonitor
set /P INPUT=Would you like to install Open Hardware Monitor (Y/N)?
If /I "%INPUT%"=="y" goto yopenhardwaremonitor
If /I "%INPUT%"=="n" goto nopenhardwaremonitor
echo Invalid input & goto openhardwaremonitor
:yopenhardwaremonitor
echo Installing Open Hardware Monitor.
choco install openhardwaremonitor -y >> C:\install_log.txt 2>&1
goto zopenhardwaremonitor
:nopenhardwaremonitor
echo Not installing Open Hardware Monitor. >> C:\install_log.txt
goto zopenhardwaremonitor
:zopenhardwaremonitor

REM Games
:steam
set /P INPUT=Would you like to install Steam (Y/N)?
If /I "%INPUT%"=="y" goto ysteam
If /I "%INPUT%"=="n" goto nsteam
echo Invalid input & goto steam
:ysteam
echo Installing Steam. >> C:\install_log.txt
choco install steam -y >> C:\install_log.txt 2>&1
goto zsteam
:nsteam
echo Not installing Steam. >> C:\install_log.txt
goto zsteam
:zsteam

:amazongames
set /P INPUT=Would you like to install Amazon Games (Y/N)?
If /I "%INPUT%"=="y" goto yamazongames
If /I "%INPUT%"=="n" goto namazongames
echo Invalid input & goto amazongames
:yamazongames
echo Installing Amazon Games. >> C:\install_log.txt
choco install amazongames -y >> C:\install_log.txt 2>&1
goto zamazongames
:namazongames
echo Not installing Amazon Games. >> C:\install_log.txt
goto zamazongames
:zamazongames

:epicgameslauncher
set /P INPUT=Would you like to install Epic Games Launcher (Y/N)?
If /I "%INPUT%"=="y" goto yepicgameslauncher
If /I "%INPUT%"=="n" goto nepicgameslauncher
echo Invalid input & goto epicgameslauncher
:yepicgameslauncher
echo Installing Epic Games Launcher. >> C:\install_log.txt
choco install epicgameslauncher -y >> C:\install_log.txt 2>&1
goto zepicgameslauncher
:nepicgameslauncher
echo Not installing Epic Games Launcher. >> C:\install_log.txt
goto zepicgameslauncher
:zepicgameslauncher

:goggalaxy
set /P INPUT=Would you like to install GOG Galaxy (Y/N)?
If /I "%INPUT%"=="y" goto ygoggalaxy
If /I "%INPUT%"=="n" goto ngoggalaxy
echo Invalid input & goto goggalaxy
:ygoggalaxy
echo Installing GOG Galaxy. >> C:\install_log.txt
choco install goggalaxy -y >> C:\install_log.txt 2>&1
goto zgoggalaxy
:ngoggalaxy
echo Not installing GOG Galaxy. >> C:\install_log.txt
goto zgoggalaxy
:zgoggalaxy

:supertuxkart
set /P INPUT=Would you like to install SuperTuxKart (Y/N)?
If /I "%INPUT%"=="y" goto ysupertuxkart
If /I "%INPUT%"=="n" goto nsupertuxkart
echo Invalid input & tuxkart
If /I "%tuxkart
:ysupertuxkart
echo Installing SuperTuxKart. >> C:\install_log.txt
choco install supertuxkart -y >> C:\install_log.txt 2>&1
goto zsupertuxkart
:nsupertuxkart
echo Not installing SuperTuxKart. >> C:\install_log.txt
goto zsupertuxkart
:zsupertuxkart

:sauerbraten
set /P INPUT=Would you like to install Sauerbraten (Y/N)?
If /I "%INPUT%"=="y" goto ysauerbraten
If /I "%INPUT%"=="n" goto nsauerbraten
echo Invalid input & goto sauerbraten
:ysauerbraten
echo Installing Sauerbraten. >> C:\install_log.txt
choco install sauerbraten -y >> C:\install_log.txt 2>&1
goto zsauerbraten
:nsauerbraten
echo Not installing Sauerbraten. >> C:\install_log.txt
goto zsauerbraten
:zsauerbraten

:chessx
set /P INPUT=Would you like to install ChessX (Y/N)?
If /I "%INPUT%"=="y" goto ychessx
If /I "%INPUT%"=="n" goto nchessx
echo Invalid input & goto chessx
:ychessx
echo Installing ChessX. >> C:\install_log.txt
choco install chessx -y >> C:\install_log.txt 2>&1
goto zchessx
:nchessx
echo Not installing ChessX. >> C:\install_log.txt
goto zchessx
:zchessx

REM Completion
echo.
echo Installation completed. >> C:\install_log.txt
echo Installation completed.
echo Press any key to close.
pause >nul
