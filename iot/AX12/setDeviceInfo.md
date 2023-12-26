# Tenda AX12 Command injection vulnerability

## Firmware information

Firmware download address ：https://www.tenda.com.cn/download/detail-3621.html

## Affected version

Tenda AX12 V22.03.01.46

## Vulnerability details

![img](https://e4l4pic.oss-cn-beijing.aliyuncs.com/image-20231123163923586.png)![img](https://e4l4pic.oss-cn-beijing.aliyuncs.com/image-20231123164111282.png)

![img](https://e4l4pic.oss-cn-beijing.aliyuncs.com/image-20231123164223779.png)

![img](https://e4l4pic.oss-cn-beijing.aliyuncs.com/image-20231123164413088.png)

![img](https://e4l4pic.oss-cn-beijing.aliyuncs.com/image-20231123191920751.png)

In the `setDeviceInfo` sub-function module within `/goform/setModules`, the `mac` parameter is passed to `update_dev_name` without validation. The `update_dev_name` function is defined in `libtd_server.so` and it passes the parameter to `db_devinfo_query_name_by_mac`. This is then concatenated with an SQL command in `snprintf`, leading to a command injection vulnerability.

## Author

E4L4@TalentSec Co.,Ltd