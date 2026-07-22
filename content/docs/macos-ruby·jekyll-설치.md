+++
title = "macOS Ruby·Jekyll 설치"
date = 2021-10-18T01:31:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["MACOS"]
toc = true

[extra]
source = "notion"
notion_id = "1ce19726-c64f-4858-be90-57884de808d7"
notion_url = "https://app.notion.com/p/macOS-Ruby-Jekyll-1ce19726c64f4858be9057884de808d7"
+++

## Jekyll 설치 (macOS)

```bash
gem install rdoc
gem install bundler jekyll
```

- `Gem::FilePermissionError` 에러 시: 맥 Ruby 환경 구축 참고

## 새 사이트 생성 및 서버 실행

```bash
jekyll new my-awesome-site
cd my-awesome-site
bundle exec jekyll serve
```
