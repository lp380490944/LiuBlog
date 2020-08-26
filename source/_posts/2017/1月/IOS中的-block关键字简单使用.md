---
title: ' IOS中的__block关键字简单使用'
date: 2017-01-10 17:11:27
tags: 内存管理
---

###  1.__block 什么开始后使用 ？
结论: 在block里面修改局部变量的值都要使用__Block修饰。
###  2.在block中对一个数组执行添加操作，这个数组需要声明成__block么？

答案：不需要声明成__block ,因为testArray的指针并没有改变(往数组里面添加对象，数组的指针是没有改变的，只是指针指向的内存里面的内容变了)

### 3.在block里对NSInterger的值进行修改,这个NSIterger变量是否需要用__block修饰？
<!--more-->
答:NSInterger的值发生变化,需要添加__block进行修饰.

示例代码

```objectivec


    NSMutableArray * testArray = [NSMutableArray arrayWithObjects:@"1",@"2",@"3", nil];
    __block NSInteger foo = 100;
    
    void (^testBlock)() = ^{
      
        [testArray addObject:@"99"];
        
        foo = 50;
    };
    testBlock();
    NSLog(@"%@",testArray);
    NSLog(@"%ld",foo);
    
    
 ```
 
 打印结果:
 2017-01-10 17:47:45.201 block内存测试[4768:2423415] (
    1,
    2,
    3,
    99
)
2017-01-10 17:47:45.201 block内存测试[4768:2423415] 50

