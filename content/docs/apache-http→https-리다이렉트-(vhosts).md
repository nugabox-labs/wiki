+++
title = "Apache HTTP→HTTPS 리다이렉트 (vhosts)"
date = 2019-12-23T08:32:00Z
updated = 2026-07-21T06:47:00Z
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
