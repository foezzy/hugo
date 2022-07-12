---
title: Charles快速配置安卓手机Proxy
date: 2020-05-11 15:02:58
tags: 工具
---
### 前言
Charles可以实现很多功能，比如抓包，修改返回结果，限速，真是一个神器，但是每次手机配置代理，真是逆天的操作

1.进入设置
2.进入 WLAN
3.找对应 wifi 连接
4.进入详情
5.找到代理
6.选择手动
7.输入主机名
8.输入端口号
9.最后保存

所以这篇文章就是为了把这么多步简化的过程，在网上搜索了一些方式，发现有两篇有很好的参考价值
[一键设置 Android http proxy 的尝试](http://tao93.top/2018/10/31/%E4%B8%80%E9%94%AE%E8%AE%BE%E7%BD%AE%20Android%20http%20proxy%20%E7%9A%84%E5%B0%9D%E8%AF%95/)
[Android自动设置HTTP代理
](https://zhuanlan.zhihu.com/p/134136375)

### 主要方式
方式一：安装一个app,然后用adb shell发送给app，代码进行wifi连接与配置，这种方式在 Api > 23 就会失效，目前大部分都是8.0以上的手机，这种方式就不好用了

方式二：用adb shell settings put global进行配置，但是这种方式是临时的，不用的话还要手动关一下
### 目前做法
参考知乎上那位大神的做法，直接写个sh脚本，再加上zsh的alias，就能比较方便的配置proxy了

### 步骤
新建 easy_proxy.sh 的文本，把以下代码贴进去即可

```
#!/bin/bash

echo "\n---------------- Support ------------------"
echo "设置本机IP代理    ./easy_proxy.sh set"
echo "设置自定义代理  ./easy_proxy.sh set ****:8888"
echo "删除代理       ./easy_proxy.sh clean"
echo "--------------------------------------------\n"

# 获取当前IP
ip=$(ifconfig en0 | grep -E 'inet \d{3}.' | awk '{print $2}')
default_proxy=${ip}":8888"

echo "本机IP为: $default_proxy\n"
if [ "$1" == "set" ];then
    if [ -n "$2" ];then
        echo "设置自定义代理 $2"
        adb shell settings put global http_proxy $2
    else
        echo "设置本机IP代理 $default_proxy"
        adb shell settings put global http_proxy $default_proxy
    fi
elif [ "$1" == "clean" ];then
    echo "清除代理成功"
    adb shell settings put global http_proxy :0
else
    echo "!!! 请输入合法的操作符 !!!"
fi
```

设置代理

```
$ ./easy_proxy.sh set
```


删除代理

```
$ ./easy_proxy.sh clean
```

### 遇到的坑

小米手机要打开一个设置：
开发者选项 - 调试 - USB调试要打开

不然会报java.lang.SecurityException: Permission denial: writing to settings requires:android.permission.WRITE_SECURE_SETTINGS 的错误

其他品牌的手机没试过，可能也会有类似的坑

