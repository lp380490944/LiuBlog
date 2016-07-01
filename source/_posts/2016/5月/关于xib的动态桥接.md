---
title: 关于xib的动态桥接
date: 2016-05-25 23:17:47
tags:
---
 
 
# 关于xib的动态桥接

## xib作为一个轻量级的IB非常好用，但是有些场景下就显得有些尴尬了

- 当一个xib创建的自定义视图用到了另外的一个自定义视图的时候就特别的麻烦了，还好看到了[这篇文章](http://blog.sunnyxx.com/2014/07/01/ios_ib_bridge/)，写的很好，等回头慢慢琢磨


- 另外xib创建的自定义控件 加载的时候用一下方法：


	    NSArray* nibView = [[NSBundle mainBundle] loadNibNamed:@"VisitView" owner:nil options:nil];
	    VisitView * view = [nibView firstObject];
	    view.backgroundColor = [UIColor redColor];
	
	    return view;

 这里的VisitView就是我用xib创建的自定义View。