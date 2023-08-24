#!/bin/bash

# 安装了一些软件包
# [git, node.js, npm]

# 更新软件包
# sudo apt update

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

# 检查是否已经安装了npm
if ! command -v npm &> /dev/null; then
    echo "npm is not installed. Installing..."

    # 根据不同的Linux发行版，使用不同的包管理工具进行安装
    if command -v apt-get &> /dev/null; then
        sudo apt-get update
        sudo apt-get install -y npm
    elif command -v yum &> /dev/null; then
        sudo yum install -y npm
    elif command -v dnf &> /dev/null; then
        sudo dnf install -y npm
    else
        echo "Unsupported package manager. Please install npm manually."
        exit 1
    fi

    echo "npm has been installed."
else
    echo "npm is already installed."
fi

# # 检查是否已经安装了Node.js
# if ! command -v node &> /dev/null; then
#     echo "Node.js is not installed. Installing..."

#     # 根据不同的Linux发行版，使用不同的包管理工具进行安装
#     if command -v apt-get &> /dev/null; then
#         sudo apt-get update
#         sudo apt-get install -y nodejs
#     elif command -v yum &> /dev/null; then
#         sudo yum install -y nodejs
#     elif command -v dnf &> /dev/null; then
#         sudo dnf install -y nodejs
#     else
#         echo "Unsupported package manager. Please install Node.js manually."
#         exit 1
#     fi

#     echo "Node.js has been installed."
# else
#     echo "Node.js is already installed."
# fi

# 安装nvm
if ! command -v npm &> /dev/null; then
    echo "npm not install"
    curl https://raw.github.com/creationix/nvm/v0.33.11/install.sh | sh
else
    echo "npm is already installed."