@echo off

setlocal enabledelayedexpansion

:main
    title Wi-Fi_Password_Dump     
    echo.
    echo Dumping all saved WiFi passwords into WifiDumpData.txt
    echo.
    echo Please Wait for 20 seconds 
    echo.

    echo updating the WifiDumpData.txt 
    del WifiDumpData.txt

    
    call :find-all-profiles r

    
    :print-all-profiles
        for /f "tokens=1* delims=," %%a in ("%r%") do (
            call :find-key-output "%%a" key
            if "!key!" NEQ "" (
                echo WiFi: [%%a] Password: [!key!] >> WifiDumpData.txt
            )
            set r=%%b
        )
        if "%r%" NEQ "" goto:print-all-profiles

    echo.
    pause

    .\WifiDumpData.txt 

    goto :eof

::

:find-key-output <1=profile-name> <2=key-output>
    setlocal

    set result=

    FOR /F "usebackq tokens=2 delims=:" %%a in (
        `netsh wlan show profile name^="%~1" key^=clear ^| findstr /C:"Key Content"`) DO (
        set result=%%a
        set result=!result:~1!
    )
    (
        endlocal
        set %2=%result%
    )

    goto :eof

::

:find-all-profiles <1=result-variable>
    setlocal

    set result=

   
    FOR /F "usebackq tokens=2 delims=:" %%a in (
        `netsh wlan show profiles ^| findstr /C:"All User Profile"`) DO (
        set val=%%a
        set val=!val:~1!

        set result=%!val!,!result!
    )
    (
        endlocal
        set %1=%result:~0,-1%
    )

    goto :eof
