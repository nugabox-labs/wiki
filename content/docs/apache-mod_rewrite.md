+++
title = "Apache mod_rewrite"
date = 2020-06-23T13:33:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["WEB"]
toc = true

[extra]
source = "notion"
notion_id = "98061454-1a2d-4954-b454-eef5a7f3f44a"
notion_url = "https://app.notion.com/p/Apache-mod_rewrite-980614541a2d4954b454eef5a7f3f44a"
external_url = "https://chess72.tistory.com/35"
+++

컴파일: `./configure --prefix=/usr/local/apache2 --enable-rewrite`

범위: Server Config / VirtualHost / Directory / `.htaccess`

## 지시자

```javascript
RewriteEngine On|Off
RewriteLog /path/to/rewrite.log          # 구버전
RewriteLogLevel 0-9                      # 0=off
RewriteCond TestString CondPattern
RewriteRule Pattern Substitution [flags]
```

## 공사중 (특정 IP만 허용)

```javascript
RewriteCond %{REMOTE_ADDR} !^127\.0\.0\.1
RewriteCond %{REQUEST_URI} !^/uc/
RewriteRule ^.+$ /uc/index.html [L]
```

## 플래그

- `L` last / `R=301` redirect / `F` 403 / `C` chain

## 예

```javascript
# /user_id → main.php?id=
RewriteCond %{REQUEST_URI} !^/admin$
RewriteRule ^/([a-zA-Z0-9]+)$ /blog/main.php?id=$1

# 외부 리다이렉트
RewriteRule ^/external$ http://www.example.com/ [R,L]
```
