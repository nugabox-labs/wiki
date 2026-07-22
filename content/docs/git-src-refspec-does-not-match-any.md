+++
title = "Git src refspec does not match any"
date = 2022-04-30T04:24:00Z
updated = 2026-07-21T06:47:00Z
categories = ["TECH"]
tags = ["GIT", "ISSUE"]
toc = true

[extra]
source = "notion"
notion_id = "3fac89c4-d73e-458d-a067-33efa31b70f1"
notion_url = "https://app.notion.com/p/Git-src-refspec-does-not-match-any-3fac89c4d73e458da06733efa31b70f1"
external_url = "https://velog.io/@kimiszero/github-src-refspec-master-does-not-match-any-%ED%95%B4%EA%B2%B0%EB%B0%A9%EB%B2%95"
+++

로컬에 `master`/`main` 커밋이 없거나 브랜치명이 안 맞을 때 `git push` 실패.

## 개인 프로젝트

```bash
git clone https://github.com/<user>/<repo>.git
# 변경분만 복사해 사용
```

## 처음부터 올리기

```bash
git init
git branch -m main
git remote add origin https://github.com/<user>/<repo>.git
git add .
git commit -m "first commit"
git push -u origin main
```

## 팀·권한

clone은 되고 push만 실패 → write 권한 확인.

기본 브랜치는 `main` (`master` 우회 비권장).
