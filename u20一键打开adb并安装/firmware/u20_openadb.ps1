
$session = New-Object Microsoft.PowerShell.Commands.WebRequestSession
$session.UserAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36"





$s = Invoke-WebRequest -UseBasicParsing -Uri "http://192.168.88.1/goform/goform_get_cmd_process?isTest=false&cmd=Language%2Ccr_version%2Cwa_inner_version&multi_data=1&_=1713857210897" `
-WebSession $session `
-Headers @{
"Accept"="application/json, text/javascript, */*; q=0.01"
  "Accept-Encoding"="gzip, deflate"
  "Accept-Language"="en-US,en;q=0.9"
  "Referer"="http://192.168.88.1/index.html"
  "X-Requested-With"="XMLHttpRequest"
}

$vs = $s.Content | ConvertFrom-Json
$ss = $vs.wa_inner_version + $vs.cr_version
$sha256 = New-Object System.Security.Cryptography.SHA256CryptoServiceProvider
$data = [System.Text.Encoding]::UTF8.GetBytes($ss)
$hashBytes = $sha256.ComputeHash($data)
$hash = [System.BitConverter]::ToString($hashBytes).Replace("-", "")
$key = $hash


$s=Invoke-WebRequest -UseBasicParsing -Uri "http://192.168.88.1/goform/goform_get_cmd_process?isTest=false&cmd=LD&_=1742005474188" `
-WebSession $session `
-Headers @{
"Accept"="application/json, text/javascript, */*; q=0.01"
  "Accept-Encoding"="gzip, deflate"
  "Accept-Language"="en-US,en;q=0.9"
  "Referer"="http://192.168.88.1/index.html"
  "X-Requested-With"="XMLHttpRequest"
}

$vs = $s.Content | ConvertFrom-Json
$sha256 = New-Object System.Security.Cryptography.SHA256CryptoServiceProvider
$data1 = "8C6976E5B5410415BDE908BD4DEE15DFB167A9C873FC4BB8A81F6F2AB448A918"+$vs.LD
$data = [System.Text.Encoding]::UTF8.GetBytes($data1)
$hashBytes = $sha256.ComputeHash($data)
$hash = [System.BitConverter]::ToString($hashBytes).Replace("-", "")

$body = "isTest=false&goformId=LOGIN&user=admin&password="+$hash

Invoke-WebRequest -UseBasicParsing -Uri "http://192.168.88.1/goform/goform_set_cmd_process" `
-Method "POST" `
-WebSession $session `
-Headers @{
"Accept"="application/json, text/javascript, */*; q=0.01"
  "Accept-Encoding"="gzip, deflate"
  "Accept-Language"="en-US,en;q=0.9"
  "Origin"="http://192.168.88.1"
  "Referer"="http://192.168.88.1/index.html"
  "X-Requested-With"="XMLHttpRequest"
} `
-ContentType "application/x-www-form-urlencoded; charset=UTF-8" `
-Body $body
















Invoke-WebRequest -UseBasicParsing -Uri "http://192.168.88.1/goform/goform_get_cmd_process?isTest=false&cmd=RD&_=1713857210897" `
-WebSession $session `
-Headers @{
"Accept"="application/json, text/javascript, */*; q=0.01"
  "Accept-Encoding"="gzip, deflate"
  "Accept-Language"="en-US,en;q=0.9"
  "Referer"="http://192.168.88.1/index.html"
  "X-Requested-With"="XMLHttpRequest"
}

$ck = $session.Cookies.GetCookies("http://192.168.88.1/goform")["JSESSIONID"].Value
$sha256 = New-Object System.Security.Cryptography.SHA256CryptoServiceProvider
$data1 = $key+$ck
$data = [System.Text.Encoding]::UTF8.GetBytes($data1)
$hashBytes = $sha256.ComputeHash($data)
$hash = [System.BitConverter]::ToString($hashBytes).Replace("-", "")

$body = "isTest=false&goformId=USB_PORT_SETTING&usb_port_switch=1&AD="+$hash

Invoke-WebRequest -UseBasicParsing -Uri "http://192.168.88.1/goform/goform_set_cmd_process" `
-Method "POST" `
-WebSession $session `
-Headers @{
"Accept"="application/json, text/javascript, */*; q=0.01"
  "Accept-Encoding"="gzip, deflate"
  "Accept-Language"="en-US,en;q=0.9"
  "Origin"="http://192.168.88.1"
  "Referer"="http://192.168.88.1/index.html"
  "X-Requested-With"="XMLHttpRequest"
} `
-ContentType "application/x-www-form-urlencoded; charset=UTF-8" `
-Body $body




