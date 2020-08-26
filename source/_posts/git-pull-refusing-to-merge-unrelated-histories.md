---
title: git pull refusing to merge unrelated histories
date: 2018-08-20 11:02:09
tags: git
---
如果合并了两个不同开始提交的仓库的时候，在2.9.2之后的git会发现这两个仓库可能不是同一个，为了防止开发者上传错误，于是给出如下的提示
>fatal: refusing to merge unrelated histories

如果我在github新建了一个仓库 写了readme ，让后再把本地的一个已经存在的仓库上传到github的时候。会发现github的仓库和本地的仓库没有共同的commit 所以不让提交，认为是写错了origin 如果开发者确定就是要用的origin就可以使用--allow-unrelated-histories告诉git自己是确定的
 遇到无法提交的问题最好是先pull一下使用
 ```git pull origin master``` 发现无法pull git 输出
 ```refusing to merge unrelated histories ```
我们就需要把两个不同的项目合并git pull 之后需要添加 --allow-unrelated-histories告诉git需要不相关的历史合并如果我们的源是origin， 分支是master那么我们就需要这么写
```git pull origin master --allow-unrelated-histories```
 如果设置过了默认的分支就可以
 ```git pull --allow--unrelated--histories```
 这样就解决问题了bingo!