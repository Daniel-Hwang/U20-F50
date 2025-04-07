@echo off
set path=units
echo:请手动打开后台并登录
echo 确认已经登入后台
echo 按回车确认执行开启
Pause > nul

:: 使用完整路径调用PowerShell脚本以执行开启adb的操作
"C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -ExecutionPolicy Bypass -File "firmware\u20_openadb.ps1"
:: 添加2秒延迟
timeout /t 2 /nobreak > nul
echo 等待adb开启
adb devices
echo 如果列表出现设备则开启成功

adb wait-for-device


echo 正在安装短信转发
adb install firmware\fwd.apk
echo 正在安装ftp
adb install firmware\ftp.apk

Pause > nul