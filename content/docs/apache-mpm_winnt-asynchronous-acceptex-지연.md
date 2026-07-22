+++
title = "Apache mpm_winnt Asynchronous AcceptEx 지연"
date = 2024-09-06T00:45:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER", "TECH"]
tags = ["WINDOWS", "WEB", "ISSUE"]
toc = true

[extra]
source = "notion"
notion_id = "bba691b2-3b3c-4b1d-893c-8ece8c20ea3c"
notion_url = "https://app.notion.com/p/Apache-mpm_winnt-Asynchronous-AcceptEx-bba691b23b3c4b1d893c8ece8c20ea3c"
external_url = "https://gunnm.tistory.com/110"
+++

## 증상

```
[mpm_winnt:warn] (OS 64)지정된 네트워크 이름을 더 이상 사용할 수 없습니다.
AH00341: winnt_accept: Asynchronous AcceptEx failed.
```

Apache:80 간헐 무한로딩 / Tomcat:8080은 정상.

## httpd.conf

```javascript
EnableMMAP off
EnableSendfile off
AcceptFilter http none
AcceptFilter https none
```

Apache 서비스 재시작.
