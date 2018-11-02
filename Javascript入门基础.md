# 1 进入javascript世界

## 1.1 认识JavaScript
##### JavaScript是什么?

JavaScript是一种可以用来给网页增加交互性的编程语言。也常被称为“脚本语言”。
它是世界上最流行的编程语言。

##### 学习JavaScript的好处

<ul>
<li>1.所有主流浏览器都支持JavaScript</li>
<li>2.大部分的网页都会用到JavaScript</li>
<li>3.可以让网页呈现各种动态效果</li>
<li>4.学习起来很容易，同时学习环境只要有文本编辑器就可以编写JavaScript代码</li>
</ul>
##### 本课程能学到什么?

本课程是入门课程，内容主要是*基础的语法*和*DOM的简单操作*。



## 1.2 如何插入js代码
##### js代码的位置

html中的js代码必须放在*script标签*里面。

js代码可以放在HTML页面中*head和body*标签部分中。

##### 示例:

```javascript
<!DOCTYPE html>
<html>
<head>
<title>first script</title>
</head>
<body>
<script>
document.write("hello world!");
</script>
</body>
</html>
```

##### 示例讲解:

<ul>
<li>*<script>*这是script 开始标签，告诉浏览器后面的代码是js而不是html;</li>
<li>*document.write("Hello, world!");*这是是一个JavaScript语句：它获得文档窗口并在其中写入"Hello, world!"。一行的结束就被认定为语句的结束，通常在结尾加上一个分号";"来表示语句的结束。</li>
<li>*</script>*这结束JavaScript，并告诉浏览器后面的代码是html。</li>
</ul>
PS: 那些老旧的实例可能会在 script 标签中使用* type="text/javascript"*。现在已经不必这样做了。JavaScript 是所有现代浏览器以及 html5 中的默认脚本语言。


>
在右侧html代码框中第九行试试上述hello world的例子。



## 1.3 引入外部js
##### 外部js的引用

有时候我们经常需要让多个html页面共享一个脚本，所以就把脚本保存到外部文件中。
外部JavaScript文件的文件扩展名是 .js。

如需使用外部文件，请在 `<script>`标签的 "src" 属性中设置该 .js 文件：

##### 示例:

```javascript
<!DOCTYPE html>
<html>
<head>
<!-- 引入了外部的一个myScript.js的文件 -->
<script src="myScript.js"></script>
</head>
<body>
</body>
</html>
```

文件路径：*./example/hello.js*，代码如下：

```javascript
document.write("我是一个外部的JavaScript文件");
```

提示：外部JavaScript文件中不用`<script>`标签


>
在右侧html代码框中第六行中引入上述中hello.js文件。



## 1.4 变量
##### 什么是变量？

变量是用于存储信息的容器。

##### 变量的命名规则

<ul>
<li>变量必须以字母开头；</li>
<li>变量也能以$和_符号开头（不过我们不推荐这么做）；</li>
<li>变量名称对大小写敏感（a和A是不同的变量)。</li>
</ul>
##### 变量的声明

语法：*var 变量名*

##### 示例：

```javascript
var x = 2015; //声明变量的同时初始化变量
var MyName = "hubwiz"; //在为变量赋文本值时，为该值加引号
```


>
在右侧html代码框中的script标签中声明 x 和 y 变量 并分别赋值（任意赋值），然后利用document.write(x)和document.write(y)进行输出。



## 1.5 语句
##### 语句

语句以一个分号结尾；如果省略分号，则由解析器确定语句的结尾。

如下示例：

```javascript
var sum = a + b // 即使没有分号也是有效的语句——不推荐
var dif = a - b; // 有效的语句——推荐
```

然语句结尾的分号不是必需的，但我们建议任何时候都不要省略它。另外，加上分号也会在某些情况下增进代码的性能，因为这样解析器就不必再花时间推测应该在哪里插入分号了。



## 1.6 数据类型
##### 数据类型

在JavaScript中，一段信息就是一个值（value）。值有不同的类型，大家最熟悉的类型是数字。字符串（string）值是包围在引号中的一个或多个单词。

<table class="table">
<tr>
<td>类型</td>
<td>描述</td>
<td>示例</td>
</tr>
<tr>
<td>数字</td>
<td>任何数字值。数字可以带小数点，也可以不带</td>
<td>68.57</td>
</tr>
<tr>
<td>字符串</td>
<td>引号中的字符。您可以使用单引号或双引号</td>
<td>"hello, world"</td>
</tr>
<tr>
<td>布尔值（Boolean）</td>
<td>true或false</td>
<td>true</td>
</tr>
<tr>
<td>Undefined 和 Null</td>
<td>Undefined 这个值表示变量不含有值。可以通过将变量的值设置为 null 来清空变量。</td>
<td></td>
</tr>
<tr>
<td>对象</td>
<td>与对象相关联的任何值</td>
<td></td>
</tr>
<tr>
<td>函数</td>
<td>函数返回的值</td>
<td></td>
</tr>
</table>

PS：数据类型中我们将在《JavaScript深入》课程更加详细的讲解

##### 动态类型

JavaScript 拥有动态类型。这意味着相同的变量可用作不同的类型。

##### 示例：

```javascript
var a; //a为undefined
var a = 6; //a 为数字
var a = "Jason"; // a 为字符串
```


>
声明一个数字类型和字符串类型的，并利用document.write()进行输出。


# 2 开始互动

## 2.1 代码中的注释
##### 注释的作用

注释用于提高代码的可读性。由于JavaScript不会执行注释，也可用于阻止代码的执行（多用于调试）。注释分为：*单行注释和多行注释*。

##### 单行注释

单行注释是在注释内容前加符号 "//" 。

##### 如下示例：

```javascript
document.write("my name is huizhiwang"); //我是注释，该语句用于输出
```

##### 多行注释

##### 如下示例：

```javascript
/*
这里是多行注释
下面的语句用于输出
*/
document.write("多行注释");
```


>
在右侧html代码框第六行单行注释掉，把七、八、九行进行多行注释。



## 2.2 关于函数(function)
##### 什么是函数？

函数是一组执行某一任务的JavaScript 语句，可被脚本的其他部分调用。这时我们就可以把完成特定功能的代码块放到一个函数里，直接调用这个函数，就省重复输入大量代码的麻烦。

##### 基本语法：

```javascript
function functionName(){
代码块
}
functionName();
```

##### 说明：

<ul>
<li>*function* 定义函数的关键字</li>
<li>*第一个functionName* 是自己给函数取的名字</li>
<li>*代码块* 是完成某一任务的代码</li>
<li>*第二个functionName* 函数调用的一种</li>
</ul>
PS：还有其他定义函数的方法，我们将在JavaScript进阶中讲解

##### 示例：

```javascript
function add(){
var x = 3; //定义变量x
var y = 6; //定义变量y
document.write(x + y);  //document.write 输出 x 加 y 之后的值
}
add();
```


> 在JavaScript代码框中编写一个函数名是*doc*，功能是输出文本是*"你是一个好人"*的警告框。最后调用这个函数。</div>

## 2.3 发出警报(alert)
##### 发出警报

JavaScript的主要用途之一是向用户提供反馈的信息。比如创建一个弹出的警告窗口，提供给用户必须要了解的重要信息。这个警告窗口是使用alert实现的。

语法：*alert(字符串或变量);*

##### 示例：

```javascript
var myName = "者行孙"；
alert("hello!");
alert(myName);
```

PS: 弹出警告的警告窗口有一个确定按钮，点击确定会继续执行后面的代码。


>
在script标签中定义一个变量名为myName赋值，并使用alert弹出变量myName的内容。



## 2.4 确认选择(confirm)
##### 确认选择

除了向用户提供信息，我们还希望从用户那里获得信息。这里就用到了confirm 消息对话框。

语法：*confirm(str);*

参数说明：

str: 在消息对话框中要显示的文本，返回的是布尔值。当点击“确定”按钮时，会返回true，点击“取消”按钮时，返回的是false。

##### 示例：

```javascript
if(confirm("你有房有车有存款吗？")==true){
document.write("求包养");
}else{
document.write("努力吧，少年");
}
```


> 询问用户“你喜欢学习JavaScript吗？”，当为true时返回“让我们一起共同进步”    当为false时返回“你可能需要进一步了解JavaScript”。




## 2.5 提示(prompt)
##### 提示

有时候，不仅希望用户回答Yes/No。而是希望得到更特定的响应。这中情况我们可以利用prompt。

语法：*prompt(str1, str2);*

参数说明：

str1：要显示在消息对话框中的文本，不能修改

str2：文本框中的内容，可以修改

点击确定按钮，文本框中的内容将作为函数返回值，点击取消按钮将返回null。

##### 示例：

```javascript
var myName = prompt("输入您的名字");
if(myName != null &amp;&amp; myName != ''){
document.write("welcome to " + myName);
}else{
document.write("welcome to my friend.");
}
```


> 练习一下上面中的示例，不要复制哦。</div>

## 2.6 打开新页面
##### 打开新页面

在html页面中，有时我们需要跳转到新的页面中。这是时候就用到了open()。

语法：*window.open(URL, 窗口名称);*

参数说明：

URL：可选,打开窗口的网址或路径。如果省略了这个参数，或者它的值是空字符串，那么新窗口就不会显示任何文档。

窗口名称：可选,该字符串是一个由逗号分隔的特征列表，声明了被打开窗口的名称。可以是"_top"、"_blank"、"_selft"、"_parent"等。

<ul>
<li>_*blank* 在新窗口显示目标网页</li>
<li>_*selft* 在当前窗口显示目标网页</li>
<li>_*parent* 框架网页中当前整个窗口位置显示目标网页</li>
<li>_*top* 框架网页中在上部窗口中显示目标网页</li>
</ul>
##### 示例：

```javascript
function open_win() {
window.open("http://www.baidu.com","_blank");
}
open_win();
```

示例功能：跳转到"<a href="http://www.baidu.com",以新的窗口打开。">http://www.baidu.com",以新的窗口打开。</a>


> 以新的窗口打开"<a href="http://www.hubwiz.com"首页。">http://www.hubwiz.com"首页。</a></div>
# 3 流程控制

## 3.1 if..else.. 语句
##### if..else.. 语句

用于基于不同的条件来执行不同的动作。

##### 有三种语句：

##### if语句

只有当指定条件为true时，该语句才会执行代码。

##### 语法：

```javascript
if(条件){
只有条件为true才会执行的代码
}
```

##### if...else 语句

当条件为true时执行if里面的代码，在条件为false时执行else里面的代码

##### 语法：

```javascript
if(条件){
条件为true时执行的代码
}else{
当条件不为 true 时执行的代码
}
```

##### If...else if...else 语句

使用 if....else if...else 语句来选择多个代码块之一来执行。

##### 语法：

```javascript
if (条件 1) {
当条件 1 为 true 时执行的代码
} else if (条件 2) {
当条件 2 为 true 时执行的代码
} else {
当条件 1 和 条件 2 都不为 true 时执行的代码
}
```


>
在javascript代码框中，定义一个分数的变量，当分数大于90 输出优秀，大于60小于90输出及格，小于60输出不及格



## 3.2 switch 语句
##### switch 语句

switch 语句用于基于不同的条件来执行不同的动作。

##### 语法：

```javascript
switch(n) {
case 1:
执行代码块 1
break;
case 2:
执行代码块 2
break;
default:
n 与 case 1 和 case 2 不同时执行的代码
}
```

语法解释：首先设置表达式 n（通常是一个变量）。随后表达式的值会与结构中的每个 case 的值做比较。如果存在匹配，则与该 case 关联的代码块会被执行。请使用 break 来阻止代码自动地向下一个 case 运行。

##### default 关键词

default 关键词来规定匹配不存在时做的事情



## 3.3 for 循环
##### for 循环

如果您希望一遍又一遍地运行相同的代码，并且每次的值都不同，那么这时使用循环会很方便的完成您的需求，下面讲解for循环的用法和示例。

##### 语法：

```javascript
for (语句 1; 语句 2; 语句 3)  {
被执行的代码块
}
```

参数解释：

<ul>
<li>*语句 1* 在循环（代码块）开始前执行</li>
<li>*语句 2* 定义运行循环（代码块）的条件</li>
<li>*语句 3* 在循环（代码块）已被执行之后执行</li>
</ul>
##### 示例：

```javascript
for(var i = 0; i < 5; i++){
document.write("我是第" + i + "循环");
}
```


>
试试上述中的示例



## 3.4 while 循环
##### while 循环

只要指定条件为 true，循环就可以一直执行代码。

##### 语法：

```javascript
while (条件) {
需要执行的代码
}
```

##### 示例：

```javascript
var i = 0
while (i<5)  {
document.write("i的值" + i + "
");
i++;
}
```

##### do/while 循环

do/while 循环是 while 循环的变体。该循环会执行一次代码块，在检查条件是否为真之前，然后如果条件为真的话，就会重复这个循环。

##### 语法：

```javascript
do {
需要执行的代码
}
while (条件);
```

##### 示例：

```javascript
var i = 0;
do  {
document.write("i的值" + i + "
");
i++;
}while(i < 5);
```


>
试试上述中的示例



## 3.5 break 和 continue 语句
##### break 和 continue 语句

break 语句用于跳出循环。continue 用于跳过循环中的一个迭代。

##### break 语句

我们已经在switch()语句的讲解中见到过，它用于跳出switch()语句。break 语句可用于跳出循环。break 语句跳出循环后，会继续执行该循环之后的代码（如果有的话）：

##### 示例：

```javascript
for (var i=0;i<10;i++) {
if (i==3) {
break;
}
document.write("i等于：" + i + "
");
}
```

##### continue 语句

continue 语句中断循环中的迭代，如果出现了指定的条件，然后继续循环中的下一个迭代。

##### 示例：

```javascript
for (var i=0;i<10;i++) {
if (i==3) {
continue; //跳过了值 3
}
document.write("i等于：" + i + "
");
}
```


>
上述中的两个示例，在右边代码框中复现。



## 3.6 throw、try 和 catch(错误处理)
##### try...catch...语句

当错误发生时，当事情出问题时，JavaScript 引擎通常会停止，并生成一个错误消息。

try 语句允许我们定义在执行时进行错误测试的代码块。

catch 语句允许我们定义当 try 代码块发生错误时，所执行的代码块。

JavaScript 语句 try 和 catch 是成对出现的。

##### 语法：

```javascript
try {
//在这里运行代码
}catch(err) {
//在这里处理错误
}
```

##### 示例：

```javascript
try {
allert("Welcome guest!");\\这里是故意把alert单词写错
}catch(err) {
txt="本页有一个错误。\n\n";
txt+="错误描述：" + err.message + "\n\n";
txt+="点击确定继续。\n\n";
alert(txt);
}
```

##### throw 语句

throw 语句允许我们创建自定义错误。

正确的技术术语是：创建或抛出异常（exception）。

如果把 throw 与 try 和 catch 一起使用，那么您能够控制程序流，并生成自定义的错误消息。

##### 语法：*throw exception*

参数：exception 可以是 JavaScript 字符串、数字、逻辑值或对象。

##### 示例：

```javascript
function myFunc(){
try{
//这是是获取id为test的输入框中的值，详细用处会在DOM操作中讲解
var test = document.getElementById("test").value;
if (x == ""){
throw "值为空";
}
if (x > 5){
throw "值小了";
}
if (x < 10){
throw "值大了";
}
}
catch (err){
alert("错误：" + err + "。");
}
}
```


>
仿照上面中的示例，功能是当输入的值小于60的时候抛出异常信息。


# 4 DOM操作

## 4.1 DOM简介
##### 什么是DOM？

文档对象模型（Document Object Model简称DOM）定义访问和处理HTML文档的标准方法。
通过 DOM，可访问 HTML 文档的所有元素。

当网页被加载时，浏览器会创建页面的文档对象模型（Document Object Model）。
HTML DOM 模型被构造为对象的树。

##### 代码段：

```javascript
<!DOCTYPE html>
<html>
<head>
<meta content="text/html" charset="utf-8" />
<title>文档标题</title>
</head>
<body>

<h1>我的标题<h1>
<a href="http://www.hubwiz.com">我的链接</a>
</body>
</html>
```

##### 将HTML代码分解为DOM树，如下图：

<img src="img/dom.png" alt="">

HTML文档可以说由节点构成的集合，三种常见的DOM节点:

<ul>
<li><ol>
<li>元素节点：上图中*<html>、<body>、<a>*等都是元素节点，即标签。</li>
</ol>
</li>
<li><ol>
<li>文本节点:向用户展示的内容，如*<title>...</title>*中的*“文档标题”*文本。</li>
</ol>
</li>
<li><ol>
<li>属性节点:元素属性，如*<a>*标签的链接属性 *href* 。</li>
</ol>
</li>
</ul>


## 4.2 查找HTML元素
##### 查找HTML元素

我们经常会遇到通过JavaScript来操作HTML元素要达到这个目标，我们必须首先找到该元素。

在这里我们将讲解两种方法来完成这件事情：

<ul>
<li>1.通过id 查找HTML元素</li>
<li>2.通过标签名查找HTML元素</li>
</ul>
##### 通过 id 查找 HTML 元素

在 DOM 中查找 HTML 元素的最简单的方法，是通过使用元素的 id。

##### 如下：

```javascript
//查找到id="email"的元素
var i = document.getElementById("email");
```

如果找到该元素，则该方法将以对象（在 x 中）的形式返回该元素。如果未找到该元素，则 x 将包含 null。

##### 通过标签名查找 HTML 元素

##### 如下：

```javascript
//查找到标签为a的元素
var y=x.getElementsByTagName("a");
```

##### 示例：

示例描述：



## 4.3 改变 HTML 元素的内容
##### 改变 HTML

-----------------
##### 改变 HTML 内容

修改 HTML 内容的最简单的方法时使用* innerHTML *属性。


##### 语法：*document.getElementById(id).innerHTML=new HTML*

##### 示例1：

```javascript
<html>
<body>

<p id="p1">Hello World!


<script>
document.getElementById("p1").innerHTML="New text!";
</script>
</body>
</html>
```

##### 改变 HTML 属性

##### 语法：

```javascript
document.getElementById(id).attribute=new value
```

##### 示例2：

```javascript
<!DOCTYPE html>
<html>
<head></head>
<body>
<input id="changes" type="text" value="改变标签的属性" />
<script>
//把input的属性type值改变为button
document.getElementById("changes").type="button";
</script>
</body>
</html>
```


>
在右边代码框中试试上述中的示例。



## 4.4 改变 CSS
##### 改变 HTML 样式

语法：*document.getElementById(id).style.property=new style*

property参数列表

<table class="table">
<tr>
<td>属性</td>
<td>描述</td>
</tr>
<tr>
<td>background</td>
<td>在一行中设置所有的背景属性</td>
</tr>
<tr>
<td>border</td>
<td>在一行设置四个边框的所有属性</td>
</tr>
<tr>
<td>clear</td>
<td>设置在元素的哪边不允许其他的浮动元素</td>
</tr>
<tr>
<td>color</td>
<td>设置文本的颜色</td>
</tr>
<tr>
<td>font</td>
<td>在一行设置所有的字体属性</td>
<td></td>
</tr>
<tr>
<td>fontSize</td>
<td>设置元素的字体大小。</td>
</tr>
</table>

##### 示例：

```javascript

我叫王大锤!

<script>
//改变id="p1"的p元素的文本颜色。
document.getElementById("p2").style.color="red";
</script>
```


>
试试上述中的示例


