+++
title = "WebtoB-Jeus 연동"
date = 2019-10-07T18:11:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["WEB", "WAS"]
toc = true

[extra]
source = "notion"
notion_id = "8066602a-b2ce-4dbd-82b5-be4e12921f2f"
notion_url = "https://app.notion.com/p/WebtoB-Jeus-8066602ab2ce4dbd82b5be4e12921f2f"
external_url = "https://itstory07.tistory.com/539"
+++

## 기동/종료 순서

START: WEB → WAS / STOP: WAS → WEB

## 1) WebtoB `http.m`

```bash
vi /경로/webtob/config/http.m
```

- NODE: `JSVPORT = 9900` (없으면 추가)
- SVRGROUP: `jsvg SVRTYPE = JSV`
- SERVER: `MyGroup SVGNAME = jsvg, MinProc = 20, MaxProc = 20`

## 2) 컴파일·재기동

```bash
wscfl -i http.m
wsdown
wsboot
```

- `http://WEB서버IP:8080/` 확인
- `wsadmin` → `si`: Jeus 연동 전 MyGroup은 `NRDY`

## 3) Jeus 기동

```bash
startDomainAdminServer -u administrator -p <password>
startManagedServer -domain jeus_domain -server server1 -u administrator -p <password>
jeusadmin -u administrator -p <password>
```

웹어드민: `http://localhost:9736/webadmin`

## 4) 웹어드민 WebtoB 등록

- IP: WebtoB 서버 IP
- Thread Pool Number = `http.m` MinProc/MaxProc
- registration-id = WebtoB SERVER명 (예: `www` / `MyGroup`)

연동 후 `wsadmin` → `si`에서 MyGroup이 `RDY`면 성공.

## 문제 시 재기동

1. WAS: local-shutdown → exit
1. WEB: `wsdown` → `wsboot`
1. WAS: startDomainAdminServer → startManagedServer → jeusadmin
