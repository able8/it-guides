# Nodejs-Session应用
<!-- TOC  -->

- [Nodejs-Session应用](#nodejs-session应用)
- [1 cookie 和 session](#1-cookie-和-session)
    - [1.1 cookie](#11-cookie)
    - [1.2 nodejs中的cookie](#12-nodejs中的cookie)
    - [1.3 express中的cookie](#13-express中的cookie)
    - [1.4 session](#14-session)
    - [1.5 express中的session](#15-express中的session)
- [2 数据库存储session](#2-数据库存储session)
    - [2.1 存储到mongodb数据库](#21-存储到mongodb数据库)
    - [2.2 存储到redis数据库（一）](#22-存储到redis数据库一)
    - [2.3 存储到redis数据库（二）](#23-存储到redis数据库二)
- [3 项目实践](#3-项目实践)
    - [3.1 页面设计](#31-页面设计)
    - [3.2 用户凭证](#32-用户凭证)
    - [3.3 检查是否登录](#33-检查是否登录)
    - [3.4 登录验证](#34-登录验证)
    - [3.5 注销session](#35-注销session)

<!-- /TOC  -->

# 1 cookie 和 session

## 1.1 cookie
### cookie

在web应用中，多个请求之间 *共享“用户会话”* 是非常必要的。但HTTP1.0协议是无状态的。那这时Cookie就出现了。那Cookie又是如何处理的呢？

 **Cookie的处理** ：

- 服务端向客户端 *发送Cookie*
- 客户端的浏览器把 *Cookie保存*
- 然后在每次请求浏览器都会将Cookie发送到服务端

在HTML文档被发送之前，Web服务器通过传送HTTP 包头中的 *Set-Cookie*  消息把一个cookie 发送到用户的浏览器中，如下示例：

```javascript
Set-Cookie: name=value; Path=/; expires=Wednesday, 09-Nov-99 23:12:40 GMT;
```

其中比较重要的属性：

-  **name=value** ：键值对，可以设置要保存的 * Key/Value* ，注意这里的 name 不能和其他属性项的名字一样
-  **Expires** ：    过期时间（秒），在设置的某个时间点后该 Cookie 就会失效，如 expires=Wednesday, 09-Nov-99 23:12:40 GMT
-  **maxAge** ：    最大失效时间（毫秒），设置在多少后失效
-  **secure** ：   当 secure 值为 true 时，cookie 在 HTTP 中是无效，在 HTTPS 中才有效
-  **Path** ：     表示 cookie 影响到的路，如 path=/。如果路径不能匹配时，浏览器则不发送这个Cookie
-  **httpOnly** ： 是微软对COOKIE做的扩展。如果在COOKIE中设置了“httpOnly”属性，则通过程序（JS脚本、applet等）将无法读取到COOKIE信息，防止XSS攻击产生

## 1.2 nodejs中的cookie
### nodejs中的cookie

nodejs是如何想客户端发送cookie的呢？
有两个中方案：

- 使用 **response.writeHead** ，代码如下：

```javascript
//设置过期时间为一分钟
var today = new Date();
var time = today.getTime() + 60*1000;
var time2 = new Date(time);
var timeObj = time2.toGMTString();
response.writeHead({
'Set-Cookie':'myCookie="type=ninja", "language=javascript";path="/";Expires='+timeObj+';httpOnly=true'
});
```

缺点：使用response.writeHead只能发送一次头部，即只能调用一次，且不能与response.render共存，否则会报错。

- 使用 **response.cookie** ，代码示例如下：

```javascript
response.cookie('haha', 'name1=value1&amp;name2=value2', {maxAge:10*1000, path:'/', httpOnly:true});
```

语法:  *response.cookie('cookieName', 'name=value[name=value...]',[options]);*

options 每个字段的意思在上文中都讲解了，这里不再重复阐述了。

## 1.3 express中的cookie
### cookie的简单使用

express 在 4.x 版本之后，管理session和cookies等许多模块都不再直接包含在express中，
`而是需要单独下载安装相应模块。

cookieParser安装： *$ npm install cookie-parser*

使用方法:

```javascript
var express      = require('express');
var cookieParser = require('cookie-parser');

var app = express();
app.use(cookieParser());

app.get('/', function (req, res) {
// 如果请求中的 cookie 存在 isVisit, 则输出 cookie
// 否则，设置 cookie 字段 isVisit, 并设置过期时间为1分钟
if (req.cookies.isVisit) {
console.log(req.cookies);
res.send("再次欢迎访问");
} else {
res.cookie('isVisit', 1, {maxAge: 60 * 1000});
res.send("欢迎第一次访问");
}
});
app.listen(80);
```

> 首先熟悉一下右边环境的使用，

- 在app.js文件中引入express使用cookie需要的模块
- 按照上面示例验证一下cookie。

## 1.4 session
### 什么是session？

 *session* 是另一种记录客户状态的机制，不同的是Cookie保存在客户端浏览器中，而session *保存在服务器* 上。

客户端浏览器访问服务器的时候，服务器把 *客户端信息以某种形式记录在服务器* 上，这就是session。客户端浏览器再次访问时只需要从该Session中查找该客户的状态就可以了。

如果说Cookie机制是通过检查客户身上的 *“通行证”* 来确定客户身份的话，那么session机制就是通过检查服务器上的 *“客户明细表”* 来确认客户身份。

session相当于程序在服务器上建立的一份客户档案，客户来访的时候只需要查询客户档案表就可以了。

#####  **两者的区别：**

- cookie数据存放在客户的浏览器上，session数据放在服务器上。

- cookie不是很安全，别人可以分析存放在本地的COOKIE并进行COOKIE欺骗
考虑到安全应当使用session。

- session会在一定时间内保存在服务器上。当访问增多，会比较占用你服务器的性能
考虑到减轻服务器性能方面，应当使用COOKIE。

- 单个cookie保存的数据不能超过4K，很多浏览器都限制一个站点最多保存20个cookie。

- 所以建议： *将登陆信息等重要信息存放为session、其他信息如果需要保留，可以放在cookie中*

## 1.5 express中的session
### session的简单应用

跟cookie一样都需要单独的安装和引用模块，
安装模块： *$sudo npm install express-session*
主要的方法就是 session(options)，其中 options 中包含可选参数，主要有：

-  **name** : 设置 cookie 中，保存 session 的字段名称，默认为 connect.sid 。
-  **store** : session 的存储方式，默认存放在内存中，也可以使用 redis，mongodb 等。express 生态中都有相应模块的支持。
-  **secret** : 通过设置的 secret 字符串，来计算 hash 值并放在 cookie 中，使产生的 signedCookie 防篡改。
-  **cookie** : 设置存放 session id 的 cookie 的相关选项，默认为
(default: { path: '/', httpOnly: true, secure: false, maxAge: null })
-  **genid** : 产生一个新的 session_id 时，所使用的函数， 默认使用 uid2 这个 npm 包。
-  **rolling** : 每个请求都重新设置一个 cookie，默认为 false。
-  **resave** : 即使 session 没有被修改，也保存 session 值，默认为 true。

#####  **示例** ：

```javascript
var express = require('express');
var session = require('express-session');
var app = express();

app.use(session({
secret: 'hubwiz app', //secret的值建议使用随机字符串
cookie: {maxAge: 60 * 1000 * 30} // 过期时间（毫秒）
}));
app.get('/', function (req, res) {
if (req.session.sign) {//检查用户是否已经登录
console.log(req.session);//打印session的值
res.send('welecome <strong>' + req.session.name + '</strong>, 欢迎你再次登录');
} else {
req.session.sign = true;
req.session.name = '汇智网';
res.send('欢迎登陆！');
}
});
app.listen(80);
```

>

- 首先 *清空app.js* 中的代码。如果文件中的代码需要保留，可以存到个人笔记中
- 再按照上面的示例验证一下express中的session。

<kbd>PS：不要忘记引用模块。</kbd>

# 2 数据库存储session

## 2.1 存储到mongodb数据库
### 存储到mongodb数据库

在上一章中完成的示例中我们尝试一下：登录后， *重新启动* node app，然后刷新访问测试页面。我们会发现 *session丢了* ！
这是因为session会 *默认的存储到内存* 当中。也就是说session数据都是存储在内存当中的，当进程退出后，session数据就会丢失。

在开发环境中，这也许并不算什么坏事。但是如果线上的应用是这样的，用户绝对是不能忍受的。这也就引出了本章节要讲解的内容： *将session数据
持久化存储* 。

首先我们讲解如何把session存储到mongodb数据库当中：

在使用mongodb存储时首先要加载一个模块： *connect-mongo*

安装命令： *npm install connect-mongo*

 **使用代码** ：

```javascript
var session = require('express-session');
var MongoStore = require('connect-mongo/es5')(session);

mongoose.connect('mongodb://127.0.0.1:27017/hubwiz'); //连接数据库
mongoose.connection.on('open', function () {
console.log('-----------数据库连接成功！------------');
});

app.use(session({
secret: "what do you want to do?", //secret的值建议使用128个随机字符串
cookie: {maxAge: 60 * 1000 * 60 * 24 * 14}, //过期时间
resave: true, // 即使 session 没有被修改，也保存 session 值，默认为 true
saveUninitialized: true,
store: new MongoStore({
mongooseConnection: mongoose.connection //使用已有的数据库连接
})
}));

app.listen(80);
```

## 2.2 存储到redis数据库（一）
### 依赖模块及参数

Redis是一个非常适合用于Session管理的数据库。第一，它的结构简单，key-value的形式非常符合SessionID-UserID的存储；第二，读写速度非常快；第三，自身支持数据自动过期和清除；第四，语法、部署非常简单。基于以上原因，很多Session管理都是基于Redis实现的。所以我们这个示例将用redis管理session。

Express已经将Session管理的整个实现过程简化到仅仅几行代码的配置的地步了，你完全不用理解整个session产生、存储、返回、过期、再颁发的结构，使用Express和Redis实现Session管理，只要两个中间件就足够了：

-  *express-session*
-  *connect-redis*

#####  **参数**

-  **client**  你可以复用现有的redis客户端对象， 由 redis.createClient() 创建
-  **host**    Redis服务器名
-  **port**    Redis服务器端口
-  **socket**  Redis服务器的unix_socket

#####  **可选参数**

-  **ttl**         Redis session TTL 过期时间 （秒）
-  **disableTTL**  禁用设置的 TTL
-  **db**          使用第几个数据库
-  **pass**        Redis数据库的密码
-  **prefix**      数据表前辍即schema, 默认为 "sess:"

## 2.3 存储到redis数据库（二）
### 简单应用

req在经过session中间件的时候就会自动完成session的有效性验证、延期/重新颁发、以及对session中数据的获取了。

使用示例：

```javascript
var express = require('express');
var session = require('express-session');
var RedisStore = require('connect-redis')(session);

var app = express();
var options = {
"host": "127.0.0.1",
"port": "6379",
"ttl": 60 * 60 * 24 * 30,   //session的有效期为30天(秒)
};

// 此时req对象还没有session这个属性
app.use(session({
store: new RedisStore(options),
secret: 'express is powerful'
}));

app.listen(80);
```

<blockquote>
注意，环境内没有预装Redis服务器。

</blockquote>

# 3 项目实践

## 3.1 页面设计
### 页面设计

express为session应用提供了简单的实现方式，为了方便理解，我们创建一个简单的登录系统。

首先我们来设计简单页面：

- index - 主页，用来展示登录表单
- home - 用户页，登录成功展示的页面

#####  **index.ejs:**

```javascript
<form action="/sign" method="post">
<fieldset>
<legend>Please sign in</legend>
<p>User: <input type="text" name="user"/>

<p>Pass: <input type="text" name="password"/>

<button>Submit</button>
</fieldset>
</form>
```

#####  **sign.ejs**

```javascript
<!doctype html>
<html>
<head>
<title>session练习项目-汇智网</title>
</head>
<body>
<!--登录成功展示的内容-->
<p>welecome <strong> <%=session.name%> </strong>, 欢迎你再次登录<a href="/out"></a>

</body>
</html>
```

>

- 首先创建views文件夹，并在文件夹中创建两个ejs文件分别为：index.ejs 和 sign.ejs
- 然后把上述中的代码写到文件中
- 最后保存文件。

## 3.2 用户凭证
### 用户凭证

我们创建一个user.json的文件，把用户凭证信息存放到当中：

```javascript
{
"hubwiz":{
"password": "0903",
"name": "汇智网"
}
}
```

 *hubwiz* 为登录用户名， *password* 为登录密码， *name* 为用户昵称。

然后通过require载入express和user文件：

```javascript
var express = require('express'),
user = require('./user');
```

接着我们加上bodyParser和session中间件，由于session中间件需要操作cookie，所以在它之前要先引入cookieParser模块。如下：

```javascript
var cookieParser = require('cookie-parser'),
bodyParser = require('body-parser'),
session = require('express-session');

app.use(session({
secret: 'hubwizApp', //为了安全性的考虑设置secret属性
cookie: {maxAge: 60 * 1000 * 30}, //设置过期时间
resave: true, // 即使 session 没有被修改，也保存 session 值，默认为 true
saveUninitialized: false, //
}));
```

>

- 创建user.json文件，然后按照上述中的格式添加信息，然后保存。

- 然后参照上述代码在app.js文件中添加代码。

- 最后保存文件。

<div>

## 3.3 检查是否登录
### 检查是否登录

接下来，我们首先检查用户是否已经登录。如果没有登录则展示index页面

```javascript
var app = express();

app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));
app.use(cookieParser());

app.get('/', function (req, res) {
if (req.session.sign) {//检查用户是否已经登录，如果已登录展现的页面
console.log(req.session);//打印session的值
res.render('sign', {session:req.session});
} else {//否则展示index页面
res.render('index', {title: 'index'});
}
});
```

>

- 参照上述代码在app.js文件中添加代码。

- 最后保存文件。

<div>

## 3.4 登录验证
### 登录验证

登录路由检查登录表单的信息是否与用户凭证匹配，匹配则认为登录成功，否则失败：

```javascript
//登录表单处理
app.post('/sign', function (req, res) {
//登录的数据和user.json中的数据进行对比
if (req.body.password != user[req.body.user].password || !user[req.body.user]) {
res.end('sign failure');
} else {
req.session.sign = true;
req.session.name = user[req.body.user].name;
res.send('welecome <strong>' + req.session.name + '</strong>，<a href="/out">登出</a>');
}
});
```

截止到现在我们就把一个简单的session登录完成了。

>

- 首先把上述中的路由添加到app.js文件中。

- 然后点击 <kbd>提交运行</kbd> 启动我们的nodejs应用。再点击访问测试

- 之后在表单中输入用户凭证信息，登录成功，在返回主页面验证session。

<div>

## 3.5 注销session
### 注销session

剩下的工作就是注销操作了，非常简单，只需要在req.session 上调用destroy() 方法来清空session 就可以了：

```javascript
app.get('/out', function(req, res){
req.session.destroy();
res.redirect('/');
})
```

把上述代码加入到app.js文件当中。

这样我们的session课程就到此结束了。

>

- 参照上述代码在app.js文件中添加代码。

- 最后保存文件。点击<kbd>访问测试</kbd>

<div>
