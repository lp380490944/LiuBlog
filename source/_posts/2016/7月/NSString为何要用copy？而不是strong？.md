---
title: NSString为何要用copy？而不是strong？
date: 2016-07-21 11:17:00
tags:
---


**  这里仅仅是一个备注。 **

####   在一些model的属性中我们常常使用的是 copy而不是strong 这到底是为什么呢？平时用的时候倒是看不出来但是 到了关键时候可能就是一个大坑了。。这里我们来稍微的深究一下哈。。



这里我们创建一个model类

```objectivec

     #import <Foundation/Foundation.h>
     
    
	   @interface Model : NSObject
	   @property(nonatomic,strong)NSString * name;
	   @end

```

<!-- more-->


在我们的控制器中引入model 并对model 的name 属性进行赋值

```objectivec



     - (void)viewDidLoad {
	      [super viewDidLoad];
	    
	    NSMutableString * str  = [[NSMutableString alloc] init];
	    str.string = @"张三";
	    Model * model = [Model new];
	    
	    model.name = str;
	    NSLog(@"model.name = %@",model.name);
	    
	    
	    
	    [str appendString:@"新增加的"];
	    NSLog(@"model.name = %@",model.name);
	        
	}
	
```
 我们来看下打印结果：

![Paste_Image.png](http://upload-images.jianshu.io/upload_images/67179-6885d05c13a76787.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

*你会看到两次的打印结果不一样 同个model的名字竟然会改变这显然是不科学的  也就是说 在strong相当于MRC下的Retain 只是对name指向的对象进行了引用计数+1.当原始的字符串发生改变的时候 model.name 也会随着改变。

而copy 这里指的是深拷贝，也就是拷贝的是对象，并不是指针哈。

无论原来的对象如何改变都不会影响到  model.name的。


  > ** talk is cheap show my code  **

   
 
```objectivec
 
 
	  #import <Foundation/Foundation.h>
	
	 @interface Model : NSObject
	 @property(nonatomic,copy)NSString * name;
	 
	 @end
	 
```
再次打印结果 ：


![Paste_Image.png](http://upload-images.jianshu.io/upload_images/67179-835f5ce30bb7c731.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

### OK 这次总算是弄明白了为什么要用copy了吧。哈哈  鼓掌。