layout: 'tableview'
title: 'tableview cell上播放倒计时'
date: 2016-07-07 16:09:53
tags:
---

# tableview cell 上播放倒计时

## 项目中有用到cell上播放倒计时，遇到很多的坑，在这里总结一些以免下次再遇到

- 1 第一条跟NStimer无关  只是平时项目中的细节问题，一定要注意block中的循环引用问题，这里有两种方法 

```objectivec

      // 第一种创建一个self弱引用
      #define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
      //第二种就是如果项目中用到了reactivecocoa这个第三方的话 使用     @weakify（self）
      @Strongify（self）
       
 ```
      
       
<!--more-->
      
### 这两个是成对出现的block外用@weakify block里面用@strongify（今天发现好多控制器请求数据的时候没有严格使用，导致很多控制器没有释放）

- 2 这里只说我自己遇到的问题及解决办法，基本的介绍就不再说了 

  （1）定时器如果要循环的话需要加入到runloop中
  
  
        [[NSrunLoop currenRunLoop] addTimer:_timerforMode:NSRunLoopCommonModes]
        
   (2)定时器创建的线程和释放的线程应该在同一个线程，否则的话无法释放有兴趣的同学可以试一下
   
   



  ```objectivec
  
       //创建
      dispatch_async(dispatch_get_main_queue(), ^{
        if (self.time) {
            [self.time invalidate];
        }
        self.time = [NSTimer ez_scheduledTimerWithTimeInterval:1    block:^{
            NSDate *currentDate =[NSDate date];
            NSCalendar *calendar = [NSCalendar currentCalendar];
            
            NSCalendarUnit  unit = NSDayCalendarUnit | NSCalendarUnitHour | NSCalendarUnitMinute  | NSCalendarUnitSecond;
            NSDateComponents *commponent = [calendar components:unit fromDate:currentDate toDate:[NSDate dateWithString:weakSelf.endTime ] options:NSCalendarWrapComponents];
            
            
            NSDate *dt = [[NSDate dateWithString: weakSelf.endTime] earlierDate:currentDate];
            NSLog(@"-------------------%@",weakSelf.endTime);
            //    self.getPrimeRate.enabled =YES;
            
            if([dt isEqualToDate:[NSDate dateWithString:weakSelf.endTime ]])
            {
                [weakSelf.time invalidate];
                weakSelf.countDownLabel.text = @"⚡️距离开放认投剩余0天00时00分00秒";
                
            }else
            {
                weakSelf.countDownLabel.text = [NSString stringWithFormat:@"⚡️距离开放认投剩余%zd天%02zd时%02zd分%02zd秒",commponent.day,commponent.hour,commponent.minute,commponent.second];
                
            }
        } repeats:YES];
    });
```

这里是释放  

```objectivec

    dispatch_async(dispatch_get_main_queue(), ^{
                 @strongify(self)
                 [self.time invalidate];
                 self.time = nil;
                 NSLog(@"timer停止了");
             });
  ```

 **注 这里我使用的是一个NStimer的分类原文有详细介绍就是创建一个对self弱引用的Nstimer[原文](http://blog.callmewhy.com/2015/07/06/weak-timer-in-ios/)**  
 
- 3 由于cell的重用问题 每次控制pop或者dismiss的时候，都不能够释放所以尤其是在和定时器一起用的时候要特别的注意循环引用的问题 ，我就是 遇到了这样的问题感觉很坑的 ，我们要想释放cell就需要知道 控制器的UIviewcontroller的dealoc方法 那么我们怎么才能在cell中得到cell所在的控制器呢  为了降低耦合度 有网友想到了给view添加一个扩展的方法原文[在这](http://www.jianshu.com/p/94729046ea31)原文有循序渐进的讲解为什么但是最终没有完全解决我遇到的问题，很不错了

 核心代码 ：
 
 ```objectivec
 
    - (UIViewController*)getViewController
	{
	    for (UIView* next = [self superview]; next; next = next.superview)
	    {
        UIResponder* nextResponder = [next nextResponder];
        
        if ([nextResponder isKindOfClass:[UIViewController class]])
        {
            return (UIViewController*)nextResponder;
        }
    }
    
    return nil; }
```
 其实是使用响应者链得到对应的Controller 这样的话cell就可以得到对应的Controller 然后使用RAC得到控制器销毁的消息发送时刻释放定时器。
 
 核心代码如下 :
  
 ```objectivec
 
    - (void)didMoveToSuperview
		{
		    UIViewController *controller = [self getViewController];
		    //这里需要判断相应的controller是否存在
		    if (controller){
		        @weakify(self)
		        [controller.rac_willDeallocSignal
		         subscribeCompleted:^{
		             @strongify(self)
		             [self.countDownTimer invalidate];
		             self.countDownTimer = nil;
		         }];
		    }
		}
		
```
 **这里释放的时机很重要使用上面的扩展需要Cell被添加到视图树之后才能获取到需要的UIViewController,不然得到会是一个空。那么怎么保证Cell一定被添加到视图树呢。UIView有个方法叫didMoveToSuperview,它会在该视图的父视图改变的时候被调用**


- 4最后的时候发现虽然好了很多打印的时候仍然有一个定时器不能释放 ，试了很多的办法都不行 所以 就在cell 的dealoc方法中又释放了一次就好了具体是什么原因暂时还没发现，希望有知道的大神能够说一下啊，毕竟自己还是一个菜鸟。

  最后又发现了一个好的例文还没仔细看[【iOS】TableViewCell上展示倒计时](http://www.jianshu.com/p/8ae4c65f4313);
  
  好了先写这么多，有想起来的再补充吧。


  