---
title: test
date: 2023-01-01 19:45:20
tags: [Java使用正则替换时遇到的坑]
---

首先说明需求

有个xxx.api.abc.com需要替换成config.abc.com

这个是可以用正则做到的，如下

```java
String oldUrl = "xxx.api.abc.com";
String newUrl = oldUrl.replaceAll(".*\.api", "config"); //报错
```

查了下，发现正则要用两个斜杆\\\，所以改成

```java
String newUrl = oldUrl.replaceAll(".*\\.api", "config")  //OK
//或者下面的更简单
String newUrl = oldUrl.replaceAll(".*api", "config")  //OK
  
```

之所以有坑，是因为java里的`\`有一定含义，反斜杠 `\` 在 Java 中表示转义字符

这里例举两个特别重要的用法：

- 在匹配 `.` 或 `{` 或 `[` 或 `(` 或 `?` 或 `$` 或 `^` 或 `*` 这些特殊字符时，需要在前面加上 `\\`，比如匹配 `.` 时，Java 中要写为 `\\.`，但对于正则表达式来说就是 `\.`
- 在匹配 `\` 时，Java 中要写为 `\\\\`，但对于正则表达式来说就是 `\\`
- 其他类似`\d`在Java里要写成`\\d`

Java 中的正则表达式字符串有两层含义，首先 Java 字符串转义出符合正则表达式语法的字符串，然后再由转义后的正则表达式进行模式匹配

