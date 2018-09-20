#!/bin/bash
 
echo -e "\033[0;32mDeploying updates\033[0m"

d=$(date +%Y%m%d-%H%M%S) 

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi

# Back up files
cp ~/blog/blog ~/backup/blog/$d -r
cp ~/blog/ca2ju3.coding.me ~/backup/ca2ju3.coding.me/$d -r

# Push Hugo content
git add -A
git commit -m "$msg"
git push origin master

echo -e "\033[0;32mDeploying updates to coding.me...\033[0m"
# Prepare config.toml for coding.me
cp ~/blog/config/config.toml.coding ./config.toml
# Go To Public folder
cd ~/blog/blog/public
# Delete outdated files previously
ls | grep -v .git* | xargs rm -rf
# Go To coding.me folder
cd ~/blog/ca2ju3.coding.me
# Delete outdated files previously
ls | grep -v .git* | xargs rm -rf

# Go To Blog folder
cd ~/blog/blog/

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# sync files to coding
rsync --exclude=.git --exclude=CNAME ~/blog/blog/public/* ~/blog/ca2ju3.coding.me/ -rv

# Go To coding.me folder
cd ~/blog/ca2ju3.coding.me

# Add changes to git.
git add -A

git commit -m "$msg"

# Push source and build repos.
git push origin master

# Go To Blog folder
cd ~/blog/blog

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"
# Prepare config.toml for github.io
cp ~/blog/config/config.toml.github ~/blog/blog/config.toml
# Prepare CNAME for github.io
cp ~/blog/config/CNAME ~/blog/blog/public/

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd ~/blog/blog/public

# Add changes to git.
git add -A

git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ..
