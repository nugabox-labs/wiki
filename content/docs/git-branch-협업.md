+++
title = "Git Branch 협업"
date = 2022-04-23T07:32:00Z
updated = 2026-07-21T06:47:00Z
categories = ["TECH"]
tags = ["GIT"]
toc = true

[extra]
source = "notion"
notion_id = "30cb3164-7c8c-4d57-a834-5de9f9329dc6"
notion_url = "https://app.notion.com/p/Git-Branch-30cb31647c8c4d57a8345de9f9329dc6"
+++

## Git Flow 브랜치

- `main` — 배포 이력(태그)
- `hotfix` — 배포 후 긴급 수정
- `release` — 배포 준비
- `develop` — feature 병합
- `feature` — 기능 개발

## feature → develop

```bash
git clone [Repository URL]
git branch develop
git push -u origin develop

git branch feature_test develop
git add test.html
git commit -m "수정내용"
git push --set-upstream origin feature_test
```

1. GitHub Compare & pull request → base=`develop` → 리뷰어 지정 → Create
1. Merge pull request → Confirm → 필요 시 feature 브랜치 삭제
