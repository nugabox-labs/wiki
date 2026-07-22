+++
title = "Git 서브모듈·서브트리"
date = 2025-01-07T07:38:00Z
updated = 2026-07-21T06:47:00Z
categories = ["TECH"]
tags = ["GIT"]
toc = true

[extra]
source = "notion"
notion_id = "174aac4e-32a5-80b5-bdc0-cd270c3eaf58"
notion_url = "https://app.notion.com/p/Git-174aac4e32a580b5bdc0cd270c3eaf58"
+++

## 서브모듈

```bash
git submodule add <repo-url> pg/search
git add .gitmodules pg/search && git commit -m "Add submodule"
git submodule update --init --recursive
# 서브모듈 내부 수정 후
cd pg/search && git add . && git commit && git push
cd ../.. && git add pg/search && git commit && git push
```

## 서브트리

```bash
git subtree add --prefix=pg/search <repo-url> main --squash
git subtree pull --prefix=pg/search <repo-url> main --squash
```

## 서브트리→서브모듈 전환

```bash
git rm -r pg/search
git submodule add <repo-url> pg/search
git submodule update --init --recursive
```
