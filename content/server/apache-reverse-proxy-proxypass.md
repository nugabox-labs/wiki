+++
title = "Apache Reverse Proxy ProxyPass"
date = 2020-09-02T02:18:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["WEB"]
toc = true

[extra]
source = "notion"
notion_id = "db04e2ec-f439-4d47-abb6-d583b2b2a5ef"
notion_url = "https://app.notion.com/p/Apache-Reverse-Proxy-ProxyPass-db04e2ecf4394d47abb6d583b2b2a5ef"
external_url = "https://httpd.apache.org/docs/current/mod/mod_proxy.html"
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
