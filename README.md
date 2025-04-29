**20250429更新version2.7.0 apk，install it in your T760 devices, then check 192.168.0.1:2333**

**20250426重要更新！！此教程为免费教程，工具内所有文件均为网络收集，如有侵权会删除， 禁止出售倒卖，倒卖死！！
文件/脚本由：kanoqwq (Minikano) 整理
我是成功了，刷机请谨慎！请提前备份**
 
 
 欢迎支持一键三连，点颗星星~谢谢呢 



***20250407更新 中兴F50-IMEI修改详细教程***

一、开启USB调试模式

1. 使用浏览器登录F50管理后台，随后在同一浏览器新标签页中打开链接：

```
http://192.168.0.1/index.html#usb_port
```

1. 在打开页面启用“USB调试模式”，然后重启设备。

二、连接电脑并投屏

1. 使用USB数据线连接F50与Windows电脑，推荐使用QtScrcpy工具进行投屏。

三、进入工程模式并修改IMEI

1. 进入F50界面后，打开拨号键盘输入：

```
*#*#83781#*#*
```

1. 进入工程模式(Engineer Mode)，选择顶部的"DEBUG&LOG"，找到"Send AT Command"功能。
2. 在"AT Command"输入框中输入AT命令修改：

```
AT+SPIMEI=0,"你的新IMEI号"
```

- 注意：数字“0”表示修改串号1，“1”表示修改串号2。
- AT命令需使用英文输入法确保无误。

1. 点击"SEND"按钮确认，页面下方提示"OK"则表示修改成功。

四、注意事项

- 修改后的IMEI后台可正常显示，可解决无法连接智慧生活App、IMEI已被绑定等问题。
- 推荐使用符合设备标准的合法15位IMEI号码。

 （飞猫u20里没有这个usb port哦） 



***20250401更新飞猫 U20开启ADB***

浏览器F12开发者输入如下：

飞猫U20开启ADB功能教程（20250401更新）

1. 在浏览器中按F12打开开发者模式，进入Console或使用PowerShell执行以下代码以开启飞猫U20的ADB功能：

```
$session = New-Object Microsoft.PowerShell.Commands.WebRequestSession
$session.UserAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 Chrome/133.0.0.0 Safari/537.36"

$s = Invoke-WebRequest -UseBasicParsing -Uri "http://192.168.88.1/goform/goform_get_cmd_process?isTest=false&cmd=Language%2Ccr_version%2Cwa_inner_version&multi_data=1" -WebSession $session -Headers @{
  "Accept"="application/json, text/javascript, */*; q=0.01"
  "Referer"="http://192.168.88.1/index.html"
  "X-Requested-With"="XMLHttpRequest"
}

$vs = $s.Content | ConvertFrom-Json
$ss = $vs.wa_inner_version + $vs.cr_version
$sha256 = [System.Security.Cryptography.SHA256]::Create()
$hashBytes = $sha256.ComputeHash([System.Text.Encoding]::UTF8.GetBytes($ss))
$key = ([System.BitConverter]::ToString($hashBytes)).Replace("-","")

Invoke-WebRequest -UseBasicParsing -Uri "http://192.168.88.1/goform/goform_get_cmd_process?isTest=false&cmd=RD" -WebSession $session -Headers @{
  "Accept"="application/json, text/javascript, */*; q=0.01"
  "Referer"="http://192.168.88.1/index.html"
  "X-Requested-With"="XMLHttpRequest"
}

$ck = $session.Cookies.GetCookies("http://192.168.88.1/goform")["JSESSIONID"].Value
$data1 = $key + $ck
$hashBytes = $sha256.ComputeHash([System.Text.Encoding]::UTF8.GetBytes($data1))
$hash = ([System.BitConverter]::ToString($hashBytes)).Replace("-","")

$body = "isTest=false&goformId=USB_PORT_SETTING&usb_port_switch=1&AD="+$hash

Invoke-WebRequest -UseBasicParsing -Uri "http://192.168.88.1/goform/goform_set_cmd_process" -Method "POST" -WebSession $session -Headers @{
  "Accept"="application/json, text/javascript, */*; q=0.01"
  "Origin"="http://192.168.88.1"
  "Referer"="http://192.168.88.1/index.html"
  "X-Requested-With"="XMLHttpRequest"
} -ContentType "application/x-www-form-urlencoded; charset=UTF-8" -Body $body
```

1. 执行成功后，即可实现飞猫U20设备的ADB功能开启。



***中兴F50随身WIFI开启高性能模式***

**开启性能模式**

访问该地址即可打开隐藏项:

http://192.168.88.1/index.html#performance_mode

如果您修改过LAN地址，可以将192.168.0.1改为您修改的地址即可。

