---
title: Mac系统多个jdk版本切换配置 - 简书
date: 2023-06-23 20:35:50
tags: [jdk版本]
---

在学习一个框架时，该框架要求只能用java8编译。我的电脑上装的是java11。于是练习了一波装两个版本的java。

安装比较简单，不赘述。

安装完成后，就是配置环境变量。Mac的环境变量保存在 .bash\_profile 文件中。一般情况下，不会自动将环境变量填入其中。也就是说，虽然你的电脑里面安装了jdk，但是，.bash\_profile中并没有和jdk相关的配置。

terminal中输入

vi .bash\_profile 打开文件

插入

```bash
export JAVA_8_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_261.jdk/Contents/Home"

    export JAVA_11_HOME="/Library/Java/JavaVirtualMachines/jdk-11.0.14.jdk/Contents/Home"

    alias jdk8='export JAVA_HOME=$JAVA_8_HOME'

    alias jdk11='export JAVA_HOME=$JAVA_11_HOME'

    JAVA_HOME=$JAVA_11_HOME

    PATH=$JAVA_HOME/bin:$PATH:.

    CLASSPATH=$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/jrt-fs.jar:.

    export JAVA_HOME

    export PATH

    export CLASSPATH
```

terminal 中输入

source .bash\_profile 保存更改

通过变量

JAVA\_HOME=$JAVA\_11\_HOME

来决定使用那个版本的jdk
