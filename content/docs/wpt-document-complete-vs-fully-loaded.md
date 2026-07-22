+++
title = "WPT Document Complete vs Fully Loaded"
date = 2021-08-03T09:21:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "TECH"]
tags = ["WEB", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "66050279-cc35-4499-8461-e3deed354e91"
notion_url = "https://app.notion.com/p/WPT-Document-Complete-vs-Fully-Loaded-66050279cc3544998461e3deed354e91"
external_url = "https://blog.naver.com/PostView.nhn?blogId=sehyunfa&logNo=222181301130&categoryNo=22&parentCategoryNo=0&viewDate=&currentPage=1&postListTopCurrentPage=1&from=search"
+++

> 원문이 비어 있음. 외부 참고만 유지.

## WPT: Document Complete vs Fully Loaded

- **Document Complete**: `window.onload` 시점 (DOM + 동기 리소스)
- **Fully Loaded**: onload 이후 2초간 네트워크 유휴까지 (비동기·지연 로딩 포함)

성능 비교 시 Fully Loaded가 체감에 가깝고, Document Complete는 초기 렌더 기준.

참고: [https://blog.naver.com/PostView.nhn?blogId=sehyunfa&logNo=222181301130](https://blog.naver.com/PostView.nhn?blogId=sehyunfa&logNo=222181301130)
