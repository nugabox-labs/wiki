+++
title = "WebtoB 설정 매뉴얼 (http.m 요약)"
date = 2020-10-23T17:42:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["WEB"]
toc = true

[extra]
source = "notion"
notion_id = "74a0ca28-6c15-4c3f-bc6d-f3ebd607aeb5"
notion_url = "https://app.notion.com/p/WebtoB-http-m-74a0ca286c154c3fbc6df3ebd607aeb5"
external_url = "https://twintail.tistory.com/173"
+++

> WebtoB 4.1 Configuration Reference 클리핑. 원문: [https://twintail.tistory.com/173](https://twintail.tistory.com/173)

## DOMAIN

독립 WebtoB 시스템 전반 설정. 도메인명은 31자 이내 string.

## NODE (필수: WebtobDir, ShmKey, DocRoot)

```javascript
*NODE
WebServer
    WebtobDir = "/path/to/webtob",
    ShmKey = 78100,          # 32768~262143, 충돌 주의
    DocRoot = "/path/to/webtob/docs",
    Hth = 2,                 # HTTP handler 프로세스 (기본1, 최대20)
    Port = "80",             # 또는 Listen (Listen 우선)
    User = "nobody",
    Group = "nobody",
    HostName = "www.example.com"
```

## 기타 절 (요약)

- `*VHOST` — 가상호스트 (DOCROOT, HOSTNAME, PORT, SSLFLAG…)
- `*SSL` — CertificateFile / CertificateKeyFile / PassPhraseDialog
- `*SVRGROUP` / `*SERVER` — HTML·JSV 워커
- `*URI` / `*EXT` / `*ALIAS` — 라우팅
- `*LOGGING` — 액세스·에러 로그

적용: `wscfl -i http.m` → `wsboot`

상세 절 설명은 원문·Administrator's Guide 참고.
