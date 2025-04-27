@echo off
setlocal enabledelayedexpansion

:: check wmic exist
where wmic >nul 2>nul
if %errorlevel%==0 (
    for /f %%a in ('wmic os get localdatetime ^| find "."') do set dt=%%a
    set datetime=%dt:~0,4%%dt:~4,2%%dt:~6,2%_%dt:~8,2%%dt:~10,2%%dt:~12,2%
    set "prefix=backup_partition_%datetime%"
) else (
    set "prefix=backup_partition"
)

:: radom a number
set /a rand=%RANDOM%

:: set path
set "backup_dir=%prefix%_%rand%"

:: create path
mkdir "%backup_dir%"

echo waitting adb device
adb wait-for-device

echo entering u2s
adb reboot autodloader

echo try full backup
:: backup
spd_dump --wait 300 exec_addr 0x65012f48 fdl fdl1-dl.bin 0x65000800 fdl fdl2-dl.bin 0xb4fffe00 exec path %backup_dir% r splloader read_parts partition1.xml reset

echo DONE
pause