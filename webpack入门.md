# webpack入门

<!-- TOC -->

- [webpack入门](#webpack入门)
- [1 简介](#1-简介)
    - [1.1 什么是 Webpack](#11-什么是-webpack)
    - [1.2 为什么重复造轮子](#12-为什么重复造轮子)
    - [1.3 为什么使用Webpack](#13-为什么使用webpack)
    - [1.4 环境了解](#14-环境了解)
- [2 安装使用和Loader](#2-安装使用和loader)
    - [2.1 安装](#21-安装)
    - [2.2 使用](#22-使用)
    - [2.3 两个文件](#23-两个文件)
    - [2.4 Loader介绍](#24-loader介绍)
    - [2.5 加载 CSS 文件](#25-加载-css-文件)
    - [2.6 扩展名自动绑定loader](#26-扩展名自动绑定loader)
- [3 配置文件及其他](#3-配置文件及其他)
    - [3.1 配置文件](#31-配置文件)
    - [3.2 插件](#32-插件)
    - [3.3 加载图片](#33-加载图片)
    - [3.4 使用别名](#34-使用别名)
    - [3.5 expose](#35-expose)

<!-- /TOC -->

# 1 简介

## 1.1 什么是 Webpack
### 什么是 Webpack

 **Webpack**  是一个模块打包器。它将根据模块的依赖关系进行静态分析，然后将这些模块按照指定的规则生成对应的静态资源。

<img src="images/5670d0a77e7d40946afc5e65/1-1-1/what-is-webpack0.png" alt="webpack">



## 1.2 为什么重复造轮子
### 为什么重复造轮子

　　市面上已经存在的模块管理和打包工具并不适合大型的项目，尤其单页面  *Web*  应用程序。最紧迫的原因是如何在一个大规模的代码库中，维护各种模块资源的分割和存放，维护它们之间的依赖关系，并且无缝的将它们整合到一起生成适合浏览器端请求加载的 *静态资源* 。

这些已有的模块化工具并不能很好的完成如下的目标：



- 将依赖树拆分成按需加载的块
- 初始化加载的耗时尽量少
- 各种静态资源都可以视作模块
- 将第三方库整合成模块的能力
- 可以自定义打包逻辑的能力
- 适合大项目，无论是单页还是多页的 Web 应用




## 1.3 为什么使用Webpack
### Webpack的特点和优势

 *Webapck*  和其他模块化工具有什么区别呢？

### 代码拆分

 *Webpack*  有两种组织模块依赖的方式，同步和异步。异步依赖作为分割点，形成一个新的快。在优化了依赖树后，每一个异步区块都作为一个文件被打包。

### Loader

 *Webpack*  本身只能处理原生的  *JavaScript*  模块，但是  *loader*  转换器可以将各种类型的资源转换成 JavaScript 模块。这样，任何资源都可以成为 Webpack 可以处理的模块。

### 智能解析

 *Webpack*  有一个智能解析器，几乎可以处理任何第三方库，无论它们的模块形式是  *CommonJS* 、  *AMD*  还是普通的  *JS*  文件。甚至在加载依赖的时候，允许使用动态表达式  *require("./templates/" + name + ".jade")* 。

### 插件系统

 *Webpack*  还有一个功能丰富的插件系统。大多数内容功能都是基于这个插件系统运行的，还可以开发和使用开源的 Webpack 插件，来满足各式各样的需求。

### 快速运行

 *Webpack*  使用异步  *I/O*  和多级缓存提高运行效率，这使得 Webpack 能够以令人难以置信的速度快速增量编译。



## 1.4 环境了解
### 环境了解

我们在当前的环境中指定的目录是在  */home/hubwiz/web* 下，才可以进行访问测试。

可以使用命令 *pwd* 查看我们当前指定的目录。

```javascript
$ pwd
/home/hubwiz/web
```

 *pwd* 命令用于显示当前目录。在环境中这个仓库位于 */home/hubwiz/web* 。

我们在指定的目录下，预置一个静态页面（index.html）和一张logo图片，以及style.css文件，在后面的课程知识点中编译之后，访问测试，将会看到你编译的效果。

```javascript
$ ls
index.html logo.png node_modules style.css scripts
```

 *node_modules* 中是我们预置好的几个模块,可以查看。

index.html页面中预置

```javascript
<h1>欢迎学习Webpack课程！</h1>
```



# 2 安装使用和Loader

## 2.1 安装
### 安装

首先要安装  *Node.js* ，  *Node.js*  自带了软件包管理器  *npm* ， *Webpack*  需要  *Node.js v0.6*  以上支持，建议使用最新版  *Node.js* 。

用 npm 安装 Webpack：

```javascript
$ npm install webpack -g
```

此时  *Webpack*  已经安装到了全局环境下，本课程中我们已装好 *webpack* ，可以通过命令行  *webpack -h*  试试。

通常我们会将 Webpack 安装到项目的依赖中，这样就可以使用项目本地版本的 Webpack。

```javascript
# 进入项目目录
# 确定已经有 package.json，没有就通过 npm init 创建
# 安装 webpack 依赖
$ npm install webpack --save-dev
```

Webpack 目前有两个主版本，一个是在 master 主干的稳定版，一个是在 webpack-2 分支的测试版，测试版拥有一些实验性功能并且和稳定版不兼容，在正式项目中应该使用稳定版。

```javascript
# 查看 webpack 版本信息
$ npm info webpack

# 安装指定版本的 webpack
$ npm install webpack@1.12.x --save-dev
```



## 2.2 使用
### 使用

首先有一个静态页面 index.html，已经预置好了。

```javascript
<!-- index.html -->
<html>
<head>
  <meta charset="utf-8">
</head>
<body>
  <script src="bundle.js"></script>
</body>
</html>
```

现在创建一个 JS 入口文件 entry.js：

```javascript
// entry.js
pico entry.js
// 进入编辑器输入
document.write('It works.');
// 保存并退出
```

然后编译  *entry.js*  并打包到  *bundle.js* ，运行命令：

```javascript
$ webpack ./entry.js bundle.js
```

如果成功，打包过程会显示日志：

```javascript
Hash: aeec068c58e1e78f0fb6
Version: webpack 1.12.9
Time: 70ms
    Asset     Size  Chunks             Chunk Names
bundle.js  1.48 kB       0  [emitted]  main
   [0] ./entry.js 87 bytes {0} [built]
```

在点击 *访问测试* 将会打开一个新的窗口。它应该会显示 *It works.* 。

 *注意* ：下面的课程中创建编辑文件都是用 *pico 文件名* 。



## 2.3 两个文件
### 两个文件

下一步，我们将把一些代码移到一个额外的文件中 *content.js*  并修改入口  *entry.js* ：

```javascript
// content.js
pico content.js
// 编辑内容
module.exports = "It works from content.js.";
```

```javascript
// 修改entry.js
//document.write('It works.');
document.write(require("./content.js")); // 添加content.js
```

编译文件

```javascript
$ webpack ./entry.js bundle.js
```

更新您的浏览器窗口，您应该看到文本 *It works from content.js.*

执行成功，会显示

```javascript
Hash: ef96fed65f6d3ebc0dd7
Version: webpack 1.12.9
Time: 91ms
    Asset    Size  Chunks             Chunk Names
bundle.js  1.7 kB       0  [emitted]  main
   [0] ./entry.js 133 bytes {0} [built]
   [1] ./content.js 97 bytes {0} [built]
```

 *Webpack*  会分析入口文件，解析包含依赖关系的各个文件。这些文件（模块）都打包到  *bundle.js*  。 *Webpack*  会给每个模块分配一个唯一的  *id*  并通过这个  *id*  索引和访问模块。在页面启动时，会先执行  *entry.js*  中的代码，其它模块会在运行  *require*  的时候再执行。



## 2.4 Loader介绍
### Loader介绍

 *Webpack*  本身只能处理  *JavaScript*  模块，如果要处理其他类型的文件，就需要使用  *loader*  进行转换。

 *Loader*  可以理解为是模块和资源的转换器，它本身是一个函数，接受源文件作为参数，返回转换的结果。这样，我们就可以通过  *require*  来加载任何类型的模块或文件，比如  *CoffeeScript* 、  *JSX* 、  *LESS*  或 *图片* 。

先来看看  *loader*  有哪些特性？



- Loader 可以通过管道方式链式调用，每个 loader 可以把资源转换成任意格式并传递给下一个 loader ，但是最后一个 loader 必须返回 JavaScript。
- Loader 可以同步或异步执行。
- Loader 运行在 node.js 环境中，所以可以做任何可能的事情。
- Loader 可以接受参数，以此来传递配置项给 loader。
- Loader 可以通过文件扩展名（或正则表达式）绑定给不同类型的文件。
- Loader 可以通过 npm 发布和安装。
- 除了通过 package.json 的 main 指定，通常的模块也可以导出一个 loader 来使用。
- Loader 可以访问配置。
- 插件可以让 loader 拥有更多特性。
- Loader 可以分发出附加的任意文件。




## 2.5 加载 CSS 文件
### 加载 CSS 文件

我们想要在应用中添加一个css文件。

WebPACK只能处理JavaScript本身，所以我们需要 *css-loader* 去处理 CSS。我们还需要 *style-loader* 去应用这个样式在CSS文件。

安装 loader：

```javascript
npm install css-loader style-loader
```

注意：安装  *loaders* （只需要在本地安装，不需  *-g* ）将会创建一个  *node_modules*  文件夹，在哪里  *loaders*  将会激活。

我们要在页面中引入一个 CSS 文件  *style.css* ，首页将  *style.css*  也看成是一个模块，然后用  *css-loader*  来读取它，再用  *style-loader*  把它插入到页面中。

添加一个style.css文件

```javascript
body {
    background: red;
}
```

修改 entry.js：

```javascript
+ require("!style!css!./style.css");   // 载入 style.css
  document.write(require("./content.js"));
```

重新 *编译* 并更新您的浏览器看到红色背景。



## 2.6 扩展名自动绑定loader
### 扩展名自动绑定loader

如果每次  *require*  CSS 文件的时候都要写  *loader*  前缀，是一件很繁琐的事情。

我们可以根据模块类型（扩展名）来自动绑定需要的 loader这样写 *require("./style.css")* 。

修改entry.js

```javascript
- require("!style!css!./style.css");
+ require("./style.css");
  document.write(require("./content.js"));
```

注意： *-* 表示这行删掉或者注释掉， *+* 表示新增的内容。

编译:

```javascript
webpack ./entry.js bundle.js --module-bind "css=style!css"
```

注意：！在shell中有特殊意义，需要转义,这样写才会成功的

```javascript
 webpack ./entry.js bundle.js --module-bind "css=style\!css"
```

显然，这两种使用 loader 的方式，效果是一样的。



# 3 配置文件及其他

## 3.1 配置文件
### 配置文件

Webpack 在执行的时候，除了在命令行传入参数，还可以通过指定的配置文件来执行。默认情况下，会搜索当前目录的 webpack.config.js 文件，这个文件是一个 node.js 模块，返回一个 json 格式的配置信息对象，或者通过 --config 选项来指定配置文件。

我们想将配置选项移动到配置文件中，创建一个配置文件  *webpack.config.js* ：

```javascript
module.exports = {
    entry: "./entry.js",
    output: {
        path: __dirname,
        filename: "bundle.js"
    },
    module: {
        loaders: [
            { test: /\.css$/, loader: "style!css" }
        ]
    }
};
```

现在我们仅仅运行:

```javascript
webpack
```

如果完成成功，将会返回运行结果，该命令将尝试 *WebPACK* 当前目录中加载文件 *webpack.config.js* 。

这里对Webpack的打包行为做了配置，主要分为几个部分：



- entry：指定打包的入口文件，每有一个键值对，就是一个入口文件
- output：配置打包结果，path定义了输出的文件夹，filename则定义了打包结果文件的名称
- module：定义了对模块的处理逻辑，这里可以用loaders定义了一系列的加载器，以及一些正则。当需要加载的文件匹配test的正则时，就会调用后面的loader对文件进行处理，这正是webpack强大的原因。


### 漂亮的输出

如果该项目的增长，编译可能需要更长的时间。所以我们要展示一些进度条。我们想要的颜色…

我们可以这样

```javascript
webpack --progress --colors
```



## 3.2 插件
### 插件

插件可以完成更多  *loader*  不能完成的功能。

插件的使用一般是在  *webpack*  的配置信息  *plugins*  选项中指定。

 *Webpack*  本身内置了一些常用的插件，还可以通过  *npm*  安装第三方插件。

接下来，我们利用一个最简单的  *BannerPlugin*  内置插件来实践插件的配置和运行，这个插件的作用是给输出的文件头部添加注释信息。

修改  *webpack.config.js* ，添加  *plugins* ：

```javascript
var webpack = require('webpack');
module.exports = {
  entry: './entry.js',
  output: {
    path: __dirname,
    filename: 'bundle.js'
  },
  module: {
    loaders: [
      {test: /\.css$/, loader: 'style!css'}
    ]
  },
  plugins: [
    new webpack.BannerPlugin('This file is created by mutouren')
  ]
}
```

然后运行 webpack，打开 bundle.js，可以看到文件头部出现了我们指定的注释信息：

```javascript
/*! This file is created by mutouren */
/******/ (function(modules) { // webpackBootstrap
/******/     // The module cache
/******/     var installedModules = {};
// 后面代码省略......
```



## 3.3 加载图片
### 加载图片

一个 url-loader 来说，它会将样式中引用到的图片转为模块来处理，使用该加载器需要先进行安装：

```javascript
npm install url-loader
```

修改style.css文件

```javascript
body {
    color:#fff;
    background: url('./logo.png');
}
```

配置 *webpack.config.js* 文件

```javascript
module.exports = {
    entry: "./entry.js",
    output: {
        path: __dirname,
        filename: "bundle.js"
    },
    module: {
        loaders: [
            { test: /\.css$/, loader: "style!css" },
            { test: /\.(png|jpg)$/, loader: "url?limit=40000" }   // 添加到这
        ]
    }
};
```

注意后面那个limit的参数，当你图片大小小于这个限制的时候，会自动启用base64编码图片。

我们还是运行

```javascript
webpack
```

将会看到背景图片已设置成功。



## 3.4 使用别名
### 在 Webpack 中使用别名

模块别名定义，方便后续直接引用别名，无须多写长长的地址，比如我们现在想要把 *scripts/jquery.min.js* jquery压缩文件打包.

别名（ *resolve.alias* ） 是 Webpack 的一个配置项，它的作用是把用户的一个请求重定向到另一个路径，例如通过修改  *webpack.config.js*  配置文件， *jquery* 为别名加入：

```javascript
resolve: {
  alias: {
      jquery: "./scripts/jquery.min.js"
  }
}
```

例如我们之前不用别名，在entry.js中，想要把jquery打包

```javascript
require('./scripts/jquery.min.js');
```

设置别名，就可以修改为

```javascript
require('jquery');
```

这样待打包的脚本中的 require('jquery'); 其实就等价于 require('./scripts/jquery.min.js'); 。通过别名的使用在本例中可以减少几乎一半的时间。



## 3.5 expose
### expose暴露

在上节中，我们把需要的jquery打包了，但是现在前台页面想要直接用还是不可以的，需要我们把jquery暴露出来。

你可能在全局中使用了一个压缩版本的 jquery，为了修复你可以安装这个暴露全局加载器

```javascript
npm install expose-loader --save-dev
```

然后像下面这样修改 *entry.js* ：

```javascript
require('expose?$!jquery');
```

把 *$* 作为别名为jquery的变量暴露到全局上下文中。

现在我们在页面就可以使用 *$* ，例如：

```javascript
$('h1').text();
```


