@echo off
title Starling 

chcp 65001 >nul
setlocal enabledelayedexpansion

set y=
for /f %%i in (
    'echo prompt $E ^| cmd'
    ) do (
    set y=%%i
) 

set red=!y![31m
set green=!y![32m
set yellow=!y![33m
set purple=!y![35m
set blue=!y![36m
set reset=!y![0m 
set star=%userprofile%\AppData\Local\Bloxstrap\Modifications\

if not exist "!star!" (
    echo. 
    echo Starling requires Bloxstrap to apply ClientSettings but it doesn't seem to be available. 
    echo.
    echo Bloxstrap could be installed by pressing Enter.
    echo.
    echo If you don't want to install Bloxstrap to apply ClientSettings, type 1.
    echo.
    set /p x= 
    echo.

    if "!x!" equ "" (
        winget install bloxstrap 
        echo.
        echo Great, Bloxstrap is successfully installed. 
        echo.
        timeout /t 3 /nobreak >nul & goto main
    ) 

    if "!x!" equ "1" (
        echo This is not the place where your looking for, you are supposed to use Whisperwind instead
        timeout /t 2 /nobreak >nul
        start "" "https://github.com/validchoice/Whisperwind" 
        exit
    )
) 
if not exist "%~d0\Backup" (
    mkdir "%~dp0\Backup" 
    xcopy "!star!\ClientSettings" "%~dp0\Backup" /y 
)


:main
cls 
echo.
echo ┌── !blue!Starling!reset!
set /p x="└─$ "

if /i "!x!" equ "help" (
    goto helpcmd
) 

if "!x!" equ "1" (
    goto balanced
) 

if "!x!" equ "2" (
    goto default
) 

if "!x!" equ "3" (
    goto potato
) 

if "!x!" equ "cs" (
    start "" "!star!" 
    goto main
) 

:helpcmd
cls 
echo.
echo Oh, hey^^!
echo.
echo It seems like you either forgot or are new to Starling commands.
echo.
echo Don't worry, I will guide you through those commands.
echo.
echo.
echo 1                                         Import ClientSettings - Balanced 
echo.
echo 2                                         Import ClientSettings - Normal 
echo.
echo 3                                         Import ClientSettings - Potato
echo.
echo cs                                        Open ClientSettings folder 
echo.
echo You may press any key to leave & pause >nul & goto main 

:balanced 
cls 
echo.
echo Applying balanced graphics... 
echo.
:: Powershell is unstable so I choose curl instead
curl -s -o "!star!\ClientSettings\ClientAppSettings.json" "https://raw.githubusercontent.com/validchoice/Starling/main/cs/balanced.json"
echo Done^^!
echo Successfully applied balanced graphics^^!
timeout /t 3 /nobreak >nul & goto main 

:default 
cls 
echo.
echo Applying normal graphics...
echo.
curl -s -o "!star!\ClientSettings\ClientAppSettings.json" "https://raw.githubusercontent.com/validchoice/Starling/main/cs/normal.json"
echo Done^^!
echo Successfully applied normal graphics^^! 
timeout /t 3 /nobreak >nul & goto main 

:potato 
cls 
echo.
echo Applying potato graphics...
echo.
curl -s -o "!star!\ClientSettings\ClientAppSettings.json" "https://raw.githubusercontent.com/validchoice/Starling/main/cs/potato.json"
echo Done^^!
echo Successfully applied potato graphics^^! 
timeout /t 3 /nobreak >nul & goto main 
