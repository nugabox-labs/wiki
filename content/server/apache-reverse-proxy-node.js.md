+++
title = "Apache Reverse Proxy Node.js"
date = 2020-07-24T17:01:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "BACK-END"]
tags = ["WEB", "Node.js"]
toc = true

[extra]
source = "notion"
notion_id = "f87c49de-885f-470e-a961-d61f42a72f58"
notion_url = "https://app.notion.com/p/Apache-Reverse-Proxy-Node-js-f87c49de885f470ea961d61f42a72f58"
external_url = "https://playon.tistory.com/87"
+++

> 원본 스크린샷 기반 재구성. Node listen 포트는 환경에 맞게 조정.

```javascript
LoadModule proxy_module modules/mod_proxy.so
LoadModule proxy_http_module modules/mod_proxy_http.so

<VirtualHost *:80>
    ServerName example.com
    ProxyPreserveHost On
    ProxyPass        / http://127.0.0.1:3000/
    ProxyPassReverse / http://127.0.0.1:3000/
</VirtualHost>
```

Node는 `3000` 등에서 listen.
