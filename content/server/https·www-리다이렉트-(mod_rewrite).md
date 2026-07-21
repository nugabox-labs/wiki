+++
title = "HTTPS·www 리다이렉트 (mod_rewrite)"
date = "2020-12-11T14:52:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["SERVER"]
tags = ["WEB"]
toc = true

[extra]
source = "notion"
notion_id = "a95d4e7d-f9c9-4e30-91ee-ece131a7c750"
notion_url = "https://app.notion.com/p/HTTPS-www-mod_rewrite-a95d4e7df9c94e3091eeece131a7c750"
external_url = "https://bluescoder.com/https%EC%99%80-%EB%8F%84%EB%A9%94%EC%9D%B8%EC%9D%98-www-%EB%A6%AC%EB%8B%A4%EC%9D%B4%EB%A0%89%ED%8A%B8-%EC%B2%98%EB%A6%AC/"
+++

## HTTP→HTTPS (301)

Bitnami 예: `/home/bitnami/apps/wordpress/conf/htaccess.conf`

```javascript
<IfModule mod_rewrite.c>
    RewriteEngine on
    RewriteCond %{HTTPS} !=on [NC]
    RewriteRule ^ https://example.com%{REQUEST_URI} [L,R=301]
</IfModule>
```

## HTTPS + www 제거 (apex로 통일)

```javascript
<IfModule mod_rewrite.c>
    RewriteEngine on
    RewriteCond %{HTTPS} !=on [OR]
    RewriteCond %{HTTP_HOST} ^www\. [NC]
    RewriteRule ^ https://example.com%{REQUEST_URI} [L,R=301]
</IfModule>
```

결과: `http(s)://www.example.com` · `http://example.com` → `https://example.com`

Bitnami 재시작:

```bash
sudo /opt/bitnami/ctlscript.sh restart
```

- 301: 영구(서버단, SEO)
- 302: 일시(앱/JS)
