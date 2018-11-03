# Node异步编程
<!-- TOC  -->

- [Node异步编程](#node异步编程)
- [1  异步编程 简介](#1--异步编程-简介)
    - [1.1 简介即打印hello world](#11-简介即打印hello-world)
    - [1.2 node.js的优势](#12-nodejs的优势)
    - [1.3 非线性思维在流程控制中的好处](#13-非线性思维在流程控制中的好处)
    - [1.4 node.js中如何进行异常捕获](#14-nodejs中如何进行异常捕获)
    - [1.5 node.js灰调函数的函数嵌套](#15-nodejs灰调函数的函数嵌套)
    - [1.6 课程小结](#16-课程小结)
- [2 异步编程 函数式编程](#2-异步编程-函数式编程)
    - [2.1 Node.js中的高阶函数](#21-nodejs中的高阶函数)
    - [2.2 现实中Node.js高阶函数的应用如排序](#22-现实中nodejs高阶函数的应用如排序)
    - [3.2 Node.js中series函数串行执行](#32-nodejs中series函数串行执行)
    - [3.3 waterfall函数顺序执行](#33-waterfall函数顺序执行)
    - [3.4 parallel函数并行立即执行](#34-parallel函数并行立即执行)
    - [3.5 parallelLimit函数并行执行限制并发数](#35-parallellimit函数并行执行限制并发数)
    - [3.6 whilst函数异步循环调用](#36-whilst函数异步循环调用)
    - [3.7 doWhilst函数异步循环调用](#37-dowhilst函数异步循环调用)
    - [3.15 iterator函数组调用](#315-iterator函数组调用)
    - [3.16 课程小结](#316-课程小结)

<!-- /TOC  -->

# 1  异步编程 简介

## 1.1 简介即打印hello world
#### 什么是异步编程？

异步编程是指由于异步I/O等因素，无法同步获得执行结果时，在回调函数中进行下一步操作的代码编写风格,常见的如setTimeout函数、ajax请求等等。

示例：

```js
console.log('hi!');
setTimeout(function(){
console.log('hello!');
},1000);
console.log('wow!');
```
从示例中可以看到，hello是在wow输出后才输出的，因为setTimeout函数设置了延迟1000毫秒才异步执行，`function(){ console.log('hello'); }`就是异步回调函数，这样的编程风格就是异步编程。

试一试,运行示例中的代码，观察输出的顺序。

请将示例中的代码录入到编辑器中，并提交运行。

## 1.2 node.js的优势
#### 优势

为什么选择node.js？它有哪些优势呢？

- 性能：相对于多线程，异步I/O没有了线程间的上下文切换开销，由此带来可观的性能提升是选择它的主要原因。
- 成本：由于性能的提升，相同的硬件可以发挥更大的作用，变相的降低了运营成本，由于node.js采用javascript作为开发语言，而javascript的使用已经非常广泛，所以降低了node.js的学习成本。
- 效率：node.js采用javascript作为开发语言，使前后端开发语言统一，不需要切换开发语言，使开发效率更高，加之javascript使用者众多，使得node.js迅速的流行起来。

## 1.3 非线性思维在流程控制中的好处
#### 不符合线性思维习惯

虽然异步会带来很多好处，但是也衍生了很多问题。
异步编程在流程控制中业务表达不太适合自然语言的线性思维习惯。

实例 - 获取数据

线性表达

```js
var data = getData(id);
```
异步编程:
```js
getData(id,function(data){
//在回调函数中才能获取到data数据
});
```

思维模式的转换是异步编程初学者遇到的难点之一，要克服这个问题没有什么捷径可走，只有长期的使用锻炼，以适应这样的思维模式。

## 1.4 node.js中如何进行异常捕获
#### 异常捕获

异步I/O的实现主要有两个阶段，①提交请求；②处理结果；
这两个阶段彼此不关联，而异常并不一定发生在请求提交（即调用函数）时，平常的try/catch并不能有效的捕捉到程序的异常。

示例：

```js
try{
setTimeout(function(){
var data = a/1; //错误的计算
},1000);
}catch (e){
console.log(e);
}
```

因为计算并不会马上执行，所以即便是发生了错误，也无法捕获到相关信息，那么异步编程中应该如何处理异常的呢？请看示例2：

```js
setTimeout(function(){
try{
var data = a/1; //错误的计算
}catch(e){
console.log(e);
}
},1000);
```

## 1.5 node.js灰调函数的函数嵌套
#### 函数嵌套

刚刚接触node.js的朋友们都有一个共同的烦恼，在进行较复杂的业务处理时，茫茫多的callback看得人头昏眼花，写着写着自己都糊涂了，更何况普遍患有强迫症的程序猿，面对如此难看的代码，如何能忍？

```js
test1(function(v1){
test2(funciton(v1,function(v2){
test3(function(v2,fcuntion(v3){
test4(v3,function(v4){
callback(v4);
});
}));
}));
});
```

异步编程中，函数嵌套是一个普遍存在的问题，也因此常常被人诟病，如何解决函数嵌套，后面的课程将专门讲解这个问题。

## 1.6 课程小结
#### 课程小结

在学习node.js的时候，异步编程往往成为了初学者的一个烦恼，面对非线性的思维、异常难以捕获、嵌套的忧虑等问题就放弃了。

非线性的思维只是因为和以前的习惯不太一样，才会觉得不太适应，但是长期使用锻炼你也会发现它并非一无是处。

异常捕获在node.js中也有了统一的约定，将异常信息作为回调函数的第一个实参传递给回调函数。
深层嵌套的问题也有很多解决办法，后面的课程中会一一解答。

- 思维方式 ===> 非线性思维需要多使用锻炼，适应这种思维方式。
- 异常捕获 ===> 遵守node.js统一的回调函数格式，将异常信息传入回调函数。
- 函数嵌套 ===> 相应解决方案，专门课程讲解。

# 2 异步编程 函数式编程

## 2.1 Node.js中的高阶函数
#### 什么是高阶函数

高阶函数是异步编程的基础，那么什么是高阶函数呢?

高阶二字听起来有点高大上的感觉，其实不然，高阶函数与普通函数不同的地方是高阶函数可以把函数作为参数，或者是将函数作为返回值，请看如下示例。

示例：

```js
function test(v){
return function(){
return v;
}
}
```

示例中是一个最简单的高阶函数，如你所见，高阶函数test的返回值是一个匿名函数。

定义一个高阶函数test，test有两个参数a和b,test返回一个将a和b相加的匿名函数。

```js
function test(a,b){
return function(){
return a+b;
}
}
```

## 2.2 现实中Node.js高阶函数的应用如排序
#### 现实应用

虽然有可能是第一次真正的去了解什么是高阶函数，但是其实我们在日常开发中经常会用到它，只是我们没有去留意或者说不知道它的称谓而已。

示例：数组的排序(sort)函数

```js
var arr = [23,54,3,12,78];
arr.sort(function(a,b){
return a-b;
});
```

有没有很熟悉的感觉,想一想常见的还有哪些高阶函数。

```jsvar test = [5,34,87,32,56,2,17];```
将数组test按从大到小进行排序，并打印排序结果。

```js
var test = [5,34,87,32,56,2,17];
test.sort(function(a,b){
return b-a;
});
console.log(test);
```

## 2.3 Node.js中的偏函数示例
#### 偏函数

什么是偏函数？

假设有一个参数或变量已经预置的函数A，我们通过调用A来产生一个新的函数B，函数B就是我们说的偏函数，有点拗口？请看示例：

```js
var isType = function(type){
return function(obj){
return toString.call(obj)=='[object '+type+']';
}
};
var isString = isType('String');
var isFunction = isType('Function');
```

isType函数中预置了判断类型的方法，只指定部分参数来产生的新的定制的函数isString和isFunction就是偏函数。

参考示例，定义一个判断数组类型的偏函数isArray(注意示例中object后的空格)。

```js
var isType = function(type){
return function(obj){
return toString.call(obj)=='[object '+type+']';
}
};
var isArray= isType('Array');
```

## 2.4 如何用node.js编写一个偏函数
#### 编写偏函数

学习了偏函数，试一试编写一个简单的偏函数！

Tom想编写一个函数say，通过传入不同的name参数，say函数可以创建出不同的偏函数，偏函数接受一个名为text的参数，执行偏函数时，控制台输出格式为:name+" say "+text，请帮助Tom编写say函数，通过say函数创建偏函数tomSay，并调用tomSay输出"tom say hello"。

```js
var say =function(name){
return function(text){
console.log(name+' say '+text);
}
};
var tomSay = say('tom');

tomSay ('hello');
```

## 2.5 课程小结
#### 课程小结

高阶函数和偏函数是异步编程的基础，熟练运用高阶函数和偏函数是非常必要的。

##### 高阶函数

- 函数作为参数；
- 函数作为返回值；

##### 偏函数

- 一个创建函数的工厂函数；
- 通过指定部分参数，定制新的函数；

# 3 异步编程 流程控制

## 3.1 Node.js流程控制简介
#### async

async是一个流程控制库，它就像黑夜中的明灯照亮那陷入callback嵌套泥潭的人们。
这么说虽然有些夸张，但是async确实为我们带来了丰富的嵌套解决方案。

项目地址：

<blockquote>
<a href="https://github.com/caolan/async">https://github.com/caolan/async</a>

</blockquote>

npm 安装:

```jsnpm install async```
使用方法：

```jsvar async = require('async');```

请参照使用方法，引入async模块。

```jsvar async = require('async');```

## 3.2 Node.js中series函数串行执行
#### series(tasks,callback);

首先登场的是series函数，它的作用是串行执行，一个函数数组中的每个函数，每一个函数执行完成之后才能执行下一个函数，示例如下：

```js
async.series({
one: function(callback){
callback(null, 1);
},
two: function(callback){
callback(null, 2);
}
},function(err, results) {

});
```

series函数的第一个参数可以是一个数组也可以是一个JSON对象，参数类型不同，影响的是返回数据的格式，如示例中的参数为数组，返回的results应该是这样的'[1,2]'。

将示例的tasks参数改写数组类型，并将执行结果打印出来(别忘了载入async模块)。

```js
var async = require('async');
async.series([
function(callback){
callback(null, 1);
},
function(callback){
callback(null, 2);
}
],function(err, results) {
console.log(results);
});
```

## 3.3 waterfall函数顺序执行
#### waterfall(tasks, [callback])

waterfall和series函数有很多相似之处，都是按顺序依次执行一组函数，不同之处是waterfall每个函数产生的值，都将传给下一个函数，而series则没有这个功能，示例如下：

```js
async.waterfall([
function(callback){
//task1
callback(null,1);
},function(data,callback){
//task1
callback(null,2);
}
],function(err,results){
console.log(results);
});
```

另外需要注意的是waterfall的tasks参数只能是数组类型。

请将示例中task1回调函数的第一个参数传入一个非空值，看一看输出的results的值是什么。

```js
var async = require('async');
async.waterfall([<br>    function(callback){
callback('test',1);<br>    },function(data,callback){
callback(null,2);
}
],function(err,results){<br>    console.log(results);
});
```

## 3.4 parallel函数并行立即执行
#### parallel(tasks, [callback])

parallel函数是并行执行多个函数，每个函数都是立即执行，不需要等待其它函数先执行。
传给最终callback的数组中的数据按照tasks中声明的顺序，而不是执行完成的顺序，示例如下：

```js
async.parallel([
function(callback){
callback(null, 'one');
},
function(callback){
callback(null, 'two');
}
],
function(err, results){

});
```

tasks参数可以是一个数组或是json对象，和series函数一样，tasks参数类型不同，返回的results格式会不一样。

将示例中tasks的回调函数用setTimeout在1000毫秒后调用，然后在parallel的回调函数中输出results，看一看整个过程花费了1s还是2s。

```js
var async=require("async");
async.parallel([
function(callback){
setTimeout(function(){
callback(null, 'one')
},1000);
},
function(callback){
setTimeout(function(){
callback(null, 'two')
},1000);
}
],
function(err, results){
console.log(results);
});
```

## 3.5 parallelLimit函数并行执行限制并发数
#### parallelLimit(tasks, limit, [callback])

parallelLimit函数和parallel类似，但是它多了一个参数limit。
limit参数限制任务只能同时并发一定数量，而不是无限制并发，示例如下：

```js
async.parallelLimit([
function(callback){
callback(null, 'one');
},
function(callback){
callback(null, 'two');
}
],
2,
function(err, results){

});
```

将示例中tasks的回调函数用setTimeout在1000毫秒后调用，limit参数设置为1，然后在parallelLimit的回调函数中输出results，看一看整个过程花费了1s还是2s。

```js
var async=require("async");
async.parallelLimit([
function(callback){
setTimeout(function(){
callback(null, 'one');
}, 1000);
},
function(callback){
setTimeout(function(){
callback(null, 'two');
}, 1000);
}
],
1,
function(err, results){
console.log(results);
});
```

## 3.6 whilst函数异步循环调用
#### whilst(test, fn, callback)

相当于while，但其中的异步调用将在完成后才会进行下一次循环。当你需要循环异步的操作的时候，它可以帮助你。示例如下：

```js
var count = 0;
async.whilst(
function () { return count < 5; },
function (callback) {
count++;
setTimeout(callback, 1000);
},
function (err) {

}
);
```

test参数是一个返回布尔值结果的函数，通过返回值来决定循环是否继续，作用等同于while循环停止的条件。

fn参数就是我们要异步执行的作业，每次fn执行完毕后才会进入下一次循环。

> ```jsvar list = [{name:'Jack',age:20},{name:'Lucy',age:18}];```
使用whilst，将list中所有人的age都加1。

## 3.7 doWhilst函数异步循环调用
#### doWhilst(fn, test, callback)

相当于do…while,较whilst而言，doWhilst交换了fn,test的参数位置，先执行一次循环，再做test判断。

```js
var count = 0;
async.doWhilst(
function (callback) {
count++;
setTimeout(callback, 1000);
},
function () { return count < 5; },
function (err) {

```javascript
}
```

);
```

> ```js
var apple = 2,
student = ['张三','李四','王五'];
```
将苹果依次分给学生，最后输出没有分到苹果的学生。

## 3.8 until函数异步循环调用
#### until(test, fn, callback)

until与whilst正好相反，当test条件函数返回值为false时继续循环，与true时跳出。其它特性一致。示例如下：

```js
var count = 5;
async.until(
function () { return count < 0; },
function (callback) {
count--;
setTimeout(callback, 1000);
},
function (err) {

}
);
```

## 3.9 doUntil函数异步循环调用
#### doUntil(fn, test, callback)

doUntil与doWhilst正好相反，当test为false时循环，与true时跳出。其它特性一致。

示例：

```js
var count = 5;
async.doUntil(
function (callback) {
count--;
setTimeout(callback, 1000);
},
function () { return count < 0; },
function (err) {

}
);
```

## 3.10 forever函数一直循环执行除非出错
#### forever(fn, errback);

forever函数比较特殊，它的功能是无论条件如何，函数都一直循环执行，只有出现程序执行的过程中出现错误时循环才会停止，callback才会被调用。

示例：

```js
async.forever(
function(next) {

```javascript
},
function(err) {
//
}
```

);
```

> 用forever做一个跑步机，输出当前跑了多少步，在第10步的时候不小心绊倒了。

## 3.11 Node.js中compose函数异步函数集合
#### ##compose(fn1, fn2...);

使用 *compose* 可以创建一个异步函数的集合函数，将传入的多个异步函数包含在其中，当我们执行这个集合函数时，会依次执行每一个异步函数，每个函数会消费上一次函数的返回值。

我们可以使用 *compose* 把异步函数 *f* 、 *g* 、 *h* ，组合成 *f(g(h()))* 的形式，通过 *callback* 得到返回值，请看示例：

```js
function fn1(n, callback) {
setTimeout(function () {
callback(null, n + 1);
}, 1000);
}
function fn2(n, callback) {
setTimeout(function () {
callback(null, n * 3);
}, 1000);
}
var demo = async.compose(fn2, fn1);
demo(4, function (err, result) {

});
```

> 执行示例代码，将result结果输出到控制台，观察运行消耗的时间。

## 3.12 auto函数有依赖关系的多个任务的执行
#### auto(tasks, [callback]);

用来处理有依赖关系的多个任务的执行。示例如下：

```js
async.auto({
getData: function(callback){
callback(null, 'data', 'converted to array');
},
makeFolder: function(callback){
callback(null, 'folder');
},
writeFile: ['getData', 'makeFolder', function(callback, results){
callback(null, 'filename');
}],
emailLink: ['writeFile', function(callback, results){
callback(null, {'file':results.writeFile, 'email':'user@example.com'});
}]
}, function(err, results) {
console.log('err = ', err);
console.log('results = ', results);
});
```

示例中writeFile依赖getData和makeFolder,emailLink依赖writeFile。

> 执行示例代码，将所有的results输出到控制台，观察输出顺序和内容。

## 3.13 Node.js中queue多点回调
#### queue(worker, concurrency);

queue相当于一个加强版的parallel，主要是限制了worker数量，不再一次性全部执行。当worker数量不够用时，新加入的任务将会排队等候，直到有新的worker可用。

它有多个点可供回调，如无等候任务时(empty)、全部执行完时(drain)等。

示例：定义一个queue，其worker数量为2：

```js
var q = async.queue(function(task, callback) {
console.log('worker is processing task: ', task.name);
callback();
}, 2);
q.push({name: 'foo'}, function (err) {
console.log('finished processing foo');
});
q.push({name: 'bar'}, function (err) {
console.log('finished processing bar');
});
```

当最后一个任务交给worker执行时，会调用empty函数:

```js
q.empty = function() {
console.log('no more tasks wating');
}
```

> 参照示例，当q全部执行完时输出'work is over.';

## 3.14 apply生成可直接调用的新函数
#### apply(function, arguments..)

apply是一个非常好用的函数，可以让我们给一个函数预绑定多个参数并生成一个可直接调用的新函数，简化代码。示例如下：

```js
function(callback) {
test(3, callback);
};
```
用apply改写：

```jsasync.apply(test, 3);```

> log是通过为console.log函数预设了一个参数'> '而得到的新函数，其输出格式为'>  **** '，请实现log函数，并调用它输出'> good';

## 3.15 iterator函数组调用
#### iterator(tasks)

将一组函数包装成为一个iterator，可通过next()得到以下一个函数为起点的新的iterator。该函数通常由async在内部使用，但如果需要时，也可在我们的代码中使用它。

```js
var iter = async.iterator([
function() { console.log('111') },
function() { console.log('222') },
function() { console.log('333') }
]);
iter();
```

直接调用()，会执行当前函数，并返回一个由下个函数为起点的新的iterator。调用next()，不会执行当前函数，直接返回由下个函数为起点的新iterator。

对于同一个iterator，多次调用next()，不会影响自己。如果只剩下一个元素，调用next()会返回null。

> 通过next函数获得新的iter，并调用它，看看输出结果。

## 3.16 课程小结
#### 课程小结

async模块在流程控制方面给我们带来了比较全面的解决办法，下面我们来回顾一下都有哪几种方案：

- 串行控制：series、waterfall、compose;

- 并行控制：parallel、parallelLimit、queue;

- 循环控制：whilst、doWhilst、until、doUntil、forever;

- 其他控制：apply、applyEach、iterator、auto;

学习了async模块后，对一般的函数嵌套问题都能够引刃而解，如果还有比较特别的应用需求，可以跟大家一起讨论一下，看看小伙伴有没有更好的解决办法，欢迎继续学习其他课程。
