#!/bin/bash

REPO_LINK="git@github.com:Maka314/SeconFun.git"
FOLDER_NAME="SeconFun"

cd "$FOLDER_NAME" || { echo "Failed to change directory to $FOLDER_NAME"; exit 1; }

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