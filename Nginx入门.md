# Nginx 入门

<!-- TOC  -->

- [Nginx 入门](#nginx-入门)
- [1 nginx概述与常用命令](#1-nginx概述与常用命令)
    - [1.1 nginx概述](#11-nginx概述)
    - [1.2 常用命令](#12-常用命令)
    - [1.3 nginx初体验](#13-nginx初体验)
- [2 nginx配置](#2-nginx配置)
    - [2.1 nginx的配置系统](#21-nginx的配置系统)
    - [2.2 nginx.conf的文件结构](#22-nginxconf的文件结构)
    - [2.3 main段配置指令](#23-main段配置指令)
    - [2.4 event段配置指令](#24-event段配置指令)
    - [2.5 http段配置指令](#25-http段配置指令)
    - [2.6 负载均衡](#26-负载均衡)
    - [2.7 location配置](#27-location配置)
    - [2.8 Rewrite配置](#28-rewrite配置)
    - [2.9 写自己的配置文件](#29-写自己的配置文件)
    - [2.10 反向代理示例](#210-反向代理示例)
    - [2.11 虚拟主机示例](#211-虚拟主机示例)
    - [2.12 正向代理示例](#212-正向代理示例)
    - [2.13 负载均衡示例](#213-负载均衡示例)
    - [2.14 Rewritef示例](#214-rewritef示例)

<!-- /TOC  -->

# 1 nginx概述与常用命令

## 1.1 nginx概述
### nginx概述

　　Nginx ("engine x") 是一个高性能的 HTTP 和  *反向代理*  服务器，也是一个 IMAP/POP3/SMTP  *代理服务器* 。 Nginx 是由 Igor Sysoev 为 *俄罗斯* 访问量第二的 Rambler.ru 站点开发的，第一个公开版本0.1.0发布于2004年10月4日。其将源代码以类BSD许可证的形式发布，因它的稳定性、丰富的功能集、示例配置文件和低系统资源的消耗而闻名。2011年6月1日，nginx 1.0.4发布。

　　Nginx是一款轻量级的Web 服务器/反向代理服务器及电子邮件（IMAP/POP3）代理服务器，并在一个BSD-like 协议下发行。由俄罗斯的程序设计师Igor Sysoev所开发，供俄国大型的入口网站及搜索引擎Rambler（俄文：Рамблер）使用。其特点是占有内存少，并发能力强，事实上nginx的并发能力确实在同类型的网页服务器中表现较好，中国大陆使用nginx网站用户有：新浪、网易、腾讯等。

## 1.2 常用命令
### nginx常用命令

1.nginx启动

```bash
nginx   -c /etc/nginx/nginx.conf
```

其中参数-c指定nginx启动时加载的配置文件，当然也可以不指定配置文件，省略-c，也可以启动，表示使用默认的配置文件。

```bash
nginx
```

2.nginx停止

```bash
nginx -s stop 或者
nginx -s quit 或者
pkill -9 nginx
```

　　例如在我们的编辑环境中已经安装好了nginx,并且已启动,在命令提示符下直接输入nginx -s stop就可以停止了。

3.nginx重载配置

```bash
nginx -s reload
```

4.检查配置文件是否正确

```bash
nginx -t
```

> 在编辑器中去练一练上面的命令吧！

## 1.3 nginx初体验
### nginx初体验

　　当我们安装完nginx后，我们首先进入nginx的安装目录，启动nginx的服务，然后在地址中输入 <a href="http://127.0.0.1/">http://127.0.0.1/</a> ，
然后我们就会看到" *welcome to nginx* "。如下图所示

<img src="images/54f031e2f8638715e4cb8e0c/1-1-3/nginx_1.JPG" alt="">

　　下面的代码为nginx.conf配置文件中的server段的默认配置，nginx所实现的功能都基于这个文件。我们将在后面的内容中继续进行讲解。

```bash
 server {
   listen       80;
   server_name  localhost;
   #charset koi8-r;
   #access_log  logs/host.access.log  main;
   location / {
           root   /root;      #定义服务器的默认网站根目录位置
           index index.php index.html index.htm;   #定义首页索引文件的名称
   }
   #error_page  404              /404.html;
   # redirect server error pages to the static page /50x.html
   error_page   500 502 503 504  /50x.html;
   location = /50x.html {
           root   html;
   }
}
```

> 下面就在我们的编辑环境中去试一试吧，首先启动nginx服务，然后点击【访问测试】，看看会出现什么呢？

# 2 nginx配置

## 2.1 nginx的配置系统
### nginx配置系统

　　nginx的配置系统由一个主配置文件和其他一些辅助的配置文件构成。这些配置文件均是纯文本文件，全部位于nginx安装目录下的conf目录下。

　　配置文件中以 *#* 开始的行，或者是前面有若干空格或者TAB，然后再跟#的行，都被认为是注释，也就是只对编辑查看文件的用户有意义，程序在读取这些注释行的时候，其实际的内容是被忽略的。

　　由于除主配置文件nginx.conf以外的文件都是在某些情况下才使用的，而只有主配置文件是在任何情况下都被使用的。所以在这里我们就以主配置文件为例，来解释nginx的配置系统。

在nginx.conf中，包含若干配置项。每个配置项由 *配置指令* 和_指令参数 *2个部分构成。* 指令参数_也就是配置指令对应的配置值。

　　 *配置指令* 是一个字符串，可以用单引号或者双引号括起来，也可以不括。但是如果配置指令包含空格，一定要引起来。

　　指令的参数使用一个或者多个空格或者TAB字符与指令分开。指令的参数有一个或者多个TOKEN串组成。TOKEN串之间由空格或者TAB键分隔。

## 2.2 nginx.conf的文件结构
### 配置文件结构

　　Nginx的核心模块为 *Main* 和 *Events* ，此外还包括标准 *HTTP模块* 、可选 *HTTP模块* 和 *邮件模块* ，其还可以支持诸多第三方模块。Main用于配置错误日志、进程及权限等相关的参数，Events用于配置IO模型，如epoll、kqueue、select或poll等，它们是必备模块，HTTP模块用于控制Nginx的HTTP进程。

　　Nginx的主配置文件由几个段组成，这个段通常也被称为nginx的上下文，每个段的定义格式如下所示。需要注意的是，其每一个指令都必须使用分号( *;* )结束，否则为语法错误。

```bash
<section> {
     <directive> <parameters>
}
```

主要结构（所有配置以分号结尾）如下：

```bash
## Main段，定义全局属性
events {
          ##定义不同IO模型下的工作机制；
}
http {
    ##定义作为web服务器的相关属性（还可以反向代理mail）
    server {
        ##定义一个虚拟主机的属性，所有web服务必须定义成一个虚拟主机，与httpd不同
        location [option] uri {
            ##定义一个URI的特性
            ##location中可以嵌套location的
            location [option] uri {
                #嵌套location
            }
               if (condition) {
                ##定义URL重写
            }
        }
    }
    upstream  &amp;ltName&amp;gt {
        ##将多个server结合在一起，实现负载均衡
    }
 }
```

## 2.3 main段配置指令
### 配置指令

　　定义Nginx运行的用户和用户组用 *user* 指令。

```bash
user www-data;
```

　　定义nginx进程数，用_worker *processes* 指令，建议设置为等于CPU总核心数。

```bash
worker_processes 8;
```

　　全局错误日志定义类型，[ debug | info | notice | warn | error | crit ]用_error *log* 指令。另外日志还可以定义在http、server及location上下文中，语法格式一样。

```bash
error_log /var/log/nginx/error.log info;
```

　　定义进程文件用 *pid* 指令

```bash
pid /var/run/nginx.pid;
```

　　用_worker_rlimit *nofile* 指令描述nginx进程打开的最多文件描述符的数目，建议设置为默认值。

```bash
     worker_rlimit_nofile 65535;
```

## 2.4 event段配置指令
### 配置指令

　　参考事件模型指令： *use [ kqueue | rtsig | epoll | /dev/poll | select | poll ];*

```bash
use epoll;
```

　　注：epoll模型是Linux 2.6以上版本内核中的高性能网络I/O模型，如果跑在FreeBSD上面，就用kqueue模型。

　　设置单个进程最大连接数用指令：_worker *connections* （最大连接数=连接数*进程数）

```bash
worker_connections 65535;
```

## 2.5 http段配置指令
### 配置指令

　　设定mime类型,类型由mime.type文件定义 用 *include* 指令.

```bash
include       /etc/nginx/mime.types;
default_type  application/octet-stream;
```

　　开启gzip压缩指令

```bash
gzip on;
gzip_disable "MSIE [1-6]\.(?!.*SV1)";
```

　　设定负载均衡的服务器列表用指令 *upstream* 。

```bash
upstream mysvr {
    #weigth参数表示权值，权值越高被分配到的几率越大
    #本机上的Squid开启3128端口
    server 192.168.8.1:3128 weight=5;
    server 192.168.8.2:80  weight=1;
    server 192.168.8.3:80  weight=6;
}
```

　　设定虚拟主机用指令 *server* ，其中包括端口，主机名称，默认请求等设置。

```bash
server {
    #侦听80端口
    listen       80;
    #定义使用www.xx.com访问
    server_name  www.xx.com;
    #设定本虚拟主机的访问日志
    access_log  logs/www.xx.com.access.log  main;
    #默认请求
    location / {
          root   /root;      #定义服务器的默认网站根目录位置
          index index.php index.html index.htm;   #定义首页索引文件的名称
          fastcgi_pass  www.xx.com;
          fastcgi_param SCRIPT_FILENAME $document_root/$fastcgi_script_name;
          include /etc/nginx/fastcgi_params;
     }

    # 定义错误提示页面
    error_page   500 502 503 504 /50x.html;
    location = /50x.html {
    root   /root;
    }
}
```

请求转向指令_proxy *pass*

```bash
proxy_pass http://www.hubwiz.com;
```

## 2.6 负载均衡
### 负载均衡

　　 *负载均衡* （又称为负载分担），英文名称为Load Balance，其意思就是将负载（工作任务）进行平衡、分摊到多个操作单元上进行执行，例如Web服务器、FTP服务器、企业关键应用服务器和其它关键任务服务器等，从而共同完成工作任务。

　　nginx的 *upstream* 目前支持4种方式的分配

　　1)、 *轮询* （默认）  每个请求按时间顺序逐一分配到不同的后端服务器，如果后端服务器down掉，能自动剔除。

　　2)、 *weight*   指定轮询几率，weight和访问比率成正比，用于后端服务器性能不均的情况。

　　3)、_ip *hash*   每个请求按访问ip的hash结果分配，这样每个访客固定访问一个后端服务器，可以解决session的问题。

　　4)、 *fair* （第三方）  按后端服务器的响应时间来分配请求，响应时间短的优先分配。

```bash
upstream ixdba.net{
    ip_hash;
    server 192.168.12.133:80;
    server 192.168.12.134:80  down;
    server 192.168.12.135:8009  max_fails=3  fail_timeout=20s;
    server 192.168.12.136:8080;
}
```

　　 *upstream* 是Nginx的HTTP Upstream模块，这个模块通过一个简单的调度算法来实现客户端IP到后端服务器的负载均衡。在上面的设定中，通过upstream指令指定了一个负载均衡器的名称ixdba.net。这个名称可以任意指定，在后面需要的地方直接调用即可。

## 2.7 location配置
### Location配置

语法规则：  *location [=|~|~*|^~] /uri/ { … }*

<table table class="table table-bordered" style="line-height:15px;" align="center" border="2">
<tbody>
<tr>
<th style="text-align:center">
                通配符</th>
<th style="text-align:center">
                说明</th>
</tr>
<tr>
<td align="center">
                = </td>
<td align="center">
                开头表示精确匹配</td>
</tr>
<tr>
<td align="center">
                ^~</td>
<td align="center">
                开头表示uri以某个常规字符串开头，理解为匹配 url路径即可</td>
</tr>
<tr>
<td align="center">
                ~</td>
<td align="center">
                开头表示区分大小写的正则匹配</td>
</tr>
<tr>
<td align="center">
                !~</td>
<td align="center">
                区分大小写不匹配</td>
</tr>
<tr>
<td align="center">
                !~*</td>
<td align="center">
                不区分大小写不匹配</td>
</tr>
<tr>
<td align="center">
                ~*</td>
<td align="center">
                开头表示不区分大小写的正则匹配</td>
</tr>
<tr>
<td align="center">
                /</td>
<td align="center">
                通用匹配，任何请求都会匹配到</td>
</tr>
</tbody>
</table>

　　首先匹配 =，其次匹配^~, 其次是按文件中顺序的正则匹配，最后是交给 / 通用匹配。当有匹配成功时候，停止匹配，按当前匹配规则处理请求。

```bash
location = / {
   #规则A
}
location = /login {
   #规则B
}
location ^~ /static/ {
   #规则C
}
location ~ \.(gif|jpg|png|js|css)$ {
   #规则D
}
```

　　那么产生的效果如下：

访问根目录/， 比如<a href="http://localhost/">http://localhost/</a> 将匹配规则A；
访问 <a href="http://localhost/login">http://localhost/login</a> 将匹配规则B；
访问 <a href="http://localhost/static/a.html">http://localhost/static/a.html</a> 将匹配规则C；
访问 <a href="http://localhost/a.gif">http://localhost/a.gif</a>, <a href="http://localhost/b.jpg">http://localhost/b.jpg</a> 将匹配规则D。

## 2.8 Rewrite配置
### Rewrite规则

　　Nginx Rewrite 规则相关指令有if,rewrite,set,return,break等，其中最关键的就是rewrite。一个简单的Nginx Rewrite规则语法如下：

`rewrite ^/b/(.\*)\.html /play.php?video=$1 break;`

<b>正则表达式匹配，</b>其中：

- ~ 为区分大小写匹配；<br>
- ~* 为不区分大小写匹配；<br>
- !~和!~*分别为区分大小写不匹配及不区分大小写不匹配。

<b>文件及目录匹配，</b>其中：

- -f和!-f用来判断是否存在文件；<br>
- -d和!-d用来判断是否存在目录；<br>
- -e和!-e用来判断是否存在文件或目录；<br>
- -x和!-x用来判断文件是否可执行。<br>
</div>

<b>flag标记有：</b>

- last 相当于Apache里的[L]标记，表示完成rewrite；
- break 终止匹配, 不再匹配后面的规则；
- redirect 返回302临时重定向 地址栏会显示跳转后的地址；
- permanent 返回301永久重定向 地址栏会显示跳转后的地址。

当然除了这些以外，Rewrite规则中还会用到一些相应的全局变量，如$args，$url等等

## 2.9 写自己的配置文件
### 写自己的nginx配置文件

　　前面几节中我们已经学过了nginx配置文件中的各个段的配置指令，下面我们就来写一个自己配置文件。如下代码：

```bash
worker_processes  1;
events {
    worker_connections  1024;
}
http {
       server {
            location / {
                      #root   html;      #定义服务器的默认网站根目录位置
                      #index index.php index.html index.htm;   #定义首页索引文件的名称
                      proxy_pass http://www.hubwiz.com;
             }
            error_page   500 502 503 504  /50x.html;
            location = /50x.html {
                root   html;
           }
         }
}
```

　　这样我们自己的配置文件就完成了，先将nginx的服务停止，然后我们用 *nginx -c  *.conf* 命令来重新启动nginx，*.conf 为我们自己的配置文件所在的路径，nginx启动以后，然后点击【访问测试】，看看会出现什么情况，是不是已经转到我们所配置的站点了。

　　在右面的编辑页面中编辑一个配置文件，我自己的配置文件名为Mynginx.conf,其中的内容就是以上面代码的内容，保存在/etc/nginx目录下，完成以后我们做如下操作：

```bash
nginx -s stop
nginx -c /etc/nginx/Mynginx.conf
```

然后点击【访问测试】，如图所示。

<img src="images/54f031e2f8638715e4cb8e0c/1-2-9/mynginx.JPG" alt="">

> 在编辑器中去练一练吧，把上面的转移地址改为百度试试。

## 2.10 反向代理示例
### 反向代理示例

　　 *反向代理（Reverse Proxy）* 是指代理服务器来接收来自Internet上的连接请求，并将请求转发给内部网络上的服务器，并从服务器上得到的结果返回给Internet上请求连接的客户端。

　　比如要配置后端跑 apache 服务的 ip 和端口，也就是说，我们的目标是实现通过 <a href="http://ip:port">http://ip:port</a> 能访问到你的网站。配置文件可以修改以下内容，reload nginx就可以了。

```bash
## Basic reverse proxy server ##
    upstream apachephp  {
        server ip:8080; #Apache
    }
    ## Start www.nowamagic.net ##
    server {
        listen 80;
        server_name  www.nowamagic.net;
        access_log  logs/quancha.access.log  main;
        error_log  logs/quancha.error.log;
        root   html;
        index  index.html index.htm index.php;

        ## send request back to apache ##
        location / {
            proxy_pass  http://apachephp;
                #……………………
}
}
```

## 2.11 虚拟主机示例
### 虚拟主机示例

　　Nginx做虚拟主机，尤其是仅仅支持纯静态-html，这是最简单的应用了，可以理解为一个仅支持静态页面的最简单的Web服务器。

　　例子，同时支持两个虚拟主机（纯静态-html支持）的配置，我们只需要理改server段，如下：

```bash
server {
        listen       80;
        server_name  www.hubwiz.com;
        #charset koi8-r;
        #access_log  logs/host.access.log  main;
        location / {
                      root   /root;
                      index index.php index.html index.htm;

        }
        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   html;
        }
      }
server {
        listen       80;
        server_name  www.baidu.com;
        #charset koi8-r;
        #access_log  logs/host.access.log  main;
        location / {
                      root   /root;
                      index index.php index.html index.htm;

        }
        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   html;
        }
}
```

## 2.12 正向代理示例
### 正向代理示例

nginx正向代理配置如下：

```bash
server
{
  listen       8080;
  server_name www.hubwiz.com;
  index index.html index.htm index.php;
  root  /home/wwwroot;
     location / {
         resolver        192.168.8.88;
         proxy_pass      $scheme://$http_host$request_uri;
         proxy_buffers   256 4k;
 }
   access_log off;
}
```

　　以上配置的注意事项：

1，不能有hostname。

2，必须有resolver, 即dns，即上面的x.x.x.x，换成当前机器的DNS服务器ip即可(查看dns方法 cat /etc/resolv.conf 代理使用)。

3，$http_host和$request_uri是nginx系统变量，保持原样即可。

　　检测配置文件无误后，重启nginx，在浏览器中添加代理服务器的IP地址，就可以使用该Nginx正向代理了。

## 2.13 负载均衡示例
### 负载均衡示例

```bash
upstream backend{
      #定义负载均衡设备的Ip及设备状态
      server 127.0.0.1:9090 down;
      server 192.168.1.12:8080 weight=2 ;
      server 192.168.1.13:6060 max_fails=3 fail_timeout=30s;
      server 1192.168.1.14:7070 backup;
}
server{
    #…………………………
   location /{
        proxy_pass http://backend;
        #…………………………
    }
}
```

以上代码就是对负载均衡应用的示例。

 *Upstream* 可对后端服务器进行健康检查。

<span>a)  *down* 表示当前的server暂时不参与负载。</span>

<span>b)  *weight* 默认为1.weight越大，负载的权重就越大。</span>

<span>c) _max *fails*  ：在fail_timeout时间内对后台服务器请求失败的次数。</span>

<span>d) _fail *timeout* :max_fails次失败后，暂停的时间。</span>

<span>e)  *backup* ： 其它所有的非backup机器down或者忙的时候，请求backup机器。所以这台机器压力会最轻。</span>

## 2.14 Rewritef示例
### Rewrite简单示例

```bash
worker_processes  1;
events {
    worker_connections  1024;
}
http {
       server {
            location /hubwiz {
                      rewrite (.*) http://www.hubwiz.com;
        }
           location /baidu {
                      rewrite (.*) http://www.baidu.com;
        }
        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   html;
       }
   }
}
```

　　按照前面讲的内容以及上面的代码，修改我们自己的配置文件，保存，重新加载nginx，然后点击【访问测试】，在地址栏给出的地址后面分别输入“ */hubwiz* ”、“ */baidu* ”，是不是会和我的结果一样呢？

输入“/hubwiz”转到汇智网，输入“/baidu”是不是转到百度了呢？

> 下面就在我们的编辑环境中去试一试吧。
