#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

# 生成静态文件
npm run docs:build

# 进入生成的文件夹
cd .vuepress/dist

# 如果是发布到自定义域名
echo 'review-notes.top' > CNAME

git init
git add -A
git commit -m 'deploy'

# 如果发布到 https://GourdErwa.github.io
# git push -f git@github.com:GourdErwa/review-notes.git master

# 如果发布到 https://GourdErwa.github.io/<REPO>
git push -f git@github.com:GourdErwa/review-notes.git master:gh-pages

cd -