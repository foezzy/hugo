为什么要写这一篇随笔呢？最近做项目的过程中，遇到很多页面在要显示文本时，有一部分是固定的文本，有一部分是动态获取的，并且格式各式各样。一开始采取比较笨的办法，把他拆分成一个个文本控件，然后对不同的控件采用不同的样式。这样做效率

很低，并且文本之间的对齐是个很大的问题，后来到网上寻求帮助，找到一些有关Android字符串和字符串资源格式化的文章，在此做一个总结。

**一.字符串格式化**

Java的String类给我们提供了两个重载的格式化字符串的方法，可以通过占位符的方式，向固定字符串中传入参数。他们分别是：

format(String format, Object... args) 新字符串使用本地语言环境，制定字符串格式和参数生成格式化的新字符串。

format(Locale locale, String format, Object... args) 使用指定的语言环境，制定字符串格式和参数生成格式化的字符串。

例如：

字符串占位符%s ：System.out.println("Hi,%s", "王力")  输出  Hi,王力

十进制整形占位符%d ：System.out.println("我今年%d岁", 20)  输出  我今年20岁

浮点型占位符%f：System.out.println("荔枝的价格是 %f 元", 3.5)  输出 荔枝的价格是3.5元

还有其他字符型，整形，日期格式等等格式化方法，再次就不一一举例了。

**二.带HTML标签的字符串格式化**

当我们需要对一段文字的部分文字进行字体颜色，字形，字体风格设置时，我们可以使用HTML标签，然后在输出的时候，通过Html.from方法解析为html字符串。

例如：
```
String str = "后面的文字是加粗的红色文字：" + "<font color='#ff0000'><b>加粗红色文字</b></font>";
CharseQuence cq=Html.from(str);
textView.setText(cq);
```

第一种情形和第二种情形可以结合起来使用：
```
String str = "后面的文字是加粗的红色文字：" + "<font color='#ff0000'><b>%s</b></font>";
String str2=String.format(str,"红色加粗文字");
```
输出与上面一样.

**三.字符串资源的格式化**

我们在字符串资源中同样可以通过占位符来给字符串传入参数，不过与第一种方式相比，占位符的格式略有不同

我们使用%\[index\]$\[type\]格式进行标记，index标记替换资源中第index个资源对应的位置，type则标示所要替换的资源的类型（s表示资源为字符串格式）

例如：

<?xml version="1.0" encoding="utf-8"?>
<resources\>
    <string name\="hello"\>Hello World, my name is %1$s!</string\>
    <string name\="app\_name"\>MyString</string\>
</resources\>

TextView mytext = (TextView)findViewById(R.id.mystring);
String myname \= getString(R.string.hello);
myname \= String.format(myname, "yinghui");
mytext.setText(myname);

如果需要同时传入多个参数，则需要改变index，顺序一一对应。例如%1$s  %2$s等等

**四.带HTML标签的字符串资源的格式化**

 由于Android开发中的字符串资源是保存在XML文件中，因为Html中的<, >，&有特殊含义，(前两个字符用于链接签，&用于转义)，不能直接使用。使用这三个字符时，应使用它们的转义序列。

例如：

我们需要在XML中保存这个字符串<b>我是加粗文字</b> 需要将<转义为&lt;或者&#60; ，需要将>转义为&gt;或者&#62(这里也可以不转义)

代码：

<string name\="format2"\>&lt;b&gt;我是加粗文字&lt;/b&gt;</string\>

需要说明的是：  
　　　　a. 转义序列各字符间不能有空格；  
　　　　b. 转义序列必须以“;”结束；  
　　　　c. 单独的&不被认为是转义开始。  
　　　　d. 区分大小写　

常见的转义字符见下表：

![UUK2Bc](https://raw.githubusercontent.com/foezzy/pics/master/uPic/UUK2Bc.png)

使用方法

String str=getString(R.string.format2);
CharseQuence cq\=Html.from(str);
textView.setText(cq);

通过灵活运用以上字符串格式化的技巧，我们可以加快开发的效率，提高界面布局的美观程度。

参考资料：

[http://blog.csdn.net/wsywl/article/details/6555959](http://blog.csdn.net/wsywl/article/details/6555959)

[http://blog.163.com/djx421%40126/blog/static/4885513620104212950216/](http://blog.163.com/djx421%40126/blog/static/4885513620104212950216/)

[http://www.cnblogs.com/hyd309/p/3549076.html](http://www.cnblogs.com/hyd309/p/3549076.html)

