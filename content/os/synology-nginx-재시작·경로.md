+++
title = "Synology nginx 재시작·경로"
date = 2020-05-26T05:27:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["WEB", "SYNOLOGY"]
toc = true

[extra]
source = "notion"
notion_id = "f95b91bd-5faa-4684-8c66-7b95b800e03b"
notion_url = "https://app.notion.com/p/Synology-nginx-f95b91bd5faa46848c667b95b800e03b"
external_url = "https://app.notion.com/p/25287c174def4358bc4029db37d9d789"
+++

> Synology DSM nginx 메모. access log: [Synology nginx access log 활성화](https://app.notion.com/p/25287c174def4358bc4029db37d9d789)

```bash
# 로그
/var/log/nginx/error.log

# 사이트 설정 (Synology)
/usr/local/etc/nginx/sites-enabled/user.conf.server

# 재시작
synoservicecfg --restart nginx
synoservice --restart nginx
```
