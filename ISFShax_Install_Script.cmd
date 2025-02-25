@echo off

:ISFShax Downloader Start
set DEFAULT_PATH=copy_to_sd
color 5
echo.                                              ----Peppe30_STUDIOS----
echo.
echo ISFShax Downloader
echo.
echo ISFShax Downloader simplifies the ISFShax installation process
echo.
echo 1 Install ISFShax (Browser Method Or Dnsespresso)
echo 2 Update ISFShax
echo 3 Wiiu Already Modded?
echo 4 Install Fastboot For ISFShax
echo 5 Repair Bricked WiiU (NOT WORK)
set /p choose=Choose your Options:

if %choose%==1 goto Install ISFShax
if %choose%==2 goto Update ISFShax
if %choose%==3 goto PayLoadLoader Update To ISFShax
if %choose%==4 goto Fastboot Install
if %choose%==5 goto Unbrick WiiU

:Install ISFShax 
set destpath=%DEFAULT_PATH%
md "%destpath%/wiiu/payloads/fw_img_loader"
cd /D "%destpath%"
md "wiiu\ios_plugins"
md wiiu\apps

echo.                                              ----Peppe30_STUDIOS----


echo "Set-up ISFShax Files..."


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
echo "File preparation..."
del fw_img_loader_hbl.zip PayloadFromRPX.zip
rename root.rpx launch.rpx

md hax\ios_plugins
copy wiiu\ios_plugins\* hax\ios_plugins\

curl -L https://github.com/isfshax/haxcopy/releases/latest/download/haxcopy.wuhb -o wiiu\apps\haxcopy.wuhb >nul 2>&1


color A
echo.                                              ----Peppe30_STUDIOS----
echo.
echo "Download finished" 
echo Aroma is not included by default Download it from here https://aroma.foryour.cafe/ 
echo For anything join the Discord server https://discord.com/invite/p59ABtKseu

pause
cls
goto ISFShax Downloader Start

:Update ISFShax
set DEFAULT_PATH=copy_to_sd
set destpath=%DEFAULT_PATH%
md "%destpath%"
cd /D "%destpath%"
md "wiiu\ios_plugins"
md "hax\ios_plugins"

echo.                                              ----Peppe30_STUDIOS----

echo "Preparation Update"

curl -L https://github.com/isfshax/isfshax/releases/latest/download/superblock.img -o superblock.img >nul 2>&1
curl -L https://github.com/isfshax/isfshax/releases/latest/download/superblock.img.sha -o superblock.img.sha >nul 2>&1
curl -L https://github.com/isfshax/isfshax_installer/releases/latest/download/ios.img -o ios.img >nul 2>&1
curl -L https://github.com/StroopwafelCFW/minute_minute/releases/latest/download/fw.img -o fw.img >nul 2>&1
curl -L https://github.com/StroopwafelCFW/stroopwafel/releases/latest/download/00core.ipx -o wiiu\ios_plugins\00core.ipx >nul 2>&1
curl -L https://github.com/isfshax/wafel_isfshax_patch/releases/latest/download/5isfshax.ipx -o wiiu\ios_plugins\5isfshax.ipx >nul 2>&1
curl -L https://github.com/StroopwafelCFW/wafel_payloader/releases/latest/download/5payldr.ipx -o wiiu\ios_plugins\5payldr.ipx >nul 2>&1
curl -L https://github.com/StroopwafelCFW/minute_minute/releases/latest/download/fw_fastboot.img -o hax\fw.img >nul 2>&1

copy wiiu\ios_plugins\* hax\ios_plugins\


color A
echo.                                              ----Peppe30_STUDIOS----
echo.
echo "Update Ready!"
echo Run ISFShax Installer to update

pause 
cls
goto ISFShax Downloader Start

:Fastboot Install
cls
Color 5
echo.                                              ----Peppe30_STUDIOS----
echo.
echo Fastboot Installation Does Not Allow You To Start The Minute Menu While It Is Installed
echo (You Can Remove The Fastboot Whenever You Want)
echo (this only applies to the V5.0 version of ISFShax)
set /p "destDir=Enter the letter of your disk (e.g. D:):

pause 

curl -L https://github.com/StroopwafelCFW/minute_minute/releases/latest/download/fw_fastboot.img -o minute.img
xcopy /y "minute.img" "%destDir%\" >nul
del "minute.img"

cls
Color A
echo.                                              ----Peppe30_STUDIOS----
echo. 
echo "The Fastboot is ready to be installed!"
pause 
cls
goto ISFShax Downloader Start


:Unbrick WiiU
echo This function is not yet integrated into the program:(

Pause 

cls 
goto ISFShax Downloader Start


:PayLoadLoader Update To ISFShax

cls
echo.                                              ----Peppe30_STUDIOS----
color 4 
echo BEFORE YOU BEGIN YOU NEED TO REMOVE THE PAYLOADLOADER AUTO-START WITH THIS GUIDE https://wiiu.hacks.guide/uninstall-payloadloader.html 

pause

color 5
echo After removing autoboot or completely uninstalling the payloadLoader, quietly follow the first option in the ISFShax Downloader

pause

cls
goto ISFShax Downloader Start

