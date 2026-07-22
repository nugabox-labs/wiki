+++
title = "Git Workflow"
date = 2021-08-30T07:31:00Z
updated = 2026-07-21T06:47:00Z
categories = ["TECH"]
tags = ["GIT", "TIL", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "1c980957-6b5b-4a4e-9e9d-7c49fc9f8cdf"
notion_url = "https://app.notion.com/p/Git-Workflow-1c9809576b5b4a4e9e9d7c49fc9f8cdf"
external_url = "https://velog.io/@scy0334/TIL200831Git-Workflow"
+++

## 기초

```bash
git clone <URL> .
git add .
git add <file>
git reset HEAD <file>
git commit -m "msg"
git reset --soft HEAD^
git reset HEAD^
git push [remote] [branch]
```

## 페어 원격

```bash
git clone <URL>
git remote add pair <pair-URL>
git remote -v
git add .
git commit -m 'change'
git push origin master
git pull pair master
```

## Conflict

- pull/merge 전 working·staging dirty → abort 후 `git status` → commit 또는 stash
- 잘못된 쪽으로 merge하면 `Everything up-to-date` → 양쪽 재commit 후 pull, 또는 `git revert`로 merge 되돌리기
