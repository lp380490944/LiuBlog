---
title: iOS UITableView 的beginUpdates和endUpdates
date: 2016-07-29 16:21:04
tags:
---
#  iOS UITableView 的beginUpdates和endUpdates


#### 今天在看大神写的代码的时候发现了这样的一段

```objectivec

    if (adapter.cellType == kShowTextCellNormalType) {
        
        adapter.cellType = kShowTextCellExpendType;
        
        adapter.cellHeight = model.expendStringHeight;
        [self.tableView beginUpdates];
        [self.tableView endUpdates];
        [self expendState];
        
    } else {
    
        adapter.cellType = kShowTextCellNormalType;
        
        adapter.cellHeight = model.normalStringHeight;
        [self.tableView beginUpdates];
        [self.tableView endUpdates];
        [self normalState];
    }
    
```

这里只看关键的两句
```objectivec
        
        [self.tableView beginUpdates];
        [self.tableView endUpdates];
        
```
   第一次遇到这样的写法很是诧异看了一下苹果的官方文档是这样解释道的：
   
   > Call this method if you want subsequent insertions, deletion, and selection operations (for example, cellForRowAtIndexPath: andindexPathsForVisibleRows) to be animated simultaneously. This group of methods must conclude with an invocation ofendUpdates. These method pairs can be nested.
If you do not make the insertion, deletion, and selection calls inside this block, table attributes such as row count might become invalid. 
You should not call reloadData within the group; if you call this method within the group, you will need to perform any animations yourself.

** 一般当tableview需要同时执行多个动画时，才会用到beginUpdates函数，它的本质就是建立了CATransaction这个事务。我们可以通过以下的代码验证这个结论 **

```objectivec

        [CATransaction begin];

		[CATransaction setCompletionBlock:^{
		    // animation has finished
		}];
		
		[tableView beginUpdates];
		// do some work
		[tableView endUpdates];
		
		[CATransaction commit];
		
		
		
######  这段代码来自stackoverflow，它的作用就是在tableview的动画结束后，执行需要的操作。这段代码好用的原因就是beginUpdates本质上就是添加了一个动画事务，即CATransaction，当然这个事务可能包含许多操作，比如会重新调整每个cell的高度（但是默认不会重新加载cell）。如果你仅仅更改了UITableView的cell的样式，那么应该试试能否通过调用beginUpdates 和 reloadRowsAtIndexPaths 来实现效果，而不是调用tableview的reloadData方法去重新加载全部的cell！


带有动画效果重新加载cell的代码

```objectivec	
		[tableView beginUpdates];
		[tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:tmp] withRowAnimation:UITableViewRowAnimationAutomatic];
		[tableView endUpdates];```

#### 一般的想要点击cell高度的时候可以在```didSelectRowAtIndexPath:```方法中
改变cell的数据源然后调用 




```objectivec

	  [tableView beginUpdates];
	  [tableView endUpdates];
	  
```

就会自动的调用```heightForRow```方法了

![此图转自网络](http://images.cnitblog.com/blog/493542/201402/061151017595013.png)
