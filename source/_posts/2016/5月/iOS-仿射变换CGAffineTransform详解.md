---
title: iOS 仿射变换CGAffineTransform详解
date: 2016-05-25 14:36:49
tags:
---


# iOS 仿射变换CGAffineTransform详解

-原文在[这里](http://www.jianshu.com/p/6c09d138b31d)根本看不懂

但是我知道了 ：

     self.view.transform=CGAffineTransformIdentity；
     
     
     
  这句话的 作用是 重新初始化（也就是重置 坐标系）要不然只能播放一次。不加这句的话，再点击播放也不会因为坐标系是改变过的，没有重置 而且  CGAffineTransformIdentity； 是系统给的固定值。暂时就知道这些。