+++
title = "Apache HTTP→HTTPS 리다이렉트 (vhosts)"
date = "2019-12-23T08:32:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["SERVER"]
tags = ["WEB"]
toc = true

[extra]
source = "notion"
notion_id = "afb38346-851a-49fd-8f1d-f58d08075b57"
notion_url = "https://app.notion.com/p/Apache-HTTP-HTTPS-vhosts-afb38346851a49fd8f1df58d08075b57"
+++

## 현재 Host 유지하며 HTTPS로

```javascript
RewriteEngine on
RewriteCond %{HTTPS} !=on
RewriteRule ^(.*)$ https://%{HTTP_HOST}$1 [R,L]
```

## 고정 URL로

```javascript
RewriteEngine On
RewriteCond %{HTTPS} off
RewriteRule .* https://www.example.com/ [R,L]
```

관련: [HTTPS·www 리다이렉트](https://app.notion.com/p/a95d4e7df9c94e3091eeece131a7c750)
