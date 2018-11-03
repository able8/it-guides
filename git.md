
## 5.7 解决冲突
### 解决冲突

在上节中*master*分支和*feature1*分支各自都分别有新的提交，变成了这样：

<img src="images/55d301543ad79a1b05dcc4e2/1-5-7/resolve01.png" />

这种情况下，Git无法执行“快速合并”，只能试图把各自的修改合并起来，但这种合并就可能会有冲突，执行*git merge feature1*,在看readme.txt：

```javascript
<<<<<<< HEAD
Creating a new branch is quick &amp; simple.
=======
Creating a new branch is quick AND simple.
>>>>>>> feature1
```

我们把冲突的内容修改为*Creating a new branch is quick and simple.*，提交：

```javascript
$ git add readme.txt
$ git commit -m "conflict fixed"
```

现在，master分支和feature1分支变成了下图所示：

<img src="images/55d301543ad79a1b05dcc4e2/1-5-7/resolve02.png" />

用带参数的git log也可以看到分支的合并情况：

```javascript
$ git log --graph --pretty=oneline --abbrev-commit
```

最后，删除feature1分支：

```javascript
$ git branch -d feature1
Deleted branch feature1.
```

冲突解决，最后，删除feature1分支* git branch -d feature1*。当Git无法自动合并分支时，就必须首先解决冲突。解决冲突后，再提交，合并完成。

用*git log --graph*命令可以看到分支合并图。


