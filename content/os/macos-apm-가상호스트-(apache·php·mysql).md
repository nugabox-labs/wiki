+++
title = "macOS APM 가상호스트 (Apache·PHP·MySQL)"
date = 2023-03-11T14:02:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["MACOS"]
toc = true

[extra]
source = "notion"
notion_id = "486999a3-6659-48a7-861f-ecb4b7f0431e"
notion_url = "https://app.notion.com/p/macOS-APM-Apache-PHP-MySQL-486999a3665948a7861fecb4b7f0431e"
external_url = "https://labs.brandi.co.kr/2018/01/23/kwakjs.html"
+++

> Homebrew·구버전 PHP 기준.

## 버전 확인

```bash
httpd -v
php -v
```

## 구버전 PHP + Apache (예: php56)

```bash
brew tap homebrew/php
brew install php56 --with-apache
```

`/etc/apache2/httpd.conf`:

```javascript
LoadModule php5_module /경로/libphp5.so
#LoadModule php7_module libexec/apache2/libphp7.so
```

```bash
apachectl restart
```

## MySQL

```bash
brew install mysql56
/usr/local/Cellar/mysql@5.6/버전/bin/mysql.server start
```

## 가상호스트

`httpd.conf`에서 `Include .../httpd-vhosts.conf` 주석 해제. `httpd-vhosts.conf`:

```bash
# NameVirtualHost *:80   # Apache 2.4 미만만
DocumentRoot "/프로젝트/경로"
ServerName 도메인주소
```

`/etc/hosts`에 로컬 도메인 매핑.
