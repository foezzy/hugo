---
title: LiveData数据丢失问题
date: 2023-11-12 19:45:20
tags: [LiveData]
---

LiveData一个具有生命周期感知能力的观察者模式，是在页面与数据分离中维持页面和数据的一致性的桥梁。

## 基本使用

一般在ViewModel中定义

```kotlin
val uiStatusLiveData = MutableLiveData<LoginUiStatus>()
```

在需要通知页面的数据变化的时候，将消息发布

```kotlin
val status = LoginUiStatus()  
status.needDismissDialog = true  
uiStatusLiveData.postValue(status)
```

在activity或者fragment中只要注册观察着就好了

```kotlin
viewModel.uiStatusLiveData.observe(this) { status ->  
   //更改UI的代码
} 
```

以上就是简单的使用，然而在使用过程中出现了一个问题：发送数据丢失。

## 数据丢失问题

事情的起因是这样的，我在viewmodel中周期性的发一个消息去通知UI改变，在周期之外，还发了其他的消息。可是有时候却收不到周期之外的消息。于是去查源码看看问题出在了哪。

```kotlin
protected void postValue(T value) {  
    boolean postTask;  
    synchronized (mDataLock) {  
        postTask = mPendingData == NOT_SET;  
        mPendingData = value;  
    }  
    if (!postTask) {  
        return;  
    }  
    ArchTaskExecutor.getInstance().postToMainThread(mPostValueRunnable);  
}
```

这代码就有意思了，如果一次发送很多，LiveData来不及发送的话，他就会丢弃最早获取的而只发送最后一个消息。如果一次发送消息太多的时候，重要的中间态消息会被丢弃。

那么发送消息还有另一个方法即setValue()

```kotlin
@MainThread  
protected void setValue(T value) {  
  assertMainThread("setValue");  
  mVersion++;  
  mData = value;  
  dispatchingValue(null);  
}
```

这个方法不会丢失消息，但是只能在主线程中使用

## 总结

setValue方法，不会丢失消息，但是必须在主线程中使用

postValue方法，会丢失消息，可以在子线程中使用
