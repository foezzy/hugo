---
title: clashX使用说明
date: 2020-06-25 17:11:45
tags: clashX
---
## 前言

Clash 是一个使用 Go 语言编写，基于规则的跨平台代理软件核心程序。
ClashX 是运行在 macOS 上的一款科学上网工具。
也就是ClashX是套着Clash程序的MacOS平台的科学上网外壳。

## 下载

ClashX下载地址：
https://github.com/yichengchen/clashX/releases

选择最新的dmg版本下载，然后安装到MacOS系统

如果速度太慢，可以选择蓝奏盘下载，蓝奏盘的版本是1.20.4，地址如下：
https://wwa.lanzous.com/iPf0pe0zfsh

## 安装

下载dmg文件后打开，直接把clash.app拖动到Application文件夹

## 使用

打开Clash,如果第一次打开失败可以在进程管理器杀掉ClashX进程再打开一次
在状态栏发现一个小猫的图标，说明启动完成

![p1](https://gitee.com/osc_hh/pics/raw/master/uPic/zz1MYC.png)

1.添加配置，最好使用订阅连接，也可以自己手动添加节点，从机场服务商获取到订阅连接后可以直接添加到Clash，目前Clash支持SS、V2ray节点两种方式

添加订阅节点方式：单击小猫图标 - 配置 - 托管配置 - 管理
然后添加订阅连接。

![picname](https://gitee.com/osc_hh/pics/raw/master/uPic/SWtTS6.png)


### 重要说明：
自己手动配置节点还是比较麻烦，推荐还是通过添加配置自动生成
自动生成涉及到订阅的转化，因为机场商提供的不是yaml格式的配置，所以要转换一下，把ss或者v2ray节点转换为ClashX支持的格式

可以通过：[https://acl4ssr.netlify.app/](https://acl4ssr.netlify.app/)  这个地址转换，比如复制了Surge3的订阅连接，然后打开上面，把地址添加到ClashX中，客户端选择Clash，点击生成订阅连接，就得到了Clash客户端的订阅连接，添加到ClashX里，就可以看到生成的yaml文件

![picname](https://gitee.com/osc_hh/pics/raw/master/uPic/Yb9cir.png)

注意：该地址需要科学上网，而且打开速度有点慢，如果打开不了需要自己搜索：clash 订阅转换  找到合适的替代品

2.同时需要注意的是,要勾选上设置为系统代理，这个表示ClashX是否工作，勾上就开始工作
![picname](https://gitee.com/osc_hh/pics/raw/master/uPic/BzgGRz.png)

3.节点添加完成后就可以测速是否正常，选择某个节点，就可以愉快地上网了。

![picname](https://gitee.com/osc_hh/pics/raw/master/uPic/hpc0qM.png)










