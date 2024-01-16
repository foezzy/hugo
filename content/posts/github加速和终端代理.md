---
title: github加速和终端代理
date: 2019-10-09 10:16:24
tags: [加速,代理]
---

### github加速：

解决github在访问和clone时速度太慢的问题

下载一个可以设置host的软件，比如mac上可以用iHost

然后设置下面的host

https://gitee.com/Mosiki/github/raw/master/github_hosts.txt

设置完刷新dns，就可以加速github的访问和clone了

### 终端代理：

就是在iterm2里要能访问到外网数据

比如在拉取某一个仓库时，如果这个仓库需要fq，就要用到这个东西

参考链接：https://zhuanlan.zhihu.com/p/46973701

最后是用v2ray-u加zshrc设置alias简写来简化操作，每次要用的时候输入setproxy，不用了就unsetproxy。

alias setproxy="export ALL_PROXY=socks5://127.0.0.1:1080"

alias unsetproxy="unset ALL_PROXY"