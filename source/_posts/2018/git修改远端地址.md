---
title: git修改远端地址
date: 2018-07-26 14:37:29
tags: git
---

> 在使用git的时候我们难免会修改或者添加错了远端的URL 这个时候就需要我们重新删除之后再添加这里有三种方法

### 1.直接修改

git remote set-url origin [url]



### 2.先删除在修改

```  
//删除
git remote rm origin
//添加
git remote add origin [url]
```

<!--more-->

### 3.简单粗暴 直接编辑config文件
