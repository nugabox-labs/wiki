+++
title = "Apache Reverse Proxy (ProxyPass)"
date = "2020-09-02T02:18:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["SERVER"]
tags = ["WEB"]
toc = true

[extra]
source = "notion"
notion_id = "db04e2ec-f439-4d47-abb6-d583b2b2a5ef"
notion_url = "https://app.notion.com/p/Apache-Reverse-Proxy-ProxyPass-db04e2ecf4394d47abb6d583b2b2a5ef"
+++

```javascript
LoadModule proxy_module modules/mod_proxy.so
LoadModule proxy_http_module modules/mod_proxy_http.so

Listen 80   # 필요 시 다른 포트

<VirtualHost *:80>
    ProxyPass        /api/ http://backend.example.com:8100/api/v1/
    ProxyPassReverse /api/ http://backend.example.com:8100/api/v1/
</VirtualHost>
```

클라이언트가 `/api/...` 요청 → 백엔드로 프록시 후 응답 반환.

관련: [mod\_proxy vs mod\_jk](https://app.notion.com/p/6b0f759960144539ab359e96240dd162)
