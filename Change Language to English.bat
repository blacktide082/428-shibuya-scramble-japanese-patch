@echo off

:: This script will swap the executable filenames
:: to allow you to change the language of the game
:: when running from within Steam.
::
:: At the end it will rename itself to "Change Language to <Language>.bat"
:: to easily tell which language running the script will change the game to.

set base=428 Shibuya Scramble
set cur=%base%.exe
set eng=%base%.eng.exe
set jpn=%base%.jpn.exe

if exist "%eng%" (
    ren "%cur%" "%jpn%"
    ren "%eng%" "%cur%"
    set new_name="Change Language to Japanese.bat"
    goto rename
) else (
    if exist "%jpn%" (
        ren "%cur%" "%eng%"
        ren "%jpn%" "%cur%"
        set new_name="Change Language to English.bat"
        goto rename
    ) else (
        echo.
        echo Could not find alternate language .exe file!
        echo.
        echo Did you patch the game by running patch.bat first?
        echo.
        pause
    )
)

:rename
set cur_name="%~f0"
start /b cmd /c "ren %cur_name% %new_name%"