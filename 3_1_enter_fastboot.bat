@echo off
setlocal enabledelayedexpansion

echo waitting adb device
adb wait-for-device

::enter bootloader
echo enter bootloader
adb reboot bootloader

echo DONE
pause