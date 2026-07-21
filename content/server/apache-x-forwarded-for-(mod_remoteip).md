+++
title = "Apache X-Forwarded-For (mod_remoteip)"
date = 2023-07-27T06:33:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["WEB"]
toc = true

[extra]
source = "notion"
notion_id = "36b8a390-c37b-4692-810a-37d9d06ddd39"
notion_url = "https://app.notion.com/p/Apache-X-Forwarded-For-mod_remoteip-36b8a390c37b4692810a37d9d06ddd39"
+++

> Apache 2.4.6 / `mod_remoteip`

## 모듈

```javascript
LoadModule remoteip_module modules/mod_remoteip.so
```

## httpd.conf

```javascript
<IfModule remoteip_module>
    RemoteIPHeader X-Forwarded-For
    RemoteIPTrustedProxy 10.40.0.0/24
</IfModule>
```

신뢰 Proxy CIDR은 환경에 맞게 변경.

## 로그 포맷 (`%h` → `%a`)

```bash
<IfModule log_config_module>
    LogFormat "%a %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"" combined
    LogFormat "%a %l %u %t \"%r\" %>s %b" common
    CustomLog "logs/access_log" combined
</IfModule>
```

`%a` = RemoteIP 반영 클라이언트 IP.
