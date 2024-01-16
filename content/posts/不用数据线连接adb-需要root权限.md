---
title: '不用数据线连接adb,需要root权限'
date: 2020-05-15 11:34:05
tags: [adb连接]
---
有 2 种方法开启无线调试，其中一种需要 USB 线先连接，这里只介绍另一种不借助 USB 线的

过程很简单，手机需要有 ROOT 权限

* * *

1. 手机端下载 终端模拟器 或其他终端 

2. 手机终端输入如下命令

> su
> 
> setprop service.adb.tcp.port 5555
> 
> stop adbd
> 
> start adbd

3. 查看本机 ip

> ifconfig

![](http://upload-images.jianshu.io/upload_images/18974911-6d579288a337e95e.png)

4. 在开发者选项中打开 USB 调试（否则连接后会显示未授权）

5. 电脑端输入

> adb connect Phone_ip:5555 (Phone_ip 为你自己手机 ip) 
> 
> adb devices

6. 若成功 此时你便能看到自己的设备了

> List of devices attached
> 
> 192.168.1.59:5555      device


### 可能遇到的问题
问题：unable to connect to 192.168.199.248:5555: Connection refused
解决办法 (设置监听端口)

``` java
$ setprop service.adb.tcp.port 5555  //设置监听端口
$ stop adbd
$ start adbd

```

