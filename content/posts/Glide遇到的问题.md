---
title: Glide遇到的问题
date: 2019-04-13 17:18:28
tags: [Glide]
---
## 在RecyclerView中notifyDataSetChangedd的时候闪烁
这个问题是在item中某一项需要刷新的时候出现的，本来imageview不用刷新，结果还是刷新了，并且闪烁了一下，解决方法参考：[链接](https://github.com/bumptech/glide/issues/527)

解决方法一：

``` java
RequestOptions options = new RequestOptions().transform(new GlideCircleTransform()).placeholder(view.getDrawable());
Glide.with(Utils.getContext()).load(url).apply(options).into(view);
```
解决方法二：

``` java
RequestOptions options = new RequestOptions().transform(new GlideCircleTransform()).dontAnimate().fitCenter();
Glide.with(Utils.getContext()).load(url).apply(options).into(view);
```


