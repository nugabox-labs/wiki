+++
title = "Apache·Tomcat 홈페이지 속도 최적화"
date = 2019-03-26T06:08:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["WEB", "WAS"]
toc = true

[extra]
source = "notion"
notion_id = "22d21d24-c299-445a-a555-bbacc18e27de"
notion_url = "https://app.notion.com/p/Apache-Tomcat-22d21d24c299445aa555bbacc18e27de"
external_url = "https://app.notion.com/p/bbde5f4b9d3941179d8d7d7c26cd1e17"
+++

## Apache·Tomcat 홈페이지 속도 최적화

### 정적 리소스 캐시 (Cache-Control)

```javascript
<IfModule mod_headers.c>
<FilesMatch ".(js|css|xml|gz|html|json)$">
    Header append Vary: Accept-Encoding
</FilesMatch>
<FilesMatch "\.(ico|flv|jpg|jpeg|png|gif|css|swf)$">
    Header set Cache-Control "max-age=2678400, public"
</FilesMatch>
<FilesMatch "\.(html|htm)$">
    Header set Cache-Control "max-age=7200, private, must-revalidate"
</FilesMatch>
</IfModule>
```

### gzip 압축 (mod\_deflate)

```javascript
<IfModule mod_deflate.c>
AddOutputFilterByType DEFLATE text/html text/css text/javascript text/plain text/xml
AddOutputFilterByType DEFLATE application/javascript application/xml application/json
AddOutputFilterByType DEFLATE font/woff font/ttf image/svg+xml image/x-icon
DeflateCompressionLevel 9
BrowserMatch ^Mozilla/4 gzip-only-text/html
BrowserMatch ^Mozilla/4\.0[678] no-gzip
BrowserMatch \bMSIE !no-gzip !gzip-only-text/html
Header append Vary User-Agent
SetEnvIfNoCase Request_URI \.(?:gif|jpe?g|png|bmp|zip|gz|rar|7z)$ no-gzip dont-vary
</IfModule>
```

### 만료 헤더 (mod\_expires) — 정적 1개월, HTML 즉시 만료

```javascript
<IfModule mod_expires.c>
ExpiresActive On
ExpiresDefault "access plus 1 month"
ExpiresByType text/html "access plus 0 seconds"
ExpiresByType text/css "access plus 1 month"
ExpiresByType application/javascript "access plus 1 month"
ExpiresByType image/jpeg "access plus 1 month"
ExpiresByType image/png "access plus 1 month"
# 폰트/이미지/오디오/비디오도 동일 패턴으로 1개월
<IfModule mod_headers.c>
    Header append Cache-Control "public"
</IfModule>
</IfModule>
```

## Tomcat — conf/server.xml AJP 압축

```xml
<Connector port="8009" protocol="AJP/1.3" redirectPort="8443" URIEncoding="UTF-8"
    maxThreads="150" minSpareThreads="25" maxSpareThreads="75"
    compressableMimeType="text/html,text/xml,text/plain,text/javascript,text/css,application/javascript"
    compression="on" compressionMinSize="1024"
    noCompressionUserAgents="gozilla, traviata"
    connectionTimeout="60000" />
```
