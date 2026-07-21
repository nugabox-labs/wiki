+++
title = "Git Branch를 이용한 협업"
date = 2022-04-23T07:32:00Z
updated = 2026-07-21T02:37:00Z
categories = ["DEV-OPS"]
tags = ["GIT/SVN"]
toc = true

[extra]
source = "notion"
notion_id = "30cb3164-7c8c-4d57-a834-5de9f9329dc6"
notion_url = "https://app.notion.com/p/Git-Branch-30cb31647c8c4d57a8345de9f9329dc6"
+++

## Git Flow 브랜치 구조

- `main` : 배포 이력 관리(태그로 관리)
- `hotfix` : 배포 후 발견된 버그 긴급 수정
- `release` : 배포 준비
- `develop` : 완성된 feature 병합
- `feature` : 기능 개발용(개발자별 작업 브랜치)

## 협업 절차 (feature → develop)

**1) develop 브랜치 생성 및 push**

```bash
git clone [Repository URL]
git branch develop
git push -u origin develop
```

**2) develop 기준 feature 브랜치 생성**

```bash
git branch feature_test develop
git branch
```

**3) 작업 후 commit/push**

```bash
git add test.html
git commit -m "수정내용"
git push --set-upstream origin feature_test
```

**4) Pull Request 생성**: GitHub → Compare & pull request → 대상 브랜치를 develop으로 지정 → 리뷰어/담당자 지정 → Create pull request

**5) 승인 후 병합**: Merge pull request → Confirm merge → 필요 시 Delete branch로 feature 브랜치 정리 (이력 남기려면 유지 가능)

관련: [CLI Git 명령어 정리 #1](https://app.notion.com/p/14d0b8006aec42fc95613242b5469dd8), [#2](https://app.notion.com/p/ea907d96fef24f39ad7989e31c91714f)
