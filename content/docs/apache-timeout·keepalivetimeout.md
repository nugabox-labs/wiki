+++
title = "Apache Timeout·KeepAliveTimeout"
date = 2021-03-19T01:53:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["WEB"]
toc = true

[extra]
source = "notion"
notion_id = "279b2ce4-955b-4d7d-a6a7-3ab4e8fa6ee5"
notion_url = "https://app.notion.com/p/Apache-Timeout-KeepAliveTimeout-279b2ce4955b4d7da6a73ab4e8fa6ee5"
external_url = "https://sncap.tistory.com/735"
+++

## Timeout

비활성 연결 유지 시간(초).

- Apache 2.2 기본: 300
- Apache 2.4 기본: 60

```javascript
Timeout 60
```

## KeepAliveTimeout

`KeepAlive On`일 때, 다음 요청 대기 시간.

- 공식 기본값: **5초** (2.2·2.4 모두 초 단위)
- 설정 전 해당 버전 문서 확인 권장

```javascript
KeepAlive On
KeepAliveTimeout 5
```
