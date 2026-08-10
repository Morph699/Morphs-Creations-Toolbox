@echo off
setlocal EnableDelayedExpansion
:: ============================================
:: ADMIN & INIT
:: ============================================
fltmc >nul 2>&1 || (powershell -Command "Start-Process -FilePath '%~f0' -Verb RunAs" & exit /b)
title Morphs Creations Toolbox Console v4.52
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
for %%d in ("%W_Dir%" "%P_Dir%" "%F_Dir%" "%T_Dir%" "%R_Dir%") do if not exist "%%~d" mkdir "%%~d" >nul 2>&1

:: ============================================
:: Animated Unicode Logo Render
:: ============================================
cls
chcp 65001 >nul
mode con:cols=78 lines=26
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
mode con:cols=106 lines=27
set "Page=1"
set "uinput=" & set "sel=" & cls & color %StateCol%
echo ==========================================================================================================
echo    	**Morphs Creations** DEPLOYMENT CONSOLE v4.52 (Page 1/5)    [^] MODE: %NetState%    [^] ARCH: %Arch%
echo ==========================================================================================================
echo     Archivers            System Optimising          Network / Cloud              Security / Privacy
echo  -------------------    --------------------     ----------------------      -----------------------
echo   [ 1 ] 7-Zip (1.6M)    [ 22 ] DrvSnapst (1M)    [ 50 ] AdvIPScan (20M)      [ 70 ] 1Pass (100M)
echo   [ 2 ] WinRAR (6M)     [ 23 ] ServiceMan (x64)  [ 51 ] Dropbox (288M)       [ 71 ] Avast (Onln)
echo  -------------------    [ 24 ] UpdBlocker        [ 52 ] G-Drive (251M)       [ 72 ] Bitwarden (80M)
echo   System Optimising     [ 25 ] WinTools(2M)      [ 53 ] IDM (12M)            [ 73 ] GlaryUtil (20M)
echo  -------------------   -------------------       [ 54 ] MegaSync (70M)       [ 74 ] Malwarebyte (3M)
echo  [ 10 ] AIDA64 (59M)          Browsers           [ 55 ] Nmap (35M)           [ 75 ] PrivaZer (33M)
echo  [ 11 ] Cleanr (81M)   --------------------      [ 56 ] PuTTY (3M)           -----------------------
echo  [ 12 ] DefControl     [ 30 ] Brave (224M)       [ 57 ] Wireshark (92M)
echo  [ 13 ] DrivBoost (32M)[ 31 ] CentBrws (109M)    ----------------------
echo  [ 14 ] HideUinst (x64)[ 32 ] Chrome (148M)           Chat                    ------------------
echo  [ 15 ] Netprofile(x64)[ 33 ] Edge (195M)       --------------------           [More on page 2]
echo  [ 16 ] NewTime (x64)  [ 155 ] Firefox Setup     [ 60 ] Discord(102M)         ------------------
echo  [ 17 ] Optimizer      [ 156 ] LibreWolf Zip     [ 61 ] Telegram(52M)
echo  [ 18 ] PowerTys(259M) [ 157 ] Vivaldi Setup     ---------------------
echo  [ 19 ] Recuva (8M)    --------------------             Gaming
echo  [ 20 ] RegConvert     --------------------      ------------------
echo  [ 21 ] Revo (16M)     [ 40 ] CPU-Z (2M)         [ 65 ] Steam (45M)
echo  --------------------  [ 41 ] EZTools (77M)      ------------------
goto :MenuFooter

:: ============================================
:: MAIN MENU (PAGE 2)
:: ============================================
:MenuPage2
mode con:cols=106 lines=28
set "Page=2"
set "uinput=" & set "sel=" & cls & color %StateCol%
echo ==========================================================================================================
echo     		**Morphs Creations** DEPLOYMENT CONSOLE v4.52 (Page 2/5)
echo ==========================================================================================================
echo   Remote / Utilities             Media                   Disk Tools
echo -----------------------   --------------------      -----------------------
echo [ 85 ] AnyDesk (6M)       [ 101 ] Handbrake(113M)   [ 120 ] AnyBurn (7M)
echo [ 86 ] EasyCtx (3M)       [ 102 ] OBS (130M)        [ 121 ] ImgBurn (8M)
echo [ 87 ] Lacey Dwnld(79M)   [ 103 ] oCam (15M)        [ 123 ] Rufus (6M)
echo [ 88 ] PatchMyPC (61M)    [ 104 ] PotPlay (55M)     [ 124 ] Ventoy (16M)
echo [ 89 ] UltraViewer (6M)   [ 105 ] Shotcut (113M)    [ 125 ] Chocolatey(ps1)
echo -----------------------   [ 106 ] Spotify (2M)      [ 131 ] Everyth (2M)
echo          Docs             [ 107 ] VLC (44M)         [ 132 ] HardDisk Senti
echo -----------------------   [ 108 ] Winamp (5M)       [ 133 ] WinToHDD (37M)
echo [ 90 ] FormatFact (90M)   --------------------      [ 134 ] ImageViewer(1M)
echo [ 91 ] Git (62M)                                    [ 135 ] WinToUSB (61M)
echo [ 92 ] Notepad++ (7M)     Deployment Runtimes       [ 136 ] WizTree (5M)
echo [ 93 ] Notepad3 (4M)      --------------------      -----------------------
echo [ 94 ] Python (30M)       [ 140 ] AIR (10M)                                   ------------------
echo [ 95 ] qBit (41M)         [ 141 ] DirectX (96M)                                [More on page 3]
echo [ 96 ] Sumatra (11M)      [ 142 ] Java8-32 (65M)                               ------------------
echo [ 97 ] VSCode (351M)      [ 143 ] Java8-64 (69M)
echo [ 98 ] WinMerge (37M)     [ 144 ] PhysX (28M)
echo -----------------------   [ 145 ] OpenAL (1M)
echo                           [ 146 ] VC++ AIO (31M)
echo                           [ 147 ] XNA (6M)
echo                           [ 294 ] VC++ 15-22 x64
echo                           --------------------
goto :MenuFooter

:: ============================================
:: MAIN MENU (PAGE 3) - EXTENDED TOOLS 1
:: ============================================
:MenuPage3
mode con:cols=106 lines=28
set "Page=3"
set "uinput=" & set "sel=" & cls & color %StateCol%
echo ==========================================================================================================
echo     		**Morphs Creations** DEPLOYMENT CONSOLE v4.52 (Page 3/5)
echo ==========================================================================================================
echo   Extended Security           Extended Maintenance      Extended Diagnostics
echo -----------------------   -------------------------    -----------------------
echo [ 150 ] AdwCleaner        [ 158 ] Autoruns (Zip)       [ 164 ] Core Temp Setup
echo [ 151 ] KeePassXC (Zip)   [ 159 ] BCUninstaller        [ 169 ] MemTest86 (Zip)
echo [ 153 ] RogueKiller x64   [ 160 ] BleachBit (Zip)      [ 240 ] Speccy Setup
echo [ 154 ] Simplewall Setup  [ 225 ] HiBit Uninstaller    -----------------------
echo -----------------------   -------------------------
echo                                                          Extended Cloud ^& Net
echo                                                        -----------------------
echo                                                        [ 190 ] Kopia (Zip)
echo                                                        [ 191 ] Rclone (Zip)
echo                                                        [ 192 ] Syncthing (Zip)
echo                                                        [ 200 ] WinSCP (Zip)
echo                                                        [ 201 ] WireGuard Setup   ------------------
echo                                                        [ 230 ] Nextcloud Client  [More on page 4]
echo                                                        [ 234 ] Tailscale Setup   ------------------
echo                                                        -----------------------
goto :MenuFooter

:: ============================================
:: MAIN MENU (PAGE 4) - EXTENDED TOOLS 2
:: ============================================
:MenuPage4
mode con:cols=106 lines=28
set "Page=4"
set "uinput=" & set "sel=" & cls & color %StateCol%
echo ==========================================================================================================
echo     		**Morphs Creations** DEPLOYMENT CONSOLE v4.52 (Page 4/5)
echo ==========================================================================================================
echo     Extended Dev           Extended Media ^& Audio       Remote, Comm ^& Gaming
echo -----------------------   -------------------------    -----------------------
echo [ 193 ] DBeaver (Zip)     [ 174 ] ShareX Setup         [ 177 ] RustDesk x64
echo [ 195 ] Sublime Text      [ 180 ] Audacity (Zip)       [ 178 ] TeamViewer QS
echo [ 196 ] VSCodium (Zip)    [ 181 ] Foobar2000           [ 179 ] Zoom (Installer)
echo [ 197 ] Win Terminal      [ 182 ] GIMP (Setup)         [ 202 ] Epic Games Store
echo -----------------------   [ 183 ] ImageGlass           [ 203 ] GOG Galaxy
echo   Office ^& Document       [ 185 ] Krita (Setup)        [ 204 ] Playnite Portable
echo -----------------------   [ 186 ] LosslessCut 7z       [ 287 ] Sunshine Server
echo [ 205 ] Calibre (Zip)     [ 187 ] MKVToolNix           -----------------------
echo [ 207 ] PDF24 Creator     [ 189 ] yt-dlp (CLI)
echo -----------------------   [ 274 ] ScreenToGif
echo                           -------------------------      ISO ^& Disk Utilities   ------------------
echo                                                        -----------------------  [More on page 5]
echo                                                        [ 171 ] BulkRenameUtil   ------------------
echo                                                        [ 172 ] dupeGuru (Setup)
echo                                                        [ 173 ] FastCopy (Zip)
echo                                                        [ 175 ] TestDisk/PhotoRec
echo                                                        [ 176 ] TreeSize Free
echo                                                        [ 261 ] UNetbootin
echo                                                        -----------------------
goto :MenuFooter

:: ============================================
:: MAIN MENU (PAGE 5) - REGISTRY & SYSTEM MAINTENANCE
:: ============================================
:MenuPage5
mode con:cols=106 lines=31
set "Page=5"
set "uinput=" & set "sel=" & cls & color %StateCol%
echo ==========================================================================================================
echo     			**Morphs Creations** DEPLOYMENT CONSOLE v4.52 (Page 5/5)
echo ==========================================================================================================
echo                                       Registry Integration Suite
echo ==========================================================================================================
echo   		Context Menu Additions (ENABLE)             Context Menu Removal (DISABLE)
echo  	       ----------------------------------         ----------------------------------
echo  		[ 600 ] Enable Control Panel Desktop Menu  [ 610 ] Disable Control Panel Desktop Menu
echo  		[ 601 ] Enable Personalize Classic         [ 611 ] Disable Personalize Classic
echo  		[ 602 ] Enable Restart Explorer            [ 612 ] Disable Restart Explorer
echo  		[ 603 ] Enable System Shortcuts            [ 613 ] Disable System Shortcuts
echo  		[ 604 ] Enable System Tools                [ 614 ] Disable System Tools
echo  		[ 605 ] Enable Take Ownership              [ 615 ] Disable Take Ownership
echo.
echo                               [ 618 ] CLEANUP: Reset Desktop Context Menu
echo.
echo ==========================================================================================================
echo                                  System Maintenance ^& OS Optimizations
echo ==========================================================================================================
echo.
echo                [ 620 ] Safe WinSxS Purge                  [ 621 ] Toggle Hibernate
echo                [ 622 ] Compact OS                         [ 623 ] Query Resrv Storage
echo                                   [ 624 ] Disable Resrv Storage
echo.
echo ==========================================================================================================
echo                             Note: These changes take effect immediately.
echo ==========================================================================================================
goto :MenuFooter

:: ============================================
:: FOOTER & QUEUE
:: ============================================
:MenuFooter
echo ==========================================================================================================
echo           [ 0 ] Exit  [ N ] Next Page  [ B ] Back Page  [ S ] Save Profile  [ L ] Load Profile
echo ==========================================================================================================
set /p "uinput=Selection: "
if not defined uinput goto RefreshPage
if "%uinput%"=="0" exit /b
if /I "%uinput%"=="N" goto NavNext
if /I "%uinput%"=="B" goto NavBack
if /I "%uinput%"=="S" (set /p "cq=Enter IDs: " & echo !cq! > "%F_Dir%\Profile.txt" & goto RefreshPage)
if /I "%uinput%"=="L" (if exist "%F_Dir%\Profile.txt" (set /p sel=<"%F_Dir%\Profile.txt" & goto PrepQueue) else (goto RefreshPage))

:: SANITIZE INPUT (Remove commas & clean multi-tokens)
set "uinput=!uinput:,= !"

:: RANGE EXPANSION ENGINE (Expands inputs like "1-207" or "600-624")
set "sel="
for %%t in (!uinput!) do (
    set "item=%%t"
    echo !item!| findstr /r "^[0-9][0-9]*-[0-9][0-9]*$" >nul 2>&1
    if !errorlevel! EQU 0 (
        for /f "tokens=1,2 delims=-" %%x in ("!item!") do (
            set "rStart=%%x"
            set "rEnd=%%y"
            if !rStart! LSS !rEnd! (
                for /l %%i in (!rStart!,1,!rEnd!) do set "sel=!sel! %%i"
            ) else (
                for /l %%i in (!rStart!,-1,!rEnd!) do set "sel=!sel! %%i"
            )
        )
    ) else (
        set "sel=!sel! !item!"
    )
)
goto PrepQueue

:NavNext
if "%Page%"=="1" goto MenuPage2
if "%Page%"=="2" goto MenuPage3
if "%Page%"=="3" goto MenuPage4
if "%Page%"=="4" goto MenuPage5
if "%Page%"=="5" goto MainMenu
goto MainMenu

:NavBack
if "%Page%"=="1" goto MenuPage5
if "%Page%"=="2" goto MainMenu
if "%Page%"=="3" goto MenuPage2
if "%Page%"=="4" goto MenuPage3
if "%Page%"=="5" goto MenuPage4
goto MainMenu

:PrepQueue
set "TotalItems=0" & for %%a in (%sel%) do set /a "TotalItems+=1"
set "CurrentIndex=0"
:ProcessQueue
set /a "CurrentIndex+=1"
for /f "tokens=1*" %%a in ("!sel!") do (set "cid=%%a" & set "sel=%%b")
for /f "tokens=* delims= " %%a in ("!cid!") do set "cid=%%a"
if not defined cid goto RefreshPage
cls & echo ==========================================================
echo  PROCESSING: [!CurrentIndex!/!TotalItems!] - ID: %cid%
echo ==========================================================
findstr /i /b /c:":Opt_%cid% " "%~f0" >nul 2>&1
if !errorlevel! EQU 0 (goto Opt_%cid% ) else (echo [-] ID [%cid%] missing. & timeout /t 1 >nul & goto QueueRelay)

:QueueRelay
if defined sel goto :ProcessQueue
echo. & echo [+] Queue complete. & timeout /t 2 >nul
goto RefreshPage

:RefreshPage
if "%Page%"=="1" goto MainMenu
if "%Page%"=="2" goto MenuPage2
if "%Page%"=="3" goto MenuPage3
if "%Page%"=="4" goto MenuPage4
if "%Page%"=="5" goto MenuPage5
goto MainMenu

:: ============================================
:: REGISTRY SUBROUTINES
:: ============================================
:ApplyReg
set "rFile=%~1"
set "rUrl=https://raw.githubusercontent.com/Morph699/Morphs-Toolbox/main/Regfiles/%rFile%"
echo [SYNC] Downloading Registry Tweak: %rFile%
curl -L -k -f --retry 3 -o "%R_Dir%\%rFile%" "%rUrl%" >nul 2>&1
if exist "%R_Dir%\%rFile%" (reg import "%R_Dir%\%rFile%" >nul & echo [OK] Applied.)
timeout /t 1 >nul & goto QueueRelay

:Opt_618 
echo [CLEANUP] Resetting Desktop Context Menu...
for %%k in ("ControlPanel" "Personalization" "Restart Explorer" "SystemShortcuts" "SystemTools" "Control Panel" "PersonalizeClassic" "RestartExplorer" "Shortcuts" "Tools") do (
    reg delete "HKCR\DesktopBackground\Shell\%%~k" /f >nul 2>&1
)
echo [+] Cleanup Done.
timeout /t 2 >nul
goto QueueRelay

:Opt_600 
call :ApplyReg "Enable_CP Desktop Context Menu.reg"
goto QueueRelay
:Opt_601 
call :ApplyReg "Enable_Personalize Classic.reg"
goto QueueRelay
:Opt_602 
call :ApplyReg "Enable_Restart_Explorer_to_desktop_context_menu.reg"
goto QueueRelay
:Opt_603 
call :ApplyReg "Enable_SystemShortcuts.reg"
goto QueueRelay
:Opt_604 
call :ApplyReg "Enable_SystemTools.reg"
goto QueueRelay
:Opt_605 
call :ApplyReg "Enable_Take Ownership to Context menu.reg"
goto QueueRelay
:Opt_610 
call :ApplyReg "Remove CP Desktop Context Menu.reg"
goto QueueRelay
:Opt_611 
call :ApplyReg "Remove Personalize Classic.reg"
goto QueueRelay
:Opt_612 
call :ApplyReg "Remove_Restart_Explorer_from_desktop_context_menu.reg"
goto QueueRelay
:Opt_613 
call :ApplyReg "Remove_SystemShortcuts.reg"
goto QueueRelay
:Opt_614 
call :ApplyReg "Remove_SystemTools.reg"
goto QueueRelay
:Opt_615 
call :ApplyReg "Remove_Take Ownership from Context Menu (Default).reg"
goto QueueRelay

:: ============================================
:: DOWNLOAD & SYSTEM SUBROUTINES (CONFIRMED WORKING SET)
:: ============================================
:Opt_1 
call :DirectDL "https://github.com/ip7z/7zip/releases/download/26.02/7z2602-x64.exe" "%P_Dir%\7z2602-x64.exe"
goto QueueRelay

:Opt_2 
call :DirectDL "https://www.win-rar.com/fileadmin/winrar-versions/winrar/winrar-x64-723.exe" "%P_Dir%\winrar-x64-723.exe"
goto QueueRelay

:Opt_10 
call :DirectDL "https://download2.aida64.com/aida64extreme830.exe" "%T_Dir%\AIDA64_Extreme.exe"
goto QueueRelay

:Opt_11 
call :DirectDL "https://download.ccleaner.com/ccsetup625.exe" "%P_Dir%\CCleaner_v6.exe"
goto QueueRelay

:Opt_12 
call :DirectDL "https://raw.githubusercontent.com/Morph699/Morphs-Toolbox/main/Programs/dControl.exe" "%T_Dir%\dControl.exe"
if exist "%T_Dir%\dControl.exe" start "" "%T_Dir%\dControl.exe"
goto QueueRelay

:Opt_13 
call :DirectDL "https://www.iobit.com/downloadcenter.php?product=driver-booster" "%P_Dir%\Driver_Booster_Setup.exe"
goto QueueRelay

:Opt_14 
call :DirectDL "https://raw.githubusercontent.com/Morph699/Morphs-Toolbox/main/Programs/HideUL_x64.exe" "%T_Dir%\HideUL_x64.exe"
goto QueueRelay

:Opt_15 
call :DirectDL "https://raw.githubusercontent.com/Morph699/Morphs-Toolbox/main/Programs/NetPnc_x64.exe" "%T_Dir%\NetPnc_x64.exe"
goto QueueRelay

:Opt_16 
call :DirectDL "https://raw.githubusercontent.com/Morph699/Morphs-Toolbox/main/Programs/NewFileTime_x64.exe" "%T_Dir%\NewFileTime_x64.exe"
goto QueueRelay

:Opt_17 
call :DirectDL "https://raw.githubusercontent.com/Morph699/Morphs-Toolbox/main/Programs/Optimizer.exe" "%T_Dir%\Optimizer.exe"
goto QueueRelay

:Opt_18 
call :DirectDL "https://github.com/microsoft/PowerToys/releases/download/v0.84.0/PowerToysUserSetup-0.84.0-x64.exe" "%P_Dir%\PowerToys_Setup.exe"
goto QueueRelay

:Opt_19 
call :DirectDL "https://download.ccleaner.com/rcsetup155.exe" "%P_Dir%\Recuva_Setup.exe"
goto QueueRelay

:Opt_20 
call :DirectDL "https://raw.githubusercontent.com/Morph699/Morphs-Toolbox/main/Programs/RegConvert.exe" "%T_Dir%\RegConvert.exe"
goto QueueRelay

:Opt_21 
call :DirectDL "https://revouninstaller.b-cdn.net/ruf270/RevoUninstaller_Portable.zip" "%T_Dir%\Revo_Portable.zip"
goto QueueRelay

:Opt_22 
call :DirectDL "http://www.drivesnapshot.de/download/snapshot64.exe" "%T_Dir%\DriveSnapshot_x64.exe"
goto QueueRelay

:Opt_23 
call :DirectDL "https://raw.githubusercontent.com/Morph699/Morphs-Toolbox/main/Programs/srvman.exe" "%T_Dir%\srvman.exe"
goto QueueRelay

:Opt_24 
call :DirectDL "https://raw.githubusercontent.com/Morph699/Morphs-Toolbox/main/Programs/Wub_x64.exe" "%T_Dir%\Wub_x64.exe"
if exist "%T_Dir%\Wub_x64.exe" start "" "%T_Dir%\Wub_x64.exe"
goto QueueRelay

:Opt_25 
call :DirectDL "https://www.wintools.net/wintools.zip" "%T_Dir%\WinTools_Premium.zip"
goto QueueRelay

:Opt_30 
call :DirectDL "https://github.com/brave/brave-browser/releases/download/v1.92.139/brave-v1.92.139-win32-x64.zip" "%P_Dir%\Brave_Portable_x64.zip"
goto QueueRelay

:Opt_31 
call :DirectDL "https://static.centbrowser.com/win_stable/5.2.1168.83/centbrowser_5.2.1168.83_x64.exe" "%P_Dir%\CentBrowser_Setup.exe"
goto QueueRelay

:Opt_32 
call :DirectDL "https://dl.google.com/chrome/install/ChromeStandaloneSetup64.exe" "%P_Dir%\Chrome_Setup.exe"
goto QueueRelay

:Opt_33 
call :DirectDL "https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/0870b5f5-cf08-4f24-8383-f362a669fcd8/MicrosoftEdgeEnterpriseX64.msi" "%P_Dir%\Edge_Enterprise_x64.msi"
goto QueueRelay

:Opt_40 
call :DirectDL "https://download.cpuid.com/cpu-z/cpu-z_2.10-en.zip" "%T_Dir%\CPU-Z_Portable.zip"
goto QueueRelay

:Opt_41 
call :DirectDL "https://www.mediafire.com/file_premium/xt9r3l0v6ed4f0y/EZTools-R1122.3.5.1%28IN%29.zip/file" "%T_Dir%\EZTools_Forensic.zip"
goto QueueRelay

:Opt_50 
call :DirectDL "https://download.advanced-ip-scanner.com/download/files/Advanced_IP_Scanner_2.5.4594.1.exe" "%P_Dir%\Advanced_IP_Scanner.exe"
goto QueueRelay

:Opt_51 
call :DirectDL "https://www.dropbox.com/download?full=1&plat=win" "%P_Dir%\Dropbox_Setup.exe"
goto QueueRelay

:Opt_52 
call :DirectDL "https://dl.google.com/drive-file-stream/GoogleDriveSetup.exe" "%P_Dir%\GoogleDrive_Setup.exe"
goto QueueRelay

:Opt_53 
call :DirectDL "https://download.internetdownloadmanager.com/idman643build5.exe" "%P_Dir%\IDM_Setup.exe"
goto QueueRelay

:Opt_54 
call :DirectDL "https://mega.nz/MEGAsyncSetup.exe" "%P_Dir%\MegaSync_Setup.exe"
goto QueueRelay

:Opt_55 
call :DirectDL "https://nmap.org/dist/nmap-7.99-setup.exe" "%P_Dir%\Nmap_Setup.exe"
goto QueueRelay

:Opt_56 
call :DirectDL "https://the.earth.li/~sgtatham/putty/latest/w64/putty-64bit-0.84-installer.msi" "%P_Dir%\PuTTY_Setup.msi"
goto QueueRelay

:Opt_57 
call :DirectDL "https://www.wireshark.org/download/win64/Wireshark-latest-x64.exe" "%P_Dir%\Wireshark_Setup.exe"
goto QueueRelay

:Opt_60 
call :DirectDL "https://discord.com/api/download?platform=win" "%P_Dir%\Discord_Setup.exe"
goto QueueRelay

:Opt_61 
call :DirectDL "https://github.com/telegramdesktop/tdesktop/releases/download/v7.0.1/tsetup-x64.7.0.1.exe" "%P_Dir%\Telegram_Setup.exe"
goto QueueRelay

:Opt_65 
call :DirectDL "https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe" "%P_Dir%\Steam_Setup.exe"
goto QueueRelay

:Opt_70 
call :DirectDL "https://c.1password.com/dist/1P/win8/1PasswordSetup-latest.msixbundle" "%P_Dir%\1Password_Setup.msixbundle"
goto QueueRelay

:Opt_71 
call :DirectDL "https://bits.avcdn.net/productfamily_ANTIVIRUS/insttype_FREE/platform_WIN/installertype_ONLINE/build_RELEASE" "%P_Dir%\Avast_Free_Online.exe"
goto QueueRelay

:Opt_72 
call :DirectDL "https://bitwarden.com/download/?app=desktop&platform=windows&variant=exe" "%P_Dir%\Bitwarden_Setup.exe"
goto QueueRelay

:Opt_73 
call :DirectDL "https://www.glarysoft.com/aff/download2.php?s=GU" "%P_Dir%\GlaryUtilities_Setup.exe"
goto QueueRelay

:Opt_74 
call :DirectDL "https://downloads.malwarebytes.com/file/mb-windows?filename=MBSetup-3.3.exe" "%P_Dir%\Malwarebytes_Setup.exe"
goto QueueRelay

:Opt_75 
call :DirectDL "https://privazer.com/en/PrivaZer.exe" "%P_Dir%\PrivaZer.exe"
goto QueueRelay

:Opt_85 
call :DirectDL "https://download.anydesk.com/AnyDesk.exe" "%T_Dir%\AnyDesk.exe"
goto QueueRelay

:Opt_86 
call :DirectDL "https://www.sordum.org/files/downloads.php?easy-context-menu" "%T_Dir%\EasyContextMenu.zip"
goto QueueRelay

:Opt_87 
call :DirectDL "https://www.the-sz.com/common/get.php?product=lacey" "%T_Dir%\Lacey_Downloader.zip"
goto QueueRelay

:Opt_88 
call :DirectDL "https://homeupdater.patchmypc.com/public/PatchMyPC-HomeUpdater-Portable.exe" "%T_Dir%\PatchMyPC_Portable.exe"
goto QueueRelay

:Opt_89 
call :DirectDL "https://www.ultraviewer.net/en/UltraViewer_setup_6.6_en.exe" "%P_Dir%\UltraViewer_Setup.exe"
goto QueueRelay

:Opt_90 
call :DirectDL "https://dw.ezbsystems.com/uiso9_pe.exe" "%P_Dir%\FormatFactory_Setup.exe"
goto QueueRelay

:Opt_91 
call :DirectDL "https://github.com/git-for-windows/git/releases/download/v2.55.0.windows.3/Git-2.55.0.3-64-bit.exe" "%P_Dir%\Git_Setup.exe"
goto QueueRelay

:Opt_92 
call :DirectDL "https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.9.7/npp.8.9.7.portable.x64.7z" "%P_Dir%\NotepadPP_Portable.7z"
goto QueueRelay

:Opt_93 
call :DirectDL "https://github.com/rizonesoft/Notepad3/releases/download/RELEASE_7.26.602.1/Notepad3_7.26.602.1_x64_Portable.zip" "%P_Dir%\Notepad3.zip"
goto QueueRelay

:Opt_94 
call :DirectDL "https://www.python.org/ftp/python/3.14.6/python-3.14.6-amd64.exe" "%P_Dir%\Python_3.14.exe"
goto QueueRelay

:Opt_95 
call :DirectDL "https://github.com/qbittorrent/qBittorrent/releases/download/release-5.2.3/qbittorrent_5.2.3_x64_setup.exe" "%P_Dir%\qBittorrent.exe"
goto QueueRelay

:Opt_96 
call :DirectDL "https://www.sumatrapdfreader.org/dl/rel/3.6.1/SumatraPDF-3.6.1-64.zip" "%P_Dir%\SumatraPDF.zip"
goto QueueRelay

:Opt_97 
call :DirectDL "https://update.code.visualstudio.com/latest/win32-x64-archive/stable" "%P_Dir%\VSCode_x64.zip"
goto QueueRelay

:Opt_98 
call :DirectDL "https://github.com/WinMerge/winmerge/releases/download/v2.16.58/winmerge-2.16.58-x64-exe.zip" "%P_Dir%\WinMerge_Setup.zip"
goto QueueRelay

:Opt_101 
call :DirectDL "https://github.com/HandBrake/HandBrake/releases/download/1.8.2/HandBrake-1.8.2-x86_64-Win_GUI.exe" "%P_Dir%\Handbrake_Portable.exe"
goto QueueRelay

:Opt_102 
call :DirectDL "https://github.com/obsproject/obs-studio/releases/download/32.2.1/OBS-Studio-32.2.1-Windows-x64-Installer.exe" "%P_Dir%\OBS_Setup.exe"
goto QueueRelay

:Opt_103 
call :DirectDL "https://raw.githubusercontent.com/ohsoft/archive/master/ocam/2023121501/oCam_v550.0.exe" "%T_Dir%\oCam_Setup.exe"
goto QueueRelay

:Opt_104 
call :DirectDL "https://t1.kakaocdn.net/potplayer/PotPlayer/Version/Latest/PotPlayerSetup64.exe" "%P_Dir%\PotPlayerSetup64.exe"
goto QueueRelay

:Opt_105 
call :DirectDL "https://github.com/mltframework/shotcut/releases/download/v24.06.26/shotcut-win64-240626.exe" "%P_Dir%\Shotcut_Portable.exe"
goto QueueRelay

:Opt_106 
call :DirectDL "https://download.scdn.co/SpotifySetup.exe" "%P_Dir%\Spotify_Setup.exe"
goto QueueRelay

:Opt_107 
call :DirectDL "https://mirror.aptus.co.tz/pub/videolan/vlc/3.0.23/win64/vlc-3.0.23-win64.exe" "%P_Dir%\VLC_x64.exe"
goto QueueRelay

:Opt_108 
call :DirectDL "http://download.nullsoft.com/winamp/client/winamp_latest_full.exe" "%P_Dir%\Winamp_Setup.exe"
goto QueueRelay

:Opt_120 
call :DirectDL "https://www.anyburn.com/anyburn_setup.exe" "%P_Dir%\AnyBurn_Setup.exe"
goto QueueRelay

:Opt_121 
call :DirectDL "https://download.imgburn.com/SetupImgBurn_2.5.8.0.exe" "%P_Dir%\ImgBurn_Setup.exe"
goto QueueRelay

:Opt_123 
call :DirectDL "https://github.com/pbatard/rufus/releases/download/v4.15/rufus-4.15p.exe" "%T_Dir%\Rufus_4.15.exe"
goto QueueRelay

:Opt_124 
call :DirectDL "https://github.com/ventoy/Ventoy/releases/download/v1.1.16/ventoy-1.1.16-windows.zip" "%T_Dir%\Ventoy_x64.zip"
goto QueueRelay

:Opt_125 
call :DirectDL "https://community.chocolatey.org/install.ps1" "%T_Dir%\Choco_Install.ps1"
goto QueueRelay

:Opt_131 
call :DirectDL "https://www.voidtools.com/Everything-1.4.1.1032.x64.zip" "%T_Dir%\Everything_x64.zip"
goto QueueRelay

:Opt_132 
call :DirectDL "https://www.harddisksentinel.com/hdsentinel_setup.zip" "%T_Dir%\HardDiskSentinel.zip"
goto QueueRelay

:Opt_133 
call :DirectDL "https://www.easyuefi.com/wintohdd/downloads/WinToHDD_Free.exe" "%T_Dir%\WinToHDD_Free.exe"
goto QueueRelay

:Opt_134 
call :DirectDL "https://github.com/deminimis/minimalimageviewer/releases/download/v2.0.3/MinimalImageViewer.exe" "%T_Dir%\NativeImageViewer.exe"
goto QueueRelay

:Opt_135 
call :DirectDL "https://www.easyuefi.com/wintousb/downloads/WinToUSB_Free.exe" "%T_Dir%\WinToUSB_Free.exe"
goto QueueRelay

:Opt_136 
call :DirectDL "https://diskanalyzer.com/files/wiztree_4_23_portable.zip" "%T_Dir%\WizTree_Portable.zip"
goto QueueRelay

:Opt_140 
call :DirectDL "https://airsdk.harman.com/assets/downloads/51.3.3.1/AdobeAIR.exe" "%F_Dir%\AdobeAIR.exe"
goto QueueRelay

:Opt_141 
call :DirectDL "https://download.microsoft.com/download/8/4/a/84a35bf1-dafe-4ae8-82af-ad2ae20b6b14/directx_Jun2010_redist.exe" "%F_Dir%\DirectX_Jun2010.exe"
goto QueueRelay

:Opt_142 
call :DirectDL "https://javadl.oracle.com/webapps/download/AutoDL?BundleId=253194_f7fe8e644f724108bdb54139381e29a7" "%F_Dir%\Java8_x32.exe"
goto QueueRelay

:Opt_143 
call :DirectDL "https://javadl.oracle.com/webapps/download/AutoDL?BundleId=253195_f7fe8e644f724108bdb54139381e29a7" "%F_Dir%\Java8_x64.exe"
goto QueueRelay

:Opt_144 
call :DirectDL "https://us.download.nvidia.com/Windows/9.13.0604/PhysX-9.13.0604-SystemSoftware-Legacy.msi" "%F_Dir%\PhysX_Legacy.msi"
goto QueueRelay

:Opt_145 
call :DirectDL "https://www.openal.org/downloads/oalinst.zip" "%F_Dir%\OpenAL_Runtime.zip"
goto QueueRelay

:Opt_146 
call :DirectDL "https://www.tinyplease.com/vcpp" "%F_Dir%\VC_Redist_AIO.exe"
goto QueueRelay

:Opt_147 
call :DirectDL "https://download.microsoft.com/download/a/c/2/ac2c903b-e6e8-42c2-9fd7-bebac362a930/xnafx40_redist.msi" "%F_Dir%\XNA_Framework_4.0.msi"
goto QueueRelay

:Opt_150 
call :DirectDL "https://downloads.malwarebytes.com/file/adwcleaner" "%T_Dir%\AdwCleaner.exe"
goto QueueRelay

:Opt_151 
call :DirectDL "https://github.com/keepassxreboot/keepassxc/releases/download/2.7.9/KeePassXC-2.7.9-Win64.zip" "%T_Dir%\KeePassXC_Portable.zip"
goto QueueRelay

:Opt_153 
call :DirectDL "https://download.adlice.com/RogueKiller/RogueKillerX64.exe" "%T_Dir%\RogueKiller_x64.exe" "https://www.adlice.com/software/roguekiller/"
goto QueueRelay

:Opt_154 
call :DirectDL "https://github.com/henrypp/simplewall/releases/download/v.3.8.7/simplewall-3.8.7-setup.exe" "%T_Dir%\Simplewall_Setup.exe"
goto QueueRelay

:Opt_155 
call :DirectDL "https://download-installer.cdn.mozilla.net/pub/firefox/releases/135.0/win64/en-US/Firefox%20Setup%20135.0.exe" "%P_Dir%\Firefox_Setup.exe"
goto QueueRelay

:Opt_156 
call :DirectDL "https://gitlab.com/api/v4/projects/44042130/packages/generic/librewolf/135.0-1/librewolf-135.0-1-windows-x86_64-portable.zip" "%P_Dir%\LibreWolf_Portable.zip"
goto QueueRelay

:Opt_157 
call :DirectDL "https://downloads.vivaldi.com/stable/Vivaldi.7.1.3570.50.x64.exe" "%P_Dir%\Vivaldi_Setup.exe"
goto QueueRelay

:Opt_158 
call :DirectDL "https://download.sysinternals.com/files/Autoruns.zip" "%T_Dir%\Autoruns_Portable.zip"
goto QueueRelay

:Opt_159 
call :DirectDL "https://github.com/Klocman/Bulk-Crap-Uninstaller/releases/download/v5.8.1/BCUninstaller_5.8.1_portable.zip" "%T_Dir%\BCUninstaller_Portable.zip"
goto QueueRelay

:Opt_160 
call :DirectDL "https://download.bleachbit.org/BleachBit-4.6.2-portable.zip" "%T_Dir%\BleachBit_Portable.zip"
goto QueueRelay

:Opt_162 
call :DirectDL "https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe" "%T_Dir%\OOSU10.exe"
goto QueueRelay

:Opt_163 
call :DirectDL "https://download.sysinternals.com/files/ProcessExplorer.zip" "%T_Dir%\ProcessExplorer.zip"
goto QueueRelay

:Opt_164 
call :DirectDL "https://www.alcpu.com/CoreTemp/Core-Temp-setup.exe" "%T_Dir%\CoreTemp_Setup.exe"
goto QueueRelay

:Opt_169 
call :DirectDL "https://www.memtest86.com/downloads/memtest86-usb.zip" "%T_Dir%\MemTest86.zip"
goto QueueRelay

:Opt_171 
call :DirectDL "https://www.bulkrenameutility.co.uk/Downloads/BRU_NoInstall.zip" "%T_Dir%\BulkRenameUtility.zip"
goto QueueRelay

:Opt_172 
call :DirectDL "https://github.com/arsenetar/dupeguru/releases/download/4.3.1/dupeGuru_win64_4.3.1.exe" "%T_Dir%\dupeGuru_Setup.exe"
goto QueueRelay

:Opt_173 
call :DirectDL "https://fastcopy.jp/archive/FastCopy5.11.3_x64.zip" "%T_Dir%\FastCopy_Portable.zip" "https://fastcopy.jp/"
goto QueueRelay

:Opt_174 
call :DirectDL "https://github.com/ShareX/ShareX/releases/download/v17.0.0/ShareX-17.0.0-setup.exe" "%P_Dir%\ShareX_Setup.exe"
goto QueueRelay

:Opt_175 
call :DirectDL "https://www.cgsecurity.org/testdisk-7.2.win64.zip" "%T_Dir%\TestDisk_Portable.zip"
goto QueueRelay

:Opt_176 
call :DirectDL "https://downloads.jam-software.de/treesize_free/TreeSizeFree-Portable.zip" "%T_Dir%\TreeSizeFree_Portable.zip"
goto QueueRelay

:Opt_177 
call :DirectDL "https://github.com/rustdesk/rustdesk/releases/download/1.3.8/rustdesk-1.3.8-x86_64.exe" "%T_Dir%\RustDesk.exe"
goto QueueRelay

:Opt_178 
call :DirectDL "https://download.teamviewer.com/download/TeamViewerQS.exe" "%T_Dir%\TeamViewerQS.exe"
goto QueueRelay

:Opt_179 
call :DirectDL "https://zoom.us/client/latest/ZoomInstallerFull.exe" "%P_Dir%\Zoom_Setup.exe"
goto QueueRelay

:Opt_180 
call :DirectDL "https://github.com/audacity/audacity/releases/download/Audacity-3.7.1/audacity-win-3.7.1-64bit.zip" "%P_Dir%\Audacity_Portable.zip"
goto QueueRelay

:Opt_181 
call :DirectDL "https://www.foobar2000.org/files/foobar2000-x64_v2.24.exe" "%P_Dir%\Foobar2000_Setup.exe"
goto QueueRelay

:Opt_182 
call :DirectDL "https://download.gimp.org/gimp/v2.10/windows/gimp-2.10.38-setup.exe" "%P_Dir%\GIMP_Setup.exe"
goto QueueRelay

:Opt_183 
call :DirectDL "https://github.com/d2phap/ImageGlass/releases/download/9.4.1.15/ImageGlass_9.4.1.15_x64.zip" "%T_Dir%\ImageGlass_Portable.zip"
goto QueueRelay

:Opt_185 
call :DirectDL "https://download.kde.org/stable/krita/5.2.6/krita-x64-5.2.6-setup.exe" "%P_Dir%\Krita_Setup.exe"
goto QueueRelay

:Opt_186 
call :DirectDL "https://github.com/mifi/lossless-cut/releases/download/v3.62.0/LosslessCut-win-x64.7z" "%T_Dir%\LosslessCut_Portable.7z"
goto QueueRelay

:Opt_187 
call :DirectDL "https://mkvtoolnix.download/windows/releases/89.0/mkvtoolnix-64-bit-89.0.7z" "%P_Dir%\MKVToolNix_Portable.7z"
goto QueueRelay

:Opt_189 
call :DirectDL "https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe" "%T_Dir%\yt-dlp.exe"
goto QueueRelay

:Opt_190 
call :DirectDL "https://github.com/kopia/kopia/releases/download/v0.18.2/kopia-0.18.2-windows-x64.zip" "%T_Dir%\Kopia_Portable.zip"
goto QueueRelay

:Opt_191 
call :DirectDL "https://downloads.rclone.org/v1.69.1/rclone-v1.69.1-windows-amd64.zip" "%T_Dir%\Rclone_Portable.zip"
goto QueueRelay

:Opt_192 
call :DirectDL "https://github.com/syncthing/syncthing/releases/download/v1.29.2/syncthing-windows-amd64-v1.29.2.zip" "%T_Dir%\Syncthing_Portable.zip"
goto QueueRelay

:Opt_193 
call :DirectDL "https://dbeaver.io/files/dbeaver-ce-latest-win32.win32.x86_64.zip" "%P_Dir%\DBeaver_Portable.zip"
goto QueueRelay

:Opt_195 
call :DirectDL "https://download.sublimetext.com/sublime_text_build_4180_x64.zip" "%P_Dir%\SublimeText_Portable.zip"
goto QueueRelay

:Opt_196 
call :DirectDL "https://github.com/VSCodium/vscodium/releases/download/1.97.2.25045/VSCodium-win32-x64-1.97.2.25045.zip" "%P_Dir%\VSCodium_Portable.zip"
goto QueueRelay

:Opt_197 
call :DirectDL "https://github.com/microsoft/terminal/releases/download/v1.21.3231.0/Microsoft.WindowsTerminal_1.21.3231.0_8wekyb3d8bbwe.msixbundle" "%P_Dir%\WindowsTerminal.msixbundle"
goto QueueRelay

:Opt_200 
call :DirectDL "https://winscp.net/download/WinSCP-6.3.6-Portable.zip" "%T_Dir%\WinSCP_Portable.zip"
goto QueueRelay

:Opt_201 
call :DirectDL "https://download.wireguard.com/windows-client/wireguard-installer.exe" "%P_Dir%\WireGuard_Installer.exe"
goto QueueRelay

:Opt_202 
call :DirectDL "https://launcher-public-service-prod06.ol.epicgames.com/launcher/api/installer/download/EpicGamesLauncherInstaller.msi" "%P_Dir%\EpicGames_Setup.msi"
goto QueueRelay

:Opt_203 
call :DirectDL "https://cdn.gog.com/open/galaxy/client/2.0.73.27/setup_galaxy_2.0.73.27.exe" "%P_Dir%\GOG_Galaxy_Setup.exe"
goto QueueRelay

:Opt_204 
call :DirectDL "https://playnite.link/download/PlayniteInstaller.exe" "%T_Dir%\PlayniteInstaller.exe"
goto QueueRelay

:Opt_205 
call :DirectDL "https://download.calibre-ebook.com/7.25.0/calibre-portable-7.25.0.zip" "%P_Dir%\Calibre_Portable.zip"
goto QueueRelay

:Opt_206 
call :DirectDL "https://download.documentfoundation.org/libreoffice/stable/26.2.5/win/x86_64/LibreOffice_26.2.5_Win_x86-64.msi" "%P_Dir%\LibreOffice_Setup.msi"
goto QueueRelay

:Opt_207 
call :DirectDL "https://download.pdf24.org/pdf24-creator-11.20.0-x64.msi" "%P_Dir%\PDF24_Creator.msi"
goto QueueRelay

:Opt_225 
call :DirectDL "https://www.hibitsoft.ir/HiBitUninstaller/HiBitUninstaller-Portable.zip" "%T_Dir%\HiBitUninstaller_Portable.zip"
goto QueueRelay

:Opt_230 
call :DirectDL "https://github.com/nextcloud-releases/desktop/releases/download/v3.13.2/Nextcloud-3.13.2-x64.msi" "%P_Dir%\Nextcloud_Setup.msi"
goto QueueRelay

:Opt_234 
call :DirectDL "https://pkgs.tailscale.com/stable/tailscale-setup-latest.exe" "%P_Dir%\Tailscale_Setup.exe"
goto QueueRelay

:Opt_240 
call :DirectDL "https://download.ccleaner.com/spsetup132.exe" "%P_Dir%\Speccy_Setup.exe"
goto QueueRelay

:Opt_261 
call :DirectDL "https://github.com/unetbootin/unetbootin/releases/download/702/unetbootin-windows-702.exe" "%T_Dir%\UNetbootin_Setup.exe"
goto QueueRelay

:Opt_274 
call :DirectDL "https://github.com/NickeManarin/ScreenToGif/releases/download/2.41/ScreenToGif.2.41.Setup.x64.msi" "%T_Dir%\ScreenToGif_Setup.msi"
goto QueueRelay

:Opt_287 
call :DirectDL "https://github.com/LizardByte/Sunshine/releases/download/v0.23.1/sunshine-windows-installer.exe" "%P_Dir%\Sunshine_Setup.exe"
goto QueueRelay

:Opt_294 
call :DirectDL "https://aka.ms/vs/17/release/vc_redist.x64.exe" "%F_Dir%\vc_redist.x64.exe"
goto QueueRelay

:: ============================================
:: SYSTEM DISM & POWER SUBROUTINES
:: ============================================
:Opt_620 
dism.exe /online /cleanup-image /startcomponentcleanup
goto QueueRelay

:Opt_621 
powercfg /h off
goto QueueRelay

:Opt_622 
compact.exe /CompactOS:always
goto QueueRelay

:Opt_623 
cls
echo [QUERY] Checking Reserved Storage State...
dism /Online /Get-ReservedStorageState
pause
goto QueueRelay

:Opt_624 
cls
echo [CONFIG] Disabling Reserved Storage to reclaim space...
dism /Online /Set-ReservedStorageState /State:Disabled
timeout /t 3 >nul
goto QueueRelay

:: ============================================
:: DOWNLOAD ENGINE
:: ============================================
:DirectDL
set "dUrl=%~1" & set "dOut=%~2" & set "dRef=%~3"
if not defined dRef set "dRef=https://www.google.com"
echo [SYNC] Source: %dUrl%
echo [DEST] Target: %dOut%
curl -L -k -f --retry 3 --retry-delay 5 -e "%dRef%" -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36" "%dUrl%" -o "%dOut%"
if %errorlevel% EQU 0 (echo [OK] Saved to %dOut%. & exit /b 0) else (echo [-] Error: Failed to fetch binary. & exit /b 1)