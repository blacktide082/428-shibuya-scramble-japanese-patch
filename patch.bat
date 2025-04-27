:: This script will patch 428 Shibuya Scramble to the Japanese version.
:: Ensure that patch.exe and patch.diff are in the same directory
:: before running the script.

@echo off

setlocal enabledelayedexpansion

set base=428 Shibuya Scramble
set source=%base%.exe
set backup=%base%.eng.exe

set source_md5=979665ee8918d06aa5709f8322f3b935
set target_md5=5ec70490c26e2d7842f9aa6f0ce7c6ca

call :get_md5 "%source%" current_source_md5
call :get_md5 "%backup%" current_backup_md5

:: end the script if the exe file has already been patched
if %current_source_md5%==%target_md5% (
    echo.
    echo %source% has already been patched^^! Skipping patch...
    echo.
    pause
    exit /b
)

:: end the script if the exe file has unexpected contents
if not %current_source_md5%==%source_md5% (
    echo.
    echo %source% did not have the expected contents. Unable to patch the executable file.
    echo.
    echo. In the game's properties in Steam, on the "Installed Files" tab, click "Verify integrity of game files". Then try running the patch again.
    echo.
    echo. If it still fails after doing this, the game may have been updated and this patch will no longer work.
    echo.
    pause
    exit /b
)

:: we are good to patch now...
echo.
echo Backing up executable...
copy "%source%" "%backup%" >NUL 2>&1

echo.
echo Patching executable...
patch.exe "%source%" "%source%" patch.bsdiff

call :get_md5 "%source%" current_target_md5

:: check that the patched file matches the expected contents
if not %current_target_md5%==%target_md5% (
    echo Could not apply patch. Restoring backup file...
    move %backup% %source% >NUL 2>&1
    pause
    exit /b
)

:: add the game's steam ID to steam_appid.txt
echo 648580 > steam_appid.txt

echo.
echo Patch was applied successfully^^!
echo.
echo You can change the language back and forth between English and Japanese by running the "Change Language" batch file.
echo. 
echo You can now delete the patch.bat, patch.exe, and patch.diff files from your game's directory.
echo.

pause
exit /b

:: function for calculating the MD5 of a file
:: why is batch syntax so horrible?
:get_md5
set "file=%~1"
set "outvar=%~2"
set count=0

for /F "tokens=* USEBACKQ" %%i in (`certutil.exe -hashfile "%file%" MD5`) do (
    set /A count+=1
    if !count! equ 2 set "md5=%%i"
)

:: Assign the result to the output variable name passed in
set "%outvar%=%md5%"
goto :eof
