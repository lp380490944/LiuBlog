---
title: 使用jsonModel需要注意的
date: 2016-07-25 15:15:34
tags:
---




# 使用Jsonmodel需要注意事项

   **我们知道josnmodel可以帮助我们很方面的把json字符转模型 ，但是使用中需要注意以下几点**
   
   


 - 当Model的属性和json 不一致时
 
 
 ```objectivec
		 
		   {
		  "order_id": 104,
		  "order_details" : [
		    {
		      "name": "Product#1",   
		      "price": {
		        "usd": 12.95
		      }
		    }
		  ]
		}
		//以上是json字符串

		@interface OrderModel : JSONModel
		@property (assign, nonatomic) int id;
		@property (assign, nonatomic) float price;
		@property (strong, nonatomic) NSString* productName;
		@end
		
		@implementation OrderModel
		
		+(JSONKeyMapper*)keyMapper
		{
		  return [[JSONKeyMapper alloc] initWithDictionary:@{
		    @"order_id": @"id",
		    @"order_details.name": @"productName",
		    @"order_details.price.usd": @"price"
		  }];
		}
		
		@end 
		//以上是对应的 属性  只有返回的json和Model属性不一致的时候才需要这个方法keyMapper
		
	```
		
<!--more-->
- 可以设置全局的属性
```objectivec

				 [JSONModel setGlobalKeyMapper:[
				    [JSONKeyMapper alloc] initWithDictionary:@{
				      @"item_id":@"ID",
				      @"item.name": @"itemName"
				   }]
				];
```

- 属性为非必须的时候(也就是可选的，或者需要忽略的)

```objectivec

	   @property (strong, nonatomic) NSString<Optional>* name;//可选的
	   
	   @property (strong, nonatomic) NSString<Ignore>* customProperty;//忽略的
```

- ### 最后也是最重要的在实际使用中发现基本数据类型 float NSInterger 等无法直接使用<Optial>最后找到的解决办法是设置全局可选
例如我做的cell自适应高度的时候  cell的高度是存储在Model的属性中的需要设置可选

```objcetivec

      @property(nonatomic,assign)float  height;//缓存的高度
      +(BOOL)propertyIsOptional:(NSString*)propertyName
	{
	  if ([propertyName isEqualToString: @"height"]) return YES;
	  return NO;
	}

```


