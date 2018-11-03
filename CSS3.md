# CSS3

<!-- TOC -->

- [CSS3](#css3)
- [1 新增属性选择器](#1-新增属性选择器)
    - [1.1 简介](#11-简介)
    - [1.2 匹配属性值——开始值](#12-匹配属性值开始值)
    - [1.3 匹配属性值——包含值](#13-匹配属性值包含值)
    - [1.4 匹配属性值——结尾值](#14-匹配属性值结尾值)
- [2 新增结构伪类选择器](#2-新增结构伪类选择器)
    - [2.1 简介](#21-简介)
    - [2.2 选择首个子元素](#22-选择首个子元素)
    - [2.3 选择末尾子元素](#23-选择末尾子元素)
    - [2.4 选择首个类型子元素](#24-选择首个类型子元素)
    - [2.5 选择末尾类型子元素](#25-选择末尾类型子元素)
    - [2.6 选择一或多个子元素](#26-选择一或多个子元素)
    - [2.7 选择类型子元素(倒序)](#27-选择类型子元素倒序)
    - [2.8 选择指定类型元素](#28-选择指定类型元素)
    - [2.9 选择父元素的特定子元素(倒序)](#29-选择父元素的特定子元素倒序)
    - [2.10 选择有唯一子元素的元素](#210-选择有唯一子元素的元素)
    - [2.11 选择元素的子元素并类型是唯一的子元素](#211-选择元素的子元素并类型是唯一的子元素)
    - [2.12 选择内容为空的元素](#212-选择内容为空的元素)
- [3 CSS3 圆角边框](#3-css3-圆角边框)
    - [3.1 简介](#31-简介)
    - [3.2 border-radius属性](#32-border-radius属性)
    - [3.3 border-radius中指定两个半径](#33-border-radius中指定两个半径)
    - [3.4 不显示边框](#34-不显示边框)
    - [3.5 修改边框种类](#35-修改边框种类)
    - [3.6 绘制四个角不同半径的圆角边框](#36-绘制四个角不同半径的圆角边框)
    - [3.7 CSS3 圆角边框练习](#37-css3-圆角边框练习)
- [4 CSS3 图像边框](#4-css3-图像边框)
    - [4.1 简介](#41-简介)
    - [4.2 border-image属性](#42-border-image属性)
    - [4.3 border-image属性最简单的使用方法](#43-border-image属性最简单的使用方法)
    - [4.4 使用border-image属性来指定边框宽度](#44-使用border-image属性来指定边框宽度)
    - [4.5 中央图像自动拉伸](#45-中央图像自动拉伸)
    - [4.6 指定四条边中图像的显示方法](#46-指定四条边中图像的显示方法)
    - [4.7 使用背景图像](#47-使用背景图像)
- [5 CSS3 背景](#5-css3-背景)
    - [5.1 简介](#51-简介)
    - [5.2 background-size 属性（调整图片大小）](#52-background-size-属性调整图片大小)
    - [5.3 background-size 属性（背景图片拉伸）](#53-background-size-属性背景图片拉伸)
    - [5.4 background-origin 属性](#54-background-origin-属性)
    - [5.5 多重背景图片](#55-多重背景图片)
    - [5.6 background-clip 属性](#56-background-clip-属性)
    - [5.7 新的背景属性](#57-新的背景属性)
- [6 CSS3 文本效果](#6-css3-文本效果)
    - [6.1 简介](#61-简介)
    - [6.2 text-shadow属性使用方法](#62-text-shadow属性使用方法)
    - [6.3 位移距离](#63-位移距离)
    - [6.4 阴影的模糊半径](#64-阴影的模糊半径)
    - [6.5 阴影的颜色](#65-阴影的颜色)
    - [6.6 指定多个阴影](#66-指定多个阴影)
    - [6.7 自动换行](#67-自动换行)
- [7 CSS3 字体](#7-css3-字体)
    - [7.1 使用您需要的字体](#71-使用您需要的字体)
    - [7.2 使用粗体文本](#72-使用粗体文本)
    - [7.3 CSS3 字体描述符](#73-css3-字体描述符)
- [8 CSS3 2D 转换](#8-css3-2d-转换)
    - [8.1 简介](#81-简介)
    - [8.2 2D 转换](#82-2d-转换)
    - [8.3 translate() 方法](#83-translate-方法)
    - [8.4 rotate() 方法](#84-rotate-方法)
    - [8.5 scale() 方法](#85-scale-方法)
    - [8.6 skew() 方法](#86-skew-方法)
    - [8.7 matrix() 方法](#87-matrix-方法)
    - [8.8 新的转换属性](#88-新的转换属性)
    - [8.9 2D Transform 方法](#89-2d-transform-方法)
- [9 CSS3 3D 转换](#9-css3-3d-转换)
    - [9.1 简介](#91-简介)
    - [9.2 如何工作与浏览器支持](#92-如何工作与浏览器支持)
    - [9.3 rotateX() 方法](#93-rotatex-方法)
    - [9.4 rotateY() 旋转](#94-rotatey-旋转)
    - [9.5 转换属性](#95-转换属性)
    - [9.6 2D Transform 方法](#96-2d-transform-方法)
- [10 CSS3 过渡](#10-css3-过渡)
    - [10.1 简介](#101-简介)
    - [10.2 如何工作](#102-如何工作)
    - [10.3 多项改变](#103-多项改变)
    - [10.4 过渡属性](#104-过渡属性)
    - [10.5 使用了简写的 transition 属性](#105-使用了简写的-transition-属性)
- [11 CSS3 动画](#11-css3-动画)
    - [11.1 简介](#111-简介)
    - [11.2 实例](#112-实例)
    - [11.3 CSS3 动画](#113-css3-动画)
    - [11.4 什么是 CSS3 中的动画？](#114-什么是-css3-中的动画)
    - [11.5 实例改变背景色和位置](#115-实例改变背景色和位置)
    - [11.6 CSS3 动画属性](#116-css3-动画属性)
    - [11.7 包含所有动画属性实例](#117-包含所有动画属性实例)
    - [11.8 使用了简写的动画 animation 属性](#118-使用了简写的动画-animation-属性)
- [12 CSS3 多列](#12-css3-多列)
    - [12.1 简介](#121-简介)
    - [12.2 CSS3 创建多列](#122-css3-创建多列)
    - [12.3 CSS3 规定列之间的间隔](#123-css3-规定列之间的间隔)
    - [12.4 CSS3 列规则](#124-css3-列规则)
    - [12.5 新的多列属性](#125-新的多列属性)
- [13 CSS3 用户界面](#13-css3-用户界面)
    - [13.1 简介](#131-简介)
    - [13.2 CSS3 Resizing](#132-css3-resizing)
    - [13.3 CSS3 Box Sizing](#133-css3-box-sizing)
    - [13.4 CSS3 Outline Offset](#134-css3-outline-offset)
    - [13.5 新的用户界面属性](#135-新的用户界面属性)

<!-- /TOC -->

# 1 新增属性选择器

## 1.1 简介
### 介绍



　　属性选择器早在CSS2中就被引入了，其主要作用就是为带有 *指定属性* 的HTML 元素 *设置样式* 。使用CSS3属性选择器，你可以只指定元素的某个属性，或者你还可以同时指定元素的某个属性和其对应的属性值。

　　在CSS2中引入了一些属性选择器，而CSS3在CSS2的基础上对属性选择器进行了扩展，新增了 *3* 个属性选择器，使得属性选择器有了通配符的概念，这三个属性选择器与CSS2的属性选择器共同构成了CSS功能强大的属性选择器。

CSS3的属性选择器主要包括以下几种：



-  **E[attr^="value"]** ：指定了属性名，并且有属性值，属性值是以value *开头* 的；


-  **E[attr$="value"]** ：指定了属性名，并且有属性值，而且属性值是以value *结束* 的；


-  **E[attr*="value"]** ：指定了属性名，并且有属性值，而且属值中 *包含* 了value；






## 1.2 匹配属性值——开始值
### 匹配开始值



 **E[attr^="value"]** 属性选择器，指的是选择 *attr* 属性值以 *“value”开头* 的所有元素，也就是说，所选择的属性其对应的属性值是以“ *value* ”开始的。

如下，我们设置a标签的href属性值的背景色：

```javascript
.wrap a[href^="http://"]{background:orange;color:blue;}

.wrap a[href^="mailto:"]{background:blue;color:orange;}
```

上面代码选择了a标签的href属性，并且选取属性值为 *"http://"* 和 *"mailto:"* 开头的所有a标签，改变其颜色。



## 1.3 匹配属性值——包含值
### 匹配包含值



 **E[attr*="value"]** 属性选择器表示的是选择attr属性值中包含子串"value"的所有元素。

也就是说，只要你所选择的属性，其属性值中有这个"value"值都将被选中。

如下，我们设置a标签href的属性值的背景色：

```javascript
.wrap a[title*="hubwiz"]{background:black;color:white;}
```

上面代码表示的是，选择 *.demo* 中元素有title属性并对应属性值 *包含hubwiz* 值的a元素。



## 1.4 匹配属性值——结尾值
### 匹配结尾值



 **E[attr$="value"]** 属性选择器刚好与 **E[attr^="value"]** 选择器 *相反* ，E[attr$="value"]表示的是选择attr属性值以"value"结尾的所有元素。

这个运用在给你一些特殊的链接加背景图片很方便的，比如说给pdf,png,doc等 *不同文件加上不同icon* ，我们就可以使用这个属性来实现。

如下，我们设置a标签href的属性值的背景色：

```javascript
.wrap a[href$="png"]{background:green;color:black;}
```

上面代码表示的是，选择 *.wrap* 中元素有href属性并以 *png值结尾* 的a元素。



# 2 新增结构伪类选择器

## 2.1 简介
### 介绍



　　这节内容是 *CSS3* 选择器最新部分，有人也称这种选择器为 *CSS3* 结构类，下面我们通过实际的应用来具体了解他们的 *使用和区别* ，首先列出他具有的选择方法：



- : **first-child** 选择某个元素的第一个子元素；
- : **last-child** 选择某个元素的最后一个子元素；
- : **first-of-type** 选择一个上级元素下的第一个同类子元素；
- : **last-of-type** 选择一个上级元素的最后一个同类子元素；
- : **nth-child()** 选择某个元素的一个或多个特定的子元素；
- : **nth-last-child()** 选择某个元素的一个或多个特定的子元素，从这个元素的最后一个子元素开始算；
- : **nth-of-type()** 选择指定的元素；
- : **nth-last-of-type()** 选择指定的元素，从元素的最后一个开始计算；
- : **only-child** 选择的元素是它的父元素的唯一一个了元素；
- : **only-of-type** 选择一个元素是它的上级元素的唯一一个相同类型的子元素；
- : **empty** 选择的元素里面没有任何内容。




## 2.2 选择首个子元素
### 选择某个元素的第一个子元素<:first-child>



 **:first-child** 是用来选择某个元素的第一个子元素，比如我们这里的这个demo，你想让列表中的"1"具有与从不同的样式，按照之前的写法，我们需在要第一个li上加上一个相应的class名，比如说“ *first* ”，然后我们在给予对应的样式，如下：

```javascript
.wrap li.first {background: green; border: 1px dashed blue;}
```

在CSS3最新选择器出现之后，我们就可以使用 *:first-child* 来实现，就不需要在增加一个 *额外* 的class名了，设置如下：

```javascript
.wrap li:first-child {background: green; border: 1px dashed blue;}
```

两种方法最终效果是一样的，只是后者对我来说在操作上会更显得简单、方便、快捷。


> 请亲自把右侧的第一个背景变为红色，边框为1像素、蓝色、虚线。

## 2.3 选择末尾子元素
### 选择某个元素的最后一个子元素<:last-child>



 *:last-child* 选择器与 *:first-child* 选择器的作用 *类似* ，不同的是它选择是的元素的最后一个子元素。

比如说，我们需要单独给列表最后一项一个不同的样式，我们就可以使用这个选择器，如下设置简单样式：

```javascript
.wrap li:last-child {background: green; border: 2px dashed blue;}
```

 *:last-child* 选择器与 *:first-child* 选择器使用方法是不是很类似，亲身感受一下效果吧！



## 2.4 选择首个类型子元素
### 选择某元素下的第一个同类子元素<:first-of-type>



“ *:first-of-type* ”选择器类似于“ *:first-child* ”选择器，但不同的是 *:first-of-type* ”选择器还额外指定了元素的 *类型* ，主要用定位匹配属于其父元素的特定类型的首个子元素。

 *:first-of-type* 选择器，不限制是否为第一个子元素，只要为该类型元素的第一个就行，
类型是指什么呢，就是 *冒号* 前面匹配到的东西，比如  *p:first-of-type* ，就是指所有p元素中的第一个。

如下我们为第一个p元素设置背景色：

```javascript
.wrap > p:first-of-type {
   background: green;
}
```



## 2.5 选择末尾类型子元素
### 选择某元素的最后一个同类子元素<:last-of-type>



和:first-of-type选择器相反，:last-of-type选择器选择的是父元素下的某个类型的最后一个子元素。

如下，为最后一个p元素设置背景色：

```javascript
.wrap > p:last-of-type {
  background: green;
}
```

<div  class="cw-exe">
请亲自把最后一个div标签对应的背景色改为蓝色！

## 2.6 选择一或多个子元素
### 选择某元素的一或多个特定的子元素<:nth-child()>



 *:nth-child()* 可以选择元素的一个或多个特定的子元素，可以定义他的值(值可以是整数也可以是表达式)。

1.简单数字序号写法 :nth-child(number)，直接匹配第 *number* 个元素。参数number必须为 *大于0* 的整数。

如下，把第3个p的背景设为绿色：

```javascript
p:nth-child(3){background:green;}
```

2.倍数写法 :nth-child(an)，匹配所有倍数为a的元素。其中参数an中的 *字母n* 不可缺省，它是倍数写法的 *标志* ，如3n、5n。

如下，把第2、第4、第6、…、所有2的倍数的p的背景设为蓝色：

```javascript
p:nth-child(2n){background:blue;}
```

3.倍数分组匹配 :nth-child(an+b)与:nth-child(an-b)，先对元素进行 *分组* ，每组有a个，b为组内成员的 *序号* ，其中 *字母n* 和 *加号+* 不可缺省，位置不可调换，这是该写法的标志，其中a,b均为正整数或0。

如下，匹配第1、第4、第7、…、每3个为一组的第1个p元素

```javascript
p:nth-child(3n+1){background:orange;}
```

如下，匹配第3-1=2、第6-1=5、…、第3的倍数减1个p元素

```javascript
p:nth-child(3n-1){background:#33FF33;}
```

4.奇偶匹配 :nth-child(odd)与:nth-child(even)分别匹配序号为奇数与偶数的元素。奇数(odd)与(2n+1)结果一样；偶数(even)与(2n+0)及(2n)结果一样。

这里，我们为奇数和偶数p元素指定两种不同的背景色：

```javascript
p:nth-child(odd)
{
  background:#ff0000;
}
p:nth-child(even)
{
  background:#0000ff;
}
```



## 2.7 选择类型子元素(倒序)
### 选择元素并倒序计算<:nth-last-child()>



":nth-last-child()"选择器和前面的":nth-child()"很相似，只是这里多了一个 *last* ，所以他起的作用就和前面的":nth-child"不一样了，它是从 *最后一个* 元素开始算，来选择特定元素。

如下使用:nth-last-child()选择器来选择元素并添加样式：

```javascript
.wrap p:nth-last-child(4) {background: red;}
```

如上我们设置p元素的倒数第四个元素，我们也可以像":nth-child(2)"一样，使用表达式来选择特定元素。



## 2.8 选择指定类型元素
### 选择指定的元素<:nth-of-type()>



 *:nth-of-type* 类似于 *:nth-child* ，不同的是他只计算选择器中指定的那个元素，其实我们前面的实例都是指定了具体的元素，这个选择器主要对用来定位元素中包含了好多 *不同类型* 的元素是很有用处。

例如我们为奇数和偶数的p元素指定两种不同的背景色，如下：

```javascript
p:nth-of-type(odd)
{
   background:#FFFF33;
}
p:nth-of-type(even)
{
   background:#99FF33;
}
```



## 2.9 选择父元素的特定子元素(倒序)
### 匹配特定类型的元素并倒数计算<:nth-last-of-type()>



:nth-last-of-type(n)选择器匹配属于父元素的特定类型的第N个子元素的每个元素，从最后一个子元素开始计数(n可以是数字或公式)。

如下设置指定p元素背景色：

```javascript
p:nth-last-of-type(3){
   background: red;
}
```



## 2.10 选择有唯一子元素的元素
### 匹配其父元素中有唯一子元素的元素<:only-child>



E:only-child，匹配那些是其父元素唯一子元素的E元素。简单来说就是匹配父元素中 *只有一个* 子元素的类型元素。

看下如下简单示例：

```javascript
p:only-child
{
   background:red;
}
```



## 2.11 选择元素的子元素并类型是唯一的子元素
### 选择元素的特定类型并唯一的子元素<:only-of-type>



:only-of-type是表示一个元素他有很多个子元素，而其中只有一个子元素是 *唯一* 的。

所以我们使用这种选择器就可以选中元素的唯一子元素。

如下设置右栏中是唯一元素的背景色：

```javascript
div :only-of-type{
    background-color: green;
}
```



## 2.12 选择内容为空的元素
### 选择没有任何内容的元素<:empty>



 *:empty* 是用来选择没有任何内容的元素，这里没有内容指的是 *一点内容都没有* ，哪怕是一个空格。

现在有四个段落，其中一个段落什么都没有内容为空，如果你想这个p隐藏掉，就可通过:empty选择器来实现，如下：

```javascript
p:empty {
   display: none;
}
```

:empty选择器对于没有任何内容的元素 *判断* 是非常有用的。



# 3 CSS3 圆角边框

## 3.1 简介
### 介绍



本节介绍如何使用CSS3的样式进行圆角边框的绘制。圆角边框的绘制也是Web网站或Web应用程序中经常用来美化页面的效果的手法之一。

在CSS3之前，需要使用 *图像文件* 才能达到同样效果，如果只靠样式就能完成圆角边框的绘制，对界面设计者来说无疑是一件可喜的事情。

到目前为止，Safari浏览器、Firefox浏览器、Opera浏览器及Chrome浏览器都 *支持* 这种绘制圆角边框的样式。



## 3.2 border-radius属性
### border-radius属性



在CSS3中，只要使用border-radius属性指定好圆角的半径，就可以绘制圆角边框了。

使用Firefox浏览器的时候，需要在样式代码中将其书写成 *'-moz-border-radius'* 的形式，使用Opera浏览器的时候，需要书写成 *'border-radius'* 的形式，使用Chrome浏览器的时候，可以书写成 *'border-radius'或'-webkit-border-radius'* 的形式。

绘制一个圆角边框的示例

```javascript
.wrap {
   border: solid 5px blue;
   border-radius: 20px;
   -moz-border-radius:20px;
   -o-border-radius: 20px;
   -webkit-border-radius:20px;
   background-color:skyblue;
   padding:20px;
   width:180px;
}
```

在示例中具有一个div元素，使用border-radius属性将其边框绘制为 *圆角边框* ，圆角半径为20像素，边框颜色为蓝色，div元素背景色为浅蓝色。



## 3.3 border-radius中指定两个半径
### border-radius中指定两个半径



在border-radius属性中，可以指定两个半径。指定方法如下所示。

```javascript
border-radius: 40px 20px;
```

针对这种情况，各种浏览器的处理方式并不一致。在Chrome浏览器与Safari浏览器中，会绘制出一个椭圆形边框，第一个半径为 *椭圆* 的水平方向半径，第二个半径为椭圆的垂直方向半径。在Firefox浏览器与Opera浏览器中，将第一个半径作为边框左上角与右下角的 *圆* 半径来绘制，将第二个半径作为边框右上角与左下角的圆半径来绘制。

将示例中div元素的样式修改为如下所示的样式代码（使用两个半径），然后重新提交运行该示例，

看看在不同 *浏览器* 显示的效果。

```javascript
.wrap {
   border: solid 5px blue;
   border-radius: 40px 20px;
   -moz-border-radius:40px 20px;
   -o-border-radius:40px 20px;
   -webkit-border-radius:40px 20px;
   background-color:skyblue;
   padding:20px;
   width:180px;
}
```



## 3.4 不显示边框
### 不显示边框



在CSS3中，如果使用了border-radius属性但是把边框设定为不显示的时候，浏览器将把背景的四个角绘制为 *圆角* 。

如下所示的代码（指定边框为不显示）。

```javascript
.wrap {
   border: none;
   border-radius:20px;
   -moz-border-radius:20px;
   -o-border-radius:20px;
   -webkit-border-radius: 20px;
   background-color:skyblue;
   padding:20px;
   width:180px;
}
```



## 3.5 修改边框种类
### 修改边框种类



使用了border-radius属性后，不管边框是什么种类，都会将边框沿着圆角曲线进行绘制。

如下所示的样式代码：

```javascript
.wrap {
   border: dashed 5px blue;
   border-radius:20px;
   -moz-border-radius:20px;
   -o-border-radius:20px;
   -webkit-border-radius: 20px;
   background-color:skyblue;
   padding:20px;
   width:180px;
}
```


> 请亲自将边框修改为虚线，颜色修改为红色，并指定边框宽度为10px，然后重新运行该示例，提交运行看看效果。

## 3.6 绘制四个角不同半径的圆角边框

### 绘制四个角不同半径的圆角边框



如果要绘制的圆角边框四个角半径各不相同，可以将border-top-left-radius属性、border-top-right-radius属性、border-bottom-right-radius属性、border-bottom-left-radius属性结合起来使用。


其中border-top-left-radius属性指定 *左上角* 半径，border-top-right-radius属性指定 *右上角* 半径，border-bottom-right-radius属性指定 *右下角* 半径，border-bottom-left-radius属性指定 *左下角* 半径。


如下样式代码。


```javascript
.wrap {
   border: solid 5px blue;
   border-radius-topleft:10px;
   border-radius-topright:20px;
   border-radius-bottomright:30px;
   border-radius-bottomleft:40px;
   -moz-border-radius-topleft:10px;
   -moz-border-radius-topright:20px;
   -moz-border-radius-bottomright:30px;
   -moz-border-radius-bottomleft:40px;
   -o-border-radius-topleft:10px;
   -o-border-radius-topright:20px;
   -o-border-radius-bottomright:30px;
   -o-border-radius-bottomleft:40px;
   -webkit-border-top-left-radius:10px;
   -webkit-border-top-right-radius:20px;
   -webkit-border-bottom-right-radius:30px;
   -webkit-border-bottom-left-radius:40px;
   background-color:skyblue;
   padding:20px;
   width:180px;
}
```



## 3.7 CSS3 圆角边框练习

### CSS3 圆角边框练习



在 CSS2 中添加圆角矩形需要技巧。我们必须为每个圆角使用不同的图片。


在 CSS3 中，创建圆角是非常容易的。


在 CSS3 中，border-radius 属性用于创建圆角`border-radius:25px;`



> 按照下面的样式代码，亲自在右侧创建圆角为10像素。


```javascript
.wrap {
   text-align:left;
   border:2px solid #a1a1a1;
   padding:10px 40px;
   background:#dddddd;
   width:350px;
   border-radius:25px;
   -moz-border-radius:25px; /* 老的 Firefox */
}
```



# 4 CSS3 图像边框

## 4.1 简介

### 介绍




本节介绍如何使用CSS3的样式进行图像边框的绘制。



在CSS3之前，如果要使用图像边框，若元素的长或宽是随时可变的，页面制作通常采用的做法是让元素的每条边单独使用一幅图像文件。


但是，这种做法也有缺点：



- 一方面是比较麻烦；
- 另一方面是页面上使用的元素也就变得比较多了。






## 4.2 border-image属性

###  border-image属性



针对上面情况，CSS3中增加了一个border-image属性，可以让处于随时变化状态的元素的长或宽的边框统一使用一个 *图像文件* 来绘制。


使用border-image属性，会让浏览器在显示图像边框时，自动将所使用到的图像分割为9部分进行处理，这样就不需要页面制作者再另外进行 *人工处理* 了。另外，页面中也不需要因此而使用 *较多的元素* 了。关于浏览器对于边框所用到的图像的自动分割内容，会在下面内容进行详细介绍。



使用border-image属性的时候，如果使用的是Firefox浏览器，需要在样式代码中将其书写成 *"-moz-border-image"* 的形式；如果使用的是Safari浏览器或Chrome浏览器，需要书写成 *"-webkit-border-image"* 的形式；如果使用的是Opera浏览器，需要写成 *"border-image"* 的形式。


看下border-image属性使用示例，该示例中有一个div元素，使用border-image属性为该div元素添加了一个图像边框。


```javascript
.wrap {
   border-image:url(images/54d1cae088dba03f2cd1fec1/1-4-2/border.png) 20 20 20 20 / 20px;
   -webkit-border-image:url(images/54d1cae088dba03f2cd1fec1/1-4-2/border.png) 20 20 20 20 / 20px;
   -moz-border-image:url(images/54d1cae088dba03f2cd1fec1/1-4-2/border.png) 20 20 20 20 / 20px;
   width:200px;
}
```



## 4.3 border-image属性最简单的使用方法
### border-image属性最简单的使用方法



border-image属性最简单的使用方法如下所示。



border-image:url(图像文件的路径) A B C D



-webkit-border-image：url(图像文件的路径) A B C D




-moz-border-image：url(图像文件的路径) A B C D




border-image属性值中至少必须指定五个参数，其中第一个参数为边框所使用的图像文件的 *路径* ，A、B、C、D四个参数表示当浏览器自动把边框所使用到的图像进行分隔时的 *上边距* 、 *右边距* 、 *下边距* 及 *左边距* 。如下图1图示的方法对这四个参数进行了说明。



图1：
<img src="images/54d1cae088dba03f2cd1fec1/1-4-3/borderimage.png" />
图2：
<img src="images/54d1cae088dba03f2cd1fec1/1-4-3/borderimage_1.png" />


接下来，让我们看一下如果在border-image属性值中指定了这四个参数，浏览器对于边框所使用的图像是如何进行 *分割* 的。




首先，当在样式代码中书写如下所示的代码时，浏览器对于边框所使用的图像分割方法如图2所示。


border-image：url(borderimage_1.png) 18 18 18 18


-webkit-border-image:url(borderimage_1.png) 18 18 18 18


border-image:url(borderimage_1.png) 18 18 18 18


如图中所示，图像被自动分割为9部分。分割后的图像在CSS3中的名称如表所示




- border-top-left-image  /  border-top-image       /  border-top-right

- border-left-image  /                 /   border-right-image

- border-bottom-left-image  /  border-bottom-image  /  border-bottom-right-image



下面示例代码，可以看出浏览器是如何将分割图像显示在一个边框宽度为5px的div元素中。


```javascript
.wrap{
    border:solid 5px;
    border-image:url(images/54d1cae088dba03f2cd1fec1/1-4-3/border.png) 18 18 18 18;
    -webkit-border-image:url(images/54d1cae088dba03f2cd1fec1/1-4-3/border.png) 18 18 18 18;
    -moz-border-image:url(images/54d1cae088dba03f2cd1fec1/1-4-3/border.png) 18 18 18 18;
    width:300px;
}
```



## 4.4 使用border-image属性来指定边框宽度

### 使用border-image属性来指定边框宽度



在CSS3中，除了可以使用border或border-width属性指定边框的宽度外，使用border-image属性同样可以指定边框的宽度，方法如下：

 *border-image: url('图像文件路径') A B C D/border-width*

样式代码如下：

`.wrap {
   border:solid;
   border-image:url(images/54d1cae088dba03f2cd1fec1/1-4-4/border.png) 18 18 18 18/18px ;
   -webkit-border-image:url(images/54d1cae088dba03f2cd1fec1/1-4-4/border.png) 18 18 18 18/18px;
   -moz-border-image:url(images/54d1cae088dba03f2cd1fec1/1-4-4/border.png) 18 18 18 18/18px;
   width:300px;
}`
另外，在上述代码中A、B、C和D四个参数只指定了一个参数18px，这是因为CSS3中，如果此处的四个参数完全相同，可以只写一个参数，将其他三个参数省略。

 * border-image:url(images/54d1cae088dba03f2cd1fec1/1-4-4/border.png) 18/5px 10px 15px 20px ;*



## 4.5 中央图像自动拉伸

### 中央图像自动拉伸



浏览器将边框所用图像自动分割为9部分后，除了将border-top-image、border-left-image、border-right-image、border-bottom-image这4部分自动分配为 *四条边* 所用的图像之外，将位于中间部分的图像分配给元素边框包围的中间区域，随着div元素的内容变化的同时，或者在样式代码中修改div元素的宽度或高度的同时，中间部分的图像也会 *自动进行伸缩* ，以填满该中间区域。


#### 样式代码如下：


```javascript
.wrap {
   border: solid;
   border-image:url(images/54d1cae088dba03f2cd1fec1/1-4-5/border.png) 18/5px;
   -webkit-border-image:url(images/54d1cae088dba03f2cd1fec1/1-4-5/border.png) 18/5px ;
   -moz-border-image:url(images/54d1cae088dba03f2cd1fec1/1-4-5/border.png)  18/5px ;
   width:300px;
}
```



## 4.6 指定四条边中图像的显示方法

### 绘制四个角不同半径的圆角边框



可以在border-image属性中指定元素四条边中的图像是以拉伸的方式显示，还是以平铺的方式显示，指定方法如下所示。

`border-image: url(文件路径) A B C D/border-width topbottom leftright`
其中,topbottom表示元素的上下两条边中图像的显示方法，leftright表示元素的左右两条边中的显示方法。在显示方法中可以指定的值为 *repeat* 、 *stretch* 、 *round* 三种。


<canvas  width="15" height="15" style="border:1px solid #000000; box-shadow: 1px 1px 5px rgba(0,0,0,0.8); margin-right:5px;"></canvas> *repeat*

将显示方法指定为repeat时，图像将以平铺的方式进行显示。示例代码：

`.wrap {
   border-image:url(images/54d1cae088dba03f2cd1fec1/1-4-6/border.png) 18/5px repeat repeat;
   -webkit-border-image:url(images/54d1cae088dba03f2cd1fec1/1-4-6/border.png) 18/5px repeat repeat;
   -moz-border-image:url(images/54d1cae088dba03f2cd1fec1/1-4-6/border.png)  18/5px repeat repeat;
}`

<canvas  width="15" height="15" style="border:1px solid #000000; box-shadow: 1px 1px 5px rgba(0,0,0,0.8); margin-right:5px;"></canvas> *stretch*

将显示方法指定为stretch时，图像将以拉伸的方式进行显示。


<canvas  width="15" height="15" style="border:1px solid #000000; box-shadow: 1px 1px 5px rgba(0,0,0,0.8); margin-right:5px;"></canvas> *repeat+stretch*

将显示方法指定为repeat+stretch时，图像将以平铺方式和拉伸方式结合使用。示例如下：

`.wrap {
   border-image:url(images/54d1cae088dba03f2cd1fec1/1-4-6/border.png) 18/5px repeat stretch;
   -webkit-border-image:url(images/54d1cae088dba03f2cd1fec1/1-4-6/border.png) 18/5px repeat stretch;
   -moz-border-image:url(images/54d1cae088dba03f2cd1fec1/1-4-6/border.png)  18/5px repeat stretch;
}`

<canvas  width="15" height="15" style="border:1px solid #000000; box-shadow: 1px 1px 5px rgba(0,0,0,0.8); margin-right:5px;"></canvas> *round*

将显示方法指定为round时与将显示指定为repeat类似。




## 4.7 使用背景图像

###  使用背景图像



在使用border-image属性的时候，仍然可以正常使用背景图像，但是为了不让边框图像挡住背景图像，需要使用中间为透明的边框图像，否则背景图像就有可能被边框图像的中央部分挡住部分或全体了。





```javascript
.wrap {
    -moz-border-image: url(images/54d1cae088dba03f2cd1fec1/1-4-7/border-image-small-1.png") 22 round;
   -webkit-border-image: url("images/54d1cae088dba03f2cd1fec1/1-4-7/border-image-small-1.png") 22 round;
   -o-border-image: url("images/54d1cae088dba03f2cd1fec1/1-4-7/border-image-small-1.png") 22 round;
   border-image: url("images/54d1cae088dba03f2cd1fec1/1-4-7/border-image-small-1.png") 22 round;
   display: inline-block;
   border-width: 22px;
}
```



# 5 CSS3 背景

## 5.1 简介

### CSS3 背景介绍



CSS3中包含几个新的背景属性，提供更大背景元素控制。


在本章您将了解以下背景属性：


- 1. background-size
- 2. background-origin
- 3. background-clip


您还可以学习如何使用多重背景图像。

### 浏览器支持

<img src="images/54d1cae088dba03f2cd1fec1/1-5-1/background_1.png" />

Internet Explorer 9+、Firefox、Chrome、Safari 以及 Opera  *支持* 新的背景属性。





## 5.2 background-size 属性（调整图片大小）

### border-image属性




background-size指定背景图像的大小。CSS3以前，背景图像大小由图像的 *实际大小* 决定。


CSS3中可以指定背景图片，让我们重新在不同的环境中指定背景图片的大小。您可以指定 *像素或百分比大小* 。


你指定的大小是相对于? *父元素* 的宽度和高度的百分比的大小。


调整背景图片的大小：


```javascript
div
{
   background:url(bg_flower.gif);
   -moz-background-size:63px 100px; /* 老版本的 Firefox */
   background-size:63px 100px;
   background-repeat:no-repeat;
}
```



## 5.3 background-size 属性（背景图片拉伸）

### 背景图片进行拉伸




对背景图片进行拉伸，使其完成填充内容区域：



```javascript
div
{
   background:url(bg_flower.gif);
   -moz-background-size:40% 100%; /* 老版本的 Firefox */
   background-size:40% 100%;
   background-repeat:no-repeat;
}
```



## 5.4 background-origin 属性

### background-origin 属性



background-origin 属性规定背景图片的定位区域。


背景图片可以放置于 content-box、padding-box 或 border-box 区域。



<img src="images/54d1cae088dba03f2cd1fec1/1-5-4/background-origin.gif" />



#### 实例


在 content-box 中定位背景图片：


```javascript
.wrap {
   background:url(bg_flower.gif);
   background-repeat:no-repeat;
   background-size:100% 100%;
   -webkit-background-origin:content-box; /* Safari */
   background-origin:content-box;
}
```



## 5.5 多重背景图片

### 多重背景图片



CSS3 允许您为元素使用多个背景图像。


#### 实例：


为 body 元素设置两幅背景图片：


```javascript
body
{
    background-image:url(bg_flower.gif),url(bg_flower_2.gif);
}
```



## 5.6 background-clip 属性

###  background-clip 属性



### 标签定义及使用说明


JavaScript 语法:

```javascript
background-clip: border-box|padding-box|content-box;
```

<table width="100%" class="table table-bordered" align="center" border="2" style="line-height:22.399999618530273px;">

<tbody>

<tr style="background-color: #555555;color: #ffffff;">

<th width="20%" align="left">值</th>

<th width="68%" align="left">说明</th>
</tr>
<tr>

<td>border-box</td>

<td>默认值。背景绘制在边框方框内（剪切成边框方框）。</td>
</tr>

<tr>

<td>padding-box</td>
<td>背景绘制在衬距方框内（剪切成衬距方框）。</td>
</tr>

<tr>

<td>content-box</td>

<td>背景绘制在内容方框内（剪切成内容方框）。</td>
</tr>
</tbody>
</table>

### 实例


规定背景的绘制区域：


```javascript
.wrap
{
   background-color:yellow;
   background-clip:content-box;
}
```



## 5.7 新的背景属性

###  新的背景属性



<table class="table table-bordered" align="center" border="2" style="line-height:22.399999618530273px;">
<tbody>
<tr style="background-color: #555555;color: #ffffff;">
<th style="width:25%;">属性</th>
<th style="width:70%;">描述</th>
<th>CSS</th>
</tr>

<tr>
<td>background-clip</td>
<td>规定背景的绘制区域。</td>
<td>3</td>
</tr>

<tr>
<td>background-origin</td>
<td>规定背景图片的定位区域。</td>
<td>3</td>
</tr>

<tr>
<td>background-size</td>
<td>规定背景图片的尺寸。</td>
<td>3</td>
</tr>
</tbody></table>

# 6 CSS3 文本效果

## 6.1 简介

### CSS3 文本效果



CSS3 包含多个新的文本特性。


在本章中，您将学到如下文本属性：


- 1. text-shadow
- 2. word-wrap



### 浏览器支持

<img src="images/54d1cae088dba03f2cd1fec1/1-6-1/background_2.jpg" />

Internet Explorer 10、Firefox、Chrome、Safari 以及 Opera 支持 text-shadow 属性。

所有主流浏览器都支持 word-wrap 属性。

 *注释：* Internet Explorer 9 以及更早的版本，不支持 text-shadow 属性。





## 6.2 text-shadow属性使用方法

### text-shadow属性使用方法



text-shadow属性使用方法如下所示。

`text-shadow:length  length  length  color`

其中，前面三个length分别指阴影离开文字的横方向距离、阴影离开文字的纵方向距离和阴影的模糊半径，color指阴影的颜色。


下面是一个 *text-shadow* 属性的使用示例。在该示例中给一段红色文字绘制灰色阴影。其中阴影离开文字的横方向距离和纵方向距离均为5个像素。


```javascript
.wrap
{
   text-shadow:5px 5px 5px gray;
   color:red;
   font-size:50px;
   font-weight:bold;
}
```


> 请亲自在右侧把纵方向投影距离变为10px。



## 6.3 位移距离

### 位移距离




text-shadow属性所使用的参数中，前两个参数为阴影离开文字的横方向位移距离与纵方向位移距离。



使用text-shadow属性时 *必须* 要指定这两个参数，可以对这两个参数指定 *负数值* 。


#### 示例：


```javascript
.wrap
{
   text-shadow:-15px 10px 5px gray;
   color:navy;
   font-size:50px;
   font-weight:bold;
}
```



## 6.4 阴影的模糊半径

### 阴影的模糊半径



text-shadow 属性所使用的参数中第三个参数是阴影的模糊半径，代表阴影向外模糊时的模糊范围。这个半径的值越大，则阴影向外模糊的范围也就越大。

背景图片可以放置于 content-box、padding-box 或 border-box 区域。


将阴影的模糊半径从5个像素修改为20像素，示例代码：


`.wrap {
   text-shadow:5px 5px 20px gray;
   color:navy;
   font-size:50px;
   font-weight:bold;
}`
 *注意：* 模糊半径参数为可选参数，省略这个参数时，该参数默认为0，代表阴影不向外模糊。


## 6.5 阴影的颜色

### 阴影的颜色



text-shadow属性所使用的参数中第四个参数是绘制阴影时所使用的颜色，该参数可以放在其他三个参数 *之后* ，也可放其他三个参数 *之前* ，成为第一个参数。该参数为可选参数，如果不指定，则使用浏览器指定的默认颜色。


#### 示例代码：


```javascript
.wrap {
   text-shadow:5px 5px 20px;
   color:navy;
   font-size:50px;
   font-weight:bold;
}
```



## 6.6 指定多个阴影

###  指定多个阴影



可以使用text-shadow属性来给文字指定多个阴影，并且针对每个阴影使用不同颜色。


指定多个阴影时使用 *逗号* 将多个阴影进行分隔。到目前为止，只有Firefox浏览器、Chrome浏览器及Opera浏览器对这个功能提供支持。


#### 示例代码


为文字依次指定了桔色、黄色及绿色阴影，同时也为这些阴影指定了适当的位置。


```javascript
.wrap {
   text-shadow:10px 10px #f39800,
               40px 35px #fff100,
               70px 60px #c0ff00;
   color:navy;
   font-size:50px;
   font-weight:bold;
}
```



## 6.7 自动换行

###  自动换行



单词太长的话就可能无法超出某个区域：


<p style="width: 11em;border: 1px solid #000000;word-wrap:normal; "> This paragraph contains a very long word: thisisaveryveryveryveryveryverylongword. The long word will break and wrap to the next line.


在 CSS3 中，word-wrap 属性允许您允许文本强制文本进行换行 - 即使这意味着会对单词进行拆分：


<p style="width: 11em;border: 1px solid #000000;word-wrap:break-word;">This paragraph contains a very long word : this is a very very very very very very long word. The long word will break and wrap to the next line.



#### CSS实例代码：


允许对长单词进行拆分，并换行到下一行：

`p {word-wrap:break-word;}`



# 7 CSS3 字体

## 7.1 使用您需要的字体

### 使用您需要的字体



在新的 @font-face 规则中，您必须首先定义字体的名称（比如 myFirstFont），然后指向该字体文件。


如需为 HTML 元素使用字体，请通过 font-family 属性来引用字体的名称 (myFirstFont)：


#### 实例


```javascript
<style>
@font-face
{
    font-family: myFirstFont;
    src: url('singlemalta-webfont.ttf'),
         url('singlemalta-webfont.eot'); /* IE9+ */
}

div
{
    font-family:myFirstFont;
}
</style>
```



## 7.2 使用粗体文本

### 使用粗体字体




您必须为粗体文本添加另一个包含描述符的  *@font-face：*



#### 示例：


```javascript
@font-face
{
    font-family: myFirstFont;
    src: url('singlemalta-webfont.ttf'),
         url('singlemalta-webfont.eot'); /* IE9+ */
    font-weight:bold;
}
```

文件 "singlemalta-webfont.ttf" 是另一个字体文件，它包含了 singlemalta字体的粗体字符。

只要 font-family 为 "myFirstFont" 的文本需要显示为粗体，浏览器就会使用该字体。

通过这种方式，我们可以为相同的字体设置许多 @font-face 规则。


## 7.3 CSS3 字体描述符

###  字体描述符



下面的表格列出了能够在 @font-face 规则中定义的所有字体描述符：



<table  class="table table-bordered" align="center" border="2" style="line-height:22.399999618530273px;">
<tbody>
<tr style="background-color: #555555;color: #ffffff;">
<th style="width:20%;">描述符</th>
<th style="width:25%;">值</th>
<th>描述</th>
</tr>

<tr>
<td>font-family</td>
<td><i>name</i></td>
<td>必需。规定字体的名称。</td>
</tr>

<tr>
<td>src</td>
<td><i>URL</i></td>
<td>必需。定义字体文件的 URL。</td>
</tr>

<tr>
<td>font-stretch</td>
<td>


- normal
- condensed
- ultra-condensed
- extra-condensed
- semi-condensed
- expanded
- semi-expanded
- extra-expanded
- ultra-expanded


</td>
<td>可选。定义如何拉伸字体。默认是 "normal"。</td>
</tr>

<tr>
<td>font-style</td>
<td>


- ormal
- italic
- oblique


</td>
<td>可选。定义字体的样式。默认是 "normal"。</td>
</tr>

<tr>
<td>font-weight</td>
<td>


- normal
- bold
- 100
- 200
- 300
- 400
- 500
- 600
- 700
- 800
- 900


</td>
<td>可选。定义字体的粗细。默认是 "normal"。</td>
</tr>

<tr>
<td>unicode-range</td>
<td><i>unicode-range</i></td>
<td>可选。定义字体支持的 UNICODE 字符范围。默认是 "U+0-10FFFF"。</td>
</tr>
</tbody></table>

# 8 CSS3 2D 转换

## 8.1 简介

### CSS3 转换



通过 CSS3 转换，我们能够对元素进行移动、缩放、转动、拉长或拉伸。

### 它如何工作？

转换是使元素改变形状、尺寸和位置的一种效果。

您可以使用 2D 或 3D 转换来转换您的元素。


### 浏览器支持


<img src="images/54d1cae088dba03f2cd1fec1/1-8-1/transform.png" />

Internet Explorer 10、Firefox 以及 Opera 支持 transform 属性。

Chrome 和 Safari 需要前缀 -webkit-。

 *注释：* Internet Explorer 9 需要前缀 -ms-。





## 8.2 2D 转换

### 2D 转换



在本章中，您将学到如下 2D 转换方法：




- 1. translate()

- 2. rotate()

- 3. scale()

- 4. skew()

- 5. matrix()



您将在下一章学习 3D 转换。


#### 实例


```javascript
<style>
div
{
   transform: rotate(30deg);
   -ms-transform: rotate(30deg);    /* IE 9 */
   -webkit-transform: rotate(30deg);    /* Safari and Chrome */
   -o-transform: rotate(30deg);        /* Opera */
   -moz-transform: rotate(30deg);    /* Firefox */
}
</style>
```



## 8.3 translate() 方法

### translate() 方法




通过 translate() 方法，元素从其 *当前* 位置移动，根据给定的  *left* （x 坐标） 和  *top* （y 坐标） 位置参数：



#### 示例：


```javascript
div
{
   transform: translate(50px,100px);
   -ms-transform: translate(50px,100px);    /* IE 9 */
   -webkit-transform: translate(50px,100px);    /* Safari and Chrome */
   -o-transform: translate(50px,100px);        /* Opera */
   -moz-transform: translate(50px,100px);    /* Firefox */
}
```

值 translate(50px,100px) 把元素从 *左侧* 移动 50 像素，从 *顶端* 移动 100 像素。







## 8.4 rotate() 方法

###  rotate() 方法



通过 rotate() 方法，元素 *顺时针* 旋转给定的角度。允许 *负值* ，元素将 *逆时针* 旋转。

#### 实例

`div
{
   transform: rotate(30deg);
   -ms-transform: rotate(30deg);    /* IE 9 */
   -webkit-transform: rotate(30deg);    /* Safari and Chrome */
   -o-transform: rotate(30deg);        /* Opera */
   -moz-transform: rotate(30deg);    /* Firefox */
}`
值 rotate(30deg) 把元素顺时针旋转 30 度。


## 8.5 scale() 方法

### scale() 方法



通过 scale() 方法，元素的尺寸会增加或减少，根据给定的宽度（X 轴）和高度（Y 轴）参数：

#### 示例代码：

`div
{
   transform: scale(2,4);
   -ms-transform: scale(2,4);    /* IE 9 */
   -webkit-transform: scale(2,4);    /* Safari 和 Chrome */
   -o-transform: scale(2,4);    /* Opera */
   -moz-transform: scale(2,4);    /* Firefox */
}`
值 scale(2,4) 把宽度转换为原始尺寸的  *2 倍* ，把高度转换为原始高度的 * 4 倍* 。





## 8.6 skew() 方法

###  skew() 方法



通过 skew() 方法，元素翻转给定的角度，根据给定的水平线（X 轴）和垂直线（Y 轴）参数：

#### 示例代码


`div
{
   transform: skew(30deg,20deg);
   -ms-transform: skew(30deg,20deg);    /* IE 9 */
   -webkit-transform: skew(30deg,20deg);/* Safari and Chrome */
   -o-transform: skew(30deg,20deg);    /* Opera */
   -moz-transform: skew(30deg,20deg);    /* Firefox */
}`
值 skew(30deg,20deg) 围绕 X 轴把元素翻转 30 度，围绕 Y 轴翻转 20 度。




## 8.7 matrix() 方法

###  matrix() 方法



matrix() 方法把所有 2D 转换方法组合在一起。


matrix() 方法需要六个参数，包含数学函数，允许您：旋转、缩放、移动以及倾斜元素。


#### 示例代码


如何使用 matrix 方法将 div 元素旋转 30 度：


```javascript
div
{
   transform:matrix(0.866,0.5,-0.5,0.866,0,0);
   -ms-transform:matrix(0.866,0.5,-0.5,0.866,0,0);        /* IE 9 */
   -moz-transform:matrix(0.866,0.5,-0.5,0.866,0,0);    /* Firefox */
   -webkit-transform:matrix(0.866,0.5,-0.5,0.866,0,0);    /* Safari and Chrome */
   -o-transform:matrix(0.866,0.5,-0.5,0.866,0,0);        /* Opera */
}
```



## 8.8 新的转换属性

###  新的转换属性



下面的表格列出了所有的转换属性：

<table class="table table-bordered" align="center" border="2" style="line-height:22.399999618530273px;">
<tbody>
<tr style="background-color: #555555;color: #ffffff;">
<th style="width:25%;">属性</th>
<th>描述</th>
<th style="width:5%;">CSS</th>
</tr>

<tr>
<td>transform</td>
<td>向元素应用 2D 或 3D 转换。</td>
<td>3</td>
</tr>

<tr>
<td>transform-origin</td>
<td>允许你改变被转换元素的位置。</td>
<td>3</td>
</tr>
</tbody></table>

$v.lab.setValue({
active:'css',
html:'
<!DOCTYPE HTML>\n

<html>\n

<head>\n
</head>\n

<body>\n
<div>\n
       你好。这是一个 div 元素。\n
\n

   <div id="div2">\n
       你好。这是一个 div 元素。\n
\n
</body>\n
</html>\n',
css:'
div\n
{\n
   width:100px;\n
   height:75px;\n
   background-color:yellow;\n
   border:1px solid black;\n
}\n
div#div2\n
{\n
   transform:skew(30deg,20deg);\n
   -ms-transform:skew(30deg,20deg); / * IE 9 * /\n
   -moz-transform:skew(30deg,20deg); / * Firefox * /\n
   -webkit-transform:skew(30deg,20deg); / * Safari and Chrome * /\n
   -o-transform:skew(30deg,20deg); / * Opera * /\n
}\n
'
});



## 8.9 2D Transform 方法

###  2D Transform 方法



<table class="table table-bordered" align="center" border="2" style="line-height:22.399999618530273px;">

<tbody>

<tr style="background-color: #555555;color: #ffffff;">
<th style="width:25%;">函数</th>
<th>描述</th>
</tr>

<tr>
<td>matrix(<i>n</i>,<i>n</i>,<i>n</i>,<i>n</i>,<i>n</i>,<i>n</i>)</td>
<td>定义 2D 转换，使用六个值的矩阵。</td>
</tr>

<tr>
<td>translate(<i>x</i>,<i>y</i>)</td>
<td>定义 2D 转换，沿着 X 和 Y 轴移动元素。</td>
</tr>

<tr>
<td>translateX(<i>n</i>)</td>
<td>定义 2D 转换，沿着 X 轴移动元素。</td>
</tr>

<tr>
<td>translateY(<i>n</i>)</td>
<td>定义 2D 转换，沿着 Y 轴移动元素。</td>
</tr>

<tr>
<td>scale(<i>x</i>,<i>y</i>)</td>
<td>定义 2D 缩放转换，改变元素的宽度和高度。</td>
</tr>

<tr>
<td>scaleX(<i>n</i>)</td>
<td>定义 2D 缩放转换，改变元素的宽度。</td>
</tr>

<tr>
<td>scaleY(<i>n</i>)</td>
<td>定义 2D 缩放转换，改变元素的高度。</td>
</tr>

<tr>
<td>rotate(<i>angle</i>)</td>
<td>定义 2D 旋转，在参数中规定角度。</td>
</tr>

<tr>
<td>skew(<i>x-angle</i>,<i>y-angle</i>)</td>
<td>定义 2D 倾斜转换，沿着 X 和 Y 轴。</td>
</tr>

<tr>
<td>skewX(<i>angle</i>)</td>
<td>定义 2D 倾斜转换，沿着 X 轴。</td>
</tr>

<tr>

<td>skewY(<i>angle</i>)</td>

<td>定义 2D 倾斜转换，沿着 Y 轴。</td>
</tr>
</tbody></table>
$v.lab.setValue({
active:'css',
html:'
<!DOCTYPE HTML>\n

<html>\n

<head>\n
</head>\n

<body>\n
<div>\n
       你好。这是一个 div 元素。\n
\n

   <div id="div2">\n
       你好。这是一个 div 元素。\n
\n
</body>\n
</html>\n',
css:'
div\n
{\n
   width:100px;\n
   height:75px;\n
   background-color:yellow;\n
   border:1px solid black;\n
}\n
div#div2\n
{\n
   transform:skew(30deg,20deg);\n
   -ms-transform:skew(30deg,20deg); / * IE 9 * /\n
   -moz-transform:skew(30deg,20deg); / * Firefox * /\n
   -webkit-transform:skew(30deg,20deg); / * Safari and Chrome * /\n
   -o-transform:skew(30deg,20deg); / * Opera * /\n
}\n
'
});



# 9 CSS3 3D 转换

## 9.1 简介

### 3D 转换



CSS3 允许您使用 3D 转换来对元素进行格式化。

在本章中，您将学到其中的一些 3D 转换方法：


- 1. rotateX()
- 2. rotateY()


点击右侧的元素，来查看 2D 转换与 3D 转换之间的不同之处：






## 9.2 如何工作与浏览器支持
### 它如何工作？


转换是使元素改变形状、尺寸和位置的一种效果。

您可以使用 2D 或 3D 转换来转换您的元素。


### 浏览器支持

<img src="images/54d1cae088dba03f2cd1fec1/1-9-2/roate.png" />

Internet Explorer 10 和 Firefox 支持 3D 转换。

Chrome 和 Safari 需要前缀 -webkit-。

Opera 仍然不支持 3D 转换（它只支持  *2D 转换* ）。



## 9.3 rotateX() 方法

### rotateX() 方法



通过 rotateX() 方法，元素围绕其 X 轴以给定的度数进行旋转。


#### 示例：


```javascript
div
{
   transform: rotateX(120deg);
   -webkit-transform: rotateX(120deg);    /* Safari 和 Chrome */
   -moz-transform: rotateX(120deg);    /* Firefox */
}
```



## 9.4 rotateY() 旋转

### rotateY() 旋转



通过 rotateY() 方法，元素围绕其 Y 轴以给定的度数进行旋转。


#### 实例


```javascript
div
{
  transform: rotateY(130deg);
  -webkit-transform: rotateY(130deg);    /* Safari 和 Chrome */
  -moz-transform: rotateY(130deg);    /* Firefox */
}
```



## 9.5 转换属性

### 转换属性



下面的表格列出了所有的转换属性：


<table  class="table table-bordered" align="center" border="2" style="line-height:22.399999618530273px;">
<tbody>
<tr style="background-color: #555555;color: #ffffff;">
<th style="width:25%;">属性</th>
<th>描述</th>
<th style="width:5%;">CSS</th>
</tr>

<tr>
<td>transform</td>
<td>向元素应用 2D 或 3D 转换。</td>
<td>3</td>
</tr>

<tr>
<td>transform-origin</td>
<td>允许你改变被转换元素的位置。</td>
<td>3</td>
</tr>

<tr>
<td>transform-style</td>
<td>规定被嵌套元素如何在 3D 空间中显示。</td>
<td>3</td>
</tr>

<tr>
<td>perspective</td>
<td>规定 3D 元素的透视效果。</td>
<td>3</td>
</tr>

<tr>
<td>perspective-origin</td>
<td>规定 3D 元素的底部位置。</td>
<td>3</td>
</tr>

<tr>
<td>backface-visibility</td>
<td>定义元素在不面对屏幕时是否可见。</td>
<td>3</td>
</tr>

</tbody></table>



## 9.6 2D Transform 方法

### 2D Transform 方法



<table  class="table table-bordered" align="center" border="2" style="line-height:22.399999618530273px;">
<tbody>
<tr style="background-color: #555555;color: #ffffff;">
<th style="width:25%;">函数</th>
<th>描述</th>
</tr>

<tr>
<td>matrix3d(<i>n</i>,<i>n</i>,<i>n</i>,<i>n</i>,<i>n</i>,<i>n</i>,<br><i>n</i>,<i>n</i>,<i>n</i>,<i>n</i>,<i>n</i>,<i>n</i>,<i>n</i>,<i>n</i>,<i>n</i>,<i>n</i>)</td>
<td>定义 3D 转换，使用 16 个值的 4x4 矩阵。</td>
</tr>

<tr>
<td>translate3d(<i>x</i>,<i>y</i>,<i>z</i>)</td>
<td>定义 3D 转化。</td>
</tr>

<tr>
<td>translateX(<i>x</i>)</td>
<td>定义 3D 转化，仅使用用于 X 轴的值。</td>
</tr>

<tr>
<td>translateY(<i>y</i>)</td>
<td>定义 3D 转化，仅使用用于 Y 轴的值。</td>
</tr>

<tr>
<td>translateZ(<i>z</i>)</td>
<td>定义 3D 转化，仅使用用于 Z 轴的值。</td>
</tr>

<tr>
<td>scale3d(<i>x</i>,<i>y</i>,<i>z</i>)</td>
<td>定义 3D 缩放转换。</td>
</tr>

<tr>
<td>scaleX(<i>x</i>)</td>
<td>定义 3D 缩放转换，通过给定一个 X 轴的值。</td>
</tr>

<tr>
<td>scaleY(<i>y</i>)</td>
<td>定义 3D 缩放转换，通过给定一个 Y 轴的值。</td>
</tr>

<tr>
<td>scaleZ(<i>z</i>)</td>
<td>定义 3D 缩放转换，通过给定一个 Z 轴的值。</td>
</tr>

<tr>
<td>rotate3d(<i>x</i>,<i>y</i>,<i>z</i>,<i>angle</i>)</td>
<td>定义 3D 旋转。</td>
</tr>

<tr>
<td>rotateX(<i>angle</i>)</td>
<td>定义沿 X 轴的 3D 旋转。</td>
</tr>

<tr>
<td>rotateY(<i>angle</i>)</td>
<td>定义沿 Y 轴的 3D 旋转。</td>
</tr>

<tr>
<td>rotateZ(<i>angle</i>)</td>
<td>定义沿 Z 轴的 3D 旋转。</td>
</tr>

<tr>
<td>perspective(<i>n</i>)</td>
<td>定义 3D 转换元素的透视视图。</td>
</tr>
</tbody></table>



# 10 CSS3 过渡

## 10.1 简介

### CSS3 过渡



通过 CSS3，我们可以在不使用 Flash 动画或 JavaScript 的情况下，当元素从一种样式变换为另一种样式时为元素添加效果。

请把鼠标移动到 *右侧* 的元素上：


### 浏览器支持


<img src="images/54d1cae088dba03f2cd1fec1/1-10-1/transition.png" />

Internet Explorer 10、Firefox、Chrome 以及 Opera 支持 transition 属性。

Safari 需要前缀  *-webkit-* 。

 *注释：* Internet Explorer 9 以及更早的版本，不支持 transition 属性。

 *注释：* Chrome 25 以及更早的版本，需要前缀 -webkit-。







## 10.2 如何工作


### 它如何工作？



CSS3 过渡是元素从一种样式逐渐改变为另一种的效果。

要实现这一点，必须规定两项内容：


- 1. 规定您希望把效果添加到哪个 CSS 属性上

- 2. 规定效果的时长



实例


应用于宽度属性的过渡效果，时长为 2 秒：

`div
{
   transition: width 2s;
   -moz-transition: width 2s;    /* Firefox 4 */
   -webkit-transition: width 2s;    /* Safari 和 Chrome */
   -o-transition: width 2s;    /* Opera */
}`
 *注释：* 如果时长未规定，则不会有过渡效果，因为默认值是 0。

效果开始于指定的 CSS 属性改变值时。CSS 属性改变的典型时间是鼠标指针位于元素上时：

#### 实例

规定当鼠标指针悬浮于 <div> 元素上时：

`div:hover
{
   width:300px;
}`
 *注释：* 当指针移出元素时，它会逐渐变回原来的样式。





## 10.3 多项改变

### 多项改变



如需向多个样式添加过渡效果，请添加多个属性，由逗号隔开：


#### 示例：


向宽度、高度和转换添加过渡效果：


```javascript
div
{
   transition: width 2s, height 2s, transform 2s;
   -moz-transition: width 2s, height 2s, -moz-transform 2s;
   -webkit-transition: width 2s, height 2s, -webkit-transform 2s;
   -o-transition: width 2s, height 2s,-o-transform 2s;
}
```



## 10.4 过渡属性

### 过渡属性



<table class="table table-bordered" align="center" border="2" style="line-height:22.399999618530273px;">

<tbody><tr style="background-color: #555555;color: #ffffff;">

<th style="width:30%;">属性</th>

<th>描述</th>

<th style="width:5%;">CSS</th>
</tr>

<tr>
<td>transition</td>
<td>简写属性，用于在一个属性中设置四个过渡属性。</td>
<td>3</td>
</tr>

<tr>
<td>transition-property</td>
<td>规定应用过渡的 CSS 属性的名称。</td>
<td>3</td>
</tr>

<tr>
<td>transition-duration</td>
<td>定义过渡效果花费的时间。默认是 0。</td>
<td>3</td>
</tr>

<tr>
<td>transition-timing-function</td>
<td>规定过渡效果的时间曲线。默认是 "ease"。</td>
<td>3</td>
</tr>

<tr>

<td>transition-delay</td>

<td>规定过渡效果何时开始。默认是 0。</td>

<td>3</td>
</tr>
</tbody></table>

下面的两个例子设置所有过渡属性：


#### 实例


在一个例子中使用所有过渡属性：


```javascript
div
{
   transition-property: width;
   transition-duration: 1s;
   transition-timing-function: linear;
   transition-delay: 2s;
   /* Firefox 4 */
   -moz-transition-property:width;
   -moz-transition-duration:1s;
   -moz-transition-timing-function:linear;
   -moz-transition-delay:2s;
   /* Safari 和 Chrome */
   -webkit-transition-property:width;
   -webkit-transition-duration:1s;
   -webkit-transition-timing-function:linear;
   -webkit-transition-delay:2s;
   /* Opera */
   -o-transition-property:width;
   -o-transition-duration:1s;
   -o-transition-timing-function:linear;
   -o-transition-delay:2s;
}
```



## 10.5 使用了简写的 transition 属性

### 简写的 transition 实例



#### 实例


与上面的例子相同的过渡效果，但是使用了简写的 transition 属性：


```javascript
div
{
   transition: width 1s linear 2s;
   /* Firefox 4 */
   -moz-transition:width 1s linear 2s;
   /* Safari and Chrome */
   -webkit-transition:width 1s linear 2s;
   /* Opera */
   -o-transition:width 1s linear 2s;
}
```



# 11 CSS3 动画

## 11.1 简介

### CSS3 动画



通过 CSS3，我们能够创建动画，这可以在许多网页中 *取代* 动画图片、Flash 动画以及 JavaScript。


### CSS3 @keyframes 规则


如需在 CSS3 中创建动画，您需要学习  *@keyframes*  规则。

@keyframes 规则用于创建动画。在 @keyframes 中规定某项 CSS 样式，就能创建由 *当前样式* 逐渐改为新样式的动画效果。


### 浏览器支持


<img src="images/54d1cae088dba03f2cd1fec1/1-11-1/animation.png" />

Internet Explorer 10、Firefox 以及 Opera 支持 @keyframes 规则和 animation 属性。

Chrome 和 Safari 需要前缀 -webkit-。

 *注释：* Internet Explorer 9，以及更早的版本，不支持 @keyframe 规则或 animation 属性。








## 11.2 实例


### 实例



```javascript
@keyframes myfirst
{
from {background: red;}
to {background: yellow;}
}

@-moz-keyframes myfirst /* Firefox */
{
from {background: red;}
to {background: yellow;}
}

@-webkit-keyframes myfirst /* Safari 和 Chrome */
{
from {background: red;}
to {background: yellow;}
}

@-o-keyframes myfirst /* Opera */
{
from {background: red;}
to {background: yellow;}
}
```



## 11.3 CSS3 动画

### CSS3 动画



当您在 @keyframes 中创建动画时，请把它捆绑到某个选择器，否则不会产生动画效果。

通过规定至少以下两项 CSS3 动画属性，即可将动画绑定到选择器：


- 1. 规定动画的名称
- 2. 规定动画的时长



#### 示例：

把 "myfirst" 动画捆绑到 div 元素，时长：5 秒：

`div
{
   animation: myfirst 5s;
   -moz-animation: myfirst 5s;    /* Firefox */
   -webkit-animation: myfirst 5s;    /* Safari 和 Chrome */
   -o-animation: myfirst 5s;    /* Opera */
}`
 *注释：* 您必须定义动画的名称和时长。如果忽略时长，则动画不会允许，因为默认值是 0。






## 11.4 什么是 CSS3 中的动画？

### 什么是 CSS3 中的动画？



动画是使元素从一种样式 *逐渐变化* 为另一种样式的效果。


您可以改变任意多的样式任意多的次数。


请用 *百分比* 来规定变化发生的时间，或用关键词  *"from"*  和  *"to"* ，等同于 0% 和 100%。


0% 是动画的开始，100% 是动画的完成。


为了得到最佳的浏览器支持，您应该 *始终定义*  0% 和 100% 选择器。


#### 实例


当动画为 25% 及 50% 时改变背景色，然后当动画 100% 完成时再次改变：

```javascript
@keyframes myfirst
{
0%   {background: red;}
25%  {background: yellow;}
50%  {background: blue;}
100% {background: green;}
}

@-moz-keyframes myfirst /* Firefox */
{
0%   {background: red;}
25%  {background: yellow;}
50%  {background: blue;}
100% {background: green;}
}

@-webkit-keyframes myfirst /* Safari 和 Chrome */
{
0%   {background: red;}
25%  {background: yellow;}
50%  {background: blue;}
100% {background: green;}
}

@-o-keyframes myfirst /* Opera */
{
0%   {background: red;}
25%  {background: yellow;}
50%  {background: blue;}
100% {background: green;}
}
```



## 11.5 实例改变背景色和位置

### 实例



实例改变背景色和位置


```javascript
@keyframes myfirst
{
0%   {background: red; left:0px; top:0px;}
25%  {background: yellow; left:200px; top:0px;}
50%  {background: blue; left:200px; top:200px;}
75%  {background: green; left:0px; top:200px;}
100% {background: red; left:0px; top:0px;}
}

@-moz-keyframes myfirst /* Firefox */
{
0%   {background: red; left:0px; top:0px;}
25%  {background: yellow; left:200px; top:0px;}
50%  {background: blue; left:200px; top:200px;}
75%  {background: green; left:0px; top:200px;}
100% {background: red; left:0px; top:0px;}
}

@-webkit-keyframes myfirst /* Safari 和 Chrome */
{
0%   {background: red; left:0px; top:0px;}
25%  {background: yellow; left:200px; top:0px;}
50%  {background: blue; left:200px; top:200px;}
75%  {background: green; left:0px; top:200px;}
100% {background: red; left:0px; top:0px;}
}

@-o-keyframes myfirst /* Opera */
{
0%   {background: red; left:0px; top:0px;}
25%  {background: yellow; left:200px; top:0px;}
50%  {background: blue; left:200px; top:200px;}
75%  {background: green; left:0px; top:200px;}
100% {background: red; left:0px; top:0px;}
}
```



## 11.6 CSS3 动画属性

### CSS3 动画属性



下面的表格列出了 @keyframes 规则和所有动画属性：


<table class="table table-bordered" align="center" border="2" style="line-height:22.399999618530273px;">
<tbody><tr style="background-color: #555555;color: #ffffff;">
<th style="width:30%;">属性</th>
<th>描述</th>
<th style="width:5%;">CSS</th>
</tr>

<tr>
<td>@keyframes</td>
<td>规定动画。</td>
<td>3</td>
</tr>

<tr>
<td>animation</td>
<td>所有动画属性的简写属性，除了 animation-play-state 属性。</td>
<td>3</td>
</tr>

<tr>
<td>animation-name</td>
<td>规定 @keyframes 动画的名称。</td>
<td>3</td>
</tr>

<tr>
<td>animation-duration</td>
<td>规定动画完成一个周期所花费的秒或毫秒。默认是 0。</td>
<td>3</td>
</tr>

<tr>
<td>animation-timing-function</td>
<td>规定动画的速度曲线。默认是 "ease"。</td>
<td>3</td>
</tr>

<tr>
<td>animation-delay</td>
<td>规定动画何时开始。默认是 0。</td>
<td>3</td>
</tr>

<tr>
<td>animation-iteration-count</td>
<td>规定动画被播放的次数。默认是 1。</td>
<td>3</td>
</tr>

<tr>
<td>animation-direction</td>
<td>规定动画是否在下一周期逆向地播放。默认是 "normal"。</td>
<td>3</td>
</tr>

<tr>
<td>animation-play-state</td>
<td>规定动画是否正在运行或暂停。默认是 "running"。</td>
<td>3</td>
</tr>

<tr>
<td>animation-fill-mode</td>
<td>规定对象动画时间之外的状态。</td>
<td>3</td>
</tr>
</tbody></table>

## 11.7 包含所有动画属性实例

### 实例



运行名为 myfirst 的动画，其中设置了所有动画属性：


```javascript
div
{
animation-name: myfirst;
animation-duration: 5s;
animation-timing-function: linear;
animation-delay: 2s;
animation-iteration-count: infinite;
animation-direction: alternate;
animation-play-state: running;
/* Firefox: */
-moz-animation-name: myfirst;
-moz-animation-duration: 5s;
-moz-animation-timing-function: linear;
-moz-animation-delay: 2s;
-moz-animation-iteration-count: infinite;
-moz-animation-direction: alternate;
-moz-animation-play-state: running;
/* Safari 和 Chrome: */
-webkit-animation-name: myfirst;
-webkit-animation-duration: 5s;
-webkit-animation-timing-function: linear;
-webkit-animation-delay: 2s;
-webkit-animation-iteration-count: infinite;
-webkit-animation-direction: alternate;
-webkit-animation-play-state: running;
/* Opera: */
-o-animation-name: myfirst;
-o-animation-duration: 5s;
-o-animation-timing-function: linear;
-o-animation-delay: 2s;
-o-animation-iteration-count: infinite;
-o-animation-direction: alternate;
-o-animation-play-state: running;
}
```



## 11.8 使用了简写的动画 animation 属性

### 实例 使用了简写的动画 animation 属性



与前面的动画相同，但是使用了简写的动画 animation 属性：


```javascript
div
{
animation: myfirst 5s linear 2s infinite alternate;
/* Firefox: */
-moz-animation: myfirst 5s linear 2s infinite alternate;
/* Safari 和 Chrome: */
-webkit-animation: myfirst 5s linear 2s infinite alternate;
/* Opera: */
-o-animation: myfirst 5s linear 2s infinite alternate;
}
```

# 12 CSS3 多列

## 12.1 简介

### CSS3 多列



通过 CSS3，您能够创建多个列来对文本进行布局 - 就像报纸那样！

在本章中，您将学习如下多列属性：


- 1. column-count
- 2. column-gap
- 3. column-rule



### 浏览器支持

<img src="images/54d1cae088dba03f2cd1fec1/1-12-1/css3_multiple_columns.png" />

Internet Explorer 10 和 Opera 支持多列属性。

Firefox 需要前缀  *-moz-* 。

Chrome 和 Safari 需要前缀  *-webkit-* 。

 *注释：* Internet Explorer 9 以及更早的版本不支持多列属性。








## 12.2 CSS3 创建多列


### CSS3 创建多列



column-count 属性规定元素应该被分隔的列数：


#### 实例


把 div 元素中的文本分隔为三列：


```javascript
div
{
-moz-column-count:3;     /* Firefox */
-webkit-column-count:3; /* Safari 和 Chrome */
column-count:3;
}
```



## 12.3 CSS3 规定列之间的间隔

### CSS3 规定列之间的间隔



column-gap 属性规定列之间的间隔：

通过规定至少以下两项 CSS3 动画属性，即可将动画绑定到选择器：


#### 实例


规定列之间 40 像素的间隔：


```javascript
div
{
   -moz-column-gap:40px;        /* Firefox */
   -webkit-column-gap:40px;    /* Safari 和 Chrome */
   column-gap:40px;
}
```



## 12.4 CSS3 列规则

### CSS3 列规则



column-rule 属性设置列之间的宽度、样式和颜色规则。


#### 实例


规定列之间的宽度、样式和颜色规则：

```javascript
div
{
   -moz-column-rule:3px outset #ff0000;    /* Firefox */
   -webkit-column-rule:3px outset #ff0000;    /* Safari and Chrome */
   column-rule:3px outset #ff0000;
}
```



## 12.5 新的多列属性

### 新的多列属性



下面的表格列出了所有的转换属性：


<table class="table table-bordered" align="center" border="2" style="line-height:22.399999618530273px;">
<tbody><tr style="background-color: #555555;color: #ffffff;">
<th style="width:25%;">属性</th>
<th>描述</th>
<th style="width:5%;">CSS</th>
</tr>

<tr>
<td>column-count</td>
<td>规定元素应该被分隔的列数。</td>
<td>3</td>
</tr>

<tr>
<td>column-fill</td>
<td>规定如何填充列。</td>
<td>3</td>
</tr>

<tr>
<td>column-gap</td>
<td>规定列之间的间隔。</td>
<td>3</td>
</tr>

<tr>
<td>column-rule</td>
<td>设置所有 column-rule-* 属性的简写属性。</td>
<td>3</td>
</tr>

<tr>
<td>column-rule-color</td>
<td>规定列之间规则的颜色。</td>
<td>3</td>
</tr>

<tr>
<td>column-rule-style</td>
<td>规定列之间规则的样式。</td>
<td>3</td>
</tr>

<tr>
<td>column-rule-width</td>
<td>规定列之间规则的宽度。</td>
<td>3</td>
</tr>

<tr>
<td>column-span</td>
<td>规定元素应该横跨的列数。</td>
<td>3</td>
</tr>

<tr>
<td>column-width</td>
<td>规定列的宽度。</td>
<td>3</td>
</tr>

<tr>
<td>columns</td>
<td>规定设置 column-width 和 column-count 的简写属性。</td>
<td>3</td>
</tr>
</tbody></table>

# 13 CSS3 用户界面

## 13.1 简介

### CSS3 用户界面



在 CSS3 中，新的用户界面特性包括重设元素尺寸、盒尺寸以及轮廓等。

在本章中，您将学到以下用户界面属性：


- 1. resize
- 2. box-sizing
- 3. outline-offset



### 浏览器支持

<img src="images/54d1cae088dba03f2cd1fec1/1-13-1/css3_user_interface.png" />

Firefox、Chrome 以及 Safari 支持  *resize*  属性。

Internet Explorer、Chrome、Safari 以及 Opera 支持 box-sizing 属性。Firefox 需要前缀  *-moz-* 。

所有主流浏览器都支持 outline-offset 属性，除了 Internet Explorer。









## 13.2 CSS3 Resizing


### CSS3 Resizing



在 CSS3，resize 属性规定是否可由用户调整元素尺寸。


<p id="resize" style="border: 2px solid;padding: 10px 40px;width: 400px;resize: both;overflow: auto;">
这个 div 元素可由用户调整尺寸（在 Firefox 4+、Chrome 以及 Safari 中）。



#### CSS 代码如下：


#### 实例


规定 div 元素可由用户调整大小：


```javascript
div
{
   resize:both;
   overflow:auto;
}
```



## 13.3 CSS3 Box Sizing

### CSS3 Box Sizing



box-sizing 属性允许您以确切的方式定义适应某个区域的具体内容。


#### 实例


规定两个并排的带边框方框：


```javascript
div
{
   box-sizing:border-box;
   -moz-box-sizing:border-box;    /* Firefox */
   -webkit-box-sizing:border-box;    /* Safari */
   width:50%;
   float:left;
}
```



## 13.4 CSS3 Outline Offset

### CSS3 Outline Offset



outline-offset 属性对轮廓进行偏移，并在超出边框边缘的位置绘制轮廓。

轮廓与边框有两点不同：


- 1. 轮廓不占用空间
-  2. 轮廓可能是非矩形


<p id="outlineoffset" style="margin: 40px 0 40px 20px;width: 150px;
padding: 10px;height: 70px;border: 2px solid black;outline: 2px solid red;outline-offset: 15px;">
这个 div 在边框之外 15 像素处有一个轮廓。


CSS 代码如下：


#### 实例


规定边框边缘之外 15 像素处的轮廓：

```javascript
div
{
   border:2px solid black;
   outline:2px solid red;
   outline-offset:15px;
}
```



## 13.5 新的用户界面属性

### 新的用户界面属性



下面的表格列出了所有的转换属性：


<table class="table table-bordered" align="center" border="2" style="line-height:22.399999618530273px;">
<tbody><tr style="background-color: #555555;color: #ffffff;">
<th style="width:25%;">属性</th>
<th>描述</th>
<th style="width:5%;">CSS</th>
</tr>

<tr>
<td>appearance</td>
<td>允许您将元素设置为标准用户界面元素的外观</td>
<td>3</td>
</tr>

<tr>
<td>box-sizing</td>
<td>允许您以确切的方式定义适应某个区域的具体内容。</td>
<td>3</td>
</tr>

<tr>
<td>icon</td>
<td>为创作者提供使用图标化等价物来设置元素样式的能力。</td>
<td>3</td>
</tr>

<tr>
<td>nav-down</td>
<td>规定在使用 arrow-down 导航键时向何处导航。</td>
<td>3</td>
</tr>

<tr>
<td>nav-index</td>
<td>设置元素的 tab 键控制次序。</td>
<td>3</td>
</tr>

<tr>
<td>nav-left</td>
<td>规定在使用 arrow-left 导航键时向何处导航。</td>
<td>3</td>
</tr>

<tr>
<td>nav-right</td>
<td>规定在使用 arrow-right 导航键时向何处导航。</td>
<td>3</td>
</tr>

<tr>
<td>nav-up</td>
<td>规定在使用 arrow-up 导航键时向何处导航。</td>
<td>3</td>
</tr>

<tr>
<td>outline-offset</td>
<td>对轮廓进行偏移，并在超出边框边缘的位置绘制轮廓。</td>
<td>3</td>
</tr>

<tr>
<td>resize</td>
<td>规定是否可由用户对元素的尺寸进行调整。</td>
<td>3</td>
</tr>
</tbody></table>
