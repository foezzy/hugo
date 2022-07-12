---
title: Android Studio 使用相关
date: 2019-08-12 13:52:14
tags: Android Studio
---

## 记录Android Studio使用过程中，配置的快捷键，插件相关的东西（Mac平台）

---

### 快捷键
#### 在Finder快速打开某个文件或文件夹
本来这个东西是挺简单的，结果找了有一会，特地记录下  

直接右键有个选项 - Reveal in Finder  

![pic](https://gitee.com/osc_hh/pics/raw/master/71Q1U2.png)

但是每次去找都是在一堆选择中找它，特别不方便  

想找个什么插件也没有找到能直接打开的，后来突然想到可以设置快捷键  
这个Reveal in Finder默认是没有快捷键的~ 有点奇葩

解决方法：  

在Preferences - Keymap - 搜索 Reveal in Finder - 双击它 - Add Keyboard Shortcut  

![pic](https://gitee.com/osc_hh/pics/raw/master/iBDBYO.png)

设置成上面这样，就是直接按F键就行了，然后Apply - 确定，以后在Finder里打开直接双击F键就行了，非常方便

***

勘误：

这种做法不太好，在开始使用后发现按F没反应，就是说不能直接用某个按键去操作，要加上功能键才行

目前改为 control + ,  来实现打开文件夹目录的功能



### 自动保存
#### 在输入一行或者多行代码后按 command + s 自动格式化代码
Android Studio默认是自动保存代码的，不需要按 command + s 按钮，但是每次代码都不能自动格式化，需要录制一个宏（相当于自动操作），然后给这个宏设置快捷键，然后就能实现自动格式化了
在mac上默认格式化的快捷键是option+command+l，所以本质是把这个快捷键映射成 command + s 而已，因为更符合操作习惯，具体操作见下面链接：
[录制宏](https://www.jianshu.com/p/8f982253eb9e)

其中设置代码风格的方式有默认的，也可以自己引入xml文件，参考链接：
[Android Studio 配置 Code Style](https://www.jianshu.com/p/6f78b59caf2c)

这样设置之后，在保存的时候，就默认已经格式化完成了

后文：
使用过程还发现xml文件也会格式化，但是还自动重新排序了，这样会导致布局文件异常，解决方案看下面链接：
[格式化 xml 文件时代码错乱问题](https://blog.csdn.net/hdhdgdhdh/article/details/100012810)



### 书签

Android Studio 自带的书签功能，挺好用的，要用起来

默认情况下，菜单栏的 Navigate - Bookmarks 就可以操作书签，这里设置一下快捷方式，让它更好用

添加到书签 Toggle Bookmark 这个是说你选中一行 然后选中这个选项，就添加到书签里，我设置成快捷键 F1

![](https://gitee.com/osc_hh/pics/raw/master/PuSYU8.png)

显示书签，没什么好说的

![](https://gitee.com/osc_hh/pics/raw/master/nO1OEv.png)

然后打开书签还可以设置别名，方便查看，书签就这么多常用功能了~

![](https://gitee.com/osc_hh/pics/raw/master/lUvNZI.png)



### 插件

//todo

