---
date: 2023-06-20 10:24:00
comment: flase
editLink: false 
---

# 如何清除git提交历史

## 1. 创建新分支

拉取最新 main 分支后，创建一个临时分支

```shell
git clone https://github.com/psicmi-party/psicmi.party.static.gen.git

git checkout --orphan tmp_branch
```

## 2. 添加所有文件并提交更改

```shell
git add -A

git commit -am "rebuild main branch"
```

## 3. 删除原 main 分支

```shell
git branch -D main
```

## 4. 重命名当前分支并强制推送

```shell
git branch -m main

git push -f origin main
```
