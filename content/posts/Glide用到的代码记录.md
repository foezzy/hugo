---
title: Glide用到的代码记录
date: 2020-05-12 10:32:00
tags: Glide
---
### 同步加载
``` java
public static void loadImgSync(Context context, String url) {
        new Thread(new Runnable() {

            @Override
            public void run() {

                FutureTarget<Bitmap> futureBitmap = Glide.with(context)
                        .asBitmap()
                        .load(url)
                        .submit();
                try {
                    Bitmap myBitmap = futureBitmap.get();
                    LogUtils.d("hei:" + myBitmap.getHeight());
                    LogUtils.d("wid:" + myBitmap.getWidth());
                } catch (ExecutionException e) {
                    e.printStackTrace();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }).start();
    }
```
### 获取宽高
#### 方式1：
``` java
Glide.with(getContext().getApplicationContext())
     .asBitmap()
     .load(path)
     .into(new SimpleTarget<Bitmap>() {
         @Override
         public void onResourceReady(Bitmap bitmap,
                                     Transition<? super Bitmap> transition) {
                                     
             int w = bitmap.getWidth();
             int h = bitmap.getHeight()
            
         }
     });
```
#### 方式2：
``` java
Glide.with(getContext()).load(imageUrl).listener(new RequestListener<String, GlideDrawable>() {
        @Override
        public boolean onException(Exception e, String model, Target<GlideDrawable> target, boolean isFirstResource) {
            return false;
        }

        @Override
        public boolean onResourceReady(GlideDrawable resource, String model, Target<GlideDrawable> target, boolean isFromMemoryCache, boolean isFirstResource) {
            //This returns 0,0
            Log.e("TAG","_width: " + resource.getBounds().width() + " _height:" +resource.getBounds().height());
            return false;
        }
    }).into(ivImage).getSize(new SizeReadyCallback() {
        @Override
        public void onSizeReady(int width, int height) {
            //This returns size of imageview.
            Log.e("TAG","width: " + width + " height: " + height);
        }
    });
```

### 宽度适应屏幕，高度自适应

``` java
public static void loadPicsFitWidth(Context context, final String imageUrl, ImageView imageView) {
                ViewGroup.LayoutParams params = imageView.getLayoutParams();

//        params.width = ScreenUtils.getScreenWidth(context) - DensityUtil.dp2px(7) * 2;//减去图片两边距,在item_classify_ad.xml的CardView里

        params.width = ScreenUtils.getScreenWidth(context) - DensityUtil.dp2px(7) * 2;//左右边距

        params.height = 100;

        imageView.setLayoutParams(params);

        Glide.with(context)

                .load(imageUrl)

                .apply(RequestOptions.bitmapTransform(new RoundedCorners(10)))

                .listener(new RequestListener<Drawable>() {

                    @Override
                    public boolean onLoadFailed(@Nullable GlideException e, Object model, Target<Drawable> target, boolean isFirstResource) {
                        return false;
                    }

                    @Override
                    public boolean onResourceReady(Drawable resource, Object model, Target<Drawable> target, DataSource dataSource, boolean isFirstResource) {
                        if (imageView == null) {
                            return false;
                        }
                        // 首先设置 imageView 的 ScaleType 属性为 ScaleType.FIT_XY，让图片不按比例缩放，把图片塞满整个 View。
                        if (imageView.getScaleType() != ImageView.ScaleType.FIT_XY) {
                            imageView.setScaleType(ImageView.ScaleType.FIT_XY);
                        }

                        // 得到当前 imageView 的宽度（我设置的是屏幕宽度），获取到 imageView 与图片宽的比例，然后通过这个比例去设置 imageView 的高
                        ViewGroup.LayoutParams params = imageView.getLayoutParams();

                        int vw = params.width;

                        float scale = (float) vw / (float) resource.getIntrinsicWidth();

                        int vh = Math.round(resource.getIntrinsicHeight() * scale);

                        params.height = vh + imageView.getPaddingTop() + imageView.getPaddingBottom();

                        imageView.setLayoutParams(params);

                        return false;
                    }
                })
                .into(imageView);

    }
```

### 监听请求
``` java
Glide.with(context).load(url)
                .listener(new RequestListener<Drawable>() {

                    @Override
                    public boolean onLoadFailed(@Nullable GlideException e, Object model, Target<Drawable> target, boolean isFirstResource) {
                        return false;
                    }

                    @Override
                    public boolean onResourceReady(Drawable resource, Object model, Target<Drawable> target, DataSource dataSource, boolean isFirstResource) {
                        //dosomething
                        return false;
                    }
                })
                .into(imageView);
```
### 带圆角的图片
#### 类型1：圆形图片

``` java
Glide.with(this).load(imgUrl).apply(RequestOptions.bitmapTransform(new CircleCrop())).into(image);
```
#### 类型2：圆角图片

``` java
Glide.with(this).load(imgUrl).apply(RequestOptions.bitmapTransform(new RoundedCorners(20))).into(image);
```



