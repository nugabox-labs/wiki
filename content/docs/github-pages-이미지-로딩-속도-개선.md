+++
title = "GitHub Pages 이미지 로딩 속도 개선"
date = 2021-04-08T02:31:00Z
updated = 2026-07-21T06:47:00Z
categories = ["TECH"]
tags = ["GIT"]
toc = true

[extra]
source = "notion"
notion_id = "01779133-abac-4595-8a48-ad186a768493"
notion_url = "https://app.notion.com/p/GitHub-Pages-01779133abac45958a48ad186a768493"
external_url = "https://derek-mun.com/contents/Contents-Github-page-image-loading-speed.html"
+++

## GitHub Pages 이미지 로딩 속도 개선 (jsDelivr CDN)

GitHub raw/pages 이미지는 로딩이 느림(ping ~60ms, wget 수초). jsDelivr CDN 경유 시 대폭 개선.

```javascript
https://cdn.jsdelivr.net/gh/{계정명}/{레파지토리명}/{파일경로}
```

- GitHub storage가 Public이면 별도 설정 없이 바로 사용 가능
- 해당 경로에 파일이 없으면 최초 1회 GitHub에서 가져온 뒤 캐시, 이후 빠르게 서빙됨
