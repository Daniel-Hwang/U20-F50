@echo off
set path=units
echo:���ֶ��򿪺�̨����¼
echo ȷ���Ѿ������̨
echo ���س�ȷ��ִ�п���
Pause > nul

:: ʹ������·������PowerShell�ű���ִ�п���adb�Ĳ���
"C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -ExecutionPolicy Bypass -File "firmware\u20_openadb.ps1"
:: ���2���ӳ�
timeout /t 2 /nobreak > nul
echo �ȴ�adb����
adb devices
echo ����б�����豸�����ɹ�

adb wait-for-device


echo ���ڰ�װ����ת��
adb install firmware\fwd.apk
echo ���ڰ�װftp
adb install firmware\ftp.apk

Pause > nul