---
title: iOS性能优化之离屏渲染
date: 2020-08-26 12:45:32
tags:性能优化
---
#### GPU渲染
图形的生成一般由GPU负责，而GPU渲染有一下两种形式：
- 1.On-Screen Rendering：当前屏幕渲染，意思是GPU的渲染操作是在当前用于显示的屏幕缓冲区进行的。缓冲区大小受限，一些复杂的操作可能无法完成。
- 2.Off-S窜恩 Rendering: 离屏渲染，意思是GPU的渲染操作是在屏幕的缓冲区之外进行的。

##### 离屏渲染引发的性能问题
