+++
title = "Git 이슈 기반 버전 관리 워크플로우"
date = 2021-08-10T14:39:00Z
updated = 2026-07-21T06:32:00Z
categories = ["TECH"]
tags = ["GIT"]
toc = true

[extra]
source = "notion"
notion_id = "492cd10c-509a-4183-88d7-76f723405600"
notion_url = "https://app.notion.com/p/Git-492cd10c509a418388d776f723405600"
external_url = "https://www.huskyhoochu.com/issue-based-version-control-201"
+++

이슈 페이지 타임라인에 작업·커밋·PR을 묶어 추적.

## GitHub

- Repository 생성 → Projects(To Do/In Progress/Done) → Labels/Milestones → New Issue

## Local

```bash
git init
git remote add origin <url>
git checkout -b <이슈번호-설명>
git push -u origin <브랜치>
# 작업 후
git add . && git commit -m "[#N] 제목\n\nResolves #N"
git push
# 병합
git rebase master && git checkout master && git pull --rebase
git merge <브랜치>
# 정리
git push origin -d <브랜치> && git branch -d <브랜치>
```
