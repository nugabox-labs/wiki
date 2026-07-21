+++
title = "Apache www·HTTPS 리다이렉트 (vhosts)"
date = 2019-12-23T08:34:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["WEB"]
toc = true

[extra]
source = "notion"
notion_id = "48e10395-d970-4b02-9930-a19db103ec9c"
notion_url = "https://app.notion.com/p/Apache-www-HTTPS-vhosts-48e10395d9704b029930a19db103ec9c"
+++

> 도메인·경로는 플레이스홀더로 일반화.

## apex → www 리다이렉트 + HTTPS

```javascript
<VirtualHost example.com:80>
    ServerName example.com
    Redirect "/" "http://www.example.com/"
</VirtualHost>

<VirtualHost www.example.com:80>
    ServerName www.example.com
    ServerAlias en.example.com
    DocumentRoot "/home/app/www"
    AddDefaultCharset UTF-8

    JkMount /WEB-INF/* worker1
    JkMount /*.do worker1
    JkMount /*.jsp worker1

    ErrorLog "|/usr/local/apache2/bin/rotatelogs /usr/local/apache2/logs/www-error_log_%Y%m%d 86400"
    CustomLog "|/usr/local/apache2/bin/rotatelogs /usr/local/apache2/logs/www-access_log_%Y%m%d 86400" combined

    ErrorDocument 500 /common/error.html
    ErrorDocument 404 /common/error.html

    RewriteEngine on
    RewriteCond %{HTTPS} !=on
    RewriteRule ^(.*)$ https://%{HTTP_HOST}$1 [R,L]
</VirtualHost>
```
