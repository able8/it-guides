# Mongoose
<!-- TOC -->

- [Mongoose](#mongoose)
- [1 Mongoose 基础介绍](#1-mongoose-基础介绍)
    - [1.1 认识对象模型库Mongoose](#11-认识对象模型库mongoose)
    - [1.2 如何安装引用连接对象模型库Mongoose](#12-如何安装引用连接对象模型库mongoose)
    - [1.3 了解MongoDB中的集合Collection](#13-了解mongodb中的集合collection)
    - [1.4 Schema文件形式存储的数据库模型骨架](#14-schema文件形式存储的数据库模型骨架)
    - [1.5 用Model进行数据库管理操作](#15-用model进行数据库管理操作)
    - [1.6 通过Entity进行数据库管理操作](#16-通过entity进行数据库管理操作)
    - [1.7 创建MongoDB集合](#17-创建mongodb集合)
    - [1.8 课程小结](#18-课程小结)
- [2 Mongoose 增删改查](#2-mongoose-增删改查)
    - [2.1  查询MongoDB数据文档](#21--查询mongodb数据文档)
    - [2.2 Model的create方法保存MongoDB数据](#22-model的create方法保存mongodb数据)
    - [2.3 Entity的save方法保存MongoDB数据](#23-entity的save方法保存mongodb数据)
    - [2.4 update更新MongoDB数据](#24-update更新mongodb数据)
    - [2.5 remove删除MongoDB数据](#25-remove删除mongodb数据)
    - [2.6 课程小结](#26-课程小结)
- [3 Mongoose 简单查询](#3-mongoose-简单查询)
    - [3.1 MongoDB简单查询简介](#31-mongodb简单查询简介)
    - [3.2 用find过滤查询MongoDB数据记录](#32-用find过滤查询mongodb数据记录)
    - [3.3 用findOne查询一条符合条件数据文档](#33-用findone查询一条符合条件数据文档)
    - [3.4 用findById查询指定Id的数据文档](#34-用findbyid查询指定id的数据文档)
    - [3.5 课程小结](#35-课程小结)
- [4 Mongoose 高级查询](#4-mongoose-高级查询)
    - [4.1 MongoDB条件查询的简介](#41-mongodb条件查询的简介)
    - [4.2 MongoDB比较数据时大于$gt、小于$lt](#42-mongodb比较数据时大于gt小于lt)
    - [4.3 MongoDB不匹配数据查询$ne](#43-mongodb不匹配数据查询ne)
    - [4.4 MongoDB匹配数据查询使用$in](#44-mongodb匹配数据查询使用in)
    - [4.5 MongoDB并列查询时使用或者$or](#45-mongodb并列查询时使用或者or)
    - [4.6 MongoDB查询判断是否存在$exists](#46-mongodb查询判断是否存在exists)
    - [4.7 课程小结](#47-课程小结)
- [5 Mongoose 游标](#5-mongoose-游标)
    - [5.1 MongoDB学习游标的入门使用](#51-mongodb学习游标的入门使用)
    - [5.2 limit函数限制游标返数据结果数量](#52-limit函数限制游标返数据结果数量)
    - [5.3 skip函数跳过指定的数据结果数量](#53-skip函数跳过指定的数据结果数量)
    - [5.4 通过sort函数对游标结果数据进行排序](#54-通过sort函数对游标结果数据进行排序)
    - [5.5 课程小结](#55-课程小结)
- [6 Mongoose 属性方法](#6-mongoose-属性方法)
    - [6.1 mongodb中文档的ObjectId类型](#61-mongodb中文档的objectid类型)
    - [6.2 用Schema模型来添加属性](#62-用schema模型来添加属性)
    - [6.3 Schema模型创建一个实例的方法](#63-schema模型创建一个实例的方法)
    - [6.4 Schema模型创建一个静态方法](#64-schema模型创建一个静态方法)
    - [6.5 Schema模型来追加一个属性方法](#65-schema模型来追加一个属性方法)

<!-- /TOC -->
# 1 Mongoose 基础介绍

## 1.1 认识对象模型库Mongoose
### 简介

　　今天我们将学习Mongoose，什么是Mongoose呢，它于MongoDB又是什么关系呢，它可以用来做什么呢，介绍Mongoose之前，我们先简单了解一下MongoDB。

　　MongoDB是一个开源的NoSQL数据库，相比MySQL那样的关系型数据库，它更显得轻巧、灵活，非常适合在数据规模很大、事务性不强的场合下使用。同时它也是一个对象数据库，没有表、行等概念，也没有固定的模式和结构，所有的数据以文档的形式存储(文档，就是一个关联数组式的对象，它的内部由属性组成，一个属性对应的值可能是一个数、字符串、日期、数组，甚至是一个嵌套的文档。)，数据格式就是JSON。

介绍了MongoDB，我们下面就要认识Mongoose了。

Mongoose是什么？

　　Mongoose是MongoDB的一个对象模型工具，是基于node-mongodb-native开发的MongoDB nodejs驱动，可以在异步的环境下执行。同时它也是针对MongoDB操作的一个对象模型库，封装了MongoDB对文档的的一些增删改查等常用方法，让NodeJS操作Mongodb数据库变得更加灵活简单。

Mongoose能做什么？

　　Mongoose，因为封装了对MongoDB对文档操作的常用处理方法，让NodeJS操作Mongodb数据库变得easy、easy、So easy!

　　学习了上面的介绍，相信你已经对Mongoose有了初步的认识和了解，千里之行，始于足下，奔跑吧，少年！

$v.vtutor.say('欢迎学习『基础介绍』课程！');



## 1.2 如何安装引用连接对象模型库Mongoose
### 安装引用

前面我们已经认识了Mongoose，也了解了MongoDB，回顾一下：MongoDB是一个对象数据库，是用来存储数据的；Mongoose是封装了MongoDB操作的一个对象模型库,是用来操作这些数据的。

好，下面我们就来进行操作数据的第一步吧。

- 安装mongoose：
```bash
npm install mongoose
```



- 引用mongoose：


```bash
var mongoose = require("mongoose");
```


- 使用"mongoose"连接数据库：


```bash
var db = mongoose.connect("mongodb://user:pass@localhost:port/database");
```


- 执行下面代码检查默认数据库test，是否可以正常连接成功?


```bash
var mongoose = require("mongoose");
var db = mongoose.connect("mongodb://127.0.0.1:27017/test");
db.connection.on("error", function (error) {
    console.log("数据库连接失败：" + error);
});
db.connection.on("open", function () {
    console.log("------数据库连接成功！------");
});
```


> 有兴趣的话，试试console数据库连接对象“db”，看看返回值都有什么？


## 1.3 了解MongoDB中的集合Collection
### 了解集合

　　通过上节课程的学习我们已经打下了基础，本节课程就开始对MongoDB数据库进行具体操作。首先，我们再次简单介绍一下MongoDB数据库。

　　MongoDB —— 是一个对象数据库，没有表、行等概念，也没有固定的模式和结构，所有的数据以Document(以下简称文档)的形式存储(Document，就是一个关联数组式的对象，它的内部由属性组成，一个属性对应的值可能是一个数、字符串、日期、数组，甚至是一个嵌套的文档。)，后面我们会学习如何创建文档并插入内容。

　　在MongoDB中，多个Document可以组成Collection(以下简称集合)，多个集合又可以组成数据库。

　　我们想要操作MongoDB数据，那就得先要具备上面所说的包含数据的“文档”，文档又是什么意思呢，请看如下介绍。

　　文档 —— 是MongoDB的核心概念，是键值对的一个有序集，在JavaScript里文档被表示成对象。同时它也是MongoDB中数据的基本单元，非常类似于关系型数据库管理系统中的行，但更具表现力。

　　集合 —— 由一组文档组成，如果将MongoDB中的一个文档比喻成关系型数据库中的一行，那么一个集合就相当于一张表。

　　如果我们要通过Mongoose去创建一个“集合”并对其进行增删改查，该怎么实现呢，到这里我们就要先了解Schema(数据属性模型)、Model、Entity了。

　　好，下面就开始去深入了解它们吧！


## 1.4 Schema文件形式存储的数据库模型骨架
### Schema简述

　　Schema —— 一种以文件形式存储的数据库模型骨架，无法直接通往数据库端，也就是说它不具备对数据库的操作能力，仅仅只是数据库模型在程序片段中的一种表现，可以说是数据属性模型(传统意义的表结构)，又或着是“集合”的模型骨架。

　　那如何去定义一个Schema呢，请看示例：

```bash
var mongoose = require("mongoose");
var TestSchema = new mongoose.Schema({
    name : { type:String },//属性name,类型为String
    age  : { type:Number, default:0 },//属性age,类型为Number,默认为0
    time : { type:Date, default:Date.now },
    email: { type:String,default:''}
});
```

　　基本属性类型有：字符串、日期型、数值型、布尔型(Boolean)、null、数组、内嵌文档等。


> 定义一个Schema对象，名称为tschema，由属性name(String类型)、age(Number类型，默认为18)、gender(Boolean类型，默认为true)组成，动手试一试！


```bash
var mongoose = require("mongoose");
var tschema= new mongoose.Schema({
    name  : { type:String },
    age   : { type:Number, default:18 },
    gender: { type: Boolean, default: true }
});
```


## 1.5 用Model进行数据库管理操作
### Model简述

　　Model —— 由Schema构造生成的模型，除了Schema定义的数据库骨架以外，还具有数据库操作的行为，类似于管理数据库属性、行为的类。

　　如何通过Schema来创建Model呢，如下示例：

```bash
var db = mongoose.connect("mongodb://127.0.0.1:27017/test");
// 创建Model
var TestModel = db.model("test1", TestSchema);
```

　　test1：数据库中的集合名称,当我们对其添加数据时如果test1已经存在，则会保存到其目录下，如果未存在，则会创建test1集合，然后在保存数据。

　　拥有了Model，我们也就拥有了操作数据库的金钥匙，在后面的课程中，我们就会学习使用Model来进行增删改查的具体操作，所以，一定要熟悉他的创建格式哟！

　　如果你想对某个集合有所作为，那就交给Model模型来处理吧，创建一个Model模型，我们需要指定：1.集合名称，2.集合的Schema结构对象，满足这两个条件，我们就会拥有一个操作数据库的金钥匙。


> 使用预置代码创建一个Model对象(默认连接数据库test)，试一试？


```bash
var db = mongoose.connect("mongodb://127.0.0.1:27017/test");
var tmodel= db.model("tdoc", tschema);
```

## 1.6 通过Entity进行数据库管理操作
### Entity简述

　　Entity —— 由Model创建的实体，使用save方法保存数据，Model和Entity都有能影响数据库的操作，但Model比Entity更具操作性。

　　使用Model创建Entity，如下示例：

```bash
var TestEntity = new TestModel({
       name : "Lenka",
       age  : 36,
       email: "lenka@qq.com"
});
console.log(TestEntity.name); // Lenka
console.log(TestEntity.age); // 36
```

　　创建成功之后，Schema属性就变成了Model和Entity的公共属性了。


> 使用预置代码创建一个Entity对象并为其属性赋值，然后console其属性查看是否有值？

## 1.7 创建MongoDB集合
### 创建集合

　　基于前面的课程，接下来我们就开始学习对数据的具体操作了，下面是关于一些基础数据的定义，相信对于你来说已经不陌生了，请在仔细温习一遍吧！

　　为了方便后面课程的学习和提高您的学习效率，以下基础数据均和后面课程紧密相连，所以必须按照以下结构方式来定义，请勿修改(默认数据库为test，集合为test1)。

```bash
var mongoose = require("mongoose");
var db = mongoose.connect("mongodb://127.0.0.1:27017/test");
var TestSchema = new mongoose.Schema({
    name : { type:String },
    age  : { type:Number, default:0 },
    email: { type:String },
    time : { type:Date, default:Date.now }
});
var TestModel = db.model("test1", TestSchema );
var TestEntity = new TestModel({
    name : "helloworld",
    age  : 28,
    email: "helloworld@qq.com"
});
TestEntity.save(function(error,doc){
  if(error){
     console.log("error :" + error);
  }else{
     console.log(doc);
  }
});
```

<div style="background:#f8f8f8;color: #333333;padding: 15px 10px 5px 10px;margin-bottom:10px;border-top: 30px solid rgb(216, 104, 36);">

#### 提示:

　　在接下来的课程中，为了便于我们的学习和课题操作，我们会在以上所创建的数据库test、集合test1的基础上，来具体针对性的学习，所以，在后面的课程学习中，还会再次见到它们，不必诧异和惊讶！
</div>

<div class='cw-exe'>由于此处代码量过多，可运行以上代码直接来创建test1集合，然后查看运行结果的返回值是什么，test1是否创建成功？




## 1.8 课程小结
### 课程小结

　　本章节学习了如何通过Mongoose去创建一个数据库“集合”，还有定义“集合”的基本组成结构并使其具有相应的操作数据库能力。

简单回顾：

 *Schema* ：数据库集合的模型骨架，或者是数据属性模型传统意义的表结构。

 *Model*  ：通过Schema构造而成，除了具有Schema定义的数据库骨架以外，还可以具体的操作数据库。

 *Entity* ：通过Model创建的实体，它也可以操作数据库。

在下节课程里，我们将对数据库进行实战性的操作了，也就是增删改查，继续加油吧！



# 2 Mongoose 增删改查

## 2.1  查询MongoDB数据文档
### 查询

上节课程里集合已经创建成功，我们就先来进行第一步操作 —— 查询。

查询分很多种类型，如条件查询，过滤查询等等，今天我们只学习最基本的find查询，在后面的学习中，我们会专门针对查询做详细的介绍，好，我们就先来学习使用find查询。

1.find查询： obj.find(查询条件,callback);

```bash
Model.find({},function(error,docs){
   //若没有向find传递参数，默认的是显示所有文档
});

Model.find({ "age": 28 }, function (error, docs) {
  if(error){
    console.log("error :" + error);
  }else{
    console.log(docs); //docs: age为28的所有文档
  }
});
```


> 参考示例，查询全部文档并console输出所有结果？

```bash
TestModel.find({}, function(error, docs) {
    console.log(docs);
});
```

## 2.2 Model的create方法保存MongoDB数据
### Model保存方法

　　Model提供了一个create方法来对数据进行保存。下面我们来看一下示例：

　　Model.create(文档数据, callback))

```bash
Model.create({ name:"model_create", age:26}, function(error,doc){
    if(error) {
        console.log(error);
    } else {
        console.log(doc);
    }
});
```


> 参考示例，用create方法为集合“test1”添加一条数据(包含属性name、age、email)，并console输出返回值？

```bash
TestModel.create({
    name : "test_create",
    age  : 26,
    email: "tom@qq.com"
  },function(error,doc){
    console.log(doc);
});
```

## 2.3 Entity的save方法保存MongoDB数据
### entity保存方法

　　刚刚学习了model的create方法，那接下来就开始学习基于entity的保存方法吧。如下示例：

　　Entity.save(文档数据, callback))

```bash
var Entity = new Model({name:"entity_save",age: 27});

Entity.save(function(error,doc) {
    if(error) {
        console.log(error);
    } else {
        console.log(doc);
    }
});
```

　　model调用的是create方法，entity调用的是save方法，记住了嘛！


> 参考示例，用save方法为集合“test1”添加一条数据(包含属性name、age、email)，并console输出返回值？

```bash
var TestEntity = new TestModel({
    name : "jerry",
    age  : 28,
    email: "jerry@qq.com"
});
TestEntity.save(function(error,doc) {
   console.log(doc);
});
```

## 2.4 update更新MongoDB数据
### 数据更新

　　学习了数据的保存，接下来我们就开始学习对数据的更新吧！

1.示例：obj.update(查询条件,更新对象,callback);

```bash
var conditions = {name : 'test_update'};

var update = {$set : { age : 16 }};

TestModel.update(conditions, update, function(error){
    if(error) {
        console.log(error);
    } else {
        console.log('Update success!');
    }
});
```

　　更新后find一下，此时数据已经修改成功了！


> 结合find查询功能，去update某些数据，试试是否可以成功？

## 2.5 remove删除MongoDB数据
### 删除数据

有了数据的保存、更新，就差删除了，下面我们就来学习它吧！

1.示例：obj.remove(查询条件,callback);

```bash
var conditions = { name: 'tom' };

TestModel.remove(conditions, function(error){
    if(error) {
        console.log(error);
    } else {
        console.log('Delete success!');
    }
});
```

和update类似吧，有了remove方法我们就可以进行删除操作了，看了上面的示例，接着看下下面的问题吧！


> 结合find的查询功能试一试remove某些数据，然后查询是否成功？

## 2.6 课程小结
### 课程小结

  本章节我们讲述了针对数据库的几个操作方法，通过调用相关方法来对数据进行改变，不管是新增、删除、修改还是查查询，你都可以办到。

简单回顾：

　　查询：find查询返回符合条件一个、多个或者空数组文档结果。

　　保存：model调用create方法，entity调用的save方法。

　　更新：obj.update(查询条件,更新对象,callback)，根据条件更新相关数据。

　　删除：obj.remove(查询条件,callback)，根据条件删除相关数据。

在下节课程里，我们详细讲诉关于查询的各种方法，继续加油吧！



# 3 Mongoose 简单查询

## 3.1 MongoDB简单查询简介
### 简介

　　查询就是返回一个集合中的文档的子集，Mongoose 模型提供了find、findOne、和findById方法用于文档查询。

　　为了方便后面课程的有效学习，我们这里先添加一些测试数据。

```bash
TestModel.create([
                  { name:"test1", age:20 },
                  { name:"test2", age:30 },
                  { name:"test3", age:24 },
                  { name:"test4", age:18 },
                  { name:"test5", age:60 },
                  { name:"test6", age:50, email:"t6@qq.com" },
                  { name:"test7", age:40, email:"t7@163.com" },
                  { name:"test8", age:27 },
                  { name:"test9", age:27, email:"t9@yeah.net" },
                  { name:"test10",age:65 }
                 ], function(error,docs) {
    if(error) {
        console.log(error);
    } else {
        console.log('save ok');
    }
});
```

以上数据仅供后面测试，可以自行修改属性值，但是必须符合我们之前所定义集合属性，否则出错就...



## 3.2 用find过滤查询MongoDB数据记录
### find 过滤查询

　　前面我们学习了find的基本使用方法，相信你已经对它完全掌握了，今天呢将对find方法进行更深一步的学习，了解和掌握它的过滤功能，怎么个过滤法呢，请看如下介绍。

1.属性过滤 find(Conditions,field,callback);

field省略或为Null，则返回所有属性。

```bash
//返回只包含一个键值name、age的所有记录
Model.find({},{name:1, age:1, _id:0}，function(err,docs){
   //docs 查询结果集
})
```

说明：我们只需要把显示的属性设置为大于零的数就可以，当然1是最好理解的，_id是默认返回，如果不要显示加上("_id":0)，但是，对其他不需要显示的属性且不是_id，如果设置为0的话将会抛异常或查询无果。


> 参考示例，查询只包含name和email属性的全部文档并console输出。


```bash
TestModel.find({},{name:1, email:1, _id:0},function(err,docs){
   console.log(docs);
});
```

## 3.3 用findOne查询一条符合条件数据文档
### findOne的基本用法

　　与find相同，但只返回单个文档，也就说当查询到即一个符合条件的数据时，将停止继续查询，并返回查询结果。

1.单条数据 findOne(Conditions,callback);

```bash
TestModel.findOne({ age: 27}, function (err, doc){
   // 查询符合age等于27的第一条数据
   // doc是查询结果
});
```

findOne方法，只返回第一个符合条件的文档数据。


> 查看具有相同条件的N条数据，测试findOne方法是否真的只返回第一个符合条件的文档数据呢？

## 3.4 用findById查询指定Id的数据文档
### findById的基本用法

与findOne相同，但它只接收文档的_id作为参数，返回单个文档。

1.单条数据 findById(_id, callback);

```bash
TestModel.findById('obj._id', function (err, doc){
 //doc 查询结果文档
});
```

同样是单条数据，findById和findOne还是有些区别的。


> 根据_id属性值，试一试使用findById方法获取单个文档对象。

## 3.5 课程小结
### 课程小结

本章节我们讲述了针对数据的几个查询方法，根据不同条件选择相应的查询方法。

简单回顾：



- find过滤查询 ：find查询时我们可以过滤返回结果所显示的属性个数。


- findOne查询 ：只返回符合条件的首条文档数据。


- findById查询：根据文档_id来查询文档。




在下节课程里，我们将学习”高级查询“，继续加油吧！



# 4 Mongoose 高级查询

## 4.1 MongoDB条件查询的简介
### 条件查询

　　前面课程我们已经学习了数据查询的几个关键性方法，接下来我们将学习一些在查询时会用的常用操作符，通过操作符的使用，我们就可对数据进行更细致性的查询，一起来看一下吧。

　　"$lt"(小于)，"$lte"(小于等于),"$gt"(大于)，"$gte"(大于等于)，"$ne"(不等于)，"$in"(可单值和多个值的匹配)，"$or"(查询多个键值的任意给定值)，"$exists"(表示是否存在的意思)"$all"。

　　看了上面的简单介绍，下面就来详细的学习它们都各自拥有什么样的功能吧！



## 4.2 MongoDB比较数据时大于$gt、小于$lt
### $gt、$lt简述

　　查询时我们经常会碰到要根据某些字段进行条件筛选查询，比如说Number类型，怎么办呢，我们就可以使用$gt(>)、$lt(<)、$lte(<=)、$gte(>=)操作符进行排除性的查询，如下示例：

```bash
Model.find({"age":{"$gt":18}},function(error,docs){
   //查询所有nage大于18的数据
});

Model.find({"age":{"$lt":60}},function(error,docs){
   //查询所有nage小于60的数据
});

Model.find({"age":{"$gt":18,"$lt":60}},function(error,docs){
   //查询所有nage大于18小于60的数据
});
```

　　如果我们要对类似age字段的数据进行筛选，使用$gt、$lt是不是很方便快捷呢！


> 参考示例，查询20≤age≤50的所有文档并console输出。
</div>


```bash
TestModel.find({"age":{"$gte":20,"$lte":50}},function(error,docs){
   console.log(docs);
});
```

## 4.3 MongoDB不匹配数据查询$ne
### $ne简述

$ne(!=)操作符的含义相当于不等于、不包含，查询时我们可通过它进行条件判定，具体使用方法如下：

```bash
Model.find({ age:{ $ne:24}},function(error,docs){
    //查询age不等于24的所有数据
});

Model.find({name:{$ne:"tom"},age:{$gte:18}},function(error,docs){
  //查询name不等于tom、age>=18的所有数据
});

```

$ne可以匹配单个值，也可以匹配不同类型的值。


> 综上学习，试一试查询name不为"test4"且age小于27的所有文档并console输出。
</div>


```bash
TestModel.find({name:{$ne:"test4"},age:{$lt:27}},function(error,docs){
   console.log(docs);
});
```

## 4.4 MongoDB匹配数据查询使用$in
### $in简述

和$ne操作符相反，$in相当于包含、等于，查询时查找包含于指定字段条件的数据。具体使用方法如下：

```bash
Model.find({ age:{ $in: 20}},function(error,docs){
   //查询age等于20的所有数据
});

Model.find({ age:{$in:[20,30]}},function(error,docs){
  //可以把多个值组织成一个数组
});
```

$in和$ne除了条件判定不同，用法是不是很相似呀！


> 参考示例，查询age为24、25、27的所有文档并console输出。
</div>


```bash
TestModel.find({ age: {$in:[24,25,27]}},function(error,docs){
    console.log(docs);
});
```

## 4.5 MongoDB并列查询时使用或者$or
### $or简述

$or操作符，可以查询多个键值的任意给定值，只要满足其中一个就可返回，用于存在多个条件判定的情况下使用，如下示例：

```bash

Model.find({"$or":[{"name":"yaya"},{"age":28}]},function(error,docs){
  //查询name为yaya或age为28的全部文档
});
```

$or操作符和$in操作符相比较，有什么不同和相同呢，想一想?


> 综上示例，试一试查询name为”test4“或者age为27的的所有文档并console输出。
</div>


```bash
TestModel.find({$or:[{ name:"test4"},{age:27}]},function(error,docs){
    console.log(docs);
});
```

## 4.6 MongoDB查询判断是否存在$exists
### $exists简述

$exists操作符，可用于判断某些关键字段是否存在来进行条件查询。如下示例：

```bash
Model.find({name: {$exists: true}},function(error,docs){
  //查询所有存在name属性的文档
});
Model.find({telephone: {$exists: false}},function(error,docs){
  //查询所有不存在telephone属性的文档
});
```


> 参考示例，试一试使用$exists操作符来判定存在属性email的所有文档并console输出。
</div>


```bash
TestModel.find({email: {$exists: true}},function(error,docs){
  console.log(docs);
});
```

## 4.7 课程小结
### 课程小结

本章节我们重点讲述了关于高级查询的一些常用操作符，通过使用它们来对数据进一步进行筛选，让结果更接近我们的要求。

简单回顾：

　　$gt(>),$lt(<),$lte(<=),$gte(>=)操作符：针对Number类型的查询具体超强的排除性。

　　$ne(!=)操作符：相当于不等于、不包含，查询时可根据单个或多个属性进行结果排除。

　　$in操作符：和$ne操作符用法相同，但意义相反。

　　$or操作符：可查询多个条件，只要满足其中一个就可返回结果值。

　　$exists操作符：主要用于判断某些属性是否存在。

　　在下节课程里，我们将学习”游标“，继续加油！



# 5 Mongoose 游标

## 5.1 MongoDB学习游标的入门使用
### 简介

　　数据库使用游标返回find的执行结果。客户端对游标的实现通常能够对最终结果进行有效的控制。可以限制结果的数量，略过部分结果，根据任意键按任意顺序的组合对结果进行各种排序，或者是执行其他一些强的操作。

　　最常用的查询选项就是限制返回结果的数量(limit函数)、忽略一点数量的结果(skip函数)以及排序(sort函数)。所有这些选项一点要在查询被发送到服务器之前指定。

看了上面的简单介绍，是不是已经对它们产生了兴趣，下面我们就来近距离的了解它吧！



## 5.2 limit函数限制游标返数据结果数量
### limit函数的基本用法

　　在查询操作中，有时数据量会很大，这时我们就需要对返回结果的数量进行限制，那么我们就可以使用limit函数，通过它来限制结果数量。

1.限制数量：find(Conditions,fields,options,callback);

```bash
Model.find({},null,{limit:20},function(err,docs){
    console.log(docs);
});
```

　　如果匹配的结果不到20个，则返回匹配数量的结果，也就是说limit函数指定的是上限而非下限。


> 　　试一试查询以age为条件、过滤属性为null的所有文档并console输出，但必须使用limit函数来限制返回的文档数量。
</div>


```bash
TestModel.find({age:27},null,{limit:4},function(err,docs){
   console.log(docs);
});
```

## 5.3 skip函数跳过指定的数据结果数量
### skip函数的基本用法

　　skip函数和limit类似，都是对返回结果数量进行操作，不同的是skip函数的功能是略过指定数量的匹配结果，返回余下的查询结果。如下示例：

1.跳过数量：find(Conditions,fields,options,callback);

```bash
Model.find({},null,{skip:4},function(err,docs){
    console.log(docs);
});
```

如果查询结果数量中少于4个的话，则不会返回任何结果。


> 查询以age为条件、过滤属性为null的所有文档并console输出而且使用skip函数来跳过N条文档。
</div>


```bash
TestModel.find({age:27},null,{skip:2},function(err,docs){
   console.log(docs);
});
```

## 5.4 通过sort函数对游标结果数据进行排序
### sort函数的基本用法

　　sort函数可以将查询结果数据进行排序操作，该函数的参数是一个或多个键/值对，键代表要排序的键名，值代表排序的方向，1是升序，-1是降序。

1.结果排序：find(Conditions,fields,options,callback);

```bash
Model.find({},null,{sort:{age:-1}},function(err,docs){
  //查询所有数据，并按照age降序顺序返回数据docs
});
```

　　sort函数可根据用户自定义条件有选择性的来进行排序显示数据结果。


> 　　结合前面的学习，试一试查询所有文档(只显示属性name和age)且按照age升序展示结果，并console输出所有文档。
</div>


```bash
TestModel.find({},
               {name: 1, age: 1, _id: 0 },
               {sort:{age: 1 }},
               function(err,docs){
   console.log(docs);
});
```

## 5.5 课程小结
### 课程小结

　　关于游标的一些基本使用方法我们就先介绍到这里，通过对游标的学习，我们了解了可以通过使用游标来对数据结果进行有效的控制和操作。

简单回顾：

　　limit函数：限制返回结果的数量。

　　skip函数：略过指定的返回结果数量。

　　sort函数：对返回结果进行有效排序。

　　好，到这里我们就暂时结束了游标的学习，通过本节课程的学习，相信对你也有了一定的帮助和提升，再接再厉，继续加油吧！



# 6 Mongoose 属性方法

## 6.1 mongodb中文档的ObjectId类型
### ObjectId简述

存储在mongodb集合中的每个文档（document）都有一个默认的主键_id，这个主键名称是固定的，它可以是mongodb支持的任何数据类型，默认是ObjectId。该类型的值由系统自己生成，从某种意义上几乎不会重复，生成过程比较复杂，有兴趣的朋友可以查看源码。

使用过MySQL等关系型数据库的友友们都知道，主键都是设置成自增的。但在分布式环境下，这种方法就不可行了，会产生冲突。为此，MongoDB采用了一个称之为ObjectId的类型来做主键。ObjectId是一个12字节的  BSON 类型字符串。按照字节顺序，一次代表：



- 4字节：UNIX时间戳
- 3字节：表示运行MongoDB的机器
- 2字节：表示生成此_id的进程
- 3字节：由一个随机数开始的计数器生成的值



```bash
var mongoose = require('mongoose');
var tSchema = new mongoose.Schema({}); //默认_id:ObjectId类型
```

　　每一个文档都有一个特殊的键“_id”，这个键在文档所属的集合中是唯一的。



## 6.2 用Schema模型来添加属性
### Schema添加属性值

　　前面我们已经讲述了如何定义一个Schema并赋予某些属性值,那能不能先定义后添加属性呢，答案是可以的，如下所示：

```bash
var mongoose = require('mongoose');
var TempSchema = new mongoose.Schema;
TempSchema.add({ name: 'String', email: 'String', age: 'Number' });
```


> 　　console一下，TempSchema前后有什么变化呢！

## 6.3 Schema模型创建一个实例的方法
### 实例方法

　　有的时候，我们创造的Schema不仅要为后面的Model和Entity提供公共的属性，还要提供公共的方法.那怎么在Schema下创建一个实例方法呢，请看示例：

```bash
var mongoose = require('mongoose');
var saySchema = new mongoose.Schema({name : String});
saySchema.method('say', function () {
  console.log('Trouble Is A Friend');
})
var say = mongoose.model('say', saySchema);
var lenka = new say();
lenka.say(); //Trouble Is A Friend
```


> 是不是很简单，赶快自己定义一个实例方法试试效果吧！

## 6.4 Schema模型创建一个静态方法
### Schema静态方法

前面课程我们讲述了如何为Schema创建实例方法，接下来将讲述怎么为Schema创建静态方法。如下示例：

```bash
var mongoose = require("mongoose");
var db = mongoose.connect("mongodb://127.0.0.1:27017/test");
var TestSchema = new mongoose.Schema({
    name : { type:String },
    age  : { type:Number, default:0 },
    email: { type:String, default:"" },
    time : { type:Date, default:Date.now }
});

TestSchema.static('findByName', function (name, callback) {
    return this.find({ name: name }, callback);
});

var TestModel = db.model("test1", TestSchema );
TestModel.findByName('tom', function (err, docs) {
 //docs所有名字叫tom的文档结果集
});
```


> 试一试，自己动手去创建一个自定义的静态方法，该怎么实现？

## 6.5 Schema模型来追加一个属性方法
### Schema追加方法

　　关于Schema的如何定义前面我们已经讲述过了，有时场景的需要，我们甚至可以为Schema模型追加方法。

　　为Schema模型追加speak方法，如下示例：

```bash
var mongoose = require("mongoose");
var db = mongoose.connect("mongodb://127.0.0.1:27017/test");
var TestSchema = new mongoose.Schema({
    name : { type:String },
    age  : { type:Number, default:0 },
    email: { type:String, default:"" },
    time : { type:Date, default:Date.now }
});

TestSchema.methods.speak = function(){
  console.log('我的名字叫'+this.name);
}

var TestModel = db.model('test1',TestSchema);
var TestEntity = new TestModel({name:'Lenka'});
TestEntity.speak();//我的名字叫Lenka
```


> 是不是和前面的方法很类似，赶快动手试试吧！
