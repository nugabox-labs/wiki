+++
title = "Burp Suite 프록시·Repeater"
date = 2021-03-18T01:55:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["NETWORK"]
toc = true

[extra]
source = "notion"
notion_id = "b4d497db-5d54-4f2f-90f1-adbc8210017b"
notion_url = "https://app.notion.com/p/Burp-Suite-Repeater-b4d497db5d544f2f90f1adbc8210017b"
+++

## 프록시 리스너

1. Proxy → Options → Proxy Listeners에 `127.0.0.1:<port>` 추가
1. macOS: 시스템 설정 → 네트워크 → 고급 → 프록시 → HTTP/HTTPS에 동일 주소
1. Proxy → Intercept → **Intercept is on**

## Repeater

1. Intercept Request 복사 → Repeater 탭에 붙여넣기
1. Target 지정 후 Request 수정 → Send → Response 확인

예: `GET /setStats.do?...` → `OPTIONS /setStats.do?...` → 403 등 응답 검증
