---
title: Android依赖相问题
date: 2019-08-29 10:20:29
tags: Android
---

# Android依赖第三方库引起一个报错

<font color="#dd0000">uses-sdk:minSdkVersion 1 cannot be smaller than version 14 declared in library [com.android.support:appcompat-v7:28.0.0]
</font><br />  

谷歌查了一下说是依赖库版本比主模块版本低，要提高依赖库的版本， 但是找了发现没有低，主要是没有找到是哪个依赖库，最终是在报错信息里发现了那个库没有minSdkVersion字段，在该模块的build.gradle文件下的defaultConfig加上对应的minSdkVersion即可，要不低于主模块的版本

![](https://gitee.com/osc_hh/pics/raw/master/WxOCKl.png)