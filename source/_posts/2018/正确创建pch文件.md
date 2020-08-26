---
title: 正确创建pch文件
date: 2018-08-17 15:15:35
tags:
---
>平时经常会在项目的初期创建pch文件这里我们详细的总结一下整个创建过程加深一下记忆

### 1.创建pch文件 
![5b7676f0d5e7d.png](https://i.loli.net/2018/08/17/5b7676f0d5e7d.png)


### 2.打开预编译
- 点击target 选择build settings 
- 搜索prefix
- 设置precompile Prefix Header 为YES
- ![5b767949e8a2a.png](https://i.loli.net/2018/08/17/5b767949e8a2a.png)

### 3.添加pch路径
未添加路径前是这样的
![5b767e2a97571.png](https://i.loli.net/2018/08/17/5b767e2a97571.png)
我们直接把项目工程中的pch拖拽到这个位置
![5b767ed00f1ce.png](https://i.loli.net/2018/08/17/5b767ed00f1ce.png)
>这里显示的就是绝对路径，但是我们的工程换个地方也是要运行的所以需要的是相对路径我们对比工程目录把工程的根目录替换为$(SRCROOT)/即可

替换之后的路径是这样的
![5b767f6e72a39.png](https://i.loli.net/2018/08/17/5b767f6e72a39.png)
编译一下就成功了，我们可以随意的导入自己常用的类库和文件了。
ok over,是不是很easy.