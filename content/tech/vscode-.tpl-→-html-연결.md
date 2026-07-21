+++
title = "VSCode .tpl → HTML 연결"
date = 2023-03-11T13:56:00Z
updated = 2026-07-21T06:47:00Z
categories = ["TECH"]
tags = ["TIP"]
toc = true

[extra]
source = "notion"
notion_id = "a436f675-4193-4ffa-bb28-88cc028264c2"
notion_url = "https://app.notion.com/p/VSCode-tpl-HTML-a436f67541934ffabb2888cc028264c2"
external_url = "https://okayoon.tistory.com/entry/VSCode-%EC%97%90%EB%94%94%ED%84%B0-tpl-%ED%99%95%EC%9E%A5%EC%9E%90-%EC%9D%B8%EC%8B%9D%EB%B0%A9%EB%B2%95%EC%BD%94%EB%93%9C-%ED%99%95%EC%9E%A5%EC%9E%90-%EC%9D%B8%EC%8B%9D%EB%B0%A9%EB%B2%95"
+++

## 현재 파일만

상태바 Plain Text → HTML 선택

## 전역 (settings.json)

`File > Preferences > Settings` → `files.associations` 검색 → Edit in settings.json

```json
"files.associations": {
  "*.tpl": "html"
}
```

다른 확장자도 동일하게 매핑.
