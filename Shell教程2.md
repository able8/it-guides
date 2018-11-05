
# Shell教程 2

<!-- TOC -->

- [Shell教程 2](#shell教程-2)
- [1 Shell运行环境](#1-shell运行环境)
    - [1.1  绝对路径与相对路径](#11--绝对路径与相对路径)
    - [1.2  系统环境配置文件](#12--系统环境配置文件)
    - [1.3  用户环境配置文件](#13--用户环境配置文件)
    - [1.4  命令别名：alias](#14--命令别名alias)
    - [1.5  历史命令：history](#15--历史命令history)
    - [1.6  Shell 文件包含](#16--shell-文件包含)
- [2 输入/输出重定向](#2-输入输出重定向)
    - [2.1  重定向简介](#21--重定向简介)
    - [2.2  输出重定向](#22--输出重定向)
    - [2.3  输入重定向](#23--输入重定向)
    - [2.4  重定向深入讲解](#24--重定向深入讲解)
    - [2.5  Here Document](#25--here-document)
    - [2.6  /dev/null 文件](#26--devnull-文件)
- [3 管线命令（pipe）](#3-管线命令pipe)
    - [3.1  管线命令介绍](#31--管线命令介绍)
    - [3.2  cut剪切命令](#32--cut剪切命令)
    - [3.3  wc统计命令](#33--wc统计命令)
    - [3.4  tee双重重定向命令](#34--tee双重重定向命令)
    - [3.5  tr删除/替换命令](#35--tr删除替换命令)
    - [3.6  减号 - 的用途](#36--减号---的用途)
- [4 正规表示法及grep使用](#4-正规表示法及grep使用)
    - [4.1  正规表示法介绍](#41--正规表示法介绍)
    - [4.2  grep基本语法](#42--grep基本语法)
    - [4.3  grep与正规表示法——字符类](#43--grep与正规表示法字符类)
    - [4.4  grep与正规表示法——行首与行尾](#44--grep与正规表示法行首与行尾)
    - [4.5  grep与正规表示法——任意字节与重复字节](#45--grep与正规表示法任意字节与重复字节)
    - [4.6  grep与正规表示法——限定模式范围](#46--grep与正规表示法限定模式范围)
    - [4.7  正规表示法总结](#47--正规表示法总结)
- [5 sed命令详解](#5-sed命令详解)
    - [5.1  sed命令介绍](#51--sed命令介绍)
    - [5.2  以行为单位的新增/删除](#52--以行为单位的新增删除)
    - [5.3  以行为单位的替换与显示](#53--以行为单位的替换与显示)
    - [5.4  数据的搜寻并显示](#54--数据的搜寻并显示)
    - [5.5  数据的搜寻并删除](#55--数据的搜寻并删除)
    - [5.6  数据的搜寻并执行命令](#56--数据的搜寻并执行命令)
    - [5.7  数据的搜寻并替换](#57--数据的搜寻并替换)
    - [5.8  多点编辑](#58--多点编辑)
    - [5.9  直接修改文件内容](#59--直接修改文件内容)
- [6  awk命令详解](#6--awk命令详解)
    - [6.1  awk命令简介](#61--awk命令简介)
    - [6.2  调用awk](#62--调用awk)
    - [6.3  入门实例](#63--入门实例)
    - [6.4  awk内置变量](#64--awk内置变量)
    - [6.5  print和printf](#65--print和printf)
    - [6.6  awk编程](#66--awk编程)

<!-- /TOC -->

# 1 Shell运行环境

## 1.1  绝对路径与相对路径
### 绝对路径与相对路径

绝对路径和相对路径在shell环境中经常遇到，各有用处。

什么是 ***绝对路径*** （Absolute Pathname）？

- 绝对路径必定由“/”开头
- 绝对路径是为档案/文件的所在位置做指向
- 在任何时候，都可以用绝对路径来找到我们想要的文件

绝对路径举例：

```bash
/usr/share/src
/tmp
```

什么是 ***相对路径*** （Relative Pathnames）？

- 相对路径（Relative Pathnames）不由“/”开头
- 相对路径（Relative Pathnames）是相对于现在目前所在的位置，为目的地指向
- 通常相对路径（Relative Pathnames）比绝对路径短一点，可以当成我们迅速找到文件/档案的捷径

相对路径举例：

```bash
../test root等
```

读者或许心中会有疑问，在 *给出相对路径时，系统如何识别其相应的绝对路径呢* ？

事实上，相对路径是 *根据PATH环境变量来查找* 绝对路径的。

举例来说，我目前在 /home/test 这个 test 使用者的家目录中，我想要看看里面的 .bashrc 这个档案的数据，使用的是 more 这个指令，而这个指令在 /bin/more 当中。通常的命令写法是：

```bash
$ more .bashrc
```

而由于PATH变量的值为：

```bash
$ echo $PATH
/usr/kerberos/bin:/usr/local/bin:/bin:/usr/bin:/home/user/bin
```

在执行more命令时，shell会根据PATH变量的路径中顺序查找，一旦查找匹配到（此例匹配到的应该是/bin/more），便执行/bin/more .bashrc。这便是执行命令时 *由相对路径查找绝对路径的过程* 。

所以我们就可以理解为什么执行当前目录下的可执行程序应该用的格式是：

```bash
$ ./test.sh
```

而不是直接用test.sh了。因为通常PATH变量不包含当前路径。 *如果不加./会导致相对路径格式的命令找不到绝对路径* 。

## 1.2  系统环境配置文件
### 系统环境配置文件

用户每次登陆shell都会设定环境变量，这些环境变量就是用户在使用shell时所处的环境。

 *shell首先根据下列系统环境配置文件来设定环境变量* 。

系统预设的设定文件主要有下列几个：

####  *1、/etc/profile*

该文件设定了几个重要的变量，例如：PATH、USER、MAIL、 HOSTNAME、HISTSIZE、umask等等，也同时规划出 /etc/inputrc 这个针对键盘热建设定的文件的数据内容。同时，该文件也规划出 /etc/profile.d 及 /etc/inputrc 这两个目录与档案。

####  *2、/etc/profile.d/*

/etc/profile.d 是一个目录，里面针对 bash 及 C-shell 规范了一些数据。 以 FC4 为例，这个目录里面就针对了颜色、语系、vim 及 which 等指令进行一些额外的设定， 例如 alias 之类的规范值。我们的 vim 被用 alias 命名为 vi 就是在这个目录下被设定好的。 当然啦，这个目录的由来其实是在 /etc/profile 这个文件内规范的。 你可以自行设定一些 *.sh 的文件名的档案来书写自己的系统设定值。

#### *3、/etc/bash.bashrc

该文件规划 umask 的功能，也同时规划出提示字符的内容 (即里面的PS1) 。特别留意的是，该文件在不同的 Linux distribution 里面，摆放的位置可能不一样， 所以需要查询一下才行。

当然，以上提到的几个系统环境配置文件， ***只有root用户才有权限去修改*** 。作为普通用户，我们只能查看这些文件而已。

> 用cat命令查看本节中提到的系统环境配置文件。

## 1.3  用户环境配置文件
### 用户环境配置文件

shell根据几个系统环境配置文件设定部分系统环境变量后，再根据登入用户私有的用户环境配置文件来进一步定义用户特有的环境变量。

那么这些用户个人的喜好设定在哪里？就 *在个人家目录的几个隐藏文件中* ！

####  *1、~/.bash_profile, ~/.bash_login, ~/.profile*

这三个文件通常只要一个就够了，一般预设是用 ~/.bash_profile 。 会有这么多的文件，其实是因应其它 shell 转换过来的使用者的习惯而已。 这个档案可以定义个人化的路径 (PATH) 与环境变量等等。不过，还是有顺位上的差异， bash 启动时，会先去读取 ~/.bash_profile，找不到时，就去读取 ~/.bash_login ，然后才是 ~/.profile。

####  *2、~/.bashrc*

建议将个人设定值写在这里，例如命令别名、路径等等。 这个档案在用户每次执行 shell script 的时候都会被重新使用一遍，所以是最完整的。 而上头的 ~/.bash_profile 则只有在登入的时候会被读取一次。

####  *3、~/.bash_history*

历史命令存在该文件中。每次登入 bash 后，bash 会先读取这个档案，将所有的历史指令读入内存， 因此，当我们登入 bash 后就可以查知上次使用过哪些指令。

####  *4、~/.bash_logout*

这个档案则记录了“当我注销 bash 后，系统再帮我做完什么动作后才离开”的意思。 你可以去读取一下这个档案的内容，预设的情况下，注销时， bash 只是帮我们清掉屏幕的讯息而已。 另外，你也可以将一些备份或者是其它你认为重要的工作写在这个档案中（例如清空暂存盘）。

 ***注意*** ： *以上提到的文件在不同的linux系统中不一定都有，但只要存在，其功能和上面介绍的就是一样的。*

> 用cat命令查看本节中提到的系统环境配置文件。

## 1.4  命令别名：alias
### 命令别名：alias

命令别名是一个很有趣的东西，特别是你的 *惯用指令特别长的时候* ！还有，增设预设的属性在一些惯用的指令上面，可以 *预防一些不小心误杀文件的情况发生* ！

举个例子来说，如果你要查询隐藏文件，并且需要列出来一页一页翻看，那么需要下达 "ls -al | more" 这个指令。有点长吧？那么能不能 *用命令别名简化* 呢？

```bash
$ alias lm='ls -l | more'
```

我们用命令别名 *alias* 设定了一个指令名称为 lm ，而其实他是执行 ls -al | more 啊！真是方便。

 *alias 的定义规则* 与变量定义规则几乎相同，你只要在 alias 后面加上你的 {别名='指令 参数'}，以后你只要输入 lm 就相当于输入了 ls -al|more 这一串指令！

那么 *如何知道目前有哪些的命令别名* 呢？就使用 alias 呀！

```bash
$ alias
alias l.='ls -d .* --color=tty'
alias ll='ls -l --color=tty'
alias lm='ls -al | more'
alias ls='ls --color=tty'
alias vi='vim'
alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'
```

而如果要 *取消命令别名* 的话，那么就使用  *unalias*  吧！例如要将刚刚的 lm 命令别名拿掉，就使用：

```bash
$ unalias lm
```

那么 *命令别名与变量有什么不同* 呢？他们的意义有区别：

- alias 这种命令别名，你可以将他想成是建立一个新的指令名称
- 变量则仅是将一个数值或者字符串存在某个代表意义当中

> 查看本机已有的系统别名，并仿照本教程中的例子设置系统别名。

## 1.5  历史命令：history
### 历史命令：history

bash 有提供指令历史的服务，用命令history就可以查询我们曾经下达过的指令。

当然，如果觉得 histsory 要输入的字符太多太麻烦，可以使用命令别名来设定呢！

```bash
$ alias h='history'
```

如此则输入 h 等于输入 history 啦！

这是  *history*  命令的用法：

```bash
$ history [n]
$ history [-c]
$ history [-raw] histfiles
参数：
n ：数字，意思是『要列出最近的 n 笔命令列表』的意思！
-c ：将目前的 shell 中的所有 history 内容全部消除
-a ：将目前新增的 history 指令新增入 histfiles 中，若没有加 histfiles ，
则预设写入 ~/.bash_history
-r ：将 histfiles 的内容读到目前这个 shell 的 history 记忆中；
-w ：将目前的 history 记忆内容写入 histfiles 中！
```

 ***范例1*** ：列出目前内存内的所有 history 记忆

```bash
$ history
# 前面省略
1017 man bash
1018 ll
1019 history
1020 history
```

列出的信息当中，共分两栏， *第一栏为该指令在这个 shell 当中的代码，另一个则是指令本身的内容* 。至于会输出几笔指令记录，则与系统变量 HISTSIZE 有关。

 ***范例2*** ：列出最近使用的 3 个命令

```bash
$ history 3
1019 history
1020 history
1021 history 3
```

那么 history 这个历史命令只可以让我查询命令而已吗？当然不止啊！我们可以利用相关的功能来帮我们执行命令呢！

 ***范例3*** ：快速执行某个历史命令

```bash
$ history
66 man rm
67 alias
68 man history
69 history
$ !66 <==执行第 66 笔指令
$ !! <==执行上一个指令，本例中亦即 !66
$ !al <==执行最近以 al 为开头的指令(上头列出的第 67 个)
```

> 按照3个范例的做法执行history命令，查看结果。

## 1.6  Shell 文件包含
### Shell 文件包含

和其他语言一样， *Shell 也可以包含外部脚本* 。这样可以很方便的封装一些公用的代码作为一个独立的文件。

Shell 文件包含的语法格式如下：

```bash
. filename   # 注意点号(.)和文件名中间有一空格
```

或者

```bash
source filename
```

 ***范例1***

创建两个 shell 脚本文件。

 *test1.sh*  代码如下：

```bash
#!/bin/bash

url="http://www.hubwiz.com"
```

 *test2.sh*  代码如下：

```bash
#!/bin/bash

#使用 . 号来引用test1.sh 文件
. ./test1.sh

echo "汇智网地址：$url"
```

接下来，我们为 test2.sh 添加可执行权限并执行：

```bash
$ chmod +x test2.sh
$ ./test2.sh
汇智网地址：http://www.hubwiz.com
```

 *注：被包含的文件 test1.sh 不需要可执行权限* 。

> 用source的方式编写并测试范例脚本。

# 2 输入/输出重定向

## 2.1  重定向简介
### 重定向简介

大多数 UNIX 系统命令从你的终端接受输入并将所产生的输出发送回​​到您的终端。一个命令通常从一个叫标准输入的地方读取输入，默认情况下，这恰好是你的终端。同样，一个命令通常将其输出写入到标准输出，默认情况下，这也是你的终端。

 *重定向命令列表* 如下：

<table class="table table-bordered">
<tr>
<th> * 命令 * </th>
<th> * 说明 * </th>
</tr>
<tr>
<td> command > file </td>
<td> 将输出重定向到 file </td>
</tr>
<tr>
<td> command < file </td>
<td> 将输入重定向到 file </td>
</tr>
<tr>
<td> command >> file </td>
<td> 将输出以追加的方式重定向到 file </td>
</tr>
<tr>
<td> n > file </td>
<td> 将文件描述符为 n 的文件重定向到 file </td>
</tr>
<tr>
<td> n >> file </td>
<td> 将文件描述符为 n 的文件以追加的方式重定向到 file </td>
</tr>
<tr>
<td> n >&amp; m </td>
<td> 将输出文件 m 和 n 合并 </td>
</tr>
<tr>
<td> n <&amp; m </td>
<td> 将输入文件 m 和 n 合并 </td>
</tr>
<tr>
<td> << tag </td>
<td> 将开始标记 tag 和结束标记 tag 之间的内容作为输入 </td>
</tr>
</table>

 *注意* ：文件描述符 0 通常是 *标准输入（STDIN）* ，1 是 *标准输出（STDOUT）* ，2 是 *标准错误输出（STDERR）* 。

## 2.2  输出重定向
### 输出重定向

 *重定向一般通过在命令间插入特定的符号来实现* 。特别的，这些符号的语法如下所示:

```bash
command1 > file1
```

上面这个命令执行command1然后将输出的内容存入file1。

注意任何file1内的已经存在的内容将被新内容替代。 *如果要将新内容添加在文件末尾，请使用>>操作符。*

执行下面的 who 命令，它将命令的完整的输出重定向在用户文件中(users):

```bash
$ who > users
```

执行后，并没有在终端输出信息，这是因为输出已被从默认的标准输出设备（终端）重定向到指定的文件。
你可以使用 cat 命令查看文件内容：

```bash
$ cat users
_mbsetupuser console  Oct 31 17:35
test    console  Oct 31 17:35
test    ttys000  Dec  1 11:33
```

 *输出重定向会覆盖文件内容* ，请看下面的例子：

```bash
$ echo "汇智网：www.hubwiz.com" > users
$ cat users
汇智网：www.hubwiz.com
```

如果 *不希望文件内容被覆盖* ，可以使用  *>>*  追加到文件末尾，例如：

```bash
$ echo "汇智网：www.hubwiz.com" >> users
$ cat users
汇智网：www.hubwiz.com
汇智网：www.hubwiz.com
```

> 编写并测试2个范例，并查看结果是否与教程一致。

## 2.3  输入重定向
### 输入重定向

和输出重定向一样，Unix 命令也可以 *从文件获取输入* ，语法为：

```bash
command1 < file1
```

这样，本来需要从键盘获取输入的命令会 *转移到文件读取内容* 。

 *注意* ：输出重定向是大于号(>)，输入重定向是小于号(<)。

 ***范例1*** ：统计 users 文件的行数

```bash
$ wc -l users
2 users
```

也可以将输入重定向到 users 文件：

```bash
$  wc -l < users
2
```

注意： *上面两种方式的结果不同* 。第一种方式，会输出文件名；第二种方式不会，因为它仅仅知道从标准输入读取内容。

 ***范例2*** ：输入和输出重定向同时使用

```bash
command1 < infile > outfile
```

同时替换输入和输出，执行command1，从文件infile读取内容，然后将输出写入到outfile中。

> 编写并测试2个范例，并查看结果是否与教程一致。

## 2.4  重定向深入讲解
### 重定向深入讲解

一般情况下，每个 Unix/Linux 命令运行时都会打开 *三个文件* ：

-  *标准输入文件(stdin)* ：stdin的文件描述符为0，Unix程序默认从stdin读取数据。
-  *标准输出文件(stdout)* ：stdout 的文件描述符为1，Unix程序默认向stdout输出数据。
-  *标准错误文件(stderr)* ：stderr的文件描述符为2，Unix程序会向stderr流中写入错误信息。

默认情况下，command > file 将 stdout 重定向到 file，command < file 将stdin 重定向到 file。

如果希望  *stderr 重定向到 file* ，可以这样写：

```bash
$ command 2 > file
```

如果希望  *stderr 追加到 file 文件末尾* ，可以这样写：

```bash
$ command 2 >> file
```

其中 2 表示标准错误文件(stderr)。

如果希望 *将 stdout 和 stderr 合并后重定向到 file* ，可以这样写：

```bash
$ command > file 2>&amp;1
```

或者

```bash
$ command >> file 2>&amp;1
```

如果希望对  *stdin 和 stdout 都重定向* ，可以这样写：

```bash
$ command < file1 >file2
```

command 命令将 stdin 重定向到 file1，将 stdout 重定向到 file2。

## 2.5  Here Document
### Here Document

Here Document 是 Shell 中的一种特殊的重定向方式，用来将输入重定向到一个交互式 Shell 脚本或程序。

它的基本的形式如下：

```bash
command << delimiter
    document
delimiter
```

它的作用是 *将两个 delimiter 之间的内容(document) 作为输入传递给 command* 。

 ***注意*** ：

-  *结尾的delimiter 一定要顶格写* ，前面不能有任何字符，后面也不能有任何字符，包括空格和 tab 缩进。
-  *开始的delimiter前后的空格会被忽略掉* 。

 *在命令行中* 通过 wc -l 命令计算 Here Document 的行数：

```bash
$ wc -l << EOF
    欢迎来到
    汇智网
    www.hubwiz.com
EOF
3
```

输出结果为 3 行。

我们也可以将 Here Document  *用在脚本中* ，例如：

```bash
#!/bin/bash

cat << EOF
欢迎来到
汇智网
www.hubwiz.com
EOF
```

执行以上脚本，输出结果：

```bash
欢迎来到
汇智网
www.hubwiz.com
```

> 将三行文本内容

第一行

第二行

第三行

重定向输出到test文件中。

## 2.6  /dev/null 文件
### /dev/null 文件

如果 *希望执行某个命令，但又不希望在屏幕上显示输出结果* ，那么可以将输出重定向到  */dev/null* ：

```bash
$ command > /dev/null
```

dev/null 是一个 *特殊的文件，写入到它的内容都会被丢弃；如果尝试从该文件读取内容，那么什么也读不到* 。但是 /dev/null 文件非常有用，将命令的输出重定向到它，会起到" *禁止输出* "的效果。

如果 *希望屏蔽 stdout 和 stderr* ，可以这样写：

```bash
$ command > /dev/null 2>&amp;1
```

 ***注意*** ：0 是标准输入（STDIN），1 是标准输出（STDOUT），2 是标准错误输出（STDERR）。

> 将范例命令中的 command 改成 ls -al ，执行并查看结果。

# 3 管线命令（pipe）

## 3.1  管线命令介绍
### 管线命令介绍

shell 命令执行的时候有输出的数据会出现，如果这群数据必需要 *经过几道手续* 之后才能得到我们所想要的格式，应该如何来设定？

 这就涉及到 *管线命令 (pipe)*  ，管线命令使用的是  *|*  这个界定符号。注意 *管线命令与“连续下达命令”是不一样的* ，这点我们以后会再说明。

下面举例说明管线命令的作用。假如我们想知道某个文件test有多少行。可以用如下命令实现：

```bash
$ cat test | wc -l
```

这个管线符号 | 的作用就是将 cat test 命令的输出像管线一样传到下一个命令，作为管线命令 wc -l 的输入。这样整个命令的输出就是文件test有多少行了。

 ***注意*** ： *管线符号  |  仅能处理经由前面一个指令传来的正确信息，也就是 standard output ( STDOUT ) 的信息* ，对于 stdandard error 并没有直接处理的能力。

常用的管线命令有： *cut wc tee tr grep sed awt*  等。 *本章简要介绍这些常见管线命令的使用* ，但 grep sed awt 常与正规表示法结合应用，且功能非常强大，这三个命令将在后面的章节中单独介绍。

## 3.2  cut剪切命令
### cut剪切命令

cut命令的作用是将一段文本的 *某一段给他“切”出来* ， 处理的文本以“行”为单位。

 *cut命令* 的使用格式为：

```bash
$ cut -d'分隔字符' -f fields
$ cut -c 字符区间
参数：
-d ：后面接分隔字符。与 -f 一起使用；
-f ：依据 -d 的分隔字符将一段讯息分割成为数段，用 -f 取出第几段的意思；
-c ：以字符 (characters) 的单位取出固定字符区间；
```

 ***范例1*** ：用 last 将这个月登入者的信息中，仅留下使用者大名。

```bash
$ last
user1 tty1 192.168.1.28 Mon Aug 15 11:55 - 17:48 (05:53)
user2 tty1 192.168.1.28 Mon Aug 15 10:17 - 11:54 (01:37)
$ last | cut -d ' ' -f 1
user1
user2
```

 ***范例2*** ：将 PATH 变量取出，找出其第3、5个路径。

```bash
$ echo $PATH
/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:/usr/X11R6/bin:/usr/games:
$ echo $PATH | cut -d ':' -f 3,5
/sbin:/usr/local/bin
```

> 1、范例1中last的打印仅留下IP。

2、范例2中last的打印找出其第一个路径。

## 3.3  wc统计命令
### wc统计命令

如果我想要知道 /etc/man.config 这个文档里面有 *多少字* ？ *多少行* ？ *多少字符* 的话， 可以怎么做呢？我们可以用 *wc命令* 来轻松得到这些统计结果。使用说明如下：

```bash
$ wc [-lwm]
参数：
-l ：仅列出行；
-w ：仅列出多少字(英文单字)；
-m ：多少字符；
```

 ***范例1*** ：统计 /etc/man.config 里面到底有多少相关字、行、字符数？

```bash
$ cat /etc/man.config | wc
138 709 4506
```

输出的三个数字中，分别代表：  *行、字数、字符数* 。

 ***范例2*** ：我知道使用 last 可以输出登入者，但是 last 最后两行并非账号内容，那么请问，我该如何以一行指令串取得这个月份登入系统的总人次？

```bash
$ last | grep [a-zA-Z] | grep -v 'wtmp' | wc -l
```

由于 last 会输出空白行与 wtmp 字样在最底下两行，因此，我利用 grep 取出非空白行，以及去除 wtmp 那一行，在 *计算行数* ，就能够知道啦！

另外，如果要计算一个文档里头有 *多少个字符* 时，就使用  *wc -c*  这个参数吧！

> 1、执行范例1和2，并查看结果。

2、统计/etc/passwd文件中有多少行。

## 3.4  tee双重重定向命令
### tee双重重定向命令

有没有发现在命令重定向的时候，如果我们要将数据送出到文档的时候， 屏幕上就不会出现任何的数据！那么如果我们需要 *将数据同时显示在屏幕上跟文档中* 呢？这时候我们就要用到 *双重重定向命令 tee* 。

tee能够同时将数据流分送到文档与屏幕 (screen)；而输出到屏幕的，其实就是 stdout ，可以让下个指令继续处理！

这是tee命令的使用方式：

```bash
$ tee [-a] file
参数：
-a ：以累加 (append) 的方式，将数据加入 file 当中！
```

 ***范例1*** ：将 ls 的数据存一份到 ~/homefile，同时屏幕也有输出信息。

```bash
$ ls -l /home | tee ~/homefile | more
```

 ***范例2*** ：将 ls 的数据追加存一份到 ~/homefile，同时屏幕也有输出信息。

```bash
$ ls -l / | tee -a ~/homefile | more
```

 ***注意*** ： tee 后接的档案会被覆盖，所以，我们要 *加上 -a 这个参数才能将信息累加* 。

> 执行范例1和2并查看结果。

## 3.5  tr删除/替换命令
### tr删除/替换命令

 *tr*  可以用来 *删除一段文本中的部分文字* ，或者是进行 *文字内容的替换* ！

tr命令的使用方法为：

```bash
$ tr [-ds] SET1 ...
参数：
-d ：删除讯息当中的 SET1 这个字符串；
-s ：取代掉重复的字符！
```

 ***范例1*** ：将 last 输出的讯息中，所有的小写变成大写字符。

```bash
$ last | tr '[a-z]' '[A-Z]'
```

 ***范例2*** ：将 /etc/passwd 输出的讯息中，将冒号 : 删除。

```bash
$ cat /etc/passwd | tr -d ':'
```

 ***范例3*** ：将 DOS 档案的断行字符 ^M 符号删除。

```bash
$ cat /home/test/dostxt | tr -d '\r' > dostxt-noM
```

这个 /r 指的是 DOS 的断行字符，范例3可以去除 DOS 档案留下来的 ^M 这个断行的符号。

这东西相当的有用，相信处理 Linux &amp; Windows 系统中的人们最麻烦的一件事就是这个事情啦！亦即是 DOS 底下会自动的在每行行尾加入 ^M 这个断行符号。这个时候我们可以 *使用 tr 命令来将 ^M 去除* ， ^M 可以使用 \r 来代替之。

> 执行范例1 2 3并查看结果。对于范例3，应先自己创建一个符合说明的文件，如果不会建议略过。

## 3.6  减号 - 的用途
### 减号 - 的用途

管线命令在  *bash 的连续的处理程序* 中是相当重要的，在 log file 的分析当中也是相当重要的一环， 所以请特别留意！

而在管线命令当中， *常常会使用到前一个指令的 stdout 作为这次的 stdin*  ， 某些指令需要用到文件名称 (例如 tar) 来进行处理时， *该 stdin 与 stdout 可以利用减号 "-" 来替代* 。举例来说：

```bash
$ tar -cvf - /home/test | tar -xvf -
```

上面这个例子是说：

我将 /home/test 里面的内容给他打包，但 *打包的数据不是纪录到档案，而是传送到 stdout* ； 经过管线后，将 tar -cvf - /home 传送给后面的 tar -xvf - 。

 *后面的这个 - 则是取用前一个指令的 stdout* ， 因此，我们就不需要使用 file 了！


# 4 正规表示法及grep使用

## 4.1  正规表示法介绍
### 正规表示法介绍

正规表示法在shell文本搜索及处理中担任着非常重要的角色。简单的说， *正规表示法就是处理字符串的方法，它是以行为单位， 来进行字符串的处理行为* ，它透过一些特殊符号的辅助，可以让使用者轻易的达到搜寻/取代某特定字符串的处理程序！

 *为什么我们需要正规表示法呢？*

举例一个最常见的例子，我要找到 Test 或 test 这个关键字，但是不要其它的字符串，该如何处理？ 如果在没有正规表示法的环境中(例如 MS word)，您或许就得要使用忽略大小写的办法， 或者是分别以 Test 及 test 搜素两遍。但是，忽略大小写可能会搜寻到 TEST/tESt/tesT 等等的不需要的字符串，而造成使用者的困扰。

而使用 *正规表示法就可以轻易的描述这样的关键字，甚至比这复杂的多的关键字。* 也就是说， *正规表示法可以大大缩减指令的长度以及个数* ，从而提高处理效率。尤其是对于每天处理海量信息的系统管理员来说，正规表示法的优势就更为明显。

正规表示法是一种“表示法”， 只要工具程序支持这种表示法，那么该工具程序就可以用来作为正规表示法的字符串处理之用。也就是说，例如  *vi，grep，awk，sed*  等等工具，因为它们有支持正规表示法， 所以， *这些工具就可以使用正规表示法的特殊字符来进行字符串的处理* 。

 *grep是shell最常用的文本搜索工具之一，以下详细介绍grep命令的使用* 。在正规表示法的支持下，grep的功能变得强大无比！

## 4.2  grep基本语法
### grep基本语法

grep 是一个很常见也很常用的指令，它 *最重要的功能* 就是进行 *字符串数据的比对* ， 然后 *将符合使用者需求的字符串打印出来* 。

需要说明的是：grep 在数据中查询一个字符串时，是以  *"整行" 为单位来进行数据的采集* 的！也就是说，假如一个文档内有 10 行，其中有2行具有你所搜寻的字符串，则将那2行显示在屏幕上，其它的就丢弃了！

 *grep命令* 的基本语法是：

```bash
$ grep [-acinv] [--color=auto] '搜寻字符串' filename
选项与参数：
-a ：将 binary 文件以 text 文件的方式搜寻数据
-c ：计算找到 '搜寻字符串' 的次数
-i ：忽略大小写的不同，所以大小写视为相同
-n ：顺便输出行号
-v ：反向选择，亦即显示出没有 '搜寻字符串' 内容的那一行！
--color=auto ：可以将找到的关键词部分加上颜色的显示！
```

 ***范例1*** ：将/etc/passwd，有出现 root 的行取出来。

```bash
$ grep root /etc/passwd
root:x:0:0:root:/root:/bin/bash
operator:x:11:0:operator:/root:/sbin/nologin
```

或者

```bash
$ cat /etc/passwd | grep root
root:x:0:0:root:/root:/bin/bash
operator:x:11:0:operator:/root:/sbin/nologin
```

 ***范例2*** ：将/etc/passwd，有出现 root 的行取出来,同时显示这些行在/etc/passwd的行号。

```bash
$ grep -n root /etc/passwd
1:root:x:0:0:root:/root:/bin/bash
30:operator:x:11:0:operator:/root:/sbin/nologin
```

 ***范例3*** ：将/etc/passwd，将没有出现 root 的行取出来。

```bash
$ grep -v root /etc/passwd
root:x:0:0:root:/root:/bin/bash
operator:x:11:0:operator:/root:/sbin/nologin
```

 ***范例4*** ：将/etc/passwd，将没有出现 root 和nologin的行取出来。

```bash
$ grep -v root /etc/passwd | grep -v nologin
root:x:0:0:root:/root:/bin/bash
operator:x:11:0:operator:/root:/sbin/nologin
```

在关键字的显示方面，grep 可以使用  *--color=auto*  来 *将关键字部分使用颜色显示* 。这可是个很不错的功能啊！

 ***范例5*** ：用 dmesg 列出核心信息，再以 grep 找出内含 eth 那行,要将捉到的关键字显色，且加上行号来表示。

```bash
$ dmesg | grep -n --color=auto 'eth0'
247:eth0: RealTek RTL8139 at 0xee846000, 00:90:cc:a6:34:84, IRQ 10
248:eth0: Identified 8139 chip type 'RTL-8139C'
294:eth0: link up, 100Mbps, full-duplex, lpa 0xC5E1
305:eth0: no IPv6 routers present
```

 ***范例6*** ：根据文件内容递归查找目录。

```bash
$ grep ‘energywise’ *           #在当前目录搜索带'energywise'行的文件
$ grep -r ‘energywise’ *        #在当前目录及其子目录下搜索'energywise'行的文件
$ grep -l -r ‘energywise’ *     #在当前目录及其子目录下搜索'energywise'行的文件，但是不显示匹配的行，只显示匹配的文件
```

注：这几个命令很常用，是 *查找文件的利器* 。

> 执行范例1-6中的命令，并查看结果是否与教程一致。

## 4.3  grep与正规表示法——字符类
### grep与正规表示法——字符类

从本小节开始，我们讲述grep与正规表示法的结合使用。后面的例子中会用到一个文件  *regular_express.txt*  ，该文件的内容先以代码形式贴在这里：

```bash
"Open Source" is a good mechanism to develop programs.
apple is my favorite food.
Football game is not use feet only.
this dress doesn't fit me.
However, this dress is about $ 3183 dollars.^M
GNU is free air not free beer.^M
Her hair is very beauty.^M
I can't finish the test.^M
Oh! The soup taste good.^M
motorcycle is cheap than car.
This window is clear.
the symbol '*' is represented as start.
Oh! My god!
The gd software is a library for drafting programs.^M
You are the best is mean you are the no. 1.
The world <Happy> is the same with "glad".
I like dog.
google is the best tools for search keyword.
goooooogle yes!
go! go! Let's go.
# I am VBird
```

另外读者还可以 *自行到网上下载* ，只要在终端下使用如下命令：

```bash
 wget http://linux.vbird.org/linux_basic/0330regularex/regular_express.txt
```

 ***范例1*** ： *字符类的搜索* 。

如果我想要搜寻 test 或 taste 这两个单字时，可以发现到，其实她们有共通的 't?st' 存在。这个时候，我可以这样来搜寻：

```bash
$ grep -n 't[ae]st' regular_express.txt
8:I can't finish the test.
9:Oh! The soup taste good.
```

 *其实 [] 里面不论有几个字节，他都仅代表某一个字节* ， 所以，上面的例子说明了，我需要的字串是 tast 或 test 两个字串而已！

 ***范例2*** ： *字符类的反向选择 * 。

如果想要搜索到有 oo 的行，但不想要 oo 前面有 g，可以使用 [^] 来进行字符串的反向选择。

```bash
$ grep -n '[^g]oo' regular_express.txt
2:apple is my favorite food.
3:Football game is not use feet only.
18:google is the best tools for search keyword.
19:goooooogle yes!
```

第 2,3 行没有疑问，因为 foo 与 Foo 均可被接受！

但是第 18 行明明有 google 的 goo 啊。别忘记了，因为该行后面出现了 tool 的 too 啊！所以该行也被列出来。也就是说， 18 行里面 *虽然出现了我们所不要的项目 (goo) 但是由于有需要的项目 (too)*  ， 因此，是 *符合字符串搜索要求* 的！

至于第 19 行，同样的，因为 goooooogle 里面的 oo 前面可能是 o ，例如： go(ooo)oogle ，所以，这一行也是符合需求的！

 ***范例3*** ： *连续字符的搜索* 。

再来，假设我 oo 前面不想要有小写字节，所以，我可以这样写 [^abcd....z]oo ， 但是这样似乎不怎么方便，由于小写字节的 ASCII 上编码的顺序是连续的， 因此，我们可以将之简化为底下这样：

```bash
$ grep -n '[^a-z]oo' regular_express.txt
3:Football game is not use feet only.
```

也就是说，当我们在一组集合字节中，如果该字节组是连续的，例如 *大写英文/小写英文/数字* 等等， 就可以使用 *[a-z],[A-Z],[0-9]* 等方式来书写，那么如果我们的要求字串是 *数字与英文* 呢？那就将他全部写在一起，变成： *[a-zA-Z0-9]* 。

> 根据本小节开头的说明建立 regular_express.txt 文件，并按照范例运行命令，查看结果是否与教程一致。

## 4.4  grep与正规表示法——行首与行尾
### grep与正规表示法——行首与行尾

在正规表示法中， *行首与行尾* 字节分别用  *^ 和 $*  表示。

 ***范例1*** ：让 the 只在行首时列出。

```bash
$ grep -n '^the' regular_express.txt
12:the symbol '*' is represented as start.
```

此时，就只剩下第 12 行，因为只有第 12 行的行首是 the 开头啊!

 ***范例2*** ：查找开头是小写字节的行。

```bash
$ grep -n '^[a-z]' regular_express.txt
2:apple is my favorite food.
4:this dress doesn't fit me.
10:motorcycle is cheap than car.
12:the symbol '*' is represented as start.
18:google is the best tools for search keyword.
19:goooooogle yes!
20:go! go! Let's go.
```

 ***范例3*** ：查找开头不是英文字母的行。

$ grep -n '^[^a-zA-Z]' regular_express.txt
1:"Open Source" is a good mechanism to develop programs.
21:# I am VBird

```bash

*注意*：*^ 符号*，在字符类符号(括号[])之内与之外是不同的！ *在 [] 内代表『反向选择』，在 [] 之外则代表定位在行首的意义*！

***范例4***：找出行尾结束为小数点 (.) 的那一行呢。
```

```bash
$ grep -n '.$' regular_express.txt
1:"Open Source" is a good mechanism to develop programs.
2:apple is my favorite food.
3:Football game is not use feet only.
4:this dress doesn't fit me.
10:motorcycle is cheap than car.
11:This window is clear.
12:the symbol '*' is represented as start.
15:You are the best is mean you are the no. 1.
16:The world <Happy> is the same with "glad".
17:I like dog.
18:google is the best tools for search keyword.
20:go! go! Let's go.

```

*注意*：因为小数点具有其他意义(底下会介绍)，所以必须要使用*转义字符(\)来解除其特殊意义*！

***范例5***：找出所有空白行。

```bash
$ grep -n '^$' regular_express.txt
22:
```

因为只有行首跟行尾 (^$)，所以，这样就可以找出空白行啦！

> 建立 regular_express.txt 文件后，按照范例运行命令，查看结果是否与教程一致。

## 4.5  grep与正规表示法——任意字节与重复字节
### grep与正规表示法——任意字节与重复字节

任意一个字节 . 与重复字节 * 这两个符号在正规表示法的意义如下：

- . (小数点)：代表“一定有一个任意字节”的意思；
- *(星号)：代表“重复前一个字符， 0 到无穷多次”的意思，为组合形态

 ***范例1*** ：找出 g??d 的字串，亦即共有四个字节，起头是 g 而结束是 d 。

```bash
$ grep -n 'g..d' regular_express.txt
1:"Open Source" is a good mechanism to develop programs.
9:Oh! The soup taste good.
16:The world <Happy> is the same with "glad".
```

因为强调 g 与 d 之间一定要存在两个字节，因此，第 13 行的 god 与第 14 行的 gd 就不会被列出来啦！

 ***范例2*** ：列出有 oo, ooo, oooo 等等的数据， 也就是说，至少要有两个(含) o 以上。

 *分析* ：因为  * 代表的是 "重复 0 个或多个前面的 RE 字符" 的意义， 因此， "o* " 代表的是："拥有空字节或一个 o 以上的字节"，因此，"grep -n 'o*' regular_express.txt"将会把所有的数据都列印出来终端上！

当我们需要“至少两个 o 以上的字串”时，就需要 ooo* ，亦即是：

```bash
$ grep -n 'ooo*' regular_express.txt
1:"Open Source" is a good mechanism to develop programs.
2:apple is my favorite food.
3:Football game is not use feet only.
9:Oh! The soup taste good.
18:google is the best tools for search keyword.
19:goooooogle yes!
```

 ***范例3*** ：找出这样的字串，开头与结尾都是 g，但是两个 g 之间仅能存在至少一个 o ，亦即是 gog, goog, gooog.... 等等。

```bash
$ grep -n 'goo*g' regular_express.txt
18:google is the best tools for search keyword.
19:goooooogle yes!
```

 ***范例4*** ：找出 g 开头与 g 结尾的行，当中的字符可有可无。

```bash
$ grep -n 'g.*g' regular_express.txt
1:"Open Source" is a good mechanism to develop programs.
14:The gd software is a library for drafting programs.
18:google is the best tools for search keyword.
19:goooooogle yes!
20:go! go! Let's go.
```

因为是代表 g 开头与 g 结尾，中间任意字节均可接受，所以，第 1, 14, 20 行是可接受的喔！ 这个 .* 的 RE 表示任意字符是很常见的.

 ***范例5*** ：找出 "任意数字" 的行。

因为仅有数字，所以就成为：

```bash
$ grep -n '[0-9][0-9]*' regular_express.txt
5:However, this dress is about $ 3183 dollars.
15:You are the best is mean you are the no. 1.
```

> 建立 regular_express.txt 文件后，按照范例运行命令，查看结果是否与教程一致。

## 4.6  grep与正规表示法——限定模式范围
### grep与正规表示法——限定模式范围

我们可以利用 . 与 RE 字符及  * 来配置 0 个到无限多个重复字节， 那如果我想* 要限制一个范围区间内的重复字节数*呢？

 ***范例1*** ：找出两个到五个 o 的连续字串。

这时候就得要使用到限定范围的字符 {} 了。 但因为 { 与 } 的符号在 shell 是有特殊意义的，因此，我们必须要 *使用字符 \ 转义* 才行。 至于 {} 的语法是这样的，假设我要找到两个 o 的字串，可以是：

```bash
$ grep -n 'o\{2\}' regular_express.txt
1:"Open Source" is a good mechanism to develop programs.
2:apple is my favorite food.
3:Football game is not use feet only.
9:Oh! The soup taste good.
18:google is the best tools for search ke
19:goooooogle yes!
```

 ***范例2*** ：找出 g 后面接 2 到 5 个 o ，然后再接一个 g 的字串。

```bash
$ grep -n 'go\{2,5\}g' regular_express.txt
18:google is the best tools for search keyword.
```

 ***范例3*** ：找出 2 个 o 以上的 goooo....g 。

```bash
$ grep -n 'go\{2,\}g' regular_express.txt
18:google is the best tools for search keyword.
19:goooooogle yes!
```

> 建立 regular_express.txt 文件后，按照范例运行命令，查看结果是否与教程一致。

## 4.7  正规表示法总结
### 正规表示法总结

下表是正规表示法的 *语法总结* 。

<table border="1">
<tr>
<th> * 特殊字符 * </th>
<th> * 表示意义 * </th>
</tr>
<tr>
<td> ^word </td>
<td> 待搜寻的字符在行首 </td>
</tr>
<tr>
<td> word$ </td>
<td> 待搜寻的字符在行尾 </td>
</tr>
<tr>
<td> . </td>
<td> 匹配任何一个可能的字符 </td>
</tr>
<tr>
<td> / </td>
<td> 跳脱符号将特殊字符变成普通字符 </td>
</tr>
<tr>
<td> ? </td>
<td> 任何一个单一字符 </td>
</tr>
<tr>
<td> * </td>
<td> 匹配模式中重复的字符 </td>
</tr>
<tr>
<td> [list] </td>
<td> 列表中的字符 </td>
</tr>
<tr>
<td> [range] </td>
<td> 列表中范围内的字符 </td>
</tr>
<tr>
<td> [^range] </td>
<td> 反向选择，与 [list] 相反 </td>
</tr>
<tr>
<td> /{n/} </td>
<td> 与前一个相同字符连续 n 个 </td>
</tr>
<tr>
<td> /{n,m/} </td>
<td> 与前一个相同字浮连续 n-m 个 </td>
</tr>
</table>

特别需要注意的是： *正规表示法的特殊字符与一般在指令列输入指令的万用字符并不相同* 。

例如，在万用字符当中， * 代表的是 0 ~ 无限多个字符的意思，但是在正规表示法当中， 则是重复前一个字符的意思。使用的意义并不相同，不要搞混了。

 ***建议*** ：使用规则表达式要 *养成良好的习惯* ，就是 *在匹配模式的两端加上单引号‘’* 。这样和shell的文件通配符号做区别。

# 5 sed命令详解

## 5.1  sed命令介绍
### sed命令介绍

sed 是一种在线编辑器，它一次处理一行内容。处理时，把当前处理的行存储在临时缓冲区中，称为“模式空间”（pattern space），接着用sed命令处理缓冲区中的内容，处理完成后，把缓冲区的内容送往屏幕。接着处理下一行，这样不断重复，直到文件末尾。文件内容并没有 改变，除非你使用重定向存储输出。 *sed主要用来自动编辑一个或多个文件；简化对文件的反复操作；编写转换程序等* 。

####  *sed使用参数*

```bash
sed [-nefr] [动作]

选项与参数：
-n ：使用安静(silent)模式。在一般 sed 的用法中，所有来自 STDIN 的数据一般都会被列出到终端上。但如果加上 -n 参数后，则只有经过sed 特殊处理的那一行(或者动作)才会被列出来。
-e ：直接在命令列模式上进行 sed 的动作编辑；
-f ：直接将 sed 的动作写在一个文件内， -f filename 则可以运行 filename 内的 sed 动作；
-r ：sed 的动作支持的是延伸型正规表示法的语法。(默认是基础正规表示法语法)
-i ：直接修改读取的文件内容，而不是输出到终端。

动作说明： [n1[,n2]]function
n1, n2 ：不见得会存在，一般代表『选择进行动作的行数』，举例来说，如果我的动作是需要在 10 到 20 行之间进行的，则『 10,20[动作行为] 』

function：
a ：新增， a 的后面可以接字串，而这些字串会在新的一行出现(目前的下一行)～
c ：取代， c 的后面可以接字串，这些字串可以取代 n1,n2 之间的行！
d ：删除，因为是删除啊，所以 d 后面通常不接任何咚咚；
i ：插入， i 的后面可以接字串，而这些字串会在新的一行出现(目前的上一行)；
p ：列印，亦即将某个选择的数据印出。通常 p 会与参数 sed -n 一起运行
s ：取代，可以直接进行取代的工作哩！通常这个 s 的动作可以搭配正规表示法！例如 1,20s/old/new/g 就是啦！
```

## 5.2  以行为单位的新增/删除
### 以行为单位的新增/删除

 ***范例1*** ：将 /etc/passwd 的内容列出并且列印行号，同时将第 2~5 行删除。

```bash
$ nl /etc/passwd | sed '2,5d'
1 root:x:0:0:root:/root:/bin/bash
6 sync:x:5:0:sync:/sbin:/bin/sync
7 shutdown:x:6:0:shutdown:/sbin:/sbin/shutdown
.....(后面省略).....
```

sed 的动作为 '2,5d' ，那个 d 就是删除！因为 2-5 行给他删除了，所以显示的数据就没有 2-5 行啦！ 另外，注意一下，原本应该是要下达 sed -e 才对，没有 -e 也行啦！同时也要注意的是， sed 后面接的动作，请务必以 '' 两个单引号括住喔！

 ***范例2*** ：删除第 3 行到最后一行。

```bash
$ nl /etc/passwd | sed '3,$d'
```

 ***范例3*** ：在第2行后(亦即是加在第3行)加上 "drink tea" 字样。

```bash
$ nl /etc/passwd | sed '2a drink tea'
1 root:x:0:0:root:/root:/bin/bash
2 bin:x:1:1:bin:/bin:/sbin/nologin
drink tea
3 daemon:x:2:2:daemon:/sbin:/sbin/nologin
.....(后面省略).....
```

 ***范例4*** ：在第二行前加上 "drink tea" 字样。

```bash
$ nl /etc/passwd | sed '2i drink tea'
1 root:x:0:0:root:/root:/bin/bash
drink tea
2 bin:x:1:1:bin:/bin:/sbin/nologin
3 daemon:x:2:2:daemon:/sbin:/sbin/nologin
.....(后面省略).....
```

 ***范例5*** ：增加两行以上，在第二行后面加入两行字，例如 "Drink tea or ....." 与 "drink beer ?"。

```bash
$ nl /etc/passwd | sed '2a Drink tea or ......\
> drink beer ?'
1 root:x:0:0:root:/root:/bin/bash
2 bin:x:1:1:bin:/bin:/sbin/nologin
Drink tea or ......
drink beer ?
3 daemon:x:2:2:daemon:/sbin:/sbin/nologin
.....(后面省略).....
```

每一行之间都必须要以反斜杠 "\" 来进行新行的添加喔！所以，上面的例子中，我们可以发现在第一行的最后面就有 \ 存在。



## 5.3  以行为单位的替换与显示
### 以行为单位的替换与显示

 ***范例1*** ：将第2-5行的内容取代成为 "No 2-5 number"。

```bash
$ nl /etc/passwd | sed '2,5c No 2-5 number'
1 root:x:0:0:root:/root:/bin/bash
No 2-5 number
6 sync:x:5:0:sync:/sbin:/bin/sync
.....(后面省略).....
```

现在我们就知道如何将 *数据整行替换* 了！

 ***范例2*** ：仅列出 /etc/passwd 文件内的第 5-7 行。

```bash
$ nl /etc/passwd | sed -n '5,7p'
5 lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
6 sync:x:5:0:sync:/sbin:/bin/sync
7 shutdown:x:6:0:shutdown:/sbin:/sbin/shutdown
```

通过这个 sed 的以行为单位的显示功能， 就能够 *将某一个文件内的某些行号选择出来显示* 。



## 5.4  数据的搜寻并显示
### 数据的搜寻并显示

 ***范例1*** ：搜索 /etc/passwd有root关键字的行。

```bash
$ nl /etc/passwd | sed '/root/p'
1  root:x:0:0:root:/root:/bin/bash
1  root:x:0:0:root:/root:/bin/bash
2  daemon:x:1:1:daemon:/usr/sbin:/bin/sh
3  bin:x:2:2:bin:/bin:/bin/sh
4  sys:x:3:3:sys:/dev:/bin/sh
5  sync:x:4:65534:sync:/bin:/bin/sync
....下面忽略
```

如果root找到，除了输出所有行，还会输出匹配行。

 ***范例2*** ：只打印包含模板的行。

```bash
$ nl /etc/passwd | sed -n '/root/p'
1  root:x:0:0:root:/root:/bin/bash
```



## 5.5  数据的搜寻并删除
### 数据的搜寻并删除

 ***范例1*** ：删除/etc/passwd所有包含root的行，其他行输出。

```bash
$ nl /etc/passwd | sed  '/root/d'
2  daemon:x:1:1:daemon:/usr/sbin:/bin/sh
3  bin:x:2:2:bin:/bin:/bin/sh
....下面忽略
```

可以看到输出中第一行的匹配root已经删除了。（ *但实际上源文件中并没有删除* ）



## 5.6  数据的搜寻并执行命令
### 数据的搜寻并执行命令

 ***范例1*** ：找到匹配模式eastern的行后，搜索/etc/passwd,找到root对应的行，执行后面花括号中的一组命令，每个命令之间用分号分隔，这里把bash替换为blueshell，再输出该行。

```bash
nl /etc/passwd | sed -n '/root/{s/bash/blueshell/;p}'
1  root:x:0:0:root:/root:/bin/blueshell
```

 ***范例2*** ：如果只替换/etc/passwd的第一个bash关键字为blueshell，就退出。

```bash
nl /etc/passwd | sed -n '/bash/{s/bash/blueshell/;p;q}'
1  root:x:0:0:root:/root:/bin/blueshell
```

最后的 q 是退出的意思。



## 5.7  数据的搜寻并替换
### 数据的搜寻并替换

除了整行的处理模式之外，  *sed 还可以用行为单位进行部分数据的搜寻并替换* 。基本上 sed 的搜寻与替换的与 vi 相当的类似，其使用方法为：

```bash
sed 's/要被取代的字串/新的字串/g'
```

先观察原始信息，利用 /sbin/ifconfig 查询 IP：

```bash
$ /sbin/ifconfig eth0
eth0 Link encap:Ethernet HWaddr 00:90:CC:A6:34:84
inet addr:192.168.1.100 Bcast:192.168.1.255 Mask:255.255.255.0
inet6 addr: fe80::290:ccff:fea6:3484/64 Scope:Link
UP BROADCAST RUNNING MULTICAST MTU:1500 Metric:1
.....(以下省略).....
```

打印出本机的ip是 *192.168.1.100* 。

 ***第一步*** ：下面 *将 IP 前面的部分予以删除* ：

```bash
$ /sbin/ifconfig eth0 | grep 'inet addr' | sed 's/^.*addr://g'
192.168.1.100 Bcast:192.168.1.255 Mask:255.255.255.0
```

 ***第二步*** ：接下来则是 *删除 IP 后面的部分* ：

```bash
$ /sbin/ifconfig eth0 | grep 'inet addr' | sed 's/^.*addr://g' | sed 's/Bcast.*$//g'
192.168.1.100
```



## 5.8  多点编辑
### 多点编辑

 ***范例1*** ：一条sed命令，删除/etc/passwd第三行到末尾的数据，并把bash替换为blueshell。

```bash
$ nl /etc/passwd | sed -e '3,$d' -e 's/bash/blueshell/'
1  root:x:0:0:root:/root:/bin/blueshell
2  daemon:x:1:1:daemon:/usr/sbin:/bin/sh
```

-e表示 *多点编辑* ，第一个编辑命令删除/etc/passwd第三行到末尾的数据，第二条命令搜索bash替换为blueshell。


## 5.9  直接修改文件内容
### 直接修改文件内容

 *sed 可以直接修改文件的内容* ，不必使用管道命令或数据流重导向。不过，由于 *这个动作会直接修改到原始的文件* ，所以请你千万不要随便拿系统配置来测试！ 我们还是使用那个 regular_express.txt 文件来测试看看吧！

 ***范例1*** ：利用 sed 将 regular_express.txt 内每一行结尾若为 . 则换成 ! 。

```bash
$ sed -i 's/\.$/\!/g' regular_express.txt
```

 ***范例2*** ：利用 sed 直接在 regular_express.txt 最后一行加入 “# This is a test” 。

```bash
$ sed -i '$a # This is a test' regular_express.txt
```

由于 $ 代表的是最后一行，而 a 的动作是新增，因此该文件最后新增 “# This is a test” ！

 *sed 的“ -i ”选项可以直接修改文件内容* ，这功能非常有帮助！举例来说，如果你有一个 100 万行的文件，你要在第 100 行加某些文字，此时使用 vim 可能会疯掉！因为文件太大了！那怎办？就利用 sed 啊！通过 sed 直接修改/替换的功能，你甚至不需要使用 vim 去修订！


# 6  awk命令详解

## 6.1  awk命令简介
### awk命令简介

 *awk* 是一个强大的文本分析工具，相对于grep的查找，sed的编辑，awk在其 *对数据分析并生成报告* 时，显得尤为强大。简单来说 *awk就是把文件逐行的读入，以空格为默认分隔符将每行切片，切开的部分再进行各种分析处理* 。

 *awk* 有3个不同版本: awk、nawk和gawk，未作特别说明，一般指 *gawk* ， *gawk 是 AWK 的 GNU 版本* 。

 *awk* 其名称得自于它的创始人 Alfred Aho 、Peter Weinberger 和 Brian Kernighan 姓氏的首个字母。 *实际上 AWK 的确拥有自己的语言： AWK 程序设计语言* ， 三位创建者已将它正式定义为“样式扫描和处理语言”。它允许您创建简短的程序，这些程序读取输入文件、为数据排序、处理数据、对输入执行计算以及生成报表，还有无数其他的功能。

 *awk*  使用方法：

```bash
awk '{pattern + action}' {filenames}
```

尽管操作可能会很复杂，但语法总是这样，其中  *pattern 表示 AWK 在数据中查找的内容，而 action 是在找到匹配内容时所执行的一系列命令* 。花括号（{}）不需要在程序中始终出现，但它们用于根据特定的模式对一系列指令进行分组。pattern就是要表示的正规表示法，用斜杠括起来。

 *awk语言的最基本功能是在文件或者字符串中基于指定规则浏览和抽取信息，awk抽取信息后，才能进行其他文本操作。* 完整的awk脚本通常用来格式化文本文件中的信息。

通常， *awk是以文件的一行为处理单位的* 。awk每接收文件的一行，然后执行相应的命令，来处理文本。

## 6.2  调用awk
### 调用awk

有三种方式调用awk。

####  ***1.命令行方式***

```bash
awk [-F  field-separator]  'commands'  input-file(s)
```

其中， *commands 是真正awk命令，[-F域分隔符]是可选的。 input-file(s) 是待处理的文件* 。

在awk中，文件的每一行中，由域分隔符分开的每一项称为一个域。通常，在不指名-F域分隔符的情况下，默认的域分隔符是空格。

####  ***2.shell脚本方式***

将所有的awk命令插入一个文件，并使awk程序可执行，然后awk命令解释器作为脚本的首行，一遍通过键入脚本名称来调用。

相当于shell脚本首行的： *#!/bin/sh*

可以换成： *#!/bin/awk*

####  ***3.文件调用方式***

将所有的awk命令插入一个单独文件，然后调用：

```bash
awk -f awk-script-file input-file(s)
```

其中，-f选项加载awk-script-file中的awk脚本，input-file(s)跟上面的是一样的。

本课程 *重点介绍命令行方式* 。

## 6.3  入门实例
### 入门实例

假设last -n 5的输出如下：

```bash
$ last -n 5 <==仅取出前五行
root     pts/1   192.168.1.100  Tue Feb 10 11:21   still logged in
root     pts/1   192.168.1.100  Tue Feb 10 00:46 - 02:28  (01:41)
root     pts/1   192.168.1.100  Mon Feb  9 11:41 - 18:30  (06:48)
dmtsai   pts/1   192.168.1.100  Mon Feb  9 11:41 - 11:41  (00:00)
root     tty1                   Fri Sep  5 14:09 - 14:10  (00:01)
```

 ***范例1*** ：只显示最近登录的5个帐号。

```bash
$ last -n 5 | awk  '{print $1}'
root
root
root
dmtsai
root
```

 *awk工作流程* 是这样的：读入有'\n'换行符分割的一条记录，然后将记录按指定的域分隔符划分域，填充域，$0则表示所有域，$1表示第一个域，$n表示第n个域。默认域分隔符是"空白键" 或 "[tab]键"，所以$1表示登录用户，$3表示登录用户ip，以此类推。

 ***范例2*** ：只显示/etc/passwd的账户。

```bash
#cat /etc/passwd |awk  -F ':'  '{print $1}'
root
daemon
bin
sys
```

这种是awk+action的示例，每行都会执行action{print $1}。

-F指定域分隔符为':'。

 ***范例3*** ：只显示/etc/passwd的账户和账户对应的shell，而账户与shell之间以tab键分割。

```bash
$ cat /etc/passwd |awk  -F ':'  '{print $1"\t"$7}'
root    /bin/bash
daemon  /bin/sh
bin     /bin/sh
sys     /bin/sh
```

 ***范例4*** ：只显示/etc/passwd的账户和账户对应的shell，而账户与shell之间以逗号分割，而且在所有行添加列名name,shell,在最后一行添加"blue,/bin/nosh"。

```bash
$ cat /etc/passwd |awk  -F ':'  'BEGIN {print "name,shell"}  {print $1","$7} END {print "blue,/bin/nosh"}'
name,shell
root,/bin/bash
daemon,/bin/sh
bin,/bin/sh
sys,/bin/sh
....
blue,/bin/nosh
```

 *本例中awk工作流程是这样的* ：先执行BEGING，然后读取文件，读入有/n换行符分割的一条记录，然后将记录按指定的域分隔符划分域，填充域，$0则表示所有域,$1表示第一个域,$n表示第n个域,随后开始执行模式所对应的动作action。接着开始读入第二条记录······直到所有的记录都读完，最后执行END操作。

 ***范例5*** ：搜索/etc/passwd有root关键字的所有行。

```bash
$ awk -F: '/root/' /etc/passwd
root:x:0:0:root:/root:/bin/bash
```

这种是pattern的使用示例，匹配了pattern(这里是root)的行才会执行action(没有指定action，默认输出每行的内容)。

 ***范例6*** ：搜索/etc/passwd以root为开头的所有行（用正则表示法）。

```bash
$ awk -F: '/^root/' /etc/passwd
```

 ***范例7*** ：搜索/etc/passwd有root关键字的所有行，并显示对应的shell.

```bash
$ awk -F: '/root/{print $7}' /etc/passwd
/bin/bash
```

这里指定了action{print $7}。



## 6.4  awk内置变量
### awk内置变量

awk有许多 *内置变量用来设置环境信息* ，这些变量可以被改变，下面给出了最常用的一些变量。

```bash
ARGC               命令行参数个数
ARGV               命令行参数排列
ENVIRON            支持队列中系统环境变量的使用
FILENAME           awk浏览的文件名
FNR                浏览文件的记录数
FS                 设置输入域分隔符，等价于命令行 -F选项
NF                 浏览记录的域的个数
NR                 已读的记录数
OFS                输出域分隔符
ORS                输出记录分隔符
RS                 控制记录分隔符
```

此外， *$0变量是指整条记录，$1表示当前行的第一个域，$2表示当前行的第二个域* ，......以此类推。

 ***范例1*** ：统计/etc/passwd：文件名，每行的行号，每行的列数，对应的完整行内容。

```bash
$ awk  -F ':'  '{print "filename:" FILENAME ",linenumber:" NR ",columns:" NF ",linecontent:"$0}' /etc/passwd
filename:/etc/passwd,linenumber:1,columns:7,linecontent:root:x:0:0:root:/root:/bin/bash
filename:/etc/passwd,linenumber:2,columns:7,linecontent:daemon:x:1:1:daemon:/usr/sbin:/bin/sh
filename:/etc/passwd,linenumber:3,columns:7,linecontent:bin:x:2:2:bin:/bin:/bin/sh
filename:/etc/passwd,linenumber:4,columns:7,linecontent:sys:x:3:3:sys:/dev:/bin/sh
```

 ***范例2*** ：使用printf替代print，让代码更加简洁易读。

```bash
$ awk  -F ':'  '{printf("filename:%10s,linenumber:%s,columns:%s,linecontent:%s\n",FILENAME,NR,NF,$0)}' /etc/passwd
```



## 6.5  print和printf
### print和printf

awk中同时提供了 *print和printf两种打印输出* 的函数。

其中 *print函数的参数可以是变量、数值或者字符串* 。字符串必须用双引号引用，参数用逗号分隔。如果没有逗号，参数就串联在一起而无法区分。这里，逗号的作用与输出文件的分隔符的作用是一样的，只是后者是空格而已。

 *printf函数，其用法和c语言中printf基本相似* ，可以格式化字符串，输出复杂时，printf更加好用，代码更易懂。

## 6.6  awk编程
### awk编程

awk编程的内容极多，这里只罗列简单常用的用法。

####  ***变量和赋值***

除了awk的内置变量，awk还可以自定义变量。

 ***范例1*** ：统计/etc/passwd的账户人数。

```bash
$ awk '{count++;print $0;} END{print "user count is ", count}' /etc/passwd
root:x:0:0:root:/root:/bin/bash
......
user count is  40
```

count是自定义变量。之前的action{}里都是只有一个print,其实print只是一个语句，而action{}可以有多个语句，以;号隔开。

这里没有初始化count，虽然默认是0，但是妥当的做法还是初始化为0:

```bash
$ awk 'BEGIN {count=0;print "[start]user count is ", count} {count=count+1;print $0;} END{print "[end]user count is ", count}' /etc/passwd
[start]user count is  0
root:x:0:0:root:/root:/bin/bash
...
[end]user count is  40
```

 ***范例2*** ：统计某个文件夹下的文件占用的字节数。

```bash
$ ls -l |awk 'BEGIN {size=0;} {size=size+$5;} END{print "[end]size is ", size}'
[end]size is  8657198
```

如果以M为单位显示：

```bash
$ ls -l |awk 'BEGIN {size=0;} {size=size+$5;} END{print "[end]size is ", size/1024/1024,"M"}'
[end]size is  8.25889 M
```

注意，统计不包括文件夹的子目录。

####  ***条件语句***

awk中的条件语句是从C语言中借鉴来的，见如下声明方式：

```bash
if (expression) {
    statement;
    statement;
    ... ...
}
```

```bash
if (expression) {
    statement;
} else {
    statement2;
}
```

```bash
if (expression) {
    statement1;
} else if (expression1) {
    statement2;
} else {
    statement3;
}
```

 ***范例3*** ：统计某个文件夹下的文件占用的字节数，过滤4096大小的文件(一般都是文件夹)：

```bash
$ ls -l |awk 'BEGIN {size=0;print "[start]size is ", size} {if($5!=4096){size=size+$5;}} END{print "[end]size is ", size/1024/1024,"M"}'
[end]size is  8.22339 M
```

####  ***循环语句***

awk中的循环语句同样借鉴于C语言，支持while、do/while、for、break、continue，这些关键字的语义 *和C语言中的语义完全相同* 。

####  ***数组***

 因为awk中数组的下标可以是数字和字母，数组的下标通常被称为关键字(key)。值和关键字都存储在内部的一张针对key/value应用hash的表格里。由于hash不是顺序存储，因此在显示数组内容时会发现，它们并不是按照你预料的顺序显示出来的。数组和变量一样，都是在使用时自动创建的，awk也同样会自动判断其存储的是数字还是字符串。

一般而言， *awk中的数组用来从记录中收集信息，可以用于计算总和、统计单词以及跟踪模板被匹配的次数等等* 。

 ***范例4*** ：显示/etc/passwd的账户

```bash
$ awk -F ':' 'BEGIN {count=0;} {name[count] = $1;count++;}; END{for (i = 0; i < NR; i++) print i, name[i]}' /etc/passwd
0 root
1 daemon
2 bin
3 sys
4 sync
5 games
......
```

这里使用for循环遍历数组。