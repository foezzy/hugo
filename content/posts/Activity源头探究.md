---
title: Activity源头探究
date: 2019-3-21 12:40:09
tags: [Activity源头]
---
## 疑问


- 开发中通过 startActivity() 创建 Activity 对象到底被谁持有引用了？
- 新启动的 Activity 对象在其生命周期中理应是一直被持有引用，不然系统 gc 的时候就会被回收掉，那么其中的引用关系是怎样的呢？

## Activity 对象的创建
Activity 的创建会回调到 ActivityThread 中的 handleLaunchActivity() 方法：

>frameworks/base/core/java/android/app/ActivityThread.java:
>
``` java
@Override
public Activity handleLaunchActivity(ActivityClientRecord r,
      PendingTransactionActions pendingActions, Intent customIntent){
      ···
      final Activity a = performLaunchActivity(r, customIntent);
      ···
      return a;
}
```

接着在 performLaunchActivity() 方法里找到了 Acitivity 实例的创建：

``` java
private Activity performLaunchActivity(ActivityClientRecord r, Intent customIntent) {
    ···
    ContextImpl appContext = createBaseContextForActivity(r);
    Activity activity = null;
    try {
      // 注解1：通过 ClassLoader 以及目标 Activity 的类名来创建新的 Activity 实例
        java.lang.ClassLoader cl = appContext.getClassLoader();
        activity = mInstrumentation.newActivity(
                 cl, component.getClassName(), r.intent);
        ···
    }
    ···
}
```

Activity 相关的创建工作交由给了 Instrumentation 类处理：

>frameworks/base/core/java/android/app/Instrumentation.java:

``` java
public Activity newActivity(ClassLoader cl, String className,Intent intent)
      throws InstantiationException, IllegalAccessException,
      ClassNotFoundException {
      String pkg = intent != null && intent.getComponent() != null
                  ? intent.getComponent().getPackageName() : null;
      return getFactory(pkg).instantiateActivity(cl, className, intent);
}
```

最终的创建工作由进一步交由工厂类 AppComponentFactory 实现：

>frameworks/base/core/java/android/app/AppComponentFactory.java:

``` java
public @NonNull Activity instantiateActivity(@NonNull ClassLoader cl, 
    @NonNull String className,
    @Nullable Intent intent)throws InstantiationException, 
    IllegalAccessException, ClassNotFoundException {
    return (Activity) cl.loadClass(className).newInstance();
}
```

至此就完成了Activity的创建



