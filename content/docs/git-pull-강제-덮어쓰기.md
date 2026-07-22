+++
title = "git pull 강제 덮어쓰기"
date = 2022-07-11T16:46:00Z
updated = 2026-07-21T06:47:00Z
categories = ["TECH"]
tags = ["GIT"]
toc = true

[extra]
source = "notion"
notion_id = "b560a05c-1373-4e05-8320-460404787b02"
notion_url = "https://app.notion.com/p/git-pull-b560a05c13734e058320460404787b02"
external_url = "https://mosei.tistory.com/entry/GIT-git-pull-%EC%8B%9C-merge-%EC%98%A4%EB%A5%98%EA%B0%80-%EB%82%A0%EB%95%8C-%EA%B0%95%EC%A0%9C-git-pull-%EB%8D%AE%EC%96%B4%EC%93%B0%EA%B8%B0-%EB%B0%A9%EB%B2%95"
+++

## git pull 강제 덮어쓰기 (로컬 변경 폐기)

```bash
git fetch --all
git reset --hard origin/master
git pull
```

> `origin/main` 등 원격 브랜치명에 맞게 변경. 로컬 커밋/변경은 삭제됨.
