+++
title = "PHP OCI8 Instant Client SDK 헤더"
date = 2023-10-05T08:22:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER", "BACK-END", "TECH"]
tags = ["PHP", "LINUX", "Oracle", "ISSUE"]
toc = true

[extra]
source = "notion"
notion_id = "506cc9ea-b9d1-42aa-93e3-1fc122226d46"
notion_url = "https://app.notion.com/p/PHP-OCI8-Instant-Client-SDK-506cc9eab9d142aa93e31fc122226d46"
external_url = "https://www.phpschool.com/gnuboard4/bbs/board.php?bo_table=qna_install&wr_id=94833"
+++

## 증상

```
configure: error: Oracle Instant Client SDK header files not found
```

PHP 5.2.1 + `--with-oci8=instantclient,/usr/lib/oracle/11.2/client/lib`

## 설치

```bash
rpm -Uvh oracle-instantclient11.2-basic-11.2.0.1.0-1.i386.rpm
rpm -Uvh oracle-instantclient11.2-devel-11.2.0.1.0-1.i386.rpm
```

## configure

```bash
./configure --prefix=/usr/local/php ... \
  --with-oci8=instantclient,/usr/lib/oracle/11.2/client/lib
```

## 해결

- Instant Client 11.2 → 10.2 다운그레이드 후 정상
- 헤더 경로: `/usr/include/oracle/11.2/client`
