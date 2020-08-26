---
title: git-rebase-i-命令使用详解
date: 2018-07-26 00:01:53
tags:
---
###  git 高级功能使用详解

- rebase -i  提供交互式的 rebase 方法

  **git rebase -i HEAD~4**

  的含义就是在当前位置取前面的4个提交内容创建一个新的分支：提供可视化的方式 用鼠标拖拽排序通过**pick**按钮来来删除某个提交
<!--more-->

  提交前![5b58389e41ef7.png](https://i.loli.net/2018/07/25/5b58389e41ef7.png)

提交选择并排序

![5b5838d4aedf6.png](https://i.loli.net/2018/07/25/5b5838d4aedf6.png)

提交后

![5b583904d30fe.png](https://i.loli.net/2018/07/25/5b583904d30fe.png)