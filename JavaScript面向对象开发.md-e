
# JavaScript 面向对象开发

<!-- TOC -->

- [JavaScript 面向对象开发](#javascript-面向对象开发)
- [1 JavaScript是什么](#1-javascript是什么)
    - [1.1 常见误区](#11-常见误区)
    - [1.2 解释型语言](#12-解释型语言)
    - [1.3 面向对象](#13-面向对象)
    - [1.4 基于原型](#14-基于原型)
    - [1.5 为什么存在兼容性问题](#15-为什么存在兼容性问题)
- [2 封装](#2-封装)
    - [2.1 原始对象](#21-原始对象)
    - [2.2 原始对象的封装](#22-原始对象的封装)
    - [2.3 构造函数](#23-构造函数)
    - [2.4 原型](#24-原型)
    - [2.5 通过原型扩展已有类型](#25-通过原型扩展已有类型)
- [3 继承与多态](#3-继承与多态)
    - [3.1 jQuery提供的继承方法](#31-jquery提供的继承方法)
    - [3.2 父类型的构造函数](#32-父类型的构造函数)
    - [3.3 直接继承成员](#33-直接继承成员)
    - [3.4 直接继承成员的缺陷](#34-直接继承成员的缺陷)
    - [3.5 优化的继承方法](#35-优化的继承方法)
- [4 事件](#4-事件)
    - [4.1 什么是事件](#41-什么是事件)
    - [4.2 function作为参数](#42-function作为参数)
    - [4.3 设计一个事件对象](#43-设计一个事件对象)
    - [4.4 将事件对象设计进类型](#44-将事件对象设计进类型)
    - [4.5 一些事件的基本规范](#45-一些事件的基本规范)
- [5 作用域](#5-作用域)
    - [5.1 原型的访问权限](#51-原型的访问权限)
    - [5.2 this关键字](#52-this关键字)
    - [5.3 this的难控性](#53-this的难控性)
    - [5.4 解决this的问题](#54-解决this的问题)
    - [5.5 总结](#55-总结)

<!-- /TOC -->

# 1 JavaScript是什么

## 1.1 常见误区
### 常见误区

很多新手没有系统地了解和学习JavaScript，而更多的将注意力放在了后台（如ASP.NET、Java、PHP等）的学习，从而对JavaScript会产生一些误见，不能正确的认识。致使对JavaScript的学习越来越困难。

现在我们在这里列举一些觉的误解：



- 一个提供修改DOM的语言
- JavaScript是一款运行在浏览器上的语言



这是两种最常见的误解，由于初学时期我们看到的大部分脚本都是用于在页面运行时期修改页面内HTML元素的，因此会容易产生这种误解。




实际上，JavaScript和C++、Java、C#等语言一样，是一种语言。他和其它所有语言一样，拥有基本类型（字符，数字，布尔）与三大语句（顺序、条件、循环），基于JavaScript我们可以做很多事情，最重要的是JavaScript不仅仅运行于浏览器，还可以直接运行于操作系统（有兴趣的同学可以查看有关“windows脚本宿主”的信息）。



我们平时所使用到的修改DOM的功能，仅仅是浏览器开发商提供给开发者所使用的。那么只要浏览器开发商乐意，他们还可以提供更多的功能给我们使用。我们也可以理解为，我们写的JavaScript脚本是在浏览器厂商允许的范围内，对浏览器进行二次开发。



另外，只要浏览器允许，JavaScript还可以调用运行机器上的ActiveX组件（比如使用Scripting.FileSystemObject对客户端电脑上的文件进行各种操作）。
遗憾的是，由于加载ActiveX组件可以变向的调用控件台等存在风险的行为，因此大部分浏览器已经禁止了这项操作。



## 1.2 解释型语言
### 解释型语言

一般来说，我们平常用到的大部分语言为分 *解释型语言* 和 *编译型语言* 。

还不太清楚这两种语言的同学可以看看下面的例子：

我们把一个程序的运行理解为听一个人演讲，听众是计算机，演讲人是程序员。他们使用不同的语言，让计算机直接这么听演讲，它肯定是听不懂的，于是我们有两个方案：

 **1、找人同步翻译**

我们找翻译能力超强的人作为翻译官。每当我们说完一句话，翻译官立刻跟听演讲的计算机说“刚才他那句话的意思是………………”。

 **2、预先翻译好讲话稿**

我们的演讲稿必须事先写好，然后让翻译官将我们写好的演讲稿翻译成指定的语言。等到真正演讲大会的时候，随便找个口语好的人读一下翻译后的稿子就可以了。


这两个方案分别就是 *解释型语言* 和 *编译型语言* 了。前者每读一行代码执行一行代码，后者需要有一个编译的过程，将我们的代码编译成计算机语言再执行。

JavaScript是一种 *解释型语言* ， *解释型语言* 不需要编译也能立刻执行代码，非常适合用于变动性大的场景，比如浏览器，我们可以在任意一个时间将head中添加一个新的js引用，由于是解释型语言，浏览器能够立刻解释这段脚本并执行。

一般来说，从运行效率上讲， *编译型语言* 是非常有优势的，就像已经把文章翻译好了一样，只需要不动脑子地去读就行了。

但是从灵活性上讲， *解释型语言* 有着编译型语言无法超越的优势，只要有一个解析器，不需要任何翻译工作，就可以随时随地的执行任何语句。



## 1.3 面向对象
### 面向对象

JavaScript在设计之初就是一种面向对象的语言，虽然我们在日常的开发中很少能体验到这一点。面向对象语言往往有个特征就是需要new一个实例。而JavaScript也确实如此：

```javascript
    var dNow = new Date();
    var obj = new Object();
```

面向对象拥有三大特征



- 封装
- 继承
- 多态


JavaScript作为面向对象的语言，也实现了这三大特征，在本课程的其它章节中，会对它们进行逐一介绍。



## 1.4 基于原型
### 基于原型

JavaScript是一款基于 *原型* 模式的面向对象语言。

我们可以把 *原型* 理解为是一个使用说明书，每一个类型都会有一个对应的使用说明书，凡是使用说明上规定的成员，都是可以使用的。

比如电视器的说明书上规定了开机、关机、换台等行为，那么每一台电视机都会具备这些功能。

并且我们还可以通过JavaScript代码为指定的类型的使用说明添加新的成员。

 *原型* 是JavaScript面向对象开发中最重要的一个概念。
关于 *原型* 的详细说明也会在本课程的其它章节中出现。



## 1.5 为什么存在兼容性问题
### 为什么存在兼容性问题

做过一段时间JavaScript开发的都会知道不同一个好的脚本要考虑到各个浏览器的兼容性问题。可是，为什么会存在兼容性问题呢？

我们同样用个现实生活中的例子来说明：

JavaScript语言就好比是我们说的“中文”、“英文”、“日文”等语言中的语法。只要按照这个语法的规则来，就是正确的语言，也就是说是正确的代码。

电脑其实是一个笨家伙，他虽然看的懂语法，但他看不懂名词。如果规定电脑是computer，那么他只知道compouter是电脑，PC就不认识了。这就是兼容性，各个浏览器厂家在开发那些“名词”的时候，用了不各自的“英文单词”，导致了不同的兼容性。

 *但是随着技术的发展，大家也正在不停地出台各种规范，以希望能有一天所有浏览器都能识别完全一样的JavaScript代码。*



# 2 封装

## 2.1 原始对象
### 原始对象

我们都知道面向对象中最重要的环节是封装。JavaScript提供了定义一个原始对象的方法，详细代码请见右侧示例：

示例中我们发现，通过构建一个Object实例，我们可以为该实例手动添加任何成员，可以是字符、数字、布尔甚至于一个方法，定义的方式，即可以用 *实例名.成员名 = 内容* ，也可以使用 *实例名["成员名"] = 内容* 。

```javascript
    worker.isWorking = false;        //通过明确的属性名添加成员

    var str = "phone";
    worker[str] = 13800000000;    //通过不明确的属性名添加成员（str可变，因此不明确）

    var phone = worker.phone;    //通过不明确添加的成员，可以进行明确的访问；也可以通过不明确的方式访问明确的成员。
    var name = worker["name"];
```

从上面的代码我们可以发现，明确访问成员和不明确访问成员，二者的效果是一样。

<hr/>

另外，JavaScript也提供了更快捷的定义一个原始对象的方法：

```javascript
    var worker = {
        name : "John",
        age : 30,
        isWorking : false,
        startWork : function(){
            if(!this.isWorking){
                this.isWorking = true;
            }
        }
    };
```

通过上面的方法，我们可以定义一个对象，将对象上的属性定义后便完成了 *封装* 的工作。之后，我们只需要调用 *对象* 上的 *成员* ，就可以相应的操作了。



## 2.2 原始对象的封装
### 原始对象的封装

不难发现的一点是，通过上面的方法定义的对象，缺少了复用性。也就是说，我们每次都要写name、age、isWorking等等等等，才能创建一个新的对象实例，这肯定是不合理的。

为了能够得到更好的封装效果，我们可以通过一个function来统一地构建一个对象的实例，比如：

```javascript
    function newWorker(name,age){
        return {
            name : name,
            age : age,
            isWorking : false,
            startWork : function(){
                //come code here;
            }
        };
    };
```

通过一个function的封装，我们可以每次获得一个相同结构的实例。



## 2.3 构造函数
### 构造函数

上节中的newWorker并不是真正的构造函数，JavaScript中提供了真正的构造函数，它的语法和定义一个function其实是一样的：

```javascript
    function worker(name,age){
        this.name = name;
        this.age = age;
        this.isWorking = false;
    }

    //通过new关键字实例化
    var tom = new worker("tom", 24);
```

怎么样？现在看上去是不是有点像面向对象的样子了？有点酷酷的哦，worker内部通过this关键字给实例增加了新的属性，我们同样可以使用this关键时定义新的方法：

```javascript
    function worker(name, age){
        this.name = name;
        this.age = age;
        this.isWorking = false;
        this.startWork = function(){
            if(this.isWorking) return;
            this.isWorking = true;
        };
    }

    var tom = new worker("tom", 24);
    tom.startWork();
```

越来越有点面向对象的样子了，即new了一个实例，又调用了实例上的方法。一切都很好，可是美中不足的是，这代段码实质上是创建了一个worker的实例，并将name,age,isWorking,startWork等成员在创建worker的实例后，放在实例上。

这就好像，我们要创建工人的实例，这些工人需要会打卡、修电灯和吃饭，按照上面代码的逻辑来映射的话就是：



- 创建一个什么都不会的工人
- 开始教这个工人如何打卡
- 开始教这个工人如何修电灯
- 开始教这个工人如何吃饭
- 投入使用



等下次还需要创建一个工人的时候，依然要重走上面的路线。<br/>
那我们不难要问，为什么不发他们一个员工手册自己看呢？

另外通过右边的例子，我们还可以发现jim和tom的startWork并不指向不一个内存，也就意味着，当我们有很多实例的时候，内存开销会非常大。



## 2.4 原型
### 原型

上一节提到了仅仅通过构造函数创建实例，他们的成员并不共用，很明显这不是一个好的实现方法。

这一节我们向你隆重的介绍 *prototype* 这个概念，它便是原型。 *任何类型都会有属于自己的原型，并且原型上定义的成员，可以在每个实例中引用，并且是共用的* 。我们可以先看看右边示例的运行结果。

<hr/>

结果很明显，这次两个不同实例的startWork是相同的了，这意味着不同实例间共用了该方法。

那么在设计JavaScript面向对象类型的时候，我们一般遵循以下规则：



- 因为实例不同而不同的内容，用this关键字声明
- 无论实例怎样内容完全相同的成员，定义在prototype上




>     利用原型，再定义一个endWork的方法试试。
</div>


## 2.5 通过原型扩展已有类型
### 通过原型扩展已有类型

我们不难发现，JavaScript原型定义成员的方法和我们平时使用Java、C#、VB等语法结构不同。大部分语言是要将成员定义写在类型定义域内部的，而JavaScript是写在外部的。

```javascript
function worker(name,age){
    //some code here
} //类型定义结束

worker.prototype.startWork = function(){
    //some code here
};
```

这种特殊的语法结构允许我们可以扩展和修改已有的类型，比如 *String* ， *Date* 等。

比如，根据浏览器不同，不是所有JavaScript中的String都支持startWith这样的方法，那么我们可以自己实现一个

```javascript
String.prototype.startWith = function(str){
    return this.indexOf(str) == 0;
};

var str = "Hello World!";
document.write(str.startWith("Hello"));        //true
```


> 试试看再给String扩展一个endWith的方法。

# 3 继承与多态

## 3.1 jQuery提供的继承方法
### jQuery提供的继承方法

 *继承* 其实就是即拥有自己定义的成员，也拥有父类型定义的成员，并且可以重写父类型的成员。

jQuery提供了对原始对象的简单继承方法： *$.extend* ，它会使用后面的对象与前面的对象的成员加起来，成生新的对象。

```javascript
    //定义一个工人
    var worker = {
        name : "",
        age : 0,
        isWorking : false,
        startWork : function(){
            //some code here
        }
    };

    //定义一个工头，工头本身也是工人，但他有一个额外的属性，用于记录他所管理的员工列表，并且可以指挥一名工人开工
    var leader = $.extend(worker,{
        workers : [],
        callStart : function(worker){
            //指挥一名工人开工
        }
    });

    //此时的leader除了拥有name，age，isWorking，startWork这四项属性之外，还拥有workers和callStart成员。
```

*$.extend$还可以重写对象上的成员

```javascript
    var worker = {
        position : "worker" //职位
    };
    var leader = $.extend(worker,{
        position : "leader"
    });

    document.write(leader.position);        //leader
```

<div class="cw-exe">手动尝试一下$.extend</div>



## 3.2 父类型的构造函数
### 父类型的构造函数

对于由function创建的类型，其本身是无法使用$.extend进行继承的。

就像Java、C#等语言一样，继承时，子类必须在构造函数时调用父类型的构造函数。JavaScript实现类继承的第一步便是调用父类型的构造函数。

```javascript
function leader(name,age){
    worker.apply(this,arguments);
}
```

上述代码就已经完成了对父类型构造函数的调用，这里我来详细解释一下：

1、 *apply* 这是JavaScript内置的一个方法，只要是声明成为function的对象，都会拥有该成员。对于后台技术较高的同学，你可以将apply理解为反射调用。对于并不了解反射的同学，可以这样理解：我们正常情况下调用一个方法是 *对象.方法名(参数列表)* ，使用apply的话，我们就是 *方法名.apply(对象，参数列表)* ，顺序不一样了

2、 *arguments* 这个关键字只能在function内部使用，表示的是参数列表，在上述示例中arguments中包含的就是name和age。

3、通过worker.apply(this,arguments)，相当于使用当前实例和当前参数列表执行了一次worker方法，也就意味着将当前实例和name，age进行了一次worker的构造。



## 3.3 直接继承成员
### 直接继承成员

光调用了父类型的构造函数，但是其原型中的成员依然没有建立在当前类型中。

我们可以通过直接引用的方法得到父类型中的所有成员：

```javascript
leader.prototype = worker.prototype;

var Green = new leader("Green",50);
Green.startWork();
```

通过直接引用的方法，leader得到了worker中的所有成员，再与上一节提到的父类型构造函数，基本上达到了面向对象中的主要功能。



## 3.4 直接继承成员的缺陷
### 直接继承成员的缺陷

右边的示例由于存在BUG而无法运行，这个BUG便是直接继承成员带来的。

很明显leader继承了worker并重写了worker中的startWork方法。修改的内容是，工头干活的时候，工人一起干活。

问题出在哪儿呢？

<div style="color:red">
直接继承相当于两个人拿着同样的说明书，当其中任意一方修改了说明书以后，另一方也会按照新的说明书执行。
因此，worker中的startWork也出现了“下属工人一起干活”的行为，可是worker没有workers的成员，因此在 *var workerLength = this.workers.length;* 中会出现异常
</div>

所以直接继承原型不是一个合理的方式，因为直接继承并不是 *继承* ，而是直接 *引用* ，两者拥有相同的原型，一方的修改都会使另一方发生变化。



## 3.5 优化的继承方法
### 优化的继承方法

很明显，直接继承方法所得到的结果，并不是我们所期望的。子类的修改不应该对父类造成影响。那我们不能让父类的原型直接赋给子类的原型，而用父类型的一个副本就行了。

```javascript
leader.prototype = new worker();
```

通过这行代码，我们相当于通过创建了一个worker实例，并将这个实例中的各个成员赋值给leader的原型，这样一来，对子类的修改仅仅影响worker的实例，而不会影响worker的原型。

```javascript
leader.prototype.startWork = function(){
    //some code here;
};

var w = new worker("",0);
var l = new leader("",0);
document.write(w.startWork == l.startWork);    //false
```

<div class="cw-exe">尝试使用该节介绍的方法进行一次类型的继承</div>


# 4 事件

## 4.1 什么是事件
### 什么是事件

 *事件* 也是面向对象开发中的一个环节，虽然它不是三大特征之一。但 *事件* 可以实现很多便捷的功能。

我们初学的时候也经常会用到事件，比如

```javascript
window.onload = function(){
    var btnOk = document.getElementById("btnok");
    if(btnOk){
        btnOk.onclick = function(){
            alert("你点击了确定按钮!");
        };
    }
};
```

事件往往由两方组成：

 **1、发起方**

 *发起方* 是指这个事件由谁发起，比如由一个按钮发起一个单击事件，那么地起方就是按钮

 **2、监听方**

 *监听方* 是指这个事件被发起后，由谁来处理，比如上面的例子中 *alert("...");* 所在的方法就是监听方。

这是一种事件的简单实现，这种事件的缺点是，一次只能定义一个 *监听者* 。而一个优秀的事件，应该是可以添加多个 *监听者* 的。



## 4.2 function作为参数
### function作为参数

JavaScript语言中有个特殊的语法，就是可以将一个function作为方法的参数进行传递，类似于C和C++中的函数指针，也类似于C#中的委托。

```javascript
function test(a,b,fn){
    fn(a,b);
};
test(1,2,function(a,b){
    alert(a + b);    //3
});
```

上述例子中我们可以看出来，我们将一个方法作为参数传递给了test的fn，并且在test中被执行。如果我们写成 *test(1,2,3)* 就会报错了，因为 *fn(a,b)* 这种特殊的写法，要求fn必须是一个方法，所以我们往往在执行fn前加上一个判断

```javascript
function test(a,b,fn){
    if(typeof(fn) == "function"){
        fn(a,b);
    }
}
```

这个重要的特征将作为实现 *事件* 的主要手段



## 4.3 设计一个事件对象
### 设计一个事件对象

本节我们将运用之前课和中所学的内容，自己设计一个事件对象，主要实现以下功能：



- 添加监听者
- 移除监听者
- 清空监听者
- 发起事件信号



设计思路如下：



- 定义一个对象，包含一个实例成员listeners，用于记录所有的监听者
- 为对象的原型增加，新增、删除、清空和执行四个成员



具体代码可以参见右侧示例



## 4.4 将事件对象设计进类型
####将事件对象设计进类型

有了事件对象，我们可以丰富我们的类型，允许向类型添加监听者，允许类型在某个特殊的时刻发生事件信号。

我们设计一个场景：



- 老板管理员工
- 当员工开始工作时发起事件通知老板
- 老板可以统计出哪些员工正在工作，哪些员工不在工作



首先，我们设计员工类型（以下代码需要上一节中的myEvent支持）

```javascript
function worker(name){
    this.name = name;
    this.startWorkEvent = new myEvent();    //定义一个startWork事件
}
worker.startWork = function(){
    this.startWorkEvent.raise(this.name);    //发起开始工作的事件，并通知外部自己的姓名
};
```

然后，我就设计老板类型，可以添加所属的员工，并且在添加的时候，定义一个监听者

```javascript
function boss(name){
    this.name = name;
    this.workers = [];
    this.workerState = {};    //定义一个JS原始对象用于存放员工工作状态
}
//员工开始工作的监听者，对开始工作的员工进行状态记录
boss.prototype.onWorkerStartWork = function(workerName){
    this.workerState[workerName] = true;
};
boss.prototype.addWorker = function(worker){
    worker.startWorkEvent.addListener(this.onWorkerStartWork);
};
//统计
boss.prototype.summary = function(){
    for(var i = 0;i<this.workers.length;i++){
        //循环所有员工
        var workerName = this.workers[i].name;
        if(this.workerState[workerName]){
            document.write(workerName + "正在工作<br/>");
        }
        else{
            document.write(workerName + "不在工作<br/>");
        }
    }
};
```

上面的两段代码完成了员工和老板的所有逻辑，下面我们尝试一下使用

```javascript
var jim = new worker("jim");
var tom = new worker("tom");

var bob = new boss("bob");
bob.addWorker(jim);
bob.addWorker(tom);

jim.startWork();
bob.summary();    //jim正在工作  tom不在工作
```


> 连同上一节的myEvent一起，练习一下worker和boss试试
</div>


## 4.5 一些事件的基本规范
### 一些事件的基础规范

为了能够让其它开发人员一拿到你的代码，一般来说有以下设计规范：

对于简单的事件（不需要添加多个监听者的），往往用on开头表示，下一个单词首字母大写，比如onSelect，onChange等

```javascript
function worker(){
    this.onWork = null;
}
worker.prototype.startWork = function(){
    if(typeof(this.onWork) == "function"){
        this.onWork(this);
    }
};
var w = new worker();
w.onWork = function(){
    document.write("start!");
};
w.startWork();    //start!
```

对于能够添加多个监听者的，往往用addEventListener(str,fn)表示，str表示事件名称，名称中一带不包含on，且首字母小写。fn表示监听者方法的具体内容。

jQuery设计模式下，可以用bind来替代addEventListener，参数相同

```javascript
    var btn = $("#btnLogin");
    btn.bind("click",function(){
        //some code here
    });
```



# 5 作用域

## 5.1 原型的访问权限
### 原型的访问权限

凡是定义在原型上的成员，均是共开的成员。

在一般情况下，JavaScript不提供定义私有成员的方法。无论prototype还是this，均可以在外部访问。

按照习惯，我们往往把一些不合适公开的成员或方法使用下划线来命令。比如

```javascript
function worker(name){
    //我们不希望name可以在外部被修改
    this._name = name;
}
//开放一个方法用于读取name
worker.prototype.getName = function(){
    return this._name;
};
```



## 5.2 this关键字
### this关键字

在我们整个课程中都可以看到 *this* 关键字， *this* 表示当前实例。

我们可以通过 *this* 定义实例上的成员，也可以在原型中使用 *this* 访问原型中的其它成员和实例中的其它成员。

通过这个特性，我们知道，一个实例上拥有的成员有以下两个：



- 实例成员
- 原型成员



 *实例成员* 可以在类型定义时通过 *this* 定义，更可以在实例得到后进行定义，并且能够在定义时访问 *this*

```javascript
function worker(name){
    this.name = name;
};

var jim = new worker("jim");
jim.goHome = function(){
    document.write(this.name + "回家了!");
};
```



## 5.3 this的难控性
### this的难控性

由于 *this* 表示的是当前实例。再加上JavaScript是可以传递方法的，那么就会出现在方法嵌套时， *this* 难以控制的情况。
另外在JavaScript语言本身设计上的一些缺陷，会导制下面这种情况，this指向了window对象。

```javascript
//一个计算方法，method是具体的计算方法
function calc(a,b,method){

    //定义一个内部加班，当method == "+" 时使用
    var add = function(a,d){
        //此时的this 是window实例
        return a + b;
    }
    if(method == "+"){
        return add(a,b);
    }
}
```



## 5.4 解决this的问题
### 解决this的问题

一般来说解决this的问题，主要就是解决两个问题

 **1、this变成widow以后，如何使用this**

一般常见的做法是在定义内部方法前，使用 *var that = this;* 将this的引用放进that里，再在内部方法中访问 *that* 来实现

```javascript
//计算出在线的时间
function getOnlineTime(now, unit){

    var that = this;

    var getHour = function(){
        var date = new Date();    //获取当前时间
        var logonTime = that.logonTime;    //通过that关键字获取到了上线时间
        //some code here;
    };

    if(unit == "h") return getHour();
};
```

 **2、this当完全不知道this可能是什么的时候，如何访问我想要访问的实例**

一般常见的做法是避免在内部、嵌套、回调函数中使用this，而通过参数传递，我们可以把上面的例子改造成这种解决方式：
function getOnlineTime(now, unit){

```javascript
var getHour = function(e){
    var date = new Date();    //获取当前时间
    var logonTime = e.logonTime;    //通过that关键字获取到了上线时间
    //some code here;
};

if(unit == "h") return getHour(this);    //这里因为没有内部、嵌套、回调函数，所以this就是当前实例，于是将this作为参数传递，以保证getHour时的参数就是所需要的实例

};
```



## 5.5 总结
### 总结

总得来说，JavaScript虽然提供了面向对象的开发方式，但它并没有Java、C#等语言那么完美，但是作为一个轻量级的脚本语言，JavaScript的面向对象开发方式也足以应对各种场景了。

再者，JavaScript没有提供太多的 *自动完成* ，至使在类型继承、重写过程中，会存在文档必备的情况。

我们转换思路，可以考虑开发一种中间语言，这种语言可以完美的实现接口、抽象类等逻辑，再由这种语言生成JavaScript原生脚本。通过这种方法，可以开发出非常完美的JavaScript脚本。

目前市面上似乎已经有类似的产品出现，但是作者我并没有太详细地去了解，可以在以后的文章中进行探讨。


