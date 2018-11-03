# Vue.js
<!-- TOC -->

- [Vue.js](#vuejs)
- [1 vue.js 简介](#1-vuejs-简介)
    - [1.1 一个渐进式前端框架](#11-一个渐进式前端框架)
    - [1.2 安装方式：直接引入、CDN、NPM](#12-安装方式直接引入cdnnpm)
    - [1.3 第一个vue.js实例 Hello World](#13-第一个vuejs实例-hello-world)
    - [1.4 通过构造器函数创建实例](#14-通过构造器函数创建实例)
    - [1.5 响应式的数据(Data)属性与方法](#15-响应式的数据data属性与方法)
- [2 数据绑定模版语法](#2-数据绑定模版语法)
    - [2.1 模版中文本插值的“Mustache”语法](#21-模版中文本插值的mustache语法)
    - [2.2 模版语法如何处理原始 HTML](#22-模版语法如何处理原始-html)
    - [2.3 数据绑定HTML特性(Attributes)](#23-数据绑定html特性attributes)
    - [2.4 JavaScript表达式](#24-javascript表达式)
    - [2.5 过滤器-可自定义的函数](#25-过滤器-可自定义的函数)
    - [2.6 指令(Directives)](#26-指令directives)
    - [2.7 通过计算属性处理逻辑](#27-通过计算属性处理逻辑)
- [3 Class列表与Style样式的数据绑定](#3-class列表与style样式的数据绑定)
    - [3.1 绑定Html Class对象语法](#31-绑定html-class对象语法)
    - [3.2 绑定Html Class数组语法](#32-绑定html-class数组语法)
    - [3.3 绑定内联样式Style对象语法](#33-绑定内联样式style对象语法)
    - [3.4 绑定内联样式Style数组语法](#34-绑定内联样式style数组语法)
- [4 渲染指令](#4-渲染指令)
    - [4.1 条件渲染指令 v-if](#41-条件渲染指令-v-if)
    - [4.2 template元素条件渲染 v-if](#42-template元素条件渲染-v-if)
    - [4.3 条件渲染 v-show](#43-条件渲染-v-show)
    - [4.4 条件渲染 v-else](#44-条件渲染-v-else)
    - [4.5 列表渲染指令 v-for](#45-列表渲染指令-v-for)
    - [4.6 template元素列表渲染 v-for](#46-template元素列表渲染-v-for)
- [5 表单控件输入绑定](#5-表单控件输入绑定)
    - [5.1 文本输入框 Text](#51-文本输入框-text)
    - [5.2 多选框 Checkbox](#52-多选框-checkbox)
    - [5.3 单选按钮 Radio](#53-单选按钮-radio)
    - [5.4 选择下拉列表 Selected](#54-选择下拉列表-selected)
    - [5.5 修饰符参数特性 lazy、number、trim](#55-修饰符参数特性-lazynumbertrim)
- [6 自定义指令](#6-自定义指令)
    - [6.1 自定义指令基础(钩子函数)](#61-自定义指令基础钩子函数)
    - [6.2 指令实例属性](#62-指令实例属性)
    - [6.3 指令对象字面量](#63-指令对象字面量)
    - [6.4 指令对象字面修饰符](#64-指令对象字面修饰符)
    - [6.5 自定义元素指令](#65-自定义元素指令)
- [7 自定义过滤器](#7-自定义过滤器)
    - [7.1 自定义过滤器基础](#71-自定义过滤器基础)
    - [7.2 双向自定义过滤器](#72-双向自定义过滤器)
    - [7.3 过滤器的动态参数](#73-过滤器的动态参数)
- [8 方法与事件处理器](#8-方法与事件处理器)
    - [8.1 方法处理器](#81-方法处理器)
    - [8.2 内联语句处理器](#82-内联语句处理器)
    - [8.3 事件处理的修饰符](#83-事件处理的修饰符)
    - [8.4 按键处理的修饰符](#84-按键处理的修饰符)
- [9 过渡和动画效果](#9-过渡和动画效果)
    - [9.1 过渡动画效果简介](#91-过渡动画效果简介)
    - [9.2 CSS 过渡动画](#92-css-过渡动画)
    - [9.3 过渡的CSS类名](#93-过渡的css类名)
    - [9.4 过渡流程详解示例](#94-过渡流程详解示例)
    - [9.5 渐近的动态过渡](#95-渐近的动态过渡)
- [10 组件](#10-组件)
    - [10.1 组件的注册组合构造](#101-组件的注册组合构造)
    - [10.2 Props传递数据给子组件](#102-props传递数据给子组件)
    - [10.3 动态Prop用作特性](#103-动态prop用作特性)
    - [10.4 通过 Props 绑定类型实现单双向绑定](#104-通过-props-绑定类型实现单双向绑定)
    - [10.5 自定义通信事件示例](#105-自定义通信事件示例)

<!-- /TOC -->

# 1 vue.js 简介

## 1.1 一个渐进式前端框架
### what

 *Vue.js* 是一个构建数据驱动的 *web* 界面的库。技术上，它重点集中在 *MVVM* 模式的 *ViewModel* 层，因此它非常容易学习，非常容易与其它库或已有项目整合。

 *Vue.js* 的目标是通过尽可能简单的 *API* 实现响应的数据绑定和组合的视图组件。

 *Vue.js*  的核心是一个响应的数据绑定系统，它让数据与 *DOM* 保持同步非常简单。在使用 *jQuery* 手工操作 *DOM* 时，我们的代码常常是命令式的、重复的与易错的。 *Vue.js* 拥抱数据驱动的视图概念。通俗地讲，它意味着我们在普通 *HTML* 模板中使用特殊的语法将 *DOM*  “绑定”到底层数据。

<img src="images/566e67417e7d40946afc5ddc/1-1-1/mvvm.png" alt="">



## 1.2 安装方式：直接引入、CDN、NPM
### 安装

<b>独立版本</b>

直接下载并用 < script > 标签引入， *Vue* 会被注册为一个全局变量。如下代码，这样就可以在脚本中使用 *Vue.js* 了。

```javascript
<script src="lib/vue.js"></script>
```

<b>CDN</b>

也可以在 <a href='http://cdn.jsdelivr.net/vue/1.0.10/vue.min.js' target="_Blank">jsdelivr</a>或 <a href='http://cdnjs.cloudflare.com/ajax/libs/vue/1.0.10/vue.min.js' target="_Blank">cdnjs</a>获取 (版本更新可能会略滞后)。

<b>NPM</b>

在用 Vue.js 构建大型应用时推荐使用 NPM 安装，NPM 能很好地和诸如 Webpack 或 Browserify 的 CommonJS 模块打包器配合使用。Vue.js 也提供配套工具来开发单文件组件。

```javascript
$ npm install vue
```

获取CSP兼容版本：

```javascript
$ npm install vue@csp
```

获取最新开发版本(来自于GitHub):

```javascript
$ npm install yyx990803/vue#dev
```



## 1.3 第一个vue.js实例 Hello World
### Hello World

现在就让我们来写第一个vue.js的实例。如下代码：

html代码：

```javascript
<div id="demo">
  {{ message }}
</div>
```

JavaScript代码:

```javascript
new Vue({
  el: '#demo',
  data: {
    message: 'Hello World!'
  }
})
```

上面代码中 *div* 中的部分  *{{ message }}* 为数据绑定，我们将会在后面的学习中讲到。而vue.js代码是实例化一个 *Vue* 对象。在使用 *vue* 之前必须要实例化。


> 按上面的代码去试试吧！
</div>


## 1.4 通过构造器函数创建实例
### 构造器

每个 *Vue.js* 应用的起步都是通过构造函数Vue创建一个Vue的根实例：

```javascript
var vm = new Vue({
  // 选项
})
```

一个 *Vue* 实例其实正是一个 *MVVM* 模式中所描述的  *ViewModel*  - 因此在文档中经常会使用 *vm* 这个变量名。



## 1.5 响应式的数据(Data)属性与方法
### 属性与方法

每个 *Vue* 实例都会代理其 *data* 对象里所有的属性，如下代码：

```javascript
var data = { a: 1 }
var vm = new Vue({
  data: data
})
//vm.a === data.a  -> true
// 设置属性也会影响到原始数据
vm.a = 2
// data.a  -> 2
// ... 反之亦然
data.a = 3
//vm.a -> 3
```

注意只有这些被代理的属性是响应的。如果在实例创建之后添加新的属性到实例上，它不会触发视图更新。

除了前面这些数据属性，Vue 实例还有一些有用的实例属性与方法。这些属性与方法都有前缀  *$* ，以便与代理的数据属性区分。例如：

```javascript
var data = { a: 1 }
var vm = new Vue({
  el: '#example',
  data: data
})

vm.$data === data // -> true
vm.$el === document.getElementById('example') // -> true

// $watch 是一个实例方法
vm.$watch('a', function (newVal, oldVal) {
  // 这个回调将在 `vm.a`  改变后调用
})
```

同学们可以参考<a href='http://cn.vuejs.org/api/#实例属性' target="_Blank">这里</a>来进行学习。



# 2 数据绑定模版语法

## 2.1 模版中文本插值的“Mustache”语法
### 文本插值

数据绑定最基础的形式是文本插值，使用 {{}} 语法（双大括号）：

```javascript
<span>Message: {{ msg }}</span>
```

{{ msg }} 标签会被相应数据对象的 msg 属性的值替换。每当这个属性变化时它也会更新。

也可以只处理单次插值，今后的数据变化就不会再引起插值更新了：

```javascript
<span>This will never change: {{* msg }}</span>
```

如下JavaScript代码:

```javascript
var data={msg:'Hello Vue.js!'};
new Vue({
  el: '#demo',
  data: data
 })
data.msg="Hello World!";
```


> 练一练单次插值绑定。

## 2.2 模版语法如何处理原始 HTML
### 原始的HTML

双大括号标签将数据解析为纯文本而不是 *HTML* 。为了输出真的 *HTML* 字符串，需要用三大括号标签：

```javascript
<div>{{{ msg }}}</div>
```

如下javascript代码：

```javascript
var data={msg:'<p>Hello Vue.js!
'};
new Vue({
    el: '#demo',
    data: data
   })
```


> 输出一个span元素。

## 2.3 数据绑定HTML特性(Attributes)
### HTML特性

双大括号标签也可以用在 HTML 特性 (Attributes) 内：

```javascript
<div id="{{ id }}"></div>
```

javascript代码如下：

```javascript
var data={id:'demo'};
new Vue({
  el: 'div',
  data: data
 })
```

我们去查看HTML源码，是不是id已经变成我们设置的id了。


> 试着加入一个name属性。

## 2.4 JavaScript表达式
### JavaScript表达式

 *Vue.js*  在数据绑定内支持全功能的 *JavaScript* 表达式：

```javascript
{{ number + 1 }}
{{ ok ? 'YES' : 'NO' }}
{{ message.split('').reverse().join('') }}
```


> 练习{{ ok ? 'YES' : 'NO' }}.

## 2.5 过滤器-可自定义的函数
### 过滤器

 *Vue.js*  允许在表达式后添加可选的“过滤器 ( *Filter* ) ”，以“管道符(|)”指示。过滤器本质上是一个函数，这个函数会接收一个值，将其处理并返回。

```javascript
{{ message | uppercase }}
```

这里我们将表达式  *message*  的值“管输（pipe）”到内置的  *uppercase*  过滤器，这个过滤器其实只是一个 JavaScript 函数，返回大写化的值。 *Vue.js*  提供数个内置过滤器，在后面我们会谈到如何开发自己的过滤器。

可以串联多个过滤器：

```javascript
{{ message | filterA | filterB }}
```

html代码：　　

```javascript
<div id='demo'>
<span>{{msg | lowercase | capitalize}}</span>
</div>
```

javaScript代码：

```javascript
 var data={msg:'heLLO!'};
 new Vue({
  el: '#demo',
  data: data
 })
```

运行结果为：Hello


> 练习字符串小写（lowercase）的过滤器。

## 2.6 指令(Directives)
### 指令

 *Vue.js* 指令 ( *Directives* ) 是特殊的带有前缀  *v-*  的特性。本质是模板中出现的特殊标记，让处理模板的库知道需要对这里的 *DOM* 元素进行一些对应的处理。指令的职责就是当其表达式的值改变时把某些特殊的行为应用到 DOM 上。

```javascript
<p v-if="msg">Hello!

```

这里  *v-if*  指令将根据表达式  *msg*  值的真假删除/插入 < p > 元素。

在Vue.js中为我们提供了一些指令： *v-text，v-html，v-model，v-on，v-else* 等等，同学们可以去查看Vue.js的指令api( *cn.vuejs.org/api/#指令* )。

javascript代码：

```javascript
 var data={msg:0};
 new Vue({
  el: '#demo',
  data: data
 })
```


> 当msg的值为false时，看看HTML有什么变化呢？

## 2.7 通过计算属性处理逻辑
### 计算属性

在模板中表达式非常便利，但是它们实际上只用于简单的操作。模板是为了描述视图的结构。在模板中放入太多的逻辑会让模板过重且难以维护。这就是为什么 Vue.js 将绑定表达式限制为一个表达式。如果需要多于一个表达式的逻辑，应当使用计算属性。

在  *Vue.js*  中，你可以通过  *computed*  选项定义计算属性：

```javascript
<div id="example">
  a={{ a }}, b={{ b }}
</div>
```

```javascript
var vm = new Vue({
  el: '#example',
  data: {
    a: 1
  },
  computed: {
    // 一个计算属性的 getter
    b: function () {
      // `this` 指向 vm 实例
      return this.a + 1
    }
  }
})
```

运行结果为：a=1,b=2


> 写一个字符串求长度的计算属性。

# 3 Class列表与Style样式的数据绑定

## 3.1 绑定Html Class对象语法
### Class对象语法

可以传给  *v-bind:class*  一个对象，以动态地切换 *class* 。注意  *v-bind:class*  指令可以与普通的  *class*  特性共存。

html代码：

```javascript
<div class="static" v-bind:class="{ 'class-a': isA, 'class-b': isB }"></div>
```

javascript代码：

```javascript
var vm = new Vue({
  el: 'div',
  data: {
  isA: true,
  isB: false
}
})
```

渲染为：

```javascript
<div class="static class-a">
</div>
```

当 isA 和 isB 变化时，class 列表将相应地更新。例如，如果 isB 变为 true，class 列表将变为 "static　class-a class-b"。


> 将上面的代码练一练。

## 3.2 绑定Html Class数组语法
### Class数组语法

可以把一个数组传给 v-bind:class，以应用一个 class 列表：

html代码：

```javascript
<div v-bind:class="[classA, classB]">
```

js代码：

```javascript
var vm = new Vue({
  el: 'div',
  data: {
  classA: 'class-a',
  classB: 'class-b'
}
})
```

渲染为：

```javascript
<div class="class-a class-b"></div>
```


> 去掉一个样式看看是什么情况？

## 3.3 绑定内联样式Style对象语法
### Style对象语法

　　 *v-bind:style* 的对象语法十分直观——看着非常像 CSS，其实它是一个 *JavaScript* 对象。CSS属性名可以用驼峰式（camelCase）或短横分隔命名（kebab-case）：

html代码：

```javascript
<div v-bind:style="{ color: activeColor, fontSize: fontSize + 'px' }">Style 对象语法</div>
```

javascript代码：

```javascript
var vm = new Vue({
  el: 'div',
  data: {
  activeColor: 'red',
  fontSize: 30
}
})
```

渲染为：

```javascript
<div style="color: red; font-size: 30px;">Style 对象语法</div>
```


> 再绑定一个字体属性试试。

## 3.4 绑定内联样式Style数组语法
### Style数组语法

 *v-bind:style* 的数组语法可以将多个样式对象应用到一个元素上。

```javascript
<div v-bind:style="[styleObjectA, styleObjectB]">Style 数组语法</div>
```

javascript代码：

```javascript
var vm = new Vue({
  el: 'div',
  data: {
  styleObjectA: {
    color: 'red'
  },
    styleObjectB: {
     fontSize: '30px'
  }
}
})
```

渲染为：

```javascript
<div style="color: red; font-size: 30px;">Style 数组语法</div>
```


> 自己去试试绑定三个元素的数组！

# 4 渲染指令

## 4.1 条件渲染指令 v-if
### v-if

在字符串模板中，如 *Handlebars* ，我们得像这样写一个条件块：

```javascript
<!-- Handlebars 模板 -->
{{#if ok}}
  <h1>Yes</h1>
{{/if}}
```

　　在  *Vue.js* ，我们使用  *v-if*  指令实现同样的功能：

```javascript
<h1 v-if="ok">Yes</h1>
```

也可以用  *v-else*  添加一个  *“else”*  块：

```javascript
<h1 v-if="ok">Yes</h1>
<h1 v-else>No</h1>
```


> 练习一下v-else指令吧。

## 4.2 template元素条件渲染 v-if
### template v-if

因为  *v-if*  是一个指令，需要将它添加到一个元素上。但是如果我们想切换多个元素呢？此时我们可以把一个 `<template>` 元素当做包装元素，并在上面使用  *v-if* ，最终的渲染结果不会包含它。

```javascript
<template v-if="ok">
  <h1>Title</h1>
  <p>Paragraph 1

  <p>Paragraph 2

</template>
```

当ok为真值时，渲染为：

```javascript
<h1>Title</h1>
<p>Paragraph 1

<p>Paragraph 2

```


> 与v-else指令配合练习一下吧。

## 4.3 条件渲染 v-show
### v-show

另一个根据条件展示元素的选项是  *v-show*  指令。用法大体上一样：

```javascript
<h1 v-show="ok">Hello!</h1>
```

　　不同的是有  *v-show*  的元素会始终渲染并保持在 DOM 中。 *v-show*  是简单的切换元素的  *CSS*  属性  *display* 。



## 4.4 条件渲染 v-else
### v-else

　　可以用  *v-else*  指令给  *v-if*  或  *v-show*  添加一个 “ *else 块* ”：

```javascript
<div v-if="Math.random() > 0.5">
  Sorry
</div>
<div v-else>
  Not sorry
</div>
```

 *v-else*  元素必须立即跟在  *v-if*  或  *v-show* 元素的后面，否则它不能被识别。



## 4.5 列表渲染指令 v-for
### v-for

可以使用  *v-for*  指令基于一个数组渲染一个列表。这个指令使用特殊的语法，形式为  *item in items，items*  是数据数组， *item*  是当前数组元素的别名：

```javascript
<ul id="example">
  <li v-for="item in items">
    {{ item.message }}
  </li>
</ul>
```

js代码：

```javascript
var example1 = new Vue({
  el: '#example',
  data: {
    items: [
      { message: 'one' },
      { message: 'two' }
    ]
  }
})
```

在  *v-for*  块内我们能完全访问父组件作用域内的属性，另有一个特殊变量  *$index* ，正如你猜到的，它是当前数组元素的索引：

```javascript
  <ul id="example">
  <li v-for="item in items">
    {{ parentMessage }} - {{ $index }} - {{ item.message }}
  </li>
</ul>
```

js代码：

```javascript
var example2 = new Vue({
  el: '#example',
  data: {
    parentMessage: 'Parent',
    items: [
      { message: 'one' },
      { message: 'two' }
    ]
  }
})
```


> 练习一下v-for指令的特殊变量$index吧。

## 4.6 template元素列表渲染 v-for
### template v-for

类似于  *template v-if* ，也可以将  *v-for*  用在  *template*  标签上，以渲染一个包含多个元素的块。例如：

```javascript
<ul>
  <template v-for="item in items">
    <li>{{ item.msg }}</li>
    <li class="divider"></li>
  </template>
</ul>
```



# 5 表单控件输入绑定

## 5.1 文本输入框 Text
### Text

可以在表单的 *input*  元素上使用 *v-model*  指令来创建双向数据绑定。它会根据 *input* 元素的类型自动选取正确的绑定模式。

```javascript
<span>Message is:{{msg}}</span>
<input type="text" v-model="msg" placeholder="edit me">
```

js代码：

```javascript
var vm = new Vue({
  el: 'div',
  data: {
      msg:"hello world"
  }
})
```

其中 *placeholder* 为默认显示提示。


> 自己写一个placeholder="emal address"的输入框。

## 5.2 多选框 Checkbox
### Checkbox

多个勾选逻辑值，如下代码：

```javascript
<input type="checkbox" id="jack" value="Jack" v-model="checkedNames">
<label for="jack">Jack</label>
<input type="checkbox" id="john" value="John" v-model="checkedNames">
<label for="john">John</label>
<input type="checkbox" id="mike" value="Mike" v-model="checkedNames">
<label for="mike">Mike</label>
<br>
<span>Checked names: {{ checkedNames }}</span>
```

当我们要绑定值时可以用v-bind来绑定，如下代码：

```javascript
<div>
<input
  type="checkbox"
  v-model="toggle"
  v-bind:true-value="a"
  v-bind:false-value="b">
</div>
```

当checkbox为true时，值为a；当为fals时，值为b。


> 绑定checkbox为true时，值为T;否则为F。

## 5.3 单选按钮 Radio
### Radio

```javascript
<input type="radio" id="one" value="One" v-model="picked">
<label for="one">One</label>
<br>
<input type="radio" id="two" value="Two" v-model="picked">
<label for="two">Two</label>
<br>
<span>Picked: {{ picked }}</span>
```

我们可以用v-bind指令来绑定数据。如下代码：

```javascript
<input type="radio" v-model="pick" v-bind:value="a">
```


> 绑定值为"T"的单选按钮。

## 5.4 选择下拉列表 Selected
### select

单选，如下代码：

```javascript
<select v-model="selected">
  <option selected>A</option>
  <option>B</option>
  <option>C</option>
</select>
<span>Selected: {{ selected }}</span>
```

多选，如下代码：

```javascript
<select v-model="selected" multiple>
  <option selected>A</option>
  <option>B</option>
  <option>C</option>
</select>
<br>
<span>Selected: {{ selected | json }}</span>
```

动态选项，用 v-for 渲染，如下代码：

```javascript
<select v-model="selected">
  <option v-for="option in options" v-bind:value="option.value">
    {{ option.text }}
  </option>
</select>
<span>Selected: {{ selected }}</span>
```

js代码如下：

```javascript
new Vue({
  el: 'div',
  data: {
    selected: 'A',
    options: [
      { text: 'One', value: 'A' },
      { text: 'Two', value: 'B' },
      { text: 'Three', value: 'C' }
    ]
  }
})
```

对象的格式应为 {text:'', value:''}。这允许你把展示的文字和其背后对应的值区分开来。

也可以用v-bind来绑定数据，如我们要绑定一个数值型的数据，如下代码：

```javascript
<select v-model="selected">
  <!-- 对象字面量 -->
  <option v-bind:value="{ number: 123 }">123</option>
</select>
```


> 练一练动态选择！

## 5.5 修饰符参数特性 lazy、number、trim
### 参数特性

<b>lazy</b>

在默认情况下， *v-model*  在 *input*  事件中同步输入框值与数据，可以添加一个特性  *lazy* ，从而改到在  *change*  事件中同步：

```javascript
<!-- 在 "change" 而不是 "input" 事件中更新 -->
<input v-model="msg" lazy>
```

如下实例，当在文本框中输入完成以后，才更新内容：

```javascript
<span>Message is:{{msg}}</span>
<input type="text" v-model="msg" lazy>
```

<b>number</b>

如果想自动将用户的输入保持为数字，可以添加一个特性  *number* ：

```javascript
<input v-model="age" number>
```

<b>debounce</b>

 *debounce*  设置一个最小的延时，在每次敲击之后延时同步输入框的值与数据。如果每次更新都要进行高耗操作（例如在输入提示中 Ajax 请求），它较为有用。

```javascript
<input v-model="msg" debounce="500">
```

注意  *debounce*  参数不会延迟  *input*  事件：它延迟“写入”底层数据。


> debounce参数，延时10秒去试试看！

# 6 自定义指令

## 6.1 自定义指令基础(钩子函数)
### 基础

 *Vue.js* 允许自定义指令，实质上是让你教  *Vue* 一些新技巧：怎样将数据的变化映射到  *DOM*  的行为。可以使用  *Vue.directive(id, definition)*  的方法传入指令  *id*  和定义对象来注册一个全局自定义指令。定义对象需要提供一些钩子函数（全部可选）：

 *bind* ： 仅调用一次，当指令第一次绑定元素的时候。

 *update* ： 第一次是紧跟在 bind 之后调用，获得的参数是绑定的初始值；以后每当绑定的值发生变化就会被调用，获得新值与旧值两个参数。

 *unbind* ：仅调用一次，当指令解绑元素的时候。

```javascript
Vue.directive('my-directive', {
  bind: function () {
    // 准备工作
    // 例如，添加事件处理器或只需要运行一次的高耗任务
  },
  update: function (newValue, oldValue) {
    // 值更新时的工作
    // 也会以初始值为参数调用一次
  },
  unbind: function () {
    // 清理工作
    // 例如，删除 bind() 添加的事件监听器
  }
})
```

在注册之后，便可以在 Vue.js 模板中这样用（ *记着添加前缀 v-* ）：

```javascript
<div v-my-directive="someValue"></div>
```

当只需要 update 函数时，可以传入一个函数替代定义对象：

```javascript
Vue.directive('my-directive', function (value) {
  // 这个函数用作 update()
})
```

js代码如下：

```javascript
Vue.directive('my-directive', {
  bind: function () {
    console.log('my-directive')
  },
  update: function (value) {
    this.el.innerHTML ='value - '+ value
  }
})
var demo = new Vue({
  el: '#demo',
  data: {
    my-directive: 'hello!'
  }
})
```


> 自定义一个helloworld的指令。

## 6.2 指令实例属性
### 指令实例属性

所有的钩子函数将被复制到实际的指令对象中，钩子内 this 指向这个指令对象。这个对象暴露了一些有用的属性：

　　 *el* : 指令绑定的元素。<br>
　　 *vm* : 拥有该指令的上下文 ViewModel。<br>
　　 *expression* : 指令的表达式，不包括参数和过滤器。<br>
　　 *arg* : 指令的参数。<br>
　　 *name* : 指令的名字，不包含前缀。<br>
　　 *modifiers* : 一个对象，包含指令的修饰符。<br>
　　 *descriptor* : 一个对象，包含指令的解析结果。

```javascript
<div id="demo" v-demo:hello.a.b="msg"></div>
```

js代码：

```javascript
Vue.directive('demo', {
  bind: function () {
    console.log('demo bound!')
  },
  update: function (value) {
    this.el.innerHTML =
      'name - '       + this.name + '<br>' +
      'expression - ' + this.expression + '<br>' +
      'argument - '   + this.arg + '<br>' +
      'modifiers - '  + JSON.stringify(this.modifiers) + '<br>' +
      'value - '      + value
  }
})
var demo = new Vue({
  el: '#demo',
  data: {
    msg: 'hello!'
  }
})
```


> 去查看descriptor的结果是什么？

## 6.3 指令对象字面量
### 对象字面量

如果指令需要多个值，可以传入一个 JavaScript 对象字面量。记住，指令可以使用任意合法的 JavaScript 表达式：

```javascript
<div v-demo="{ color: 'white', text: 'hello!' }"></div>
```

js代码如下：

```javascript
Vue.directive('demo', function (value) {
  document.write(value.color+" "+value.text);
})
```


> 将 4+6 这个表达式传入指令。

## 6.4 指令对象字面修饰符
### 字面修饰符

当指令使用了字面修饰符 *literal* ，它的值将按普通字符串处理并传递给 update 方法。update 方法将只调用一次，因为普通字符串不能响应数据变化。

```javascript
<div  id="demo" v-demo.literal="foo bar baz">
```

js代码如下：

```javascript
Vue.directive('demo', function (value) {
  document.write(value) // "foo bar baz"
})
```


> 将上面代码到练习环境中去练一练。

## 6.5 自定义元素指令
### 元素指令

有时候，我们可能想要我们的指令可以以自定义元素的形式被使用，而不是作为一个特性。这与 *Angular*  的  *E*  类指令的概念非常相似。元素指令可以看做是一个轻量的自定义组件（后面会讲到）。你可以像下面这样注册一个自定义的元素指令：

```javascript
Vue.elementDirective('my-directive', {
  // API 同普通指令
  bind: function () {
    // 操作 this.el...
  }
})
```

页面应用为：

```javascript
<my-directive></my-directive>
```


> 自己定义一个< hello-vue >的元素指令。

# 7 自定义过滤器

## 7.1 自定义过滤器基础
### 基础

可以用全局方法  *Vue.filter()*  注册一个自定义过滤器，它接收两个参数：过滤器 *ID* 和过滤器函数。过滤器函数以值为参数，返回转换后的值：

```javascript
Vue.filter('split0', function (value) {
  return value.split('.')[0];
})
```

html代码：

```javascript
<div id="demo">{{msg|split0}}</div>
```

js代码：

```javascript
Vue.filter('split0', function (value) {
  return value.split('.')[0];
})
var vm=new Vue({
  el: '#example',
  data:{
  msg:'2.0'}
})
```

过滤器函数可以接收任意数量的参数：

```javascript
Vue.filter('wrap', function (value, begin, end) {
  return begin + value + end;
})
```

```javascript
<!-- 'hello' => 'before hello after' -->
<span>{{msg | wrap 'before' 'after'}}</span>
```


> 自己去练一练多参数的过滤器吧！

## 7.2 双向自定义过滤器
### 双向过滤器

我们使用过滤器都是在把来自模型的值显视在视图之前转换它。不过也可以定义一个过滤器，在把来自视图（< input > 元素）的值写回模型之前转化它，如下代码：

```javascript
Vue.filter('currencyDisplay', {
  // model -> view
  // 在更新 `<input>` 元素之前格式化值
  read: function(val) {
    return '￥'+val.toFixed(2)
  },
  // view -> model
  // 在写回数据之前格式化值
  write: function(val, oldVal) {
    var number = +val.replace(/[^\d.]/g, '')
    return isNaN(number) ? 0 : parseFloat(number.toFixed(2))
  }
})
```

html代码如下：

```javascript
<div id="example">
  <input type="text" v-model="msg|currencyDisplay"><br>
  <span>{{msg}}</span>
</div>
```



## 7.3 过滤器的动态参数
### 动态参数

如果一个过滤器参数没有被引号包裹，它会在当前  *vm*  的数据作用域里当做表达式进行动态求值。此外，过滤器函数的  *this*  上下文永远是调用它的当前  *vm* 。

```javascript
<input v-model="userInput">
<span>{{msg | concat userInput}}</span>
```

js代码：

```javascript
Vue.filter('concat', function (value, input) {
  // 这里 `input` === `this.userInput`
  return value + input
})
```


> 写一个字符串求长度的过滤器。

# 8 方法与事件处理器

## 8.1 方法处理器
### 方法处理器

可以用  *v-on*  指令监听  *DOM*  事件：

```javascript
<div id="example">
  <button v-on:click="greet">Greet</button>
</div>
```

我们绑定了一个单击事件处理器到一个方法 greet。下面在 Vue 实例中定义这个方法：

```javascript
var vm = new Vue({
  el: '#example',
  data: {
    name: 'Vue.js'
  },
  // 在 'methods' 对象中定义方法
  methods: {
    greet: function (event) {
      // 方法内 'this'指向 vm
      alert('Hello ' + this.name + '!')
      // 'event' 是原生 DOM 事件
      alert(event.target.tagName)
    }
  }
})
```


> 自己去练一练吧！

## 8.2 内联语句处理器
### 内联语句处理器

除了直接绑定到一个方法，也可以用内联  *JavaScript*  语句：

```javascript
<div id="example-2">
  <button v-on:click="say('hi')">Say Hi</button>
  <button v-on:click="say('what')">Say What</button>
</div>
```

js代码:

```javascript
new Vue({
  el: '#example',
  methods: {
    say: function (msg) {
      alert(msg)
    }
  }
})
```

有时也需要在内联语句处理器中访问原生 DOM 事件。可以用特殊变量 $event 把它传入方法：

```javascript
<button v-on:click="say('hello!', $event)">Submit</button>
```

js代码：

```javascript
new Vue({
  el: '#example',
  methods: {
    say: function (msg, event) {
    // 现在我们可以访问原生事件对象
    event.preventDefault()
  }
  }
})
```


> 直接绑定一个mouseover事件去练一练吧！

## 8.3 事件处理的修饰符
### 事件修饰符

在事件处理器中经常需要调用  *event.preventDefault()*  或  *event.stopPropagation()* 。尽管我们在方法内可以轻松做到，不过让方法是纯粹的数据逻辑而不处理 DOM 事件细节会更好。为了解决这个问题， *Vue.js*  为  *v-on*  提供两个事件修饰符： *.prevent*  与  *.stop* 。

```javascript
<!-- 阻止单击事件冒泡 -->
<a v-on:click.stop="doThis"></a>
<!-- 提交事件不再重载页面 -->
<form v-on:submit.prevent="onSubmit"></form>
<!-- 修饰符可以串联 -->
<a v-on:click.stop.prevent="doThat"></a>
<!-- 只有修饰符 -->
<form v-on:submit.prevent></form>
```



## 8.4 按键处理的修饰符
### 按键修饰符

在监听键盘事件时，我们经常需要检测  *keyCode* 。 *Vue.js* 允许为 *v-on* 添加按键修饰符：

```javascript
<!-- 只有在 keyCode 是 13 时调用 vm.submit() -->
<input v-on:keyup.13="submit">
```

记住所有的 keyCode 比较困难，Vue.js 为最常用的按键提供别名：

```javascript
<!-- 同上 -->
<input v-on:keyup.enter="submit">
```

常用按键别名： *enter、tab、delete、esc、space、up、down、left、right* 。


> 当按delete时，提示不允许删除。

# 9 过渡和动画效果

## 9.1 过渡动画效果简介
### 简介

通过  *Vue.js*  的过渡系统，你可以轻松的为 DOM 节点被插入/移除的过程添加过渡动画效果。Vue 将会在适当的时机添加/移除 CSS 类名来触发 CSS3 过渡/动画效果，你也可以提供相应的  *JavaScript*  钩子函数在过渡过程中执行自定义的 DOM 操作。

以  *v-transition="my-transition*  这个指令为例，当带有这个指令的 DOM 节点被插入或移除时，Vue 将会：

1.用  *my-transition* 这个 ID 去查找是否有注册过的  *JavaScript*  钩子对象。这个对象可以是由  *Vue.transition(id, hooks)*  全局注册，或是通过  *transitions*  选项定义在当前的组件内部。如果找到此对象，则会在过渡动画不同的阶段调用相应的钩子。

2.自动探测目标元素是否应用了  *CSS*  过渡效果或者动画效果，并在适当的时机添加/移除  *CSS*  类名。

3.如果没有提供  *JavaScript*  钩子函数，也没有检测到相应的  *CSS*  过渡/动画效果， *DOM*  的插入/移除会在下一帧立即执行。

```javascript
<div v-if="show" transition="my-transition"></div>
```

所有的  *Vue.js*  过渡效果只有在该  *DOM*  操作是通过  *Vue.js*  触发时才会生效。触发的方式可以是通过内置指令，比如  *v-if* ，或是通过  *Vue*  实例的方法，比如  *vm.$appendTo()* 。



## 9.2 CSS 过渡动画
### CSS 过渡

一个典型的  *CSS*  过渡效果定义如下：

```javascript
<div v-if="show" v-transition="expand">hello</div>
```

然后为 *.expand-transition* ， *.expand-enter*  和 *.expand-leave*  添加 CSS 规则:

```javascript
/* 必需 */
.expand-transition {
  transition: all .3s ease;
  height: 30px;
  padding: 10px;
  background-color: #eee;
  overflow: hidden;
}
/* .expand-enter 定义进入的开始状态 */
/* .expand-leave 定义离开的结束状态 */
.expand-enter, .expand-leave {
  height: 0;
  padding: 0 10px;
  opacity: 0;
}
```

另外，可以提供  *JavaScript*  钩子:

```javascript
Vue.transition('expand', {
  beforeEnter: function (el) {
    el.textContent = 'beforeEnter'
  },
  enter: function (el) {
    el.textContent = 'enter'
  },
  afterEnter: function (el) {
    el.textContent = 'afterEnter'
  },
  enterCancelled: function (el) {
    // handle cancellation
  },
  beforeLeave: function (el) {
    el.textContent = 'beforeLeave'
  },
  leave: function (el) {
    el.textContent = 'leave'
  },
  afterLeave: function (el) {
    el.textContent = 'afterLeave'
  },
  leaveCancelled: function (el) {
    // handle cancellation
  }
})
```

说简单点就是我们在操作某个元素时，当 *v-if* 的值为发生变化时，就会引起 *transition* 的变化，从而使的CSS样式改变。如果还是不明白，请同学们看第四节《过渡流程详解》。



## 9.3 过渡的CSS类名
### 过渡的CSS类名

类名的添加和切换取决于  *transition* 特性的值。比如  *transition="fade"* ，会有三个 CSS 类名：

1） *.fade-transition*  始终保留在元素上。

2） *.fade-enter*  定义进入过渡的开始状态。只应用一帧然后立即删除。

3） *.fade-leave*  定义离开过渡的结束状态。在离开过渡开始时生效，在它结束后删除。

　　如果  *transition*  特性没有值，类名默认是  *.v-transition* ,  *.v-enter*  和  *.v-leave* 。



## 9.4 过渡流程详解示例
### 过渡流程详解

根据我们第一节中的代码来讲解过渡流程：

当  *show*  属性改变时， *Vue.js*  将相应地插入或删除 *div* 元素，按照如下规则改变过渡的  *CSS*  类名：

如果  *show*  变为  *false* ， *Vue.js*  将：



- 用  *beforeLeave*  钩子；
- 添加  *v-leave*  类名到元素上以触发过渡；
- 调用  *leave*  钩子；
- 等待过渡结束（监听  *transitionend*  事件）；
- 从  *DOM*  中删除元素并删除  *v-leave*  类名；
- 调用  *afterLeave*  钩子。



如果  *show*  变为  *true* ， *Vue.js*  将：


<br>- 调用  *beforeEnter*  钩子；
- 添加  *v-enter*  类名到元素上；
- 把它插入  *DOM* ；
- 调用  *enter*  钩子；
- 强制一次 *CSS*  布局，让  *v-enter*  确实生效。然后删除  *v-enter*  类名，以触发过渡，回到元素的原始状态；
- 等待过渡结束；
- 调用 *afterEnter* 钩子。




## 9.5 渐近的动态过渡
### 渐近过渡

 *transition*  与  *v-for*  一起用时可以创建渐近过渡。给过渡元素添加一个特性  *stagger* ,  *enter-stagger*  或  *leave-stagger* ， 如下代码：

```javascript
<div v-for="list" transition stagger="100"></div>
```

或者，提供一个钩子 stagger, enter-stagger 或 leave-stagger，以更好的控制. 如下代码：

```javascript
Vue.transition('stagger', {
  stagger: function (index) {
    // 每个过渡项目增加 50ms 延时
    // 但是最大延时限制为 300ms
    return Math.min(300, index * 50)
  }
})
```

如下实例html代码：

```javascript
<div id="demo">
    <input v-model="query">
    <ul>
        <li v-for="item in list | filterBy query"
            transition="staggered"
            stagger="100">
          {{item.msg}}
         </li>
    </ul>
</div>
```

js代码：

```javascript
 new Vue({
    el: '#demo',
    data: {
        query: '',
        list: [
            { msg: 'Bruce Lee' },
            { msg: 'Jackie Chan' },
            { msg: 'Chuck Norris' },
            { msg: 'Jet Li' },
            { msg: 'Kung Fury' }
        ]
    }
})
```

CSS代码：

```javascript
ul {
    padding-left: 0;
    font-family: Helvetica, Arial, sans-serif;
}
.staggered-transition {
    transition: all .5s ease;
    overflow: hidden;
    margin: 0;
    height: 20px;
}
.staggered-enter, .staggered-leave {
    opacity: 0;
    height: 0;
}
```

以上代码的效果为:当我们在文本框中输入值时，会看到列表逐渐消失，删除内容时，会看到列表显示。


> 我们改变一下stagger值为1000，看看会有什么效果呢?

# 10 组件

## 10.1 组件的注册组合构造
### 使用组件

在 *Vue* 中，可以用  *Vue.extend()*  创建一个组件构造器：

```javascript
var MyComponent = Vue.extend({
  template:'..........' //选项
})
```

要把这个构造器用作组件，需要用  *Vue.component(tag, constructor)*  注册 ：

```javascript
// 全局注册组件，tag 为 my-component
Vue.component('my-component', MyComponent)
```

在注册之后，组件便可以用在父实例的模块中，以自定义元素 < my-component > 的形式使用。要确保在初始化根实例之前注册了组件：

```javascript
<div id="example">
  <my-component></my-component>
</div>
```

js代码如下：

```javascript
// 定义
var MyComponent = Vue.extend({
  template: '<div>A custom component!</div>'
})
// 注册
Vue.component('my-component', MyComponent)
// 创建根实例
new Vue({
  el: '#example'
})
```

渲染为：

```javascript
<div id="example">
  <div>A custom component!</div>
</div>
```


> 自己去建立一个名字为child的组件吧。

## 10.2 Props传递数据给子组件
Props 传递数据

组件实例的作用域是孤立的。这意味着不能并且不应该在子组件的模板内直接引用父组件的数据。可以使用 props 把数据传给子组件。

“ *prop* ” 是组件数据的一个字段，期望从父组件传下来。子组件需要显式地用  *props*  选项声明  *props* ：

```javascript
Vue.component('child', {
  // 声明 props
  props: ['msg'],
  // prop 可以用在模板内
  // 可以用 `this.msg` 设置
  template: '<span>{{ msg }}</span>'
})
```

然后向它传入一个普通字符串：

```javascript
<child msg="hello!"></child>
```


> 自己去建立一个名字为child的组件，然后用props传值。

## 10.3 动态Prop用作特性
动态Prop

 *HTML*  特性不区分大小写。名字形式为  *camelCase*  的  *prop*  用作特性时，需要转为  *kebab-case* （短横线隔开）：

```javascript
Vue.component('child', {
  // camelCase in JavaScript
  props: ['myMessage'],
  template: '<span>{{ myMessage }}</span>'
})
```

```javascript
<!-- kebab-case in HTML -->
<child my-message="hello!"></child>
```

类似于绑定一个普通的特性到一个表达式，也可以用  *v-bind*  绑定动态  *Props*  到父组件的数据。每当父组件的数据变化时，也会传递给子组件：

```javascript
<div>
  <input v-model="parentMsg">
  <br>
  <child v-bind:my-message="parentMsg"></child>
</div>
```


> 自己去建立一个名字为child的组件，然后用props传值。

## 10.4 通过 Props 绑定类型实现单双向绑定
Props 绑定类型

 *prop*  默认是单向绑定：当父组件的属性变化时，将传导给子组件，但是反过来不会。这是为了防止子组件无意修改了父组件的状态——这会让应用的数据流难以理解。不过，也可以使用  *.sync*  或  *.once*  绑定修饰符显式地强制双向或单次绑定。

```javascript
<!-- 默认为单向绑定 -->
<child v-bind:my-message="parentMsg"></child>
<!-- 双向绑定 -->
<child v-bind:my-message.sync="parentMsg"></child>
<!-- 单次绑定 -->
<child v-bind:my-message.once="parentMsg"></child>
```

双向绑定会把子组件的  *my-message*  属性同步回父组件的  *parentMsg*  属性。单次绑定在建立之后不会同步之后的变化。


> 练一下双向绑定，看看会有什么效果呢。

## 10.5 自定义通信事件示例
自定义事件

 *Vue*  实例实现了一个自定义事件接口，用于在组件树中通信。这个事件系统独立于原生  *DOM*  事件，做法也不同。

每个  *Vue*  实例都是一个事件触发器：



- 使用  *$on()*  监听事件；
- 使用  *$emit()*  在它上面触发事件；
- 使用  *$dispatch()*  派发事件，事件沿着父链冒泡；
- 使用  *$broadcast()*  广播事件，事件向下传导给所有的后代。



子组件可以用 this.$parent 访问它的父组件,而父组件有一个数组 this.$children，包含它所有的子元素。

```javascript
<!-- 子组件模板 -->
<template id="child-template">
  <input v-model="msg">
  <button v-on:click="notify">Dispatch Event</button>
</template>
<!-- 父组件模板 -->
<div id="events-example">
  <p>Messages: {{ messages | json }}

  <child></child>
</div>
```

```javascript
// 注册子组件
// 将当前消息派发出去
Vue.component('child', {
  template: '#child-template',
  data: function () {
    return { msg: 'hello' }
  },
  methods: {
    notify: function () {
      if (this.msg.trim()) {
        this.$dispatch('child-msg', this.msg)
        this.msg = ''
      }
    }
  }
})
// 启动父组件
// 将收到消息时将事件推入一个数组
var parent = new Vue({
  el: '#events-example',
  data: {
    messages: []
  },
  // 在创建实例时 `events` 选项简单地调用 `$on`
  events: {
    'child-msg': function (msg) {
      // 事件回调内的 `this` 自动绑定到注册它的实例上
      this.messages.push(msg)
    }
  }
})
```

关于组件的介绍我们就先讲到这里，更多介绍在请参考<a href="http://cn.vuejs.org/guide/components.html" target="_Blank">这里</a>。


> 将上面的代码，在练习环境中去练一练。
