#!/bin/bash

cd SeconFun

current_branch=$(git rev-parse --abbrev-ref HEAD)

local_commit=$(git rev-parse "$current_branch")
remote_commit=$(git ls-remote origin -h "refs/heads/$current_branch" | cut -f1)

if [ "$local_commit" != "$remote_commit" ]; then
    echo "There is a update"
    git pull
else
    echo "No need to update"
fi

