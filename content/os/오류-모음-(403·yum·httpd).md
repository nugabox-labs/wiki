+++
title = "오류 모음 (403·yum·httpd)"
date = "2019-03-29T00:57:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "f836f9d0-58ee-474d-bd84-bbddc89ef1ef"
notion_url = "https://app.notion.com/p/403-yum-httpd-f836f9d058ee474dbd84bbddc89ef1ef"
+++

## 오류 모음 (Linux/Apache)

### 403 Forbidden

```bash
sestatus
# SELinux 끄기(비권장·재부팅 필요) 또는
chcon -R -h -t httpd_sys_content_t /path
setenforce 0   # 임시 Permissive
```

### yum lock

```bash
rm -f /var/run/yum.pid
```

### Apache

- `Require all granted` → 2.4+ only (구버전 제거)
- `Could not reliably determine ... ServerName` → `httpd.conf`에서 `ServerName` 주석 해제

### httpd SSL 컴파일

```bash
yum install openssl-devel
```
