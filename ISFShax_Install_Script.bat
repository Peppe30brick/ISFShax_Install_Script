@echo off
echo P P P  eeeee  ppppp  ppppp  eeeee   333   000
ping -n 2 127.0.0.1 >nul
echo P   P  e      p   p  p   p  e          3 0   0
ping -n 2 127.0.0.1 >nul
echo PPPP   eeee   ppppp  ppppp  eeee    3333 0   0
ping -n 2 127.0.0.1 >nul
echo P      e      p      p      e          3 0   0
ping -n 2 127.0.0.1 >nul
echo P      eeeee  p      p      eeeee   333   000
ping -n 2 127.0.0.1 >nul
echo.
color 4
echo  SSSS TTTTT U   U DDDD  III  OOO  SSSS
ping -n 2 127.0.0.1 >nul
echo S       T   U   U D   D  I  O   O S    
ping -n 2 127.0.0.1 >nul
echo  SSS    T   U   U D   D  I  O   O  SSS 
ping -n 2 127.0.0.1 >nul
echo     S   T   U   U D   D  I  O   O     S
ping -n 2 127.0.0.1 >nul
echo SSSS    T    UUU  DDDD  III  OOO  SSSS 
ping -n 2 127.0.0.1 >nul
color 07

echo Welcome to the ISFShax Install Script designed by Peppe30_STUDIOS! Starting the program...
timeout /t 6 >2

set DEFAULT_PATH=Copy_To_SD
cls
:: TITLE / TITOLO
:ISFShax Downloader Start
color E
echo ---- Made with love by Peppe30_STUDIOS ----
echo ISFShax Downloader - Simplifies the ISFShax installation process
echo.
echo ! THIS SCRIPT DEPENDS ON YOUR CONNECTION AND CPU SPEED. !
echo ! Your antivirus may block the download process, some files might not download at all and the setup will fail. !
echo.

:: OPTIONS / OPZIONI
echo 1 - Install ISFShax (Browser method or DNSpresso)
echo 2 - Update ISFShax
echo 3 - WiiU already modded?
echo 4 - Install Fastboot for ISFShax
echo 5 - Repair bricked WiiU (DOESN'T WORK)
echo 6 - Credits
echo 7 - Quit
echo.

:: USER INPUT / INPUT CHE DEVE DARE L'UTENTE
:input
set /p choose=Choose an option: 
cls

:: DOES NOT ALLOW USER TO ENTER NUMBERS OUTSIDE 1 TO 7 / NON CONSENTE ALL'UTENTE DI INSERIRE NUMERI CHE NON SIANO 1, 2, 3, 4, 5, 6 O 7
if "%choose%" LSS "1" goto invalid
if "%choose%" GTR "7" goto invalid
goto valid

:: IF USER ENTERS A NUMBER LOWER THAN 1 OR GREATER THAN 7 / SE L'UTENTE INSERISCE UN NUMERO INFERIORE A 1 O SUPERIORE A 7
:invalid
echo Invalid choice! Please enter a number between 1 and 7.
goto input

:: IF USER ENTERS A NUMBER BETWEEN 1 AND 7 / SE L'UTENTE INSERISCE UN NUMERO TRA 1 E 7
:valid
if %choose%==1 goto Install_ISFShax
if %choose%==2 goto Update_ISFShax
if %choose%==3 goto PayloadLoader_Update
if %choose%==4 goto Fastboot_Install
if %choose%==5 goto Unbrick_WiiU
if %choose%==6 goto Credits
if %choose%==7 goto ExitScript

:: OPTION 1, INSTALL ISFSHAX / OPZIONE 1, INSTALLA ISFSHAX
:Install_ISFShax

set destpath=%DEFAULT_PATH%
md "%destpath%/wiiu/payloads/fw_img_loader"
cd /D "%destpath%"
md "wiiu\ios_plugins"
md wiiu\apps

echo.
echo Setting up ISFShax files, hold tight...

curl -L https://github.com/isfshax/isfshax_installer/releases/latest/download/ios.img -o ios.img >nul 2>&1
curl -L https://github.com/isfshax/isfshax/releases/latest/download/superblock.img -o superblock.img >nul 2>&1
curl -L https://github.com/isfshax/isfshax/releases/latest/download/superblock.img.sha -o superblock.img.sha >nul 2>&1
curl -L https://github.com/StroopwafelCFW/stroopwafel/releases/latest/download/00core.ipx -o wiiu\ios_plugins\00core.ipx >nul 2>&1
curl -L https://github.com/isfshax/wafel_isfshax_patch/releases/latest/download/5isfshax.ipx -o wiiu\ios_plugins\5isfshax.ipx >nul 2>&1
curl -L https://github.com/StroopwafelCFW/wafel_payloader/releases/latest/download/5payldr.ipx -o wiiu\ios_plugins\5payldr.ipx >>nul 2>&1
curl -L https://github.com/StroopwafelCFW/minute_minute/releases/latest/download/fw.img -o fw.img >nul 2>&1
curl -L https://github.com/jan-hofmeier/unencrypted_fw_img_payload/releases/latest/download/payload.elf -o wiiu\payloads\fw_img_loader\payload.elf >nul 2>&1
curl -L https://github.com/jan-hofmeier/PayloadLoaderPayload/releases/latest/download/payload.elf -o wiiu\payload.elf >nul 2>&1
curl -L https://github.com/jan-hofmeier/unencrypted_fw_img_payload/releases/latest/download/fw_img_loader_hbl.zip -o fw_img_loader_hbl.zip >nul 2>&1
tar -xmf fw_img_loader_hbl.zip
curl -L https://github.com/wiiu-env/PayloadFromRPX/releases/download/PayloadFromRPX-20230723-084033/PayloadFromRPX_20230723-084033.zip -o PayloadFromRPX.zip >nul
tar -xmf PayloadFromRPX.zip


echo Preparing the files...

del fw_img_loader_hbl.zip PayloadFromRPX.zip
rename root.rpx launch.rpx
md hax\ios_plugins
copy wiiu\ios_plugins\* hax\ios_plugins\

curl -L https://github.com/isfshax/haxcopy/releases/latest/download/haxcopy.wuhb -o wiiu\apps\haxcopy.wuhb >nul 2>&1

cls

echo Download finished!
echo.
echo Aroma is not included by default. Download it from here: https://aroma.foryour.cafe/ 
echo Any issues, questions or something else? Join the Discord server: https://discord.com/invite/p59ABtKseu
echo.
echo.

pause
cls
goto ISFShax Downloader Start

:: OPTION 2, UPDATE ISFSHAX / OPZIONE 2, AGGIORNA ISFSHAX
:Update_ISFShax

set DEFAULT_PATH=copy_to_sd
set destpath=%DEFAULT_PATH%
md "%destpath%"
cd /D "%destpath%"
md "wiiu\ios_plugins"
md "hax\ios_plugins"

echo Preparing the update files...

curl -L https://github.com/isfshax/isfshax/releases/latest/download/superblock.img -o superblock.img >nul 2>&1
curl -L https://github.com/isfshax/isfshax/releases/latest/download/superblock.img.sha -o superblock.img.sha >nul 2>&1
curl -L https://github.com/isfshax/isfshax_installer/releases/latest/download/ios.img -o ios.img >nul 2>&1
curl -L https://github.com/StroopwafelCFW/minute_minute/releases/latest/download/fw.img -o fw.img >nul 2>&1
curl -L https://github.com/StroopwafelCFW/stroopwafel/releases/latest/download/00core.ipx -o wiiu\ios_plugins\00core.ipx >nul 2>&1
curl -L https://github.com/isfshax/wafel_isfshax_patch/releases/latest/download/5isfshax.ipx -o wiiu\ios_plugins\5isfshax.ipx >nul 2>&1
curl -L https://github.com/StroopwafelCFW/wafel_payloader/releases/latest/download/5payldr.ipx -o wiiu\ios_plugins\5payldr.ipx >nul 2>&1
curl -L https://github.com/StroopwafelCFW/minute_minute/releases/latest/download/fw_fastboot.img -o hax\fw.img >nul 2>&1

copy wiiu\ios_plugins\* hax\ios_plugins\


cls
echo The update files are ready!
echo Run the ISFShax Installer to update
echo.
pause
 
cls
goto ISFShax Downloader Start

:: OPTION 3, WIIU ALREADY MODDED? / OPZIONE 3, WIIU GIA' MODDATA?
:PayLoadLoader_Update

cls
color 4 
echo BEFORE YOU START YOU NEED TO REMOVE THE PAYLOADLOADER AUTO-START FEATURE. 
echo USE THIS GUIDE: https://wiiu.hacks.guide/uninstall-payloadloader.html
echo.

pause
cls

color E
echo After removing autoboot or completely uninstalling the payloadLoader,
echo go to the main menu of this script, press 1 and press ENTER.

echo.
pause

cls
goto ISFShax Downloader Start

:: OPTION 4, INSTALL FASTBOOT FOR ISFSHAX / OPZIONE 4, INSTALLA FASTBOOT PER ISFSHAX
:Fastboot_Install

cls
echo Fastboot removes the Minute Menu when it is installed (this only applies to the v5.0 of ISFShax)
echo (You can remove Fastboot whenever you want)
echo.
echo Put the downloaded minute.img in the root of the SD Card.
echo.
pause

curl -L https://github.com/StroopwafelCFW/minute_minute/releases/latest/download/fw_fastboot.img -o minute.img

cls
echo Fastboot is ready to be installed!
echo.
pause 
cls
goto ISFShax Downloader Start

:: OPTION 5, REPAIR BRICKED WIIU (DOESN'T WORK), OPZIONE 5, RIPARA UNA WIIU BRICKATA (NON FUNZIONANTE)
:Unbrick_WiiU

echo This function is not yet integrated into the script :(
echo Follow the ISFShax installation guide with UDPIH (requires a Raspberry Pi Pico or Zero)
echo.
pause
start https://gbatemp.net/threads/how-to-set-up-isfshax.642258/

cls 
goto ISFShax Downloader Start

:: OPTION 6, CREDITS / OPZIONE 6, CREDITI
:Credits

start https://github.com/Peppe30brick/ISFShax_Install_Script
goto ISFShax Downloader Start

:: OPTION 7, QUIT / OPZIONE 6, ESCI
:ExitScript

exit /b
