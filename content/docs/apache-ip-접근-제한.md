+++
title = "Apache IP 접근 제한"
date = 2022-10-12T10:50:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["WEB", "NETWORK"]
toc = true

[extra]
source = "notion"
notion_id = "7e457c3f-d239-43d8-892e-485bbd019a6f"
notion_url = "https://app.notion.com/p/Apache-IP-7e457c3fd23943d8892e485bbd019a6f"
external_url = "https://app.notion.com/p/ebc211562dfc4f28928ecc6d4dc7c4d5"
+++

## IP 표현

```
단일 IP : 192.0.2.1
복수 IP : 192.0.2.1 192.0.2.2
IP 범위 : 192.0.2.1-192.0.2.255
IP 대역 : 192.0.2.0/24
```

## Apache 2.4 Require 예

```javascript
<Directory "/var/www/secure">
    Require ip 192.0.2.0/24
    Require ip 203.0.113.10
</Directory>

# 거부 후 허용
<Location /admin>
    Require all denied
    Require ip 192.0.2.10
</Location>
```

2.2 구문(`Order/Allow/Deny`)은 2.4에서 `Require`로 교체. 변경 후 `apachectl configtest` → reload.
