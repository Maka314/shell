# Shell脚本库

## 这是什么

这是一个脚本库，主要是简化平时一些需要重复执行的操作以及减少对于繁杂命令的记忆量。

## 能做什么

目前能一键安装`git`并设置用户名和邮箱，这样你就能开开心心的推送代码更改。
你可以在这里找到它`shell/initializeTool/git_setup.sh`
以及一个可能能够帮助你简化一些安装流程的脚本`shell/initializeTool/install.sh`

## 如何使用

复制或下载你想使用的脚本，在工作目录下创建sh脚本文件，通过如下命令修改文件权限：

```
sudo chmod +x theFileName.sh
```

具备权限后，执行脚本即可。部分脚本可能有命令行输入需求，请注意观察

```
./theFileName.sh
```
