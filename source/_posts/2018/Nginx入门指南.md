---
title: Nginx入门指南
date: 2018-05-25 22:43:28
tags:
---
### 基本操作指令

- nginx -t 测试配置是否正确
- nginx -s reload 加载最新配置
- nginx -s stop 立即停止
- nginx  -s quit 优雅停止（完成当前任务后再退出）
- nginx -s reopen 重新打开日志



#### Nginx 全局配置

worker_processes  工作进程数 取决于CPU数量x核数

event: worker_connections  最大进程数

##### 配置虚拟主机

- 基于域名的虚拟主机

- ```objective-c
  server {
      listen 80;#监听端口号
      server_name mantou360.com;#监听域名 如有多个空格隔开
          location / {
          root html/dddd;
          index index.html;
      }
  }
  ```

只用nginx -s reload 就可以加载新的配置了。如果是PHP页面需要单独配置解析的location

##### 日志管理

#### nginx的反向代理

> 用正则表达式来匹配图片请求到另外一台服务器上去
>
> ```object 
> location ~ \.(jpeg|jpg|png|gif)$ {
>     proxy_pass http://baidu.com:80;
> 	proxy_set_header  X-Forwarded-For $remote_addr;#把用户的真实ip带到被反向代理的服务器。服务器就能收到用户的真实ip了。
> }
>
> ```

nginx -s reload 就可以了

