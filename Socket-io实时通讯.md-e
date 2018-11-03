
# Socket.io 实时通讯
<!-- TOC -->

- [Socket.io 实时通讯](#socketio-实时通讯)
- [1 Socket.io 入门篇](#1-socketio-入门篇)
    - [1.1 HTML5开始提供的WebSocket库](#11-html5开始提供的websocket库)
    - [1.2 socket.io 特点介绍](#12-socketio-特点介绍)
    - [1.3 Node.js下跨平台安装部署](#13-nodejs下跨平台安装部署)
    - [1.4 通过引用模块中的listen函数来监听服务](#14-通过引用模块中的listen函数来监听服务)
    - [1.5 用connection来注册事件](#15-用connection来注册事件)
    - [1.6 搭建好一个最简单socket服务器并启动](#16-搭建好一个最简单socket服务器并启动)
    - [1.7 客户端引用Socket服务](#17-客户端引用socket服务)
    - [1.8 用io.connect函数发起服务端连接请求](#18-用ioconnect函数发起服务端连接请求)
    - [1.9 通过send函数来实现实时通信](#19-通过send函数来实现实时通信)
    - [1.10 教程小结](#110-教程小结)
- [2 Socket.io 进阶篇](#2-socketio-进阶篇)
    - [2.1 结合场景进阶Socket.io](#21-结合场景进阶socketio)
    - [2.2 使用emit函数发送消息](#22-使用emit函数发送消息)
    - [2.3 服务端注册监听事件](#23-服务端注册监听事件)
    - [2.4 客户端注册监听事件](#24-客户端注册监听事件)
    - [2.5 如何使用io.of来命名空间](#25-如何使用ioof来命名空间)
    - [2.6 用socket.broadcast.emit广播消息](#26-用socketbroadcastemit广播消息)
    - [2.7 中间件示例服务器身份验证](#27-中间件示例服务器身份验证)
    - [2.8 通过json为服务端和客户端传递参数](#28-通过json为服务端和客户端传递参数)
    - [2.9 课程小结](#29-课程小结)

<!-- /TOC -->

# 1 Socket.io 入门篇

## 1.1 HTML5开始提供的WebSocket库
### WebSocket

WebSocket是 **HTML5** 开始提供的一种浏览器与服务器间进行全双工通讯的网络技术。

现很多网站为了实现即时通讯，所用的技术都是轮询(polling)。轮询是在特定的的时间间隔（如每1秒），由浏览器对服务器发出HTTP请求，然后由服务器返回最新的数据给客服端的浏览器，这种方式有一个很大的弊端，就是会占用很多的带宽。

最新的轮询效果是Comet – 用了AJAX。但这种技术虽然可达到全双工通信，但依然需要发出请求。

使用WebSocket，浏览器和服务器只需要要做一个握手的动作，然后，浏览器和服务器之间就形成了一条快速通道，两者之间就直接可以数据互相传送。而且它为我们实现即时服务带来了两大好处：


- 节省资源：互相沟通的Header是很小的-大概只有 2 Bytes。
- 推送信息：不需要客户端请求，服务器可以主动传送数据给客户端。


实现了websocket的浏览器：

<table class='table table-bordered'>
<tr><th>Chrome</th><td>Supported in version 4+</td></tr>
<tr><th>Firefox</th><td>Supported in version 4+</td></tr>
<tr><th>Internet Explorer</th><td>Supported in version 10+</td></tr>
<tr><th>Opera</th><td>Supported in version 10+</td></tr>
<tr><th>Safari</th><td>Supported in version 5+</td></tr>
</table>

## 1.2 socket.io 特点介绍
### socket.io


Socket.IO是一个WebSocket库，包括了客户端的js和服务器端的nodejs，它的目标是构建可以在不同浏览器和移动设备上使用的实时应用。

socket.io的特点



- 易用性：socket.io封装了服务端和客户端，使用起来非常简单方便。
- 跨平台：socket.io支持跨平台，这就意味着你有了更多的选择，可以在自己喜欢的平台下开发实时应用。
- 自适应：它会自动根据浏览器从WebSocket、AJAX长轮询、Iframe流等等各种方式中选择最佳的方式来实现网络实时应用，非常方便和人性化，而且支持的浏览器最低达IE5.5。




## 1.3 Node.js下跨平台安装部署
### 安装部署


我们知道socket.io支持跨平台，在不同平台下，它的使用方法也是大同小异，所以我们只需要学习了解到它是怎么工作的，如何在某一平台使用它即可，今天我们就来学习一下在node.js中如何使用socket.io。

在node.js中安装模块首选当然是使用npm，我们在练习环境中预装了1.2.1版本：
`npm install socket.io`

如果不使用npm，还可以通过访问github的方式获取到socket.io的源码：
https://github.com/Automattic/socket.io

socket.io的官方网站，上面有关于它的最新信息：http://socket.io


## 1.4 通过引用模块中的listen函数来监听服务
### 服务监听


socket.io的服务端启动非常的简单，引用socket.io模块。

```javascript
var io = require('socket.io');
```

然后调用listen函数，传入监听的端口号，开始服务监听。练习环境中启用了80端口用于测试，在练习时只需要监听80端口即可：

```javascript
var io = require('socket.io')(80);
```


> 创建一个socket.io服务器，监听端口80。

var io = require('socket.io')(80);

## 1.5 用connection来注册事件
### 注册事件


我们学习了如何启动简单的socket服务，下面来学习一下如何为服务端注册一些常用的事件：。

```javascript
var io = require('socket.io')(80);
io.on('connection',function(socket){
//连接成功...
socket.on('disconnect',function(){
//用户已经离开...
});
});
```

 *connection* 事件在客户端成功连接到服务端时触发，有了这个事件，我们可以随时掌握用户连接到服务端的信息。

当客户端成功建立连接时，在 *connection* 事件的回调函数中，我们还是可以为socket注册一些常用的事件,如： *disconnect* 事件，它在客户端连接断开是触发，这时候我就知道用户已经离开了。


> 注册 *connection* 和 *disconnect* 事件。

## 1.6 搭建好一个最简单socket服务器并启动
### 启动服务


目前为止，我们已经搭建好了一个最简单的socket服务器，为了在浏览器中能够访问到我们的服务，我们还需要在服务端搭建一个简单的web服务器，让浏览器能够访问我们的客户端页面。

为了便捷，我们选用node.js中常用的express框架来实现web服务，示例如下：

```javascript
var express = require('express');
var app = express();
app.get('/',function(req,res){
res.status(200).send('欢迎来到汇智网学习！');
});
var server = require('http').createServer(app);
var io = require('socket.io')(server);
io.on('connection',function(socket){

});
server.listen(80);
```


> 为socket服务器添加web服务，访问服务器时可以看到欢迎词(别忘了提交运行哦)。

## 1.7 客户端引用Socket服务
### 客户端引用


服务端构建完毕，下面看一看客户端应该如何使用。

服务端运行后会在根目录动态生成socket.io的客户端js文件，客户端可以通过固定路径 */socket.io/socket.io.js* 添加引用。

首先添加网页 *index.html* ,并在网页中引用客户端js文件：
`<script src="/socket.io/socket.io.js"></script>`

当然这样的客户端引用方式并不是必须的，我们也可以引用官方的cdn或者下载到本地的客户端文件。一般情况下推荐引用动态生成的客户端文件，因为这样客户端和服务端的版本可以保持一致，减少出错的几率。

```javascript
//官方CDN
<script src="https://cdn.socket.io/socket.io-1.2.1.js"></script>
```



## 1.8 用io.connect函数发起服务端连接请求
### 连接服务


当客户端成功加载socket.io客户端文件后会获取到一个全局对象io，我们将通过io.connect函数来向服务端发起连接请求。

```javascript
var socket = io.connect('/');
socket.on('connect',function(){
//连接成功
});
socket.on('disconnect',function(data){
//连接断开
});
```

 *connect* 函数可以接受一个url参数，url可以socket服务的http完整地址，也可以是相对路径，如果省略则表示默认连接当前路径。与服务端类似，客户端也需要注册相应的事件来捕获信息，不同的是客户端连接成功的事件是 *connect* 。

了解了客户端如何使用，下面我们创建网页index.html，并添加如下内容(保存):

```javascript
<html>
<head>
<script src="/socket.io/socket.io.js"></script>
<script>
window.onload = function(){
var socket = io.connect('/');
socket.on('connect',function(){
document.write('连接成功!');
});
};
</script>
</head>
<body>
</body>
</html>
```

页面添加完毕还要记得在服务端app.js中为它添加路由，让我们可以访问测试网页：

```javascript
app.get('/index',function(req,res){
res.sendFile('index.html',{root:__dirname});
});
```


1、添加网页 *index.html* ，编辑代码连接socket服务。

2、在服务端添加路由，通过 */index* 可以访问到 *index.html* 页面。

## 1.9 通过send函数来实现实时通信
### 实时通讯


大功告成，服务端和客户端都构建完毕了，下面开始发送消息吧。

当我们成功建立连接后，我们可以通过socket对象的 *send* 函数来互相发送消息，示例-客户端向服务端发送消息(index.html)：

```javascript

var socket = io.connect('/');
socket.on('connect',function(){
//客户端连接成功后发送消息'hello world!'
socket.send('hello world!');
});
socket.on('message',function(data){
alert(data);
});
```




连接成功后，我们向服务端发送消息 *hello world!* ，还为socket注册了 *message* 事件，它是 *send* 函数对应的接收消息的事件，当服务端向客户端send消息时，我们就可以在 *message* 事件中接收到发送过来的消息。

服务端向客户端发送消息也可以通过 *send* 的方式，示例 - 服务端向客户端发送消息(app.js)：

```javascript
var io = require('scoket.io');
io.on('connection',function(socket){
socket.send('汇智网欢迎你！');
socket.on('message',function(data){
//收到消息
console.log(data);
});
});
```

与客户端相同，服务端也需要为socket注册 *message* 事件来接收客户端发送过来的消息。


> 为客户端和服务端注册 *message* 事件，并使用 *send* 函数互相发送消息。

## 1.10 教程小结
### 课程小结


我们一起学习了 *socket.io* 是什么，它并不是一项新的功能或者技术，它只是对目前实时通讯技术的封装，如HTML5中的网络技术 *WebSocket* 、 *AJAX长轮询* 、 *Iframe流* 等等，了解到它的一些优点，如跨平台、自适应等，我们可以借助它快速创建统一高效的实时应用。

在本节课程中，我们学习了如何搭建一个最基本的socket服务器，使用最简单的客户端与服务器建立连接，并实现信息的互发，当然 *socket.io* 的功能远不止如此，它还有很多非常实用的功能，这些功能将在『进阶篇』为大家一一介绍。



# 2 Socket.io 进阶篇

## 2.1 结合场景进阶Socket.io
### 前言


在入门篇中，我们学习了如何创建一个简单的socket服务器，并实现客户端和服务端的通讯。但是在生产环境中，显然这样简单的功能是不够的，所幸socket.io提供很多有趣的功能，来帮助我们将想法变成实际。

进阶篇主要主要关注两个方面。


- 第一，讲解socket.io提供的进阶功能。

- 第二，结合使用场景，通过进阶功能来实现需求。




## 2.2 使用emit函数发送消息
### 发送信息


 *socket.io* 既然是用来实现通讯的，那么如何发送、接收信息才是根本。

在 *socket.io* 中， *emit* 函数用于发送数据，还记得在入门篇中，我们使用 *send* 的方式实现了信息的互发，其实 *send* 函数只是 *emit* 的封装，实际上还是使用了 *emit* ，且看 *send* 函数是如何实现的：

```javascript
function send(){
var args = toArray(arguments);
args.unshift('message');
this.emit.apply(this, args);
return this;
}
```

在send函数中，获取到原来的参数，并在原来的基础上插入了一个参数 *message* ，然后调用了 *emit* 函数。通过 *send* 函数的实现，我们也学会了 *emit* 函数的用法，它有连个参数，第一个参数是事件名称，在接收端注册该事件就可以接收到发送过去的信息，事件名称可以自由定义，在不同的场景下，我们可以定义不同的事件来接收消息。第二个参数才是发送的数据。了解清楚了工作原理，下面来将 *send* 替换成 *emit* 函数发送信息：

```javascript
//app.js
io.on('connection',function(socket){
socket.emit('message','连接成功！');
socket.on('message',function(data){
});
});
```





> 将 *index.html* 和 *app.js* 中发送信息的方式改写成 *emit* 函数的形式。

## 2.3 服务端注册监听事件
### 服务端事件


事件监听是实现通讯的基础，因此充分了解 *socket.io* 的事件，学习如何在正确的时候使用它们至关重要。在一些关键的的状态下， *socket.io* 可以注册相应的事件，通过事件监听，我们可以在这些事件中作出反应，常用的事件如下：

<table class='table table-bordered'>

<tr><th>connection</th><td>客户端成功连接到服务器。</td></tr>

<tr><th>message</th><td>捕获客户端send信息。</td></tr>

<tr><th>disconnect</th><td>客户端断开连接。</td></tr>

<tr><th>error</th><td>发生错误。</td></tr>
</table>


> 为socket注册 *disconnect* 事件。

## 2.4 客户端注册监听事件
### 客户端


较服务端而言，客户端提供更多的监听事件，在实时应用中，我们可以为这些事件注册监听并作出反应，例如： *connect* 提示用户连接成功， *disconnect* 时提示用户停止服务等等。

<table class='table table-bordered'>
<tr><th>connect</th><td>成功连接到服务器。</td></tr>
<tr><th>connecting</th><td>正在连接。</td></tr>
<tr><th>disconnect</th><td>断开连接。</td></tr>
<tr><th>connect_failed</th><td>连接失败。</td></tr>
<tr><th>error</th><td>连接错误。</td></tr>
<tr><th>message</th><td>监听服务端send的信息。</td></tr>
<tr><th>reconnect_failed</th><td>重新连接失败。</td></tr>
<tr><th>reconnect</th><td>重新连接成功。</td></tr>
<tr><th>reconnecting</th><td>正在重连。</td></tr>
</table>

那么客户端socket发起连接时的顺序是怎么样的呢？当第一次连接时，事件触发顺序为：
 *connecting*  →  *connect* ；

当失去连接时，事件触发顺序为： *disconnect*  →  *reconnecting*  →  *connecting*  →  *reconnect*  →  *connect* 。


> 为socket注册 *disconnect* 和 *reconnect* 事件。

## 2.5 如何使用io.of来命名空间
### 命名空间


命名空间着实是一个非常实用好用的功能。我们可以通过命名空间，划分出不同的房间，在房间里的广播和通信都不会影响到房间以外的客户端。

那么如何创建房间呢？在服务端，通过 *of("")* 的方式来划分新的命名空间：

```javascript
io.of('chat').on('connection',function(socket){

});
```

示例中，我们创建一个名为 *chat* 的房间，客户端可以通过如下方式连接到指定的房间：

```javascript
var socket = io.connect('/chat');
```

虽然连接到指定的房间，但是我们也可以在服务端操作，自由的进出房间：

```javascript
socket.join('chat');//进入chat房间
socket.leave('chat');//离开chat房间
```


> 在客户端按默认方式连接到服务器，然后在服务端通过 *join* 的方式进入 *chat* 房间。

## 2.6 用socket.broadcast.emit广播消息
### 广播消息


在实时应用中，广播是一个不可或缺的功能， *socket.io* 提供两种服务端广播方式。

第一种广播方式可以称之为'全局广播'，顾名思义，全局广播就是所有连接到服务器的客户端都会受到广播的信息：

```javascript
socket.broadcast.emit('DATA',data);
```

但是，在实际应用场景中，我们很多时候并不需要所有用户都收到广播信息，有的广播信息只发送给一部分客户端，比如某个房间里面的用户，那么可以使用如下方式：

```javascript
socket.broadcast.to('chat').emit('DATA',data);
```

当使用 *to()* 的方式广播信息时，只有该命名空间下的客户端才会收到广播信息，是不是很方便呢。


> 请向所有客户端发送 *欢迎使用！* ，并向 *chat* 房间客户端发送'今天天气晴'。

## 2.7 中间件示例服务器身份验证
### 中间件

 *socket.io* 提供中间件功能，我们可以通过中间件来对请求进行预处理，比如身份验证：

```javascript
io.use(function(socket, next){
if (socket.request.headers.cookie) return next();
next(new Error('Authentication error'));
});
```

示例中展示了通过中间件进行身份验证，当没有cookie的时候抛出异常。


> 为自己的socket服务器添加身份验证，试一试客户端还能否成功连接。

## 2.8 通过json为服务端和客户端传递参数
### 传递参数

在很多应用场景中，客户端发起连接请求时都需要传递参数，这些参数可能是身份验证、初始化设置等等，那么 *socket.io* 发起连接时如何传递参数呢？

```javascript
var socket = io.connect('/');
```

由于 *connect* 函数发起连接的参数是一个url，你可能会想到把参数拼接到url上，如 *<a href="http://xxxx?xx=xxxx">http://xxxx?xx=xxxx</a>* ，但是很遗憾这样是行不通的，我们可以通过这样的方式来传递参数：

```javascript
var socket = io.connect('/',{ _query:'sid=123456' });
```

在服务端可以这样获取到传递的参数:

```javascript
io.use(function(socket){
var query = socket.request._query;
var sid = query.sid;
});
```

客户端传递的参数已经被解析成了一个json对象，这个对象就是_ *query* 。


> 客户端发起连接时传入sid参数，当sid等于123456时才允许连接到服务器。

## 2.9 课程小结
### 课程小结


本节课程为大家讲解了socket.io的一些进阶功能，这些功能基本上已经能够满足我们的开发需求了。

当然socket.io的功能不仅仅只有这些，本课程只是抛砖引玉，更多细节、深入的问题欢迎大家一起参与讨论，如果有什么问题或建议欢迎使用'问题留言'发送给我们，我们会在第一时间处理。


