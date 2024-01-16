---
title: gitignore总结
date: 2020-01-16 11:45:22
tags: [gitignore]
---

##gitignore生效操作

###场景一：某个文件已经被追踪
比如Android项目下.idea文件夹，里面已经有某些文件提交过，要忽略.idea文件夹下所有文件
先在.gitignore文件夹添加/.idea，表示忽略.idea下所有文件

接着删除缓存

```
git rm -r --cached ./.idea
```

这个命令把之前跟踪的.idea目录下所有文件的缓存给删了，然后需要push到远程项目地址就OK了，本地.idea下有修改都不会被检测到了

说明：所有文件指的是多级目录，git update-index --assume-unchanged 这个命令也能清除追踪，但是只能指定文件，所以不用这个命令

#### 场景二：未提交项目，要忽略的文件夹下的文件还未被追踪
直接在.gitignore文件夹添加/.idea，表示忽略.idea下所有文件，然后直接push就可以了


