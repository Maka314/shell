#!/bin/bash

REPO_LINK="git@github.com:Maka314/SeconFun.git"
FOLDER_NAME="SeconFun"

if [ -d "$FOLDER_NAME" ]; then
    cd "$FOLDER_NAME"
else
    git clone "$REPO_LINK"
    cd "$FOLDER_NAME"
fi

if screen -ls | grep -q "$FOLDER_NAME"; then
    echo "Screen session '$FOLDER_NAME' is running."
else
    echo "Screen session '$FOLDER_NAME' is not running."
    screen -r "$FOLDER_NAME"
    git pull
    npm install
    npm run build
    npm start
fi

current_branch=$(git rev-parse --abbrev-ref HEAD)

local_commit=$(git rev-parse "$current_branch")
remote_commit=$(git ls-remote origin -h "refs/heads/$current_branch" | cut -f1)

if [ "$local_commit" != "$remote_commit" ]; then
    echo "There is a update"
    screen -X -S "$FOLDER_NAME" quit
    screen -r "$FOLDER_NAME"
    git pull
    npm install
    npm run build
    npm start
else
    echo "No need to update"
fi