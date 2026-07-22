+++
title = "Apache Directory·Files·Location 접근 범위"
date = 2022-10-12T00:31:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["WEB"]
toc = true

[extra]
source = "notion"
notion_id = "ebc21156-2dfc-4f28-928e-cc6d4dc7c4d5"
notion_url = "https://app.notion.com/p/Apache-Directory-Files-Location-ebc211562dfc4f28928ecc6d4dc7c4d5"
external_url = "https://app.notion.com/p/7e457c3fd23943d8892e485bbd019a6f"
+++

## 섹션 컨테이너 예

```javascript
<Directory />
    AllowOverride none
    Require all denied
</Directory>

<Directory "${SRVROOT}/htdocs">
    Options Indexes FollowSymLinks
    AllowOverride None
    Require all granted
</Directory>

<Files ".ht*">
    Require all denied
</Files>
```

## Directory

```
Define SRVROOT "/usr/local/apache"
<Directory "${SRVROOT}/htdocs">
    ...
</Directory>
```

## Files / FilesMatch

```javascript
<Files ".ht*">
    Require all denied
</Files>

<FilesMatch "\.(htm|html|css|js|php)$">
    ...
</FilesMatch>
```

## Location

```javascript
<Location /aaa/bbb>
    ...
</Location>
```

적용 순서: Directory → Files → Location(이후가 덮어씀).
