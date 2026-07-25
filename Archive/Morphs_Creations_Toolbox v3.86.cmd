@echo off
setlocal EnableDelayedExpansion
:: ============================================
:: ADMIN & INIT
:: ============================================
fltmc >nul 2>&1 || (powershell -Command "Start-Process -FilePath '%~f0' -Verb RunAs" & exit /b)
title Morphs Creations Toolbox Console v3.86
color 0A & CD /D "%~dp0"

:: ============================================
:: BASE DIRECTORY SETUP
:: ============================================
set "Base_Dir=%~dp0"
set "W_Dir=%Base_Dir%EngineToolbox"
set "P_Dir=%Base_Dir%EngineToolbox\Programs"
set "F_Dir=%Base_Dir%EngineToolbox\Frameworks"
set "T_Dir=%Base_Dir%EngineToolbox\Tools"
set "R_Dir=%Base_Dir%EngineToolbox\RegFiles"
if exist "%Base_Dir%\PendingInstall.txt" del "%Base_Dir%\PendingInstall.txt"
for %%d in ("%W_Dir%" "%P_Dir%" "%F_Dir%" "%T_Dir%" "%R_Dir%") do if not exist "%%~d" mkdir "%%~d" >nul 2>&1

:: ============================================
:: Animated Unicode Logo Render
:: ============================================
cls
chcp 65001 >nul
mode con:cols=106 lines=31
color 0A
powershell -ExecutionPolicy Bypass -Command "$colors=@('Cyan','Green','Magenta','Yellow','White','DarkCyan'); $logo=@('        ßßß    ßßß   ßßßßßß   ßßßßßß   ßßßßßß   ßß   ßß  ßßßßßßß','        ßßßß  ßßßß  ßß    ßß  ßß   ßß  ßß   ßß  ßß   ßß  ßß     ','        ßß ßßßß ßß  ßß    ßß  ßßßßßß   ßßßßßß   ßßßßßßß  ßßßßßßß','        ßß  ßß  ßß  ßß    ßß  ßß   ßß  ßß       ßß   ßß       ßß','        ßß      ßß   ßßßßßß   ßß   ßß  ßß       ßß   ßß  ßßßßßßß',' ','   ßßßßßß  ßßßßßß  ßßßßßßß   ßßßßß  ßßßßßßßß  ßß  ßßßßßß  ßßß    ßß  ßßßßßßß','  ßß       ßß   ßß ßß       ßß   ßß    ßß     ßß ßß    ßß ßßßß   ßß  ßß     ','  ßß       ßßßßßß  ßßßßßßß  ßßßßßßß    ßß     ßß ßß    ßß ßß ßß  ßß  ßßßßßßß','  ßß       ßß   ßß ßß       ßß   ßß    ßß     ßß ßß    ßß ßß  ßß ßß       ßß','   ßßßßßß  ßß   ßß ßßßßßßß  ßß   ßß    ßß     ßß  ßßßßßß  ßß   ßßßß  ßßßßßßß'); foreach ($line in $logo) { if ($line.Trim().Length -eq 0) { Write-Host ''; continue }; [char[]]$chars = $line.ToCharArray(); foreach ($c in $chars) { if ($c -eq 'ß') { $color = Get-Random -InputObject $colors; Write-Host $c -ForegroundColor $color -NoNewline } else { Write-Host $c -NoNewline } }; Write-Host '' }"
echo.
timeout /t 2 >nul

:: ============================================
:: NETWORK DETECTION
:: ============================================
curl.exe -s --head https://www.google.com >nul 2>&1
if %errorlevel% EQU 0 (set "NetState=ONLINE" & set "StateCol=0B") else (set "NetState=OFFLINE" & set "StateCol=0C")
set "Arch=x86" & if exist "%WinDir%\SysWOW64" set "Arch=x64"

:: ============================================
:: MAIN MENU (PAGE 1)
:: ============================================
:MainMenu
mode con:cols=106 lines=31
set "Page=1"
set "uinput=" & set "sel=" & cls & color %StateCol%
echo  =========================================================================================================
echo    		 **Morphs Creations** DEPLOYMENT CONSOLE v3.86    [^] MODE: %NetState%    [^] ARCH: %Arch%
echo  =========================================================================================================
echo   --------------------      -------------------      -------------------         -------------------------
echo    Standard Programs         Portable Tools 1         Portable Tools 3             System Optimizations
echo   --------------------      -------------------      -------------------         -------------------------
echo  [ 1 ] 7-Zip Archiver      [ 30 ] Everything        [ 50 ] Driver Booster        [ 80 ] Safe WinSxS Purge
echo  [ 2 ] WinRAR Suite        [ 31 ] Revo Uninst Free  [ 51 ] Lacey Dwnld (79M)     [ 81 ] Toggle Hibern
echo  [ 3 ] WinDirStat Anlz     [ 32 ] Rufus             [ 52 ] WinTools Prem         [ 82 ] Compact OS Eng
echo  [ 4 ] PotPlayer (51M)     [ 33 ] Ventoy Multi      [ 53 ] AIDA64 Extr (59M)     [ 83 ] Query Resrv Stg
echo  [ 5 ] K-Lite Mega (64M)   [ 34 ] Hard Disk Sent    [ 54 ] CCleaner Old          [ 84 ] Disable Resrv Stg
echo  [ 6 ] UltraISO Utility    [ 35 ] Anydesk Tool      [ 55 ] Recuva Recovery       ------------------------
echo  [ 7 ] Telegram (51M)      [ 36 ] Psiphon Proxy     [ 56 ] Drive Snapshot           Macro Presets
echo  [ 8 ] Winamp Player       [ 37 ] CPU-Z Hardware    [ 57 ] Aomei Part (83M)      -------------------------
echo  [ 9 ] Lantern VPN Proxy   --------------------     --------------------         [ 100 ] Browsers Suite
echo  [ 10 ] UltraViewer Remote --------------------     Deployment Runtimes          [ 150 ] Runtimes Pack
echo  -------------------------  Portable Tools 2        ------------------------     [ 200 ] Portable Pack 1
echo     Online Browsers        --------------------     [ 60 ] AdobeAIR Framework    [ 250 ] Portable Pack 2
echo   -------------------      [ 40 ] Easy Context      [ 61 ] Microsoft XNA Build   [ 300 ] Portable Pack 3
echo  [ 20 ] Edge (194M)        [ 41 ] PatchMyPC (61M)   [ 62 ] OpenAL Audio Engine   [ 666 ] NUCLEAR DEPLOY
echo  [ 21 ] Chrome (148M)      [ 42 ] RustDesk Remote   [ 63 ] DirectX Leg (95M)    -------------------------
echo  [ 22 ] CentBrowser (108M) [ 43 ] CrystalDisk (SF)e [ 64 ] VC++ AIO (vcpp)    
echo  [ 23 ] Brave (223M)       [ 44 ] oCam Recorder     [ 65 ] Nvidia PhysX Legacy
echo  [ 24 ] Avast Antivirus    [ 45 ] WinToUSB (61M)    [ 66 ] Java JRE 8 (x32)
echo  [ 25 ] Discord (102M)     [ 46 ] WinToHDD Tool     [ 67 ] Java JRE 8 (x64)
echo  [ 26 ] Steam (45MB)       [ 47 ] Native Img View   -------------------------
echo   ----------------------   ----------------------- 
goto :MenuFooter

:: ============================================
:: MAIN MENU (PAGE 2)
:: ============================================
:MenuPage2
mode con:cols=106 lines=22
set "Page=2"
set "uinput=" & set "sel=" & cls & color %StateCol%
echo  =========================================================================================================
echo     			**Morphs Creations** DEPLOYMENT CONSOLE v3.86 (Page 2/3)
echo  =========================================================================================================
echo   ------------------------   -------------------       ---------------------      -----------------------
echo    Office ^& Productivity     Media Production           Developer Tools           Morphs System Tweaks
echo   ------------------------   -------------------       ---------------------      -----------------------
echo  [ 501 ] SumatraPDF Port   [ 510 ] VLC Media Mirror   [ 520 ] VS Code (296M)     [ 560 ] Hide From Uninst
echo  [ 502 ] Notepad3 Portable [ 511 ] Handbrake          [ 521 ] Notepad++ Port     [ 561 ] Net Profile Name
echo    -------------------     [ 512 ] qBittorrent (SF)   [ 522 ] Git for Win (62M)  [ 562 ] NewFileTime 
echo     Network ^& Server       [ 513 ]  Shotcut (113M)    [ 523 ] Python 3.14        [ 563 ] Optimizer 
echo    -------------------     ---------------------      [ 524 ] WinMerge (SF)      [ 564 ] RegConverter
echo  [ 530 ] Wireshark (92M)   ---------------------      -------------------        [ 565 ] Service Manager
echo  [ 531 ] Nmap Security      Security ^& Privacy        ISO Tools                  [ 566 ] EarTrumpet
echo  [ 532 ] PuTTY SSH Client  ---------------------      --------------------       [ 567 ] WizTree
echo  [ 533 ] Adv IP Scanner    [ 540 ] Malwarebytes       [ 550 ] PowerISO (9.0)     [ 568 ] PowerToys
echo  [ 534 ] EZ tools          [ 541 ] PrivaZer Utility   [ 551 ] ImgBurn Suite      [ 570 ] Defender Control
echo  [ 535 ] Dropbox           [ 542 ] Glary Utilities    [ 552 ] AnyBurn Suite      [ 571 ] Win Update Block
echo  [ 536 ] Google Drive      [ 543 ] IDM                [ 553 ] FormatFact (SF)    
echo  [ 537 ] MegaSync          [ 544 ] VeraCrypt (GH)     ------------------------   
goto :MenuFooter

:: ============================================
:: MAIN MENU (PAGE 3)
:: ============================================
:MenuPage3
mode con:cols=106 lines=22
set "Page=3"
set "uinput=" & set "sel=" & cls & color %StateCol%
echo  =========================================================================================================
echo     			**Morphs Creations** DEPLOYMENT CONSOLE v3.86 (Page 3/3)
echo  =========================================================================================================
echo     			                Registry Integration Suite
echo  =========================================================================================================
echo   		Context Menu Additions (ENABLE)             Context Menu Removal (DISABLE)
echo  	       ----------------------------------         ----------------------------------
echo  		[ 600 ] Enable CP Desktop Menu             [ 610 ] Disable CP Desktop Menu
echo  		[ 601 ] Enable Personalize Classic         [ 611 ] Disable Personalize Classic
echo  		[ 602 ] Enable Restart Explorer            [ 612 ] Disable Restart Explorer
echo  		[ 603 ] Enable System Shortcuts            [ 613 ] Disable System Shortcuts
echo  		[ 604 ] Enable System Tools                [ 614 ] Disable System Tools
echo  		[ 605 ] Enable Take Ownership              [ 615 ] Disable Take Ownership
echo.
echo                             [ 620 ] CLEANUP: Reset Desktop Context Menu
echo  =========================================================================================================
echo                             Note: These changes take effect immediately.
echo  =========================================================================================================
goto :MenuFooter

:: ============================================
:: FOOTER & QUEUE
:: ============================================
:MenuFooter
echo  =========================================================================================================
echo           [ 0 ] Exit  [ N ] Next Page  [ B ] Back Page  [ S ] Save Profile  [ L ] Load Profile
echo  =========================================================================================================
set /p "uinput=Selection: "
if not defined uinput goto RefreshPage
if "%uinput%"=="0" exit /b

:: Fixed Navigation Logic (Flattened)
if /I "%uinput%"=="N" (
    if "%Page%"=="1" goto MenuPage2
    if "%Page%"=="2" goto MenuPage3
    if "%Page%"=="3" goto MainMenu
)
if /I "%uinput%"=="B" (
    if "%Page%"=="1" goto MenuPage3
    if "%Page%"=="2" goto MainMenu
    if "%Page%"=="3" goto MenuPage2
)

if /I "%uinput%"=="S" (set /p "cq=Enter IDs: " & echo !cq! > "%F_Dir%\Profile.txt" & goto RefreshPage)
if /I "%uinput%"=="L" (if exist "%F_Dir%\Profile.txt" (set /p sel=<"%F_Dir%\Profile.txt" & goto PrepQueue) else (goto RefreshPage))

set "sel=%uinput%"
if "%sel%"=="100" set "sel=20 21 22 23"
if "%sel%"=="150" set "sel=70 71 72 73 74 75 76 77"
if "%sel%"=="200" set "sel=30 31 33 34 35 36 37 39 40"
if "%sel%"=="250" set "sel=41 42 43 44 45 46 47 49"
if "%sel%"=="300" set "sel=50 52 53 54 55 57 58 59"
if "%sel%"=="666" set "sel=1 2 20 21 535 536 537 701 712 721 752 91 92 93 800 807"

:PrepQueue
set "TotalItems=0" & for %%a in (%sel%) do set /a "TotalItems+=1"
set "CurrentIndex=0"
:ProcessQueue
set /a "CurrentIndex+=1"
for /f "tokens=1*" %%a in ("!sel!") do (set "cid=%%a" & set "sel=%%b")
if not defined cid goto InstallCheck
cls & echo ==========================================================
echo  PROCESSING: [!CurrentIndex!/!TotalItems!] - ID: %cid%
echo ==========================================================
findstr /i /b /c:":Opt_%cid%" "%~f0" >nul 2>&1
if !errorlevel! EQU 0 (goto Opt_%cid%) else (echo [-] ID [%cid%] missing. & timeout /t 2 >nul & goto QueueRelay)

:QueueRelay
if defined sel goto :ProcessQueue
goto InstallCheck

:InstallCheck
if exist "%Base_Dir%\PendingInstall.txt" (
    cls
    echo ==========================================================
    echo  QUEUE COMPLETE. DOWNLOADS READY FOR SILENT INSTALL:
    echo ==========================================================
    type "%Base_Dir%\PendingInstall.txt"
    echo.
    set /p "ins=Install these programs now? (Y/N): "
    if /I "!ins!"=="Y" goto InstallMenu
    del "%Base_Dir%\PendingInstall.txt"
)
goto RefreshPage

:InstallMenu
cls & echo ==========================================================
echo  SELECT INSTALLER TO EXECUTE (Or 0 to exit)
echo ==========================================================
set "i=0"
for /f "tokens=*" %%a in (%Base_Dir%\PendingInstall.txt) do (
    set /a i+=1
    set "f!i!=%%a"
    echo  [ !i! ] %%~nxa
)
set /p "iChoice=Selection (1-!i!): "
if "%iChoice%"=="0" del "%Base_Dir%\PendingInstall.txt" & goto RefreshPage
set "TargetFile=!f%iChoice%!"
echo Executing: !TargetFile!
if /i "!TargetFile:~-4!"==".msi" (msiexec /i "!TargetFile!" /qn) else ("!TargetFile!" /S)
echo [+] Installation command sent.
timeout /t 2 >nul & goto InstallMenu

:RefreshPage
if "%Page%"=="1" goto MainMenu
if "%Page%"=="2" goto MenuPage2
if "%Page%"=="3" goto MenuPage3
goto MainMenu

:: ============================================
:: REGISTRY SUBROUTINES
:: ============================================
:ApplyReg
set "rFile=%~1"
set "rUrl=https://raw.githubusercontent.com/Morph699/Morphs-Toolbox/main/Regfiles/%rFile%"
echo [SYNC] Downloading Registry Tweak: %rFile%
curl -L -k -f --retry 3 -o "%R_Dir%\%rFile%" "%rUrl%" >nul 2>&1
if exist "%R_Dir%\%rFile%" (
    reg import "%R_Dir%\%rFile%" >nul
    echo [OK] Registry Tweak Applied.
) else (
    echo [-] Error: Could not download registry file.
)
timeout /t 1 >nul
goto QueueRelay

:Opt_620
echo [CLEANUP] Resetting Desktop Context Menu...
for %%k in ("ControlPanel" "Personalization" "Restart Explorer" "SystemShortcuts" "SystemTools" "Control Panel" "PersonalizeClassic" "RestartExplorer" "Shortcuts" "Tools") do (
    reg delete "HKCR\DesktopBackground\Shell\%%~k" /f >nul 2>&1
)
echo [+] Cleanup Done.
timeout /t 2 >nul
goto QueueRelay

:Opt_600
call :ApplyReg "Enable_CP Desktop Context Menu.reg"
:Opt_601
call :ApplyReg "Enable_Personalize Classic.reg"
:Opt_602
call :ApplyReg "Enable_Restart_Explorer_to_desktop_context_menu.reg"
:Opt_603
call :ApplyReg "Enable_SystemShortcuts.reg"
:Opt_604
call :ApplyReg "Enable_SystemTools.reg"
:Opt_605
call :ApplyReg "Enable_Take Ownership to Context menu.reg"
:Opt_610
call :ApplyReg "Remove CP Desktop Context Menu.reg"
:Opt_611
call :ApplyReg "Remove Personalize Classic.reg"
:Opt_612
call :ApplyReg "Remove_Restart_Explorer_from_desktop_context_menu.reg"
:Opt_613
call :ApplyReg "Remove_SystemShortcuts.reg"
:Opt_614
call :ApplyReg "Remove_SystemTools.reg"
:Opt_615
call :ApplyReg "Remove_Take Ownership from Context Menu (Default).reg"

:: ============================================
:: DOWNLOAD SUBROUTINES
:: ============================================
:Opt_1 
set "vUrl=https://github.com/ip7z/7zip/releases/download/26.02/7z2602-x64.exe"
call :DirectDL "!vUrl!" "%P_Dir%\7z2602-x64.exe"
goto QueueRelay
:Opt_2 
set "vUrl=https://www.win-rar.com/fileadmin/winrar-versions/winrar/winrar-x64-723.exe"
call :DirectDL "!vUrl!" "%P_Dir%\winrar-x64-723.exe"
goto QueueRelay
:Opt_3 
set "vUrl=https://github.com/windirstat/windirstat/releases/latest/download/WinDirStat.zip"
call :DirectDL "!vUrl!" "%P_Dir%\WinDirStat.zip"
goto QueueRelay
:Opt_4 
set "vUrl=https://t1.kakaocdn.net/potplayer/PotPlayer/Version/Latest/PotPlayerSetup64.exe"
call :DirectDL "!vUrl!" "%P_Dir%\PotPlayerSetup64.exe"
goto QueueRelay
:Opt_5 
set "vUrl=https://files2.codecguide.com/K-Lite_Codec_Pack_1982_Mega.exe"
call :DirectDL "!vUrl!" "%P_Dir%\K-Lite_Mega.exe"
goto QueueRelay
:Opt_6 
set "vUrl=https://dw.ezbsystems.com/uiso9_pe.exe"
call :DirectDL "!vUrl!" "%P_Dir%\UltraISO_Setup.exe"
goto QueueRelay
:Opt_7 
set "vUrl=https://github.com/telegramdesktop/tdesktop/releases/download/v7.0.1/tsetup-x64.7.0.1.exe"
call :DirectDL "!vUrl!" "%P_Dir%\Telegram_Setup.exe"
goto QueueRelay
:Opt_8 
set "vUrl=http://download.nullsoft.com/winamp/client/winamp_latest_full.exe"
call :DirectDL "!vUrl!" "%P_Dir%\Winamp_Setup.exe"
goto QueueRelay
:Opt_9 
set "vUrl=https://media.githubusercontent.com/media/getlantern/lantern-binaries/main/lantern-installer.exe"
call :DirectDL "!vUrl!" "%P_Dir%\Lantern_Setup.exe"
goto QueueRelay
:Opt_10 
set "vUrl=https://www.ultraviewer.net/en/UltraViewer_setup_6.6_en.exe"
call :DirectDL "!vUrl!" "%P_Dir%\UltraViewer_Setup.exe"
goto QueueRelay
:Opt_20 
set "vUrl=https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/0870b5f5-cf08-4f24-8383-f362a669fcd8/MicrosoftEdgeEnterpriseX64.msi"
call :DirectDL "!vUrl!" "%P_Dir%\Edge_Enterprise_x64.msi"
goto QueueRelay
:Opt_21 
set "vUrl=https://dl.google.com/chrome/install/ChromeStandaloneSetup64.exe"
call :DirectDL "!vUrl!" "%P_Dir%\Chrome_Setup.exe"
goto QueueRelay
:Opt_22 
set "vUrl=https://static.centbrowser.com/win_stable/5.2.1168.83/centbrowser_5.2.1168.83_x64.exe"
call :DirectDL "!vUrl!" "%P_Dir%\CentBrowser_Setup.exe"
goto QueueRelay
:Opt_23 
set "vUrl=https://github.com/brave/brave-browser/releases/download/v1.92.139/brave-v1.92.139-win32-x64.zip"
call :DirectDL "!vUrl!" "%P_Dir%\Brave_Portable_x64.zip"
goto QueueRelay
:Opt_24 
set "vUrl=https://bits.avcdn.net/productfamily_ANTIVIRUS/insttype_FREE/platform_WIN/installertype_ONLINE/build_RELEASE"
call :DirectDL "!vUrl!" "%P_Dir%\Avast_Free_Online.exe"
goto QueueRelay
:Opt_25 
set "vUrl=https://discord.com/api/download?platform=win"
call :DirectDL "!vUrl!" "%P_Dir%\Discord_Setup.exe"
goto QueueRelay
:Opt_26 
set "vUrl=https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe"
call :DirectDL "!vUrl!" "%P_Dir%\Steam_Setup.exe"
goto QueueRelay
:Opt_30 
set "vUrl=https://www.voidtools.com/Everything-1.4.1.1032.x64.zip"
call :DirectDL "!vUrl!" "%T_Dir%\Everything_x64.zip"
goto QueueRelay
:Opt_31 
set "vUrl=https://revouninstaller.b-cdn.net/ruf270/RevoUninstaller_Portable.zip"
call :DirectDL "!vUrl!" "%T_Dir%\Revo_Portable.zip"
goto QueueRelay
:Opt_32 
set "vUrl=https://github.com/pbatard/rufus/releases/download/v4.15/rufus-4.15p.exe"
call :DirectDL "!vUrl!" "%T_Dir%\Rufus_4.15.exe"
goto QueueRelay
:Opt_33 
set "vUrl=https://github.com/ventoy/Ventoy/releases/download/v1.1.16/ventoy-1.1.16-windows.zip"
call :DirectDL "!vUrl!" "%T_Dir%\Ventoy_x64.zip"
goto QueueRelay
:Opt_34 
set "vUrl=https://www.harddisksentinel.com/hdsentinel_setup.zip"
call :DirectDL "!vUrl!" "%T_Dir%\HardDiskSentinel.zip"
goto QueueRelay
:Opt_35 
set "vUrl=https://download.anydesk.com/AnyDesk.exe"
call :DirectDL "!vUrl!" "%T_Dir%\AnyDesk.exe"
goto QueueRelay
:Opt_36 
set "vUrl=https://psiphon.ca/psiphon3.exe"
call :DirectDL "!vUrl!" "%T_Dir%\Psiphon3.exe"
goto QueueRelay
:Opt_37 
set "vUrl=https://download.cpuid.com/cpu-z/cpu-z_2.10-en.zip"
call :DirectDL "!vUrl!" "%T_Dir%\CPU-Z_Portable.zip"
goto QueueRelay
:Opt_40 
set "vUrl=https://www.sordum.org/files/downloads.php?easy-context-menu"
call :DirectDL "!vUrl!" "%T_Dir%\EasyContextMenu.zip"
goto QueueRelay
:Opt_41 
set "vUrl=https://homeupdater.patchmypc.com/public/PatchMyPC-HomeUpdater-Portable.exe"
call :DirectDL "!vUrl!" "%T_Dir%\PatchMyPC_Portable.exe"
goto QueueRelay
:Opt_42 
set "vUrl=https://github.com/rustdesk/rustdesk/releases/download/1.3.1/rustdesk-1.3.1-x86_64.exe"
call :DirectDL "!vUrl!" "%T_Dir%\RustDesk_Setup.exe"
goto QueueRelay
:Opt_43 
set "vUrl=https://master.dl.sourceforge.net/project/crystaldiskinfo/9.4.4/CrystalDiskInfo9_4_4.zip?viasf=1"
call :DirectDL "!vUrl!" "%T_Dir%\CrystalDiskInfo.zip"
goto QueueRelay
:Opt_44 
set "vUrl=https://raw.githubusercontent.com/ohsoft/archive/master/ocam/2023121501/oCam_v550.0.exe"
call :DirectDL "!vUrl!" "%T_Dir%\oCam_Setup.exe"
goto QueueRelay
:Opt_45 
set "vUrl=https://www.easyuefi.com/wintousb/downloads/WinToUSB_Free.exe"
call :DirectDL "!vUrl!" "%T_Dir%\WinToUSB_Free.exe"
goto QueueRelay
:Opt_46 
set "vUrl=https://www.easyuefi.com/wintohdd/downloads/WinToHDD_Free.exe"
call :DirectDL "!vUrl!" "%T_Dir%\WinToHDD_Free.exe"
goto QueueRelay
:Opt_47 
set "vUrl=https://github.com/deminimis/minimalimageviewer/releases/download/v2.0.3/MinimalImageViewer.exe"
call :DirectDL "!vUrl!" "%T_Dir%\NativeImageViewer.exe"
goto QueueRelay
:Opt_50 
set "vUrl=https://www.iobit.com/downloadcenter.php?product=driver-booster"
call :DirectDL "!vUrl!" "%P_Dir%\Driver_Booster_Setup.exe"
goto QueueRelay
:Opt_51 
set "vUrl=https://www.the-sz.com/common/get.php?product=lacey"
call :DirectDL "!vUrl!" "%T_Dir%\Lacey_Downloader.zip"
goto QueueRelay
:Opt_52 
set "vUrl=https://www.wintools.net/wintools.zip"
call :DirectDL "!vUrl!" "%T_Dir%\WinTools_Premium.zip"
goto QueueRelay
:Opt_53 
set "vUrl=https://download2.aida64.com/aida64extreme830.exe"
call :DirectDL "!vUrl!" "%T_Dir%\AIDA64_Extreme.exe"
goto QueueRelay
:Opt_54 
set "vUrl=https://download.ccleaner.com/ccsetup625.exe"
call :DirectDL "!vUrl!" "%P_Dir%\CCleaner_v6.exe"
goto QueueRelay
:Opt_55 
set "vUrl=https://download.ccleaner.com/rcsetup155.exe"
call :DirectDL "!vUrl!" "%P_Dir%\Recuva_Setup.exe"
goto QueueRelay
:Opt_56 
set "vUrl=http://www.drivesnapshot.de/download/snapshot64.exe"
call :DirectDL "!vUrl!" "%T_Dir%\DriveSnapshot_x64.exe"
goto QueueRelay
:Opt_57 
set "vUrl=https://go.aomeitech.com/dl/pa/PAssist_Std.exe"
call :DirectDL "!vUrl!" "%P_Dir%\AOMEI_PartitionAssistant.exe"
goto QueueRelay
:Opt_60 
set "vUrl=https://airsdk.harman.com/assets/downloads/51.3.3.1/AdobeAIR.exe"
call :DirectDL "!vUrl!" "%F_Dir%\AdobeAIR.exe"
goto QueueRelay
:Opt_61 
set "vUrl=https://download.microsoft.com/download/a/c/2/ac2c903b-e6e8-42c2-9fd7-bebac362a930/xnafx40_redist.msi"
call :DirectDL "!vUrl!" "%F_Dir%\XNA_Framework_4.0.msi"
goto QueueRelay
:Opt_62 
set "vUrl=https://www.openal.org/downloads/oalinst.zip"
call :DirectDL "!vUrl!" "%F_Dir%\OpenAL_Runtime.zip"
goto QueueRelay
:Opt_63 
set "vUrl=https://download.microsoft.com/download/8/4/a/84a35bf1-dafe-4ae8-82af-ad2ae20b6b14/directx_Jun2010_redist.exe"
call :DirectDL "!vUrl!" "%F_Dir%\DirectX_Jun2010.exe"
goto QueueRelay
:Opt_64 
set "vUrl=https://www.tinyplease.com/vcpp"
call :DirectDL "!vUrl!" "%F_Dir%\VC_Redist_AIO.exe"
goto QueueRelay
:Opt_65 
set "vUrl=https://us.download.nvidia.com/Windows/9.13.0604/PhysX-9.13.0604-SystemSoftware-Legacy.msi"
call :DirectDL "!vUrl!" "%F_Dir%\PhysX_Legacy.msi"
goto QueueRelay
:Opt_66 
set "vUrl=https://javadl.oracle.com/webapps/download/AutoDL?BundleId=253194_f7fe8e644f724108bdb54139381e29a7"
call :DirectDL "!vUrl!" "%F_Dir%\Java8_x32.exe"
goto QueueRelay
:Opt_67 
set "vUrl=https://javadl.oracle.com/webapps/download/AutoDL?BundleId=253195_f7fe8e644f724108bdb54139381e29a7"
call :DirectDL "!vUrl!" "%F_Dir%\Java8_x64.exe"
goto QueueRelay
:Opt_80
dism.exe /online /cleanup-image /startcomponentcleanup
goto QueueRelay
:Opt_81
powercfg /h off
goto QueueRelay
:Opt_82
compact.exe /CompactOS:always
goto QueueRelay
:Opt_83
cls
echo [QUERY] Checking Reserved Storage State...
dism /Online /Get-ReservedStorageState
pause
goto QueueRelay
:Opt_84
cls
echo [CONFIG] Disabling Reserved Storage to reclaim space...
dism /Online /Set-ReservedStorageState /State:Disabled
timeout /t 3 >nul
goto QueueRelay
:Opt_501 
set "vUrl=https://www.sumatrapdfreader.org/dl/rel/3.6.1/SumatraPDF-3.6.1-64.zip"
call :DirectDL "!vUrl!" "%P_Dir%\SumatraPDF.zip"
goto QueueRelay
:Opt_502 
set "vUrl=https://github.com/rizonesoft/Notepad3/releases/download/RELEASE_7.26.602.1/Notepad3_7.26.602.1_x64_Portable.zip"
call :DirectDL "!vUrl!" "%P_Dir%\Notepad3.zip"
goto QueueRelay
:Opt_510 
set "vUrl=https://mirror.aptus.co.tz/pub/videolan/vlc/3.0.23/win64/vlc-3.0.23-win64.exe"
call :DirectDL "!vUrl!" "%P_Dir%\VLC_x64.exe"
goto QueueRelay
:Opt_511 
set "vUrl=https://github.com/HandBrake/HandBrake/releases/download/1.8.2/HandBrake-1.8.2-x86_64-Win_GUI.exe"
call :DirectDL "!vUrl!" "%P_Dir%\Handbrake_Portable.exe"
goto QueueRelay
:Opt_512 
set "vUrl=https://github.com/qbittorrent/qBittorrent/releases/download/release-5.2.3/qbittorrent_5.2.3_x64_setup.exe"
call :DirectDL "!vUrl!" "%P_Dir%\qBittorrent.exe"
goto QueueRelay
:Opt_513 
set "vUrl=https://github.com/mltframework/shotcut/releases/download/v24.06.26/shotcut-win64-240626.exe"
call :DirectDL "!vUrl!" "%P_Dir%\Shotcut_Portable.exe"
goto QueueRelay
:Opt_520 
set "vUrl=https://update.code.visualstudio.com/latest/win32-x64-archive/stable"
call :DirectDL "!vUrl!" "%P_Dir%\VSCode_x64.zip"
goto QueueRelay
:Opt_521 
set "vUrl=https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.9.7/npp.8.9.7.portable.x64.7z"
call :DirectDL "!vUrl!" "%P_Dir%\NotepadPP_Portable.7z"
goto QueueRelay
:Opt_522 
set "vUrl=https://github.com/git-for-windows/git/releases/download/v2.55.0.windows.3/Git-2.55.0.3-64-bit.exe"
call :DirectDL "!vUrl!" "%P_Dir%\Git_Setup.exe"
goto QueueRelay
:Opt_523 
set "vUrl=https://www.python.org/ftp/python/3.14.6/python-3.14.6-amd64.exe"
call :DirectDL "!vUrl!" "%P_Dir%\Python_3.14.exe"
goto QueueRelay
:Opt_524 
set "vUrl=https://master.dl.sourceforge.net/project/winmerge/stable/2.16.42/WinMerge-2.16.42-x64-Setup.exe?viasf=1"
call :DirectDL "!vUrl!" "%P_Dir%\WinMerge.exe"
goto QueueRelay
:Opt_530 
set "vUrl=https://www.wireshark.org/download/win64/Wireshark-latest-x64.exe"
call :DirectDL "!vUrl!" "%P_Dir%\Wireshark_Setup.exe"
goto QueueRelay
:Opt_531 
set "vUrl=https://nmap.org/dist/nmap-7.99-setup.exe"
call :DirectDL "!vUrl!" "%P_Dir%\Nmap_Setup.exe"
goto QueueRelay
:Opt_532 
set "vUrl=https://the.earth.li/~sgtatham/putty/latest/w64/putty-64bit-0.84-installer.msi"
call :DirectDL "!vUrl!" "%P_Dir%\PuTTY_Setup.msi"
goto QueueRelay
:Opt_533 
set "vUrl=https://download.advanced-ip-scanner.com/download/files/Advanced_IP_Scanner_2.5.4594.1.exe"
call :DirectDL "!vUrl!" "%P_Dir%\Advanced_IP_Scanner.exe"
goto QueueRelay
:Opt_534 
set "vUrl=https://www.mediafire.com/file_premium/xt9r3l0v6ed4f0y/EZTools-R1122.3.5.1%%28IN%%29.zip/file"
call :DirectDL "!vUrl!" "%T_Dir%\EZTools_Forensic.zip"
goto QueueRelay
:Opt_535
set "vUrl=https://www.dropbox.com/download?full=1&plat=win"
call :DirectDL "!vUrl!" "%P_Dir%\Dropbox_Setup.exe"
goto QueueRelay
:Opt_536
set "vUrl=https://dl.google.com/drive-file-stream/GoogleDriveSetup.exe"
call :DirectDL "!vUrl!" "%P_Dir%\GoogleDrive_Setup.exe"
goto QueueRelay
:Opt_537
set "vUrl=https://mega.nz/MEGAsyncSetup.exe"
call :DirectDL "!vUrl!" "%P_Dir%\MegaSync_Setup.exe"
goto QueueRelay
:Opt_540 
set "vUrl=https://downloads.malwarebytes.com/file/mb-windows?filename=MBSetup-3.3.exe"
call :DirectDL "!vUrl!" "%P_Dir%\Malwarebytes_Setup.exe"
goto QueueRelay
:Opt_541 
set "vUrl=https://privazer.com/en/PrivaZer.exe"
call :DirectDL "!vUrl!" "%P_Dir%\PrivaZer.exe"
goto QueueRelay
:Opt_542 
set "vUrl=https://www.glarysoft.com/aff/download2.php?s=GU"
call :DirectDL "!vUrl!" "%P_Dir%\GlaryUtilities_Setup.exe"
goto QueueRelay
:Opt_543 
set "vUrl=https://download.internetdownloadmanager.com/idman643build5.exe"
call :DirectDL "!vUrl!" "%P_Dir%\IDM_Setup.exe"
goto QueueRelay
:Opt_544 
set "vUrl=https://github.com/veracrypt/VeraCrypt/releases/download/VeraCrypt_1.26.7/VeraCrypt_Portable_1.26.7.exe"
call :DirectDL "!vUrl!" "%P_Dir%\VeraCrypt_Portable.exe"
goto QueueRelay
:Opt_550 
set "vUrl=https://www.poweriso.com/PowerISO9-x64.exe"
call :DirectDL "!vUrl!" "%P_Dir%\PowerISO_x64.exe"
goto QueueRelay
:Opt_551 
set "vUrl=https://download.imgburn.com/SetupImgBurn_2.5.8.0.exe"
call :DirectDL "!vUrl!" "%P_Dir%\ImgBurn_Setup.exe"
goto QueueRelay
:Opt_552 
set "vUrl=https://www.anyburn.com/anyburn_setup.exe"
call :DirectDL "!vUrl!" "%P_Dir%\AnyBurn_Setup.exe"
goto QueueRelay
:Opt_553 
set "vUrl=https://dw.ezbsystems.com/uiso9_pe.exe"
call :DirectDL "!vUrl!" "%P_Dir%\FormatFactory_Setup.exe"
goto QueueRelay
:Opt_560 
set "vUrl=https://raw.githubusercontent.com/Morph699/Morphs-Toolbox/main/Programs/HideUL_x64.exe"
call :DirectDL "!vUrl!" "%T_Dir%\HideUL_x64.exe"
goto QueueRelay
:Opt_561 
set "vUrl=https://raw.githubusercontent.com/Morph699/Morphs-Toolbox/main/Programs/NetPnc_x64.exe"
call :DirectDL "!vUrl!" "%T_Dir%\NetPnc_x64.exe"
goto QueueRelay
:Opt_562 
set "vUrl=https://raw.githubusercontent.com/Morph699/Morphs-Toolbox/main/Programs/NewFileTime_x64.exe"
call :DirectDL "!vUrl!" "%T_Dir%\NewFileTime_x64.exe"
goto QueueRelay
:Opt_563 
set "vUrl=https://raw.githubusercontent.com/Morph699/Morphs-Toolbox/main/Programs/Optimizer.exe"
call :DirectDL "!vUrl!" "%T_Dir%\Optimizer.exe"
goto QueueRelay
:Opt_564 
set "vUrl=https://raw.githubusercontent.com/Morph699/Morphs-Toolbox/main/Programs/RegConvert.exe"
call :DirectDL "!vUrl!" "%T_Dir%\RegConvert.exe"
goto QueueRelay
:Opt_565 
set "vUrl=https://raw.githubusercontent.com/Morph699/Morphs-Toolbox/main/Programs/srvman.exe"
call :DirectDL "!vUrl!" "%T_Dir%\srvman.exe"
goto QueueRelay
:Opt_566
set "vUrl=https://github.com/File-New-Project/EarTrumpet/releases/latest/download/EarTrumpet.exe"
call :DirectDL "!vUrl!" "%P_Dir%\EarTrumpet_Setup.exe"
goto QueueRelay
:Opt_567
set "vUrl=https://diskanalyzer.com/files/wiztree_4_23_portable.zip"
call :DirectDL "!vUrl!" "%T_Dir%\WizTree_Portable.zip"
goto QueueRelay
:Opt_568
set "vUrl=https://github.com/microsoft/PowerToys/releases/latest/download/PowerToysSetup-x64.exe"
call :DirectDL "!vUrl!" "%P_Dir%\PowerToys_Setup.exe"
goto QueueRelay
:Opt_570 
set "vUrl=https://raw.githubusercontent.com/Morph699/Morphs-Toolbox/main/Programs/dControl.exe"
call :DirectDL "!vUrl!" "%T_Dir%\dControl.exe"
if exist "%T_Dir%\dControl.exe" start "" "%T_Dir%\dControl.exe"
goto QueueRelay
:Opt_571 
set "vUrl=https://raw.githubusercontent.com/Morph699/Morphs-Toolbox/main/Programs/Wub_x64.exe"
call :DirectDL "!vUrl!" "%T_Dir%\Wub_x64.exe"
if exist "%T_Dir%\Wub_x64.exe" start "" "%T_Dir%\Wub_x64.exe"
goto QueueRelay

:: ============================================
:: DOWNLOAD ENGINE (RESILIENT v3.85)
:: ============================================
:DirectDL
set "dUrl=%~1" & set "dOut=%~2"
echo [SYNC] Source: %dUrl%
echo [DEST] Target: %dOut%

curl -L -k -f --retry 3 --retry-delay 5 -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64)" "%dUrl%" -o "%dOut%"

if exist "%dOut%" (
    for %%A in ("%dOut%") do (
        set /a "sB=%%~zA"
        if !sB! LSS 10240 (
            echo [!] Error: Target file too small. Deleting.
            del /f /q "%dOut%"
            timeout /t 2 >nul & exit /b 1
        )
        echo "%dOut%" >> "%Base_Dir%\PendingInstall.txt"
        echo. & echo [OK] Download Successful: Saved to %dOut%.
        timeout /t 1 >nul & exit /b 0
    )
)
echo. & echo [-] Error: Engine failed to fetch binary.
pause & exit /b 1