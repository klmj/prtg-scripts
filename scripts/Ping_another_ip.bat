@echo off

:: AUTHOR : klmj@github
:: DESCRIPTION : ping another IP than device's IP, pass target's IP in arg1
::
:: value is ping response time in ms.
:: return code give sensor status

setlocal enabledelayedexpansion

:: init vars
set _target=%1

:: check if target is set in args, else error
if defined target (
    :: ping and extract response time (ex: "time=12")
    for /f "tokens=5" %%i in ('ping -n 2 -w 500 -4 %_target ^| find "TTL="') do (
        set _res=%%i
    )
) else (
    echo 0: no target in arg1
    ::   2 System Error
    exit 2
)

:: result if response time, else error
if defined _res (
    :: extract reponse time (match everything after a = or <)
    for /f "tokens=2 delims==<" %%i in ("%_res%") do (set _res=%%i)
    :: remove "ms" in case "Réponse de 127.0.0.1 : octets=32 temps<1ms TTL=128"
    set _res=!_res:ms=!
    echo !_res!: %target% reachable
    ::   0 OK
    exit 0
) else (
    echo 0: %target% NOT reachable
    ::   3 Protocol Error
    exit 3
)
