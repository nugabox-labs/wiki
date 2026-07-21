+++
title = "Synology nginx access log 활성화"
date = 2021-09-17T08:11:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["SYNOLOGY", "WEB"]
toc = true

[extra]
source = "notion"
notion_id = "25287c17-4def-4358-bc40-29db37d9d789"
notion_url = "https://app.notion.com/p/Synology-nginx-access-log-25287c174def4358bc4029db37d9d789"
external_url = "https://app.notion.com/p/f95b91bd5faa46848c667b95b800e03b"
+++

Synology nginx access log 활성화.

## 1) access\_log 켜기

```bash
sudo vi /usr/syno/share/nginx/nginx.mustache
# access_log off 주석 처리 → 아래 access_log 라인 활성
```

## 2) 로그 디렉터리 권한

```bash
sudo vi /usr/share/init/nginx.conf
# MakeDirectory /var/log/nginx → mode 0755
```

## 3) syslog-ng 파일 권한

```bash
sudo vi /etc.defaults/syslog-ng/patterndb.d/nginx.conf
# file("/var/log/nginx/access.log" perm(0666) ...)
# file("/var/log/nginx/error.log" perm(0666) ...)
# 읽기만: 0644
```

## 4) logrotate

```bash
sudo vi /etc/logrotate.d/nginx
# postrotate 앞에 create 0666 (또는 0644) 추가
```

## 5) 재시작

```bash
sudo synoservice --restart nginx
sudo synoservice --restart syslog-ng
sudo synoservice --restart synologrotate
```
