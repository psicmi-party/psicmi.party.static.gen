#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

dist_path=docs/.vuepress/dist # 打包生成的文件夹路径

# 生成静态文件
npm run build

# 生成repo的readme.md
cp PAGES.MD $dist_path/README.MD

# 进入生成的文件夹
cd $dist_path

# deploy to github
echo 'psicmi.party' > CNAME
if [ -z "$PSICMI_PARTY_TOKEN" ]; then
  echo 'no token'
  commit_info='psicmi.party'
  push_addr=git@github.com:psicmi-party/psicmi-party.github.io.git
else
  echo 'with token'
  commit_info='psicmi-party/psicmi.party.static.gen'
  push_addr=https://psicmi-party:${PSICMI_PARTY_TOKEN}@github.com/psicmi-party/psicmi-party.github.io.git
  git config --global init.defaultBranch "master"
  git config --global user.name "psicmi@163.com"
  git config --global user.email "psicmi@163.com"
fi
git init
git add -A
git commit -m "deployed by $commit_info"
git push -f $push_addr master:master

cd -
rm -rf $dist_path

