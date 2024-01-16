#!/bin/bash
# 文件名：deploy.sh
echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"
Date=`date "+%Y-%m-%d %H:%M:%S"`

# Build the project.
hugo

# Go To Public folder
cd public

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site ${Date}"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# setproxy

# Push source and build repos.
git push origin main

# Come Back up to the Project Root
cd ..



#下面是添加源仓库
git add .
msg="rebuilding site ${Date}"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# setproxy

git push origin main