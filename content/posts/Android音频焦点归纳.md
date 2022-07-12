---
title: Android音频焦点归纳整理
date: 2019-12-14 15:26:42
tags: [Android,音频焦点]
---
## 前言
音频焦点是 API 8 中引入的一个概念，它主要作用于用户在同一个时刻只能关注单个音频流，或者用来降低背景声音，使用户只关注要主要的声音。在不同Android版本中，对应的代码也有区别。主要三个节点为

- 2.2 (API level 8)
- 5.0 (API level 21)
- 8.0 (API level 26)

## 2.2-5.0
申请焦点：

```
private void requestAudioFocus() {
        audioManager = (AudioManager) getContext().getSystemService(Context.AUDIO_SERVICE);
        if (audioManager != null) {
            audioManager.requestAudioFocus(mAudioFocusListener, AudioManager.STREAM_MUSIC, AudioManager.AUDIOFOCUS_GAIN_TRANSIENT);
        }
}
```
requestAudioFocus中，有3个参数，先说参数2，参数2是多种声音类型，如下：

- AudioManager.STREAM_VOICE_CALL

- AudioManager.STREAM_SYSTEM

- AudioManager.STREAM_RING

- AudioManager.STREAM_MUSIC

- AudioManager.STREAM_ALARM

- AudioManager.STREAM_NOTIFICATION

- AudioManager.STREAM_BLUETOOTH_SCO

- AudioManager.STREAM_SYSTEM_ENFORCED

- AudioManager.STREAM_DTMF

- AudioManager.STREAM_TTS

然后是参数3，也是有多个声明类型，如下：

- AudioManager.AUDIOFOCUS_GAIN：想要长期占有焦点，失去焦点者stop播放和释放
- AudioManager.AUDIOFOCUS_GAIN_TRANSIENT：想要短暂占有焦点，失去焦点者pause播放
- AudioManager.AUDIOFOCUS_GAIN_TRANSIENT_MAY_DUCK：想要短暂占有焦点，失去焦点者可以继续播放但是音量需要调低
- AudioManager.AUDIOFOCUS_GAIN_TRANSIENT_EXCLUSIVE：想要短暂占有焦点，但希望失去焦点者不要有声音播放

最后是参数1，参数1要自己写个回调：

```
private AudioManager.OnAudioFocusChangeListener mAudioFocusListener = new AudioManager.OnAudioFocusChangeListener() {
        @Override
        public void onAudioFocusChange(int focusChange) {
            switch (focusChange) {
                case AudioManager.AUDIOFOCUS_LOSS:
                    //对应AUDIOFOCUS_GAIN 表示音频焦点请求者需要长期占有焦点，这里一般需要stop播放和释放
                    // pauseMediaPlayer();
                    break;
                case AudioManager.AUDIOFOCUS_LOSS_TRANSIENT:
                    //对应AUDIOFOCUS_GAIN_TRANSIENT 表示音频焦点请求者需要短暂占有焦点，这里一般需要pause播放
                    //pauseMediaPlayer();
                    break;
                case AudioManager.AUDIOFOCUS_LOSS_TRANSIENT_CAN_DUCK:
                    //对应AUDIOFOCUS_GAIN_TRANSIENT_MAY_DUCK 表示音频焦点请求者需要占有焦点，但是我也可以继续播放，只是需要降低音量或音量置为0
                    break;
                case AudioManager.AUDIOFOCUS_GAIN:
                    //获得焦点，这里可以进行恢复播放
                    if (mediaPlayer != null) {
                       //  startMediaPlayer();
                    }
                    break;
                default:
            }
        }
    };
```

丢弃焦点：

```
private void abandonAudioFocus() {
        audioManager = (AudioManager) getContext().getSystemService(Context.AUDIO_SERVICE);
        if (audioManager != null) {
            audioManager.abandonAudioFocus(mAudioFocusListener);
        }
    }
```

## 二级标题 5.0
对于 Android 5.0 (API level 21) 或更高版本的应用程序，音频应用程序应该使用 AudioAttributes 来描述你的应用程序正在播放的音频类型。例如，播放语音的应用程序应该指定 CONTENT_TYPE_SPEECH，其实就是需要加个声明，申请焦点的方式还是没变。

``` java
private void preparePlayer(File audioFile, boolean frontSpeaker) throws IOException {
    if (mPlayer == null) {
        mPlayer = new MediaPlayer();
        mPlayer.setOnCompletionListener(this);
        mPlayer.setOnErrorListener(this);
    }


    //5.0要setAudioAttributes
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
        mPlayer.setAudioAttributes(new AudioAttributes.Builder()
            .setContentType(frontSpeaker ? AudioAttributes.CONTENT_TYPE_SPEECH :
                AudioAttributes.CONTENT_TYPE_MUSIC)
            .setUsage(frontSpeaker ? AudioAttributes.USAGE_VOICE_COMMUNICATION :
                AudioAttributes.USAGE_MEDIA)
            .build());
    }
    else {
        mPlayer.setAudioStreamType(frontSpeaker ? AudioManager.STREAM_VOICE_CALL :
            AudioManager.STREAM_MUSIC);
    }

    mPlayer.setDataSource(audioFile.getAbsolutePath());
    mPlayer.prepare();
}
```

## 8.0
和之前一样，Android8.0中也使用了requestAudioFocus()来请求音频焦点，不一样的是，使用abandonAudioFocusRequest()释放音频焦点，并且请求和释放都需要传入同一个AudioFocusRequest实例。

``` java
mAudioFocusRequest = new AudioFocusRequest.Builder(AudioManager.AUDIOFOCUS_GAIN)
        .setAudioAttributes(new AudioAttributes.Builder()
                .setUsage(AudioAttributes.USAGE_MEDIA)
                .setContentType(AudioAttributes.CONTENT_TYPE_MOVIE)
                .build())
        .setAcceptsDelayedFocusGain(true)
        .setOnAudioFocusChangeListener(mAudioFocusChangeListener)
        .build();
//请求音频焦点      
requestFocusResult = mAudioManager.requestAudioFocus(mAudioFocusRequest);
//释放音频焦点
abandonFocusResult = mAudioManager.abandonAudioFocusRequest(mAudioFocusRequest);
```

## 参考链接
- <u>[Android 音频焦点 AudioFocus 分析](https://blog.csdn.net/u014296677/article/details/79643380)</u>
- <u>[Android 音频焦点 AudioFocus 介绍和使用](https://blog.csdn.net/jacksinrow/article/details/84139585)</u>
- <u>[android音视频指南-管理音频焦点](https://juejin.im/post/5bda9c15f265da395a1dd57c)</u>

- <u>[「播放器」Android音频焦点](https://haohaozaici.github.io/2018/04/24/Android%20Sound%20overlap/index.html)</u>

