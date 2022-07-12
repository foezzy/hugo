---
title: 一个简单的最近热点Android阅读器
date: 2019-09-30 14:01:02
tags:
---

V2EX上有人做了个热榜api，看着不错

https://www.v2ex.com/t/578957

有人拿来做了个网页

https://www.telami.cn/hot/

发现这个网页好是好，但是一下子数据太多，看不过来，于是看了下接口，发现可以自己随便定

在手机上我用的via浏览器，发现打开知乎或者一些会自动跳转的有scheme的网页，会出现找不到协议的错误，网页就没法看了

基于以上两点，自己加工了一下，做了个安卓端可以自己定义内容的查看器，其实就是内嵌个webview，截图如下

![](https://gitee.com/osc_hh/pics/raw/master/093014545507_0pic1.png)

源码可以前往 https://github.com/foezzy/EasyNewsForAndroid

直接下载apk体验地址 https://www.lanzous.com/i6i60yj

使用说明：

1.点下面检查接口，在弹出框可以看到每个频道对应了一个id，记住这个id

2.点击add，然后名字随便自己定，id就填那个id，然后ok就添加了一个频道

3.点item就可以获取最新的新闻了

4.长按item会出现关闭按钮，可以自由添加删除

5.有时网络慢时，无任何反应，接口没返回时没做什么处理

6.觉得不错请给个star谢谢



其中webview最开始自己写了一个，发现一直有些奇怪的问题，后来找了一个开源的过来用，感谢这个作者

https://github.com/hylinux1024/BridgeWebView

