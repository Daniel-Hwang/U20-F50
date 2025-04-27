@echo off
setlocal enabledelayedexpansion

echo waitting adb device
adb wait-for-device

echo entering u2s
adb reboot autodloader

echo try flash uboot
:: backup
spd_dump --wait 300 exec_addr 0x65012f48 fdl fdl1-dl.bin 0x65000800 fdl fdl2-dl.bin 0xb4fffe00 exec w uboot engineering-uboot_signed.bin reset

echo FLASH UBOOT DONE
pause