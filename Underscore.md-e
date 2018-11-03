# Underscore
<!-- TOC -->

- [Underscore](#underscore)
- [1 Underscore快速入门](#1-underscore快速入门)
    - [1.1 Underscore简介](#11-underscore简介)
    - [1.2 安装](#12-安装)
    - [1.3 课程简述](#13-课程简述)
- [2  集合部分（数组或对象）](#2--集合部分数组或对象)
    - [2.1  遍历](#21--遍历)
    - [2.2  元素合并](#22--元素合并)
    - [2.3  查找和过滤](#23--查找和过滤)
    - [2.4  过滤](#24--过滤)
    - [2.5  判断和提取](#25--判断和提取)
    - [2.6  判断最大最小值](#26--判断最大最小值)
    - [2.7  排序](#27--排序)
    - [2.8  转换和获取个数](#28--转换和获取个数)
- [3  数组部分](#3--数组部分)
    - [3.1  元素位置操作](#31--元素位置操作)
    - [3.2  获取索引位置](#32--获取索引位置)
    - [3.3  去除空值和去处嵌套](#33--去除空值和去处嵌套)
    - [3.4  范围整数数组](#34--范围整数数组)
    - [3.5  合并和转换](#35--合并和转换)
- [4  函数部分](#4--函数部分)
    - [4.1  绑定函数](#41--绑定函数)
    - [4.2  填充数据](#42--填充数据)
    - [4.3  记忆函数](#43--记忆函数)
    - [4.4  delay 和 defer](#44--delay-和-defer)
    - [4.5  after 和 before](#45--after-和-before)
    - [4.6  函数传递](#46--函数传递)
- [5  对象部分](#5--对象部分)
    - [5.1  keys 和 values](#51--keys-和-values)
    - [5.2  对象遍历](#52--对象遍历)
    - [5.3  转换和对调](#53--转换和对调)
    - [5.4  复制](#54--复制)
    - [5.5  clone](#55--clone)
    - [5.6  tag](#56--tag)
    - [5.7  比较](#57--比较)
- [6  实用功能](#6--实用功能)
    - [6.1  改变命名空间](#61--改变命名空间)
    - [6.2  随机数](#62--随机数)
    - [6.3  唯一ID](#63--唯一id)
    - [6.4  扩展](#64--扩展)
    - [6.5  返回属性值](#65--返回属性值)
- [7  链式语法](#7--链式语法)
    - [7.1  chain](#71--chain)
    - [7.2  value](#72--value)

<!-- /TOC -->

# 1 Underscore快速入门

## 1.1 Underscore简介
### 什么是Underscore？

 **Underscore** 是一个JavaScript 库，提供了一整套函数式编程的实用功能，但是没有扩展任何JavaScript内置的对象。它弥补了部分jQuery没有实现的功能，同时又是 **Backbone.js**  比不可少的部分。

> PS: Backbone 和本文无关，我们可能会单独开一门课程来讲解。

Underscore 提供了100多个函数，包括常用的each、filter、sortBy等等，还有更加专业的：函数绑定、索引、模版等。

当然JavaScript原生的函数也可以实现，但是比较麻烦，我们在学习 **Underscore** 的过程中我们会看它是如何实现的。
这样可以让我们更好的理解和学习  **Underscore**



## 1.2 安装
### 安装

 *Underscore.js* 是一个Javascript功能类库，不依赖于环境，可以加载到HTML中在浏览器运行，也可以直接在nodejs的环境中使用。

 **前端** ：把 underscore.js 直接引入到 html 页面中。

 **示例** ：

 *<script src=“underscore.js" ></script>*

 **后端** ：

 **环境** ： *nodejs5.0 npm3.6.0*

后端安装十分的方便，在命令行中输入：> npm install underscore

 **使用** ：> var _ = require('underscore');



## 1.3 课程简述
### 课程简述

underscore有近100的函数，本课程只介绍一些，比较常见的，实用的函数。

### 主要的内容有：



- 集合部分:数组或对象


- 数组部分


- 函数部分


- 对象部分


- 实用功能


- 链式语法






# 2  集合部分（数组或对象）

## 2.1  遍历
### 遍历

> _.each(list, iteratee, [context])

遍历list中的所有元素，按顺序用遍历输出每个元素。如果传递了context参数，则把iteratee绑定到context对象上。

每次调用iteratee都会传递三个参数：(element, index, list)。如果list是个JavaScript对象，iteratee的参数是 (value, key, list))。返回list以方便链式调用。

```javascript
    _.each([1, 2, 3], alert);

    => alerts each number in turn...

    _.each({one: 1, two: 2, three: 3}, alert);

    => alerts each number value in turn...
```

注意：集合函数能在 *数组，对象，和类数组对象* ，比如arguments, NodeList和类似的数据类型上正常工作。

但是它通过鸭子类型工作，所以要避免传递一个不固定length属性的对象。每个循环不能被破坏打破， 使用_.find(后面的章节会讲解到)代替，这也是很好的注意。

> _.map(list, iteratee, [context])

通过转换函数(iteratee迭代器)映射列表中的每个值产生价值的新数组。

iteratee传递三个参数：value，然后是迭代 index，最后一个是引用指向整个list。

```javascript
    _.map([1, 2, 3], function(num){ return num * 3; });

    => [3, 6, 9]

    _.map({one: 1, two: 2, three: 3}, function(num, key){ return num * 3; });

    => [3, 6, 9]

    _.map([[1, 2], [3, 4]], _.first);

    => [1, 3]
```

<div class='cw-test'>
将上文中的示例，在右侧javascript代码框中实现, 并利用document.write 进行输出查看结果。如右侧示例：
> PS：后文中的练习将不会预知代码。
</div>


## 2.2  元素合并
### 元素合并

> reduce_.reduce(list, iteratee, [memo], [context])

reduce方法把list中元素归结为一个单独的数值。

 **Memo** 是reduce函数的初始值，reduce的每一步都需要由iteratee返回。这个迭代传递4个参数：memo,value 和 迭代的index（或者 key）和最后一个引用的整个 list。

如果没有memo传递给reduce的初始调用，iteratee不会被列表中的第一个元素调用。第一个元素将取代 传递给列表中下一个元素调用iteratee的memo参数。

```javascript
    var sum = _.reduce([1, 2, 3], function(memo, num){ return memo + num; }, 0);
    => 6
```

<div class='cw-test'>
将上文中的示例，在右侧javascript代码框中实现。
</div>


## 2.3  查找和过滤
### 查找和过滤

> find_.find(list, predicate, [context])

在list中逐项查找，返回第一个通过 **predicate** 迭代函数真值检测的元素值，如果没有值传递给测试迭代器将返回undefined。

如果找到匹配的元素，函数将立即返回，不会遍历整个list。

```javascript
    var even = _.find([1, 2, 3, 4, 5, 6], function(num){ return num % 2 == 0; });
    => 2
```

> _.filter(list, predicate, [context])

遍历list中的每个值，返回包含所有通过predicate真值检测的元素值。

```javascript
    var evens = _.filter([1, 2, 3, 4, 5, 6], function(num){ return num % 2 == 0; });
    => [2, 4, 6]
```

<div class='cw-test'>
将上文中的示例，在右侧javascript代码框中实现。
</div>


## 2.4  过滤
### 过滤

> _.where(list, properties)

遍历list中的每一个值，返回一个数组，这个数组包含 **properties** 所列出的属性的所有的 键 - 值对。

```javascript
    var list = [
        {title:"AAA",year: 1982},
        {title:"BBB",year: 1900},
        {title:"CCC",year: 1982}
    ];
    console.log(
        _.where(list,{year: 1982})
    );
    => [ { title: 'AAA', year: 1982 }, { title: 'CCC', year: 1982 } ]
```

<div class='cw-test'>
将上文中的示例，在右侧javascript代码框中实现。
</div>


## 2.5  判断和提取
### 判断和提取

> _.contains(list, value, [fromIndex])

判断元素是否在list中，如果list包含指定的value则返回true（愚人码头注：使用===检测）。如果list 是数组，内部使用indexOf判断。使用 **fromIndex** 来给定开始检索的索引位置。

```javascript
    _.contains([1, 2, 3], 3);
    => true
```

> _.pluck(list, propertyName)

提取一个集合里指定的属性值， **pluck** 也许是map最常使用的用例模型的简化版本，即萃取数组对象中某属性值，返回一个数组。

```javascript
    var stooges = [{name: 'moe', age: 40}, {name: 'larry', age: 50}, {name: 'curly', age: 60}];
    _.pluck(stooges, 'name');
    => ["moe", "larry", "curly"]
```

<div class='cw-test'>
将上文中的示例，在右侧javascript代码框中实现。
</div>


## 2.6  判断最大最小值
### 判断最大最小值

> _.max(list, [iteratee], [context])

返回list中的 **最大值** 。如果传递iteratee参数，iteratee将作为list中每个值的排序依据。如果list为空，将返回-Infinity，所以你可能需要事先用isEmpty检查 list 。

```javascript
    var stooges = [{name: 'moe', age: 40}, {name: 'larry', age: 50}, {name: 'curly', age: 60}];
    _.max(stooges, function(stooge){ return stooge.age; });
    => {name: 'curly', age: 60};
```

> _.min(list, [iteratee], [context])

返回list中的 **最小值** 。如果传递iteratee参数，iteratee将作为list中每个值的排序依据。如果list为空，将返回-Infinity，所以你可能需要事先用isEmpty检查 list 。

```javascript
    var numbers = [10, 5, 100, 2, 1000];
    _.min(numbers);
    => 2
```

<div class='cw-test'>
将上文中的示例，在右侧javascript代码框中实现。
</div>


## 2.7  排序
### sortBy 排序

> _.sortBy(list, iteratee, [context])

返回一个排序后的list拷贝副本。如果传递 **iteratee** 参数， **iteratee** 将作为list中每个值的排序依据。迭代器也可以是字符串的属性的名称进行排序的(比如 length)。

```javascript
    _.sortBy([1, 2, 3, 4, 5, 6], function(num){ return Math.sin(num); });
    => [5, 4, 6, 3, 1, 2]

    var stooges = [{name: 'moe', age: 40}, {name: 'larry', age: 50}, {name: 'curly', age: 60}];
    _.sortBy(stooges, 'name');
    => [{name: 'curly', age: 60}, {name: 'larry', age: 50}, {name: 'moe', age: 40}];
```



## 2.8  转换和获取个数
### 转换和获取个数

> _.toArray(list)

把list(任何可以迭代的对象)转换成一个数组，在 **转换**  arguments 对象时非常有用。

```javascript
    (function(){ return _.toArray(arguments).slice(1); })(1, 2, 3, 4);
    => [2, 3, 4]
```

> _.size(list)

返回list的长度。

```javascript
    _.size({one: 1, two: 2, three: 3});
    => 3
```



# 3  数组部分

## 3.1  元素位置操作
### 元素位置操作

> _.first(array, [n])

返回array（数组）的 **第一个元素** 。传递 n参数将返回数组中从第一个元素开始的n个元素。

```javascript
    _.first([5, 4, 3, 2, 1]);
    => 5
```

> _.initial(array, [n])

返回数组中除了最后一个元素外的其他全部元素。 在arguments对象上特别有用。传递 n参数将从结果中排除从最后一个开始的n个元素

```javascript
    _.initial([5, 4, 3, 2, 1]);
    => [5, 4, 3, 2]
```

> _.last(array, [n])

返回array（数组）的最后一个元素。传递 n参数将返回数组中从最后一个元素开始的n个元素。

```javascript
    _.last([5, 4, 3, 2, 1]);
    => 1
```

> _.rest(array, [index])

返回数组中除了第一个元素外的其他全部元素。 **传递**  index 参数将返回从index开始的剩余所有元素 。

```javascript
    _.rest([5, 4, 3, 2, 1]);
    => [4, 3, 2, 1]
```



## 3.2  获取索引位置
### 获取索引位置

> _.indexOf(array, value, [isSorted])

 **返回value** 在该 array 中的索引值，如果value不存在 array中就返回-1。使用原生的indexOf 函数，除非它失效。

如果您正在使用一个大数组，你知道数组已经排序，传递true给isSorted将更快的用二进制搜索..,或者，传递一个数字作为第三个参数，为了在给定的索引的数组中寻找第一个匹配值。

```javascript
    _.indexOf([1, 2, 3], 2);
    => 1
```

> _.lastIndexOf(array, value, [fromIndex])

返回value在该 array 中的从最后开始的索引值，如果value不存在 array中就返回-1。

如果支持原生的 **lastIndexOf** ，将使用原生的 **lastIndexOf** 函数。传递fromIndex将从你给定的索性值开始搜索。

```javascript
    _.lastIndexOf([1, 2, 3, 1, 2, 3], 2);
    => 4
```

> _.sortedIndex(list, value, [iteratee], [context])

使用二分查找确定value在list中的位置序号，value按此序号插入能保持list原有的排序。

如果提供 **iterator** 函数， **iterator** 将作为list排序的依据，包括你传递的value 。iterator也可以是字符串的属性名用来排序(比如length)。

```javascript
    _.sortedIndex([10, 20, 30, 40, 50], 35);
    => 3

    var stooges = [{name: 'moe', age: 40}, {name: 'curly', age: 60}];
    _.sortedIndex(stooges, {name: 'larry', age: 50}, 'age');
    => 1
```

<div class='cw-test'>
将上文中的示例，在右侧javascript代码框中实现。
</div>


## 3.3  去除空值和去处嵌套
### 去除空值和嵌套

> _.compact(array)

返回一个除去所有 **false** 值的 array副本。 在javascript中, false, null, 0, "", undefined 和 NaN 都是false值.

```javascript
_.compact([0, 1, false, 2, '', 3]);
=> [1, 2, 3]
```

> flatten_.flatten(array, [shallow])

将一个嵌套多层的数组 array（数组） (嵌套可以是任何层数)转换为 **只有一层的数组** 。 如果你传递 shallow参数，数组将只减少一维的嵌套。

```javascript
    _.flatten([1, [2], [3, [[4]]]]);
    => [1, 2, 3, 4];

    _.flatten([1, [2], [3, [[4]]]], true);
    => [1, 2, 3, [[4]]];
```

<div class='cw-test'>
将上文中的示例，在右侧javascript代码框中实现。
</div>


## 3.4  范围整数数组
### 元素位置操作

> _.range([start], stop, [step])

一个用来创建整数灵活编号的列表的函数，便于 **each 和 map** 循环。

如果省略start则默认为 0；step 默认为 1.返回一个从start 到stop的整数的列表，用step来增加 （或减少）独占。

值得注意的是，如果 **stop值在start** 前面（也就是stop值小于start值），那么值域会被认为是零长度，而不是负增长。-如果你要一个负数的值域 ，请使用负数step.

```javascript
    _.range(10);
    => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    _.range(1, 11);
    => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    _.range(0, 30, 5);
    => [0, 5, 10, 15, 20, 25]
    _.range(0, -10, -1);
    => [0, -1, -2, -3, -4, -5, -6, -7, -8, -9]
    _.range(0);
    => []
```



## 3.5  合并和转换
### 元素位置操作

> _.zip(*arrays)

将 每个arrays中相应位置的值 **合并** 在一起。在合并分开保存的数据时很有用. 如果你用来处理矩阵嵌套数组时, _.zip.apply 可以做类似的效果。

```javascript
    _.zip(['moe', 'larry', 'curly'], [30, 40, 50], [true, false, false]);
    => [["moe", 30, true], ["larry", 40, false], ["curly", 50, false]]
```

> _.object(list, [values])

将数组转换为对象。传递任何一个单独[key, value]对的列表，或者一个键的列表和一个值得列表。 如果存在重复键，最后一个值将被返回。

```javascript
    _.object(['moe', 'larry', 'curly'], [30, 40, 50]);
    => {moe: 30, larry: 40, curly: 50}

    _.object([['moe', 30], ['larry', 40], ['curly', 50]]);
    => {moe: 30, larry: 40, curly: 50}
```



# 4  函数部分

## 4.1  绑定函数
### 绑定函数

> bind:

 **绑定** 函数到对象上, 无论何时函数被调用, 函数里的this都指向对象.

```javascript
    var func = function(greeting){ return greeting + ': ' + this.name };
    func = _.bind(func, {name : 'moe'}, 'hi');
    console.log(func());
    => hi: moe
```

> bindAll:

绑定方法名到对象上, 当这些方法被执行时将在对象的上下文执行. 绑定函数用作事件处理时非常方便, 否则函数调用时 this 关键字根本没什么用.

```javascript
    var buttonView = {
        label   : 'underscore',
        onClick : function(){ console.log('clicked: ' + this.label); },
        onHover : function(){ console.log('hovering: ' + this.label); }
    };
    var func  = _.bindAll(buttonView, 'onClick', 'onHover');
    func.onClick();
    => clicked: underscore
```



## 4.2  填充数据
### 填充数据

> partial:

局部应用一个函数填充在任意个数的 ** arguments** ，不改变其动态this值。和bind方法很相近。你可以传递_ 给 **arguments** 列表来指定一个不预先填充，但在调用时提供的参数。

```javascript
    var add = function(a, b) { return a + b; };
    add5 = _.partial(add, 5);
    console.log(add5(10));
    => 15
```

<div class='cw-test'>
将上文中的示例，在右侧javascript代码框中实现。
</div>


## 4.3  记忆函数
### 绑定函数

> _.memoize(function, [hashFunction])

Memoizes方法可以缓存某函数的计算结果。对于耗时较长的计算是很有帮助的。

如果传递了 hashFunction 参数，就用 ** hashFunction**  的返回值作为key存储函数的计算结果。

 **hashFunction**  默认使用function的第一个参数作为key。memoized值的缓存可作为返回函数的cache属性。

```javascript
    var fibonacci = _.memoize(function(n) {
      return n < 2 ? n: fibonacci(n - 1) + fibonacci(n - 2);
    });
```

<div class='cw-test'>
将上文中的示例，在右侧javascript代码框中实现。
</div>


## 4.4  delay 和 defer
### delay 和 defer

> delay:

在等待xx毫秒之后调用函数，类似于setTimeout

```javascript
    var log = _.bind(console.log, console);
    _.delay(log, 1000, 'sleep 1s');
    => sleep 1s
```

> defer:

 **延迟** 调用函数, 直到当前调用栈被清空为止, 跟使用 setTimeout 赋予0毫秒的延时很像。

对执行高消耗算法或大型HTML呈现而不阻碍UI更新线程很有用.

```javascript
    _.defer(function(){ console.log('deferred'); });
    => deferred
```

<div class='cw-test'>
将上文中的示例，在右侧javascript代码框中实现。
</div>


## 4.5  after 和 before
### after 和 before

 **after:**

对 **循环计数** ，只有超过计数，才会调用指定的函数

```javascript
    var nums = [1,2,3,4];
    var renderNums = _.after(nums.length, function(){
        console.log('render nums');
    });
    _.each(nums, function(num) {
        console.log('each:'+num);
        renderNums();
    });
    => each:1
    each:2
    each:3
    each:4
    render nums
```

> _.before(count, function)

创建一个函数,调用 **不超过** count 次。 当count已经达到时，最后一个函数调用的结果将被记住并返回。

```javascript
    var monthlyMeeting = _.before(3, askForRaise);
    monthlyMeeting();
    monthlyMeeting();
    monthlyMeeting();
```



## 4.6  函数传递
### 函数传递

> _.wrap(function, wrapper)

将第一个函数 function 封装到 **函数 wrapper**  里面, 并把函数 function 作为第一个参数传给 wrapper. 这样可以让 wrapper 在 function 运行之前和之后 执行代码, 调整参数然后附有条件地执行.

```javascript
    var hello = function(name) { return "hello: " + name; };
    hello = _.wrap(hello, function(func) {
      return "before, " + func("moe") + ", after";
    });
    hello();
    => 'before, hello: moe, after'
```

<div class='cw-test'>
将上文中的示例，在右侧javascript代码框中实现。
</div>


# 5  对象部分

## 5.1  keys 和 values
### keys 和 values

> _.keys(object)

 **检索** object拥有的所有可枚举属性的名称。

```javascript
    _.keys({one: 1, two: 2, three: 3});
    => ["one", "two", "three"]
```

> _.allKeys(object)

检索object拥有的和继承的所有属性的名称。

```javascript
    function Stooge(name) {
      this.name = name;
    }
    Stooge.prototype.silly = true;
    _.allKeys(new Stooge("Moe"));
    => ["name", "silly"]
```

> _.values(object)

返回object对象所有的属性值。

```javascript
  _.values({one: 1, two: 2, three: 3});
  => [1, 2, 3]
```



## 5.2  对象遍历
### 对象遍历

> _.mapObject(object, iteratee, [context])

它类似于map，但是这用于对象。 **转换** 每个属性的值。

```javascript
    _.mapObject({start: 5, end: 12}, function(val, key) {
      return val + 5;
    });
    => {start: 10, end: 17}
```

<div class='cw-test'>
将上文中的示例，在右侧javascript代码框中实现。
</div>


## 5.3  转换和对调
### 转换和对调

> _.pairs(object)

把一个对象转变为一个 **[key, value]形式的数组** 。

```javascript
    _.pairs({one: 1, two: 2, three: 3});
    => [["one", 1], ["two", 2], ["three", 3]]
```

_.invert(object)

返回一个object副本，使其 **键（keys）和值（values）对换** 。对于这个操作，必须确保object里所有的值都是唯一的且可以序列号成字符串.

```javascript
    _.invert({Moe: "Moses", Larry: "Louis", Curly: "Jerome"});
    => {Moses: "Moe", Louis: "Larry", Jerome: "Curly"};
```

<div class='cw-test'>
将上文中的示例，在右侧javascript代码框中实现。
</div>


## 5.4  复制
### 复制

> extend:

复制对象的所有属性到目标对象上， **覆盖** 已有属性

```javascript
    console.log(
        _.extend({name : 'moe'}, {age : 50})
    );
    => { name: 'moe', age: 50 }
```

> defaults:

 **复制** 对象的所有属性到目标对象上，跳过已有属性

```javascript
    var iceCream = {flavor : "chocolate"};
    console.log(
        _.defaults(iceCream, {flavor : "vanilla", sprinkles : "lots"})
    );
    => { flavor: 'chocolate', sprinkles: 'lots' }
```

<div class='cw-test'>
将上文中的示例，在右侧javascript代码框中实现。
</div>


## 5.5  clone
### clone

clone:

引入方式 **克隆** 对象，不进行复制

```javascript
    console.log(
       _.clone({name : 'moe'});
    );
    => {name : 'moe'};
```

<div class='cw-test'>
将上文中的示例，在右侧javascript代码框中实现。
</div>


## 5.6  tag
### tag

> tag:

用 **对象** 作为参数来调用函数，作为函数链式调用的一环

```javascript
    console.log(
        _.chain([1,2,3,200])
            .filter(function(num) { return num % 2 == 0; })
            .tap(console.log)
            .map(function(num) { return num * num })
            .value()
    );
    => [ 2, 200 ]
    [ 4, 40000 ]
```

<div class='cw-test'>
将上文中的示例，在右侧javascript代码框中实现。
</div>


## 5.7  比较
### 比较

> _.isEqual(object, other)

执行两个对象之间的优化 **深度比较** ，确定他们是否应被视为 **相等** 。

```javascript
    var stooge = {name: 'moe', luckyNumbers: [13, 27, 34]};
    var clone  = {name: 'moe', luckyNumbers: [13, 27, 34]};
    stooge == clone;
    => false
    _.isEqual(stooge, clone);
    => true
```

<div class='cw-test'>
将上文中的示例，在右侧javascript代码框中实现。
</div>


# 6  实用功能

## 6.1  改变命名空间
### 改变命名空间

 **Underscore** 默认使用> _（下划线）来访问和创建对象，但这个名字可能不符合我们的命名规范，或容易引起命名冲突。

我们可以通过noConflict()方法来改变Underscore的命名，并恢复_（下划线）变量之前的值，例如：

```javascript
    // Underscore对象
        console.dir(_);
        // 将Underscore对象重命名为us, 后面都通过us来访问和创建Underscore对象
        var us = _.noConflict();
        // 输出"自定义变量"
        console.dir(_);
```

<div class='cw-test'>
将上文中的示例，在右侧javascript代码框中实现。
</div>


## 6.2  随机数
### 随机数

> _.random(min, max)

返回一个 *min 和 max* 之间的随机整数。如果你只传递一个参数，那么将返回0和这个参数之间的整数。

```javascript
    _.random(0, 100);
    => 42
```

<div class='cw-test'>
将上文中的示例，在右侧javascript代码框中实现。
</div>


## 6.3  唯一ID
### 唯一ID

> _.uniqueId([prefix])

为需要的客户端模型或DOM元素生成一个 *全局唯一的id* 。如果prefix参数存在， id 将附加给它。

```javascript
    _.uniqueId('contact_');
    => 'contact_104'
```

<div class='cw-test'>
将上文中的示例，在右侧javascript代码框中实现。
</div>


## 6.4  扩展
### 扩展

允许用您自己的实用程序函数扩展 **Underscore** 。传递一个 {name: function}定义的哈希添加到 **Underscore对象** ，以及面向对象封装。

```javascript
    _.mixin({
        capitalize : function(string) {
            return string.charAt(0).toUpperCase() + string.substring(1).toLowerCase();
        }
    });
    console.log(_("fabio").capitalize());
    => Fabio
```

<div class='cw-test'>
将上文中的示例，在右侧javascript代码框中实现。
</div>


## 6.5  返回属性值
### 返回属性值

> _.result(object, property, [defaultValue])

如果指定的  *property*  的值是一个函数，那么将在object上下文内调用它;否则，返回它。

如果提供默认值，并且属性不存在，那么默认值将被返回。如果设置defaultValue是一个函数，它的结果将被返回。

```javascript
    var object = {cheese: 'crumpets', stuff: function(){ return 'nonsense'; }};
    _.result(object, 'cheese');
    => "crumpets"
    _.result(object, 'stuff');
    => "nonsense"
    _.result(object, 'meat', 'ham');
    => "ham"
```

<div class='cw-test'>
将上文中的示例，在右侧javascript代码框中实现。
</div>


# 7  链式语法

## 7.1  chain
### chain

如果你用过jQuery，那么应该对链式操作非常熟悉了。链式操作写起来非常顺畅，代码也会非常的语义化。

 **Underscore.js** 中也支持将代码写成链式的，API为chain，chain返回的是一个包装过的 **underscore** 对象，到链结束的时候，需要调用value来获取最终的结果：

```javascript
    var stooges = [{name: 'curly', age: 25}, {name: 'moe', age: 21}, {name: 'larry', age: 23}];
    var youngest = _.chain(stooges)
      .sortBy(function(stooge){ return stooge.age; })
      .map(function(stooge){ return stooge.name + ' is ' + stooge.age; })
      .first()
      .value();
    => "moe is 21"
```

<div class='cw-test'>
将上文中的示例，在右侧javascript代码框中实现。
</div>


## 7.2  value
### value

> _(obj).value()

获取封装对象的最终值.

```javascript
    _([1, 2, 3]).value();
    => [1, 2, 3]
```

在使用 **Underscore.js** 提供的众多API之后，我们自己也是可以写出非常简洁，表意的代码来，是不是很有成就感。

<div class='cw-test'>
将上文中的示例，在右侧javascript代码框中实现。
</div>

