+++
title = "Github Actions 배포 자동화"
date = 2022-07-10T15:28:00Z
updated = 2026-07-21T06:47:00Z
categories = ["TECH"]
tags = ["GIT", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "ac63ded3-10a7-41b7-82f6-ea899593b836"
notion_url = "https://app.notion.com/p/Github-Actions-ac63ded310a741b782f6ea899593b836"
external_url = "https://ezcode.kr/board/vuessr/read/14"
+++

## Github Actions 배포 자동화

워크플로 예시 골격:

```yaml
# .github/workflows/deploy.yml
name: Deploy
on:
  push:
    branches: [ main ]
jobs:
  build-deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Build
        run: npm ci && npm run build
      - name: Deploy
        run: echo "배포 스크립트/시크릿은 Actions Secrets에"
```

시크릿·SSH 키 등은 Repository Secrets에만 보관.
