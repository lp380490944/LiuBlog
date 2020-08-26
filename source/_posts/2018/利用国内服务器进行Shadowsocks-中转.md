---
title: 利用国内服务器进行Shadowsocks中转
date: 2018-07-30 14:03:42
tags: ss
---
> 说一下背景。本来是有两台香港的服务器的。但是不知道具体是什么原因。某些香港的ip段被youtube封了。
- 这也不是个例讨论在[v2ex](https://www.v2ex.com/t/368608#reply85)上
现在由于在国内洛杉矶的服务器带宽本来很高。但是网速还是很慢。于是乎就想着中转下。虽然我走了就很多的弯路。但是其实回头想想还是很简单的。
主要就是两行代码的事儿。 

*这里介绍的是centos6下的操作*
- 安装socat 优点儿:支持UDP and TCP 端口转发。
``` 
yum install -y socat ```

#### Socat使用

```
  nohup socat TCP4-LISTEN:2333,reuseaddr,fork TCP4:233.233.233.233:6666 >> /root/socat.log 2>&1 & ```
*nohup* 是后台运行
* TCP4-LISTEN:2333*此处的端口是转发的服务器端口注意不是shadowsocks 服务器。后面的是shadowsocks服务器ipv4地址+ 端口号

* fork TCP4:233.233.233.233:6666*这里需要填写的就是被转发的服务器的ip和端口也就是ss的sever_ip 和sever_port

*/root/socat.log 2>&1 &*转发的日志记录 我就是看了日志发现自己的端口已经被占用了。另外需要注意的是ucloud的服务器需要在网站上配置防火墙才行。放行对应端口。

** 转发UDP很简单，只要把 TCP4 改成 UDP4 就行了！**

### 停止转发

```  
ps -ef | grep socat
#输入上面的命令找到socat程序的PID，然后用下面的命令KILL掉这个PID进程（PID是个数字，自己替换下面的"pid"）。
kill -9 pid
```

### 卸载

``` 
yum remove socat

```

### 防火墙

####### 防火墙是最重要的一切问题其实都是防火墙的原因。

如果你的是 centos7以上没有 iptable配置防火墙看[这里](http://linux.it.net.cn/CentOS/fast/2014/1102/7635.html)


### 开机启动 

还是CentOS 
```
chmod +x /etc/rc.d/rc.local
vi /etc/rc.d/rc.local 
```

这篇文章只是做个记录。怕以后忘记。很感谢网上的大神们的分享。
装逼就到这里。看详细原文的[走起](https://doub.io/ss-jc40/)(小心墙撞头。😄)