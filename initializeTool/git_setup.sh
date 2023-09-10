#!/bin/bash

# Update package
echo "Updating..."
sudo apt update

# Check if Git is already installed

if ! command -v git &> /dev/null; then
    echo "Git is not installed. Installing..."
    
    # Depending on the Linux distribution, use different package management tools for installation.
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

# Set Git username and email
git config --global user.name "$userName"
git config --global user.email "$mail"

# Output the set Git user information
echo "The Git username that has been set is:"
git config --global user.name

echo "The Git email address that has been set is:"
git config --global user.email