setlocal enabledelayedexpansion
adb reboot autodloader
if not exist "u-boot-spl-16k-sign.bin" (
spd_dump --wait 300 exec_addr 0x65012f48 fdl fdl1-dl.bin 0x65000800 fdl fdl2-dl.bin 0xb4fffe00 exec r splloader r uboot e splloader e splloader_bak reset
@echo "(This is a notice, not an error.) Don't continue if you see find port failed, just close and re-run this batch"
pause
gen_spl-unlock splloader.bin
if !errorlevel! equ 0 (
    rename "splloader.bin" "u-boot-spl-16k-sign.bin"
    chsize uboot.bin
    rename uboot.bin uboot_bak.bin
)
pause
) else (
spd_dump --wait 300 exec_addr 0x65012f48 fdl fdl1-dl.bin 0x65000800 fdl fdl2-dl.bin 0xb4fffe00 exec e splloader e splloader_bak reset
@echo "(This is a notice, not an error.) Don't continue if you see find port failed, just close and re-run this batch"
pause
)
spd_dump --wait 300 exec_addr 0x65012f48 fdl fdl1-dl.bin 0x65000800 fdl fdl2-dl.bin 0xb4fffe00 exec w uboot fdl2-cboot.bin reset
TIMEOUT /T 10 /NOBREAK
::unlock runs here, may need twice
spd_dump exec_addr 0x65012f48 fdl spl-unlock.bin 0x65000800
::check unlock (if get 64 zeros, locked; if 32 string + 16 hash + 16 hash, unlocked)
spd_dump exec_addr 0x65012f48 fdl fdl1-dl.bin 0x65000800 fdl fdl2-dl.bin 0xb4fffe00 exec verbose 2 read_part miscdata 8192 64 m.bin reset
pause
::restore spl and uboot
spd_dump exec_addr 0x65012f48 fdl fdl1-dl.bin 0x65000800 fdl fdl2-dl.bin 0xb4fffe00 exec r boot w splloader u-boot-spl-16k-sign.bin w uboot uboot_bak.bin  w misc misc-wipe.bin reset
pause