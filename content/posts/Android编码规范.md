---
title: Android编码规范
date: 2019-06-14 10:07:09
tags: 规范
---

### Android编码规范


#### 命名规范

1.  包命名及分包结构规范
    
    *   包名沿用 Java 编程的通用风格
2.  类命名规范
    
    *   基本的类名沿用 Java 编程的通用风格（采用完整的英文描述符，所有单词第一个字母大写，采用驼峰式命名）
        
    *   android 特有的类，如 Activity、Fragment、Service、Provider、Adapter、View 等，则以对应的类型单词为后缀
        
3.  接口命名规范
    
    *   类命名以大写字母 I 为前缀，如果是监听接口以 Listener 结尾
        
    *   在自定义的监听接口里，监听事件以 on 开头, 如 onOpenMenu(), onRefresh()...
        
4.  方法命名规范
    
    *   方法命名沿用 Java 编程的通用风格（采用完整的英文描述符，函数名字以代表函数功能的英文单词组成，除首单词小写，其他单词首字母大写；一般的，函数第一个单词要求用动词）
5.  变量命名规范
    
    *   boolean 成员要以 is 开头，或以 has 开头。如： isFirst, hasMore
        
    *   控件命名规范： 原则是 “view 的缩写 + 功能描述”。 比如一个 TextView 缩写为 tv(驼峰命名抽取出来的缩写)， 这个 TextView 是显示用户名字的， 所以就可以命名为: tvUserName。
        
    *   常量的名字全部大写，单词之间用’_’分开
        
    *   控件命名规范： 原则是 “view 的缩写 + 功能描述”。 比如一个 TextView 缩写为 tv(驼峰命名抽取出来的缩写)， 这个 TextView 是显示用户名字的， 所以就可以命名为: tvUserName
        

| TextView : tv | EditText : et | Button : btn | ImageButton : ib |
| --- | --- | --- | --- |
| ImageView : iv | CheckBox : cb | RadioButton : rb | ProgressBar : pb |
| Seekbar : sb | ScrollView : sv | ListView : lv | GridView : gv |
| WebView : wv | ViewPager : vp | ExpandableListView : elv |

#### 格式规范

1.  注释规范
    
    *   文件头注释（文件要加文件头）
        
        ```
        /**
        * @author xxxx
        * @date xxxx年xx月xx日
        * Copyright xxxx. All rights reserved.
        */复制代码
        ```
        
    *   类／接口注释 (必须注明类／接口的编写目的、用途)
        
        ```
        /** 
        * 类或接口的作用描述
        * @author XXX<email>
        * @version xxxx-xx-xx（xxxx-xx-xx为年月日)
        * Copyright XXXX. All rights reserved.
        */复制代码
        ```
        
    *   方法头注释
        
        ```
        /**
        * 方法的描述
        * @param 参数的描述
        * @return 返回类型的描述
        * @exception 异常信息的描述
        */复制代码
        ```
        
    *   方法体注释
        
        使用 "//" 进行注释，注释的内容包括：
        
        *   控制流结构说明
        *   变量说明
        *   复杂代码说明
        *   处理顺序说明
2.  空行使用规范
    
    *   package 和 import 之间要空一行
        
    *   给不同功能的代码块之间加上空行， 提升可读性
        
3.  括弧使用规范
    
    *   括号沿用 Java 风格，即左弧号 {是在方法声明这一行，而不是 C++ 式的另起一行
        
    *   即使只有一行内容， if/else/for/while 等条件或循环，都要加上大括号 { }
        
4.  代码位置放置规范
    
    *   Activity 以 onCreate() 作为第一个方法， 其它类以构造函数做为第一个方法。 提高可读性
        
    *   功能上相近，有调用关系的函数尽量紧挨在一起
        
    *   Activity、Fragment 这些 android 里面具备生命周期的类，尽量把生命周期的方法按顺序排到一起，提高可读性
        
    *   内部类／接口建议统一放在文件的开头或者结尾
        

#### 优化

1.  尽量不要有重复代码。 一发现有重复代码，就要进行重构，抽取出一个公有类 / 方法
    
2.  有大量 if/else 时，考虑是否能用策略模式、模板方法模式、面向接口编程来消除这种大量的 if/else
    
3.  一个 JavaBean 类， 比如就是存一些数据的一个 Response 类，如果是要开放一个成员给别人用， 这个成员又有 getter，又有 setter， 那就直接声明为 public。
    
4.  layout 文件中， 层数不要过多， 尽量控制在 6 层以内。 当然，层数越少越好。
    
5.  对于一个布局文件中的控件具备大量相同的属性的时候，考虑将这些共同属性提取为 style 进行使用
    
6.  写布局文件需要观察布局的效果的时候，使用 tools:xxx，不要直接使用 android:xxx
    
7.  对于 activity 中常用的自己定义的 initView、initData 这些方法抽象出来放到对应的基类当中
    
8.  在设计某些功能、逻辑复杂的类或模块的时候，建议另外写一份设计文档，方便后人理解。
    

#### 适配

* 长宽用 dp 做单位， 一般不推荐用 px。 如果有特殊理由， 可以用 px，比如一条分隔线就只有 1px 宽。


