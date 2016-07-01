---
title: 关于tableView数组越界的问题处理
date: 2016-05-24 23:28:22

tags: tableview
---

#关于tableView数组越界的问题处理

###使用懒加载
- 使用懒加载的数组只创建一次刷新数据的时候要记得移除所有的数组元素

      [self.dataArray removeAllObjects];
      
      
- 判断数组为空时候的越界问题当首次数据没有请求完毕的时候[tableVIew reloadData];就会导致crash这个时候需要做一次判断：

      if(self.dataArray.count != 0){
       
       MOdel * model = self.dataArray[indexPath.row];
      }
      
      
 - 有时候会出现上拉加载更多后点击下拉出现crash 这个时候提示数组越界但是并不是真的越界 因为这个时候的indexpath.row > 数组的元素个数的。所以需要以下处理：
	 
	     if(!indexpath.row > self.dataArray.count){
	     
	     Model* model = slef.dataArray[indexpath.row];
	     
	     }