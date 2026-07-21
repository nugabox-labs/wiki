+++
title = "Apache internal dummy connection 로그 제외"
date = 2019-12-24T18:31:00Z
updated = 2026-07-21T02:37:00Z
categories = ["OS", "SERVER"]
tags = ["WEB", "LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "adc741fc-4939-4f73-9ca6-41c9301ed431"
notion_url = "https://app.notion.com/p/Apache-internal-dummy-connection-adc741fc49394f739ca641c9301ed431"
external_url = "http://faq.hostway.co.kr/index.php?mid=Linux_WEB&page=2&document_srl=3241"
+++

`internal dummy connection`이 access\_log를 채우며, 심하면 `FATAL: emalloc()` 등으로 응답 불능.

```javascript
SetEnvIf Remote_Addr "::1" loopback
SetEnvIf Remote_Addr "127\.0\.0\.1" loopback
CustomLog logs/access_log combined env=!loopback
```

httpd 재시작 후 확인.
