#!/bin/bash

# 更新软件包
echo "Updating..."
sudo apt update

# 检查是否已经安装了Git

if ! command -v git &> /dev/null; then
    echo "Git is not installed. Installing..."
    
    # 根据不同的Linux发行版，使用不同的包管理工具进行安装
    if command -v apt-get &> /dev/null; then
        sudo apt-get update
        sudo apt-get install -y git
    elif command -v yum &> /dev/null; then
        sudo yum update
        sudo yum install -y git
    elif command -v dnf &> /dev/null; then
        sudo dnf install -y git
    else
        echo "Unsupported package manager. Please install Git manually."
        exit 1
    fi

    echo "Git has been installed."
else
    echo "Git is already installed."
fi

echo "Please enter your github name, leave it blank to use defult 'mingchen'"
read userName
if [ -z "$userName" ]; then
    userName="mingchen"
fi

echo "Please enter your github email, leave it blank to use defult"
read mail
if [ -z "$mail" ]; then
    mail="traveller31415@gmail.com"
fi

# 设置Git的用户名和邮箱
git config --global user.name "$userName"
git config --global user.email "$mail"

# 输出已设置的Git用户信息
echo "已设置的Git用户名："
git config --global user.name

echo "已设置的Git邮箱地址："
git config --global user.email