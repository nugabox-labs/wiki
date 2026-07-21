+++
title = "mysqld.pid 생성 실패 (Errcode 2)"
date = "2020-05-12T18:26:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["SERVER"]
tags = ["DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "61287af5-9ab8-450a-9faf-6515b79e703d"
notion_url = "https://app.notion.com/p/mysqld-pid-Errcode-2-61287af59ab8450a9faf6515b79e703d"
external_url = "http://blog.naver.com/PostView.nhn?blogId=ok_yoonbari&logNo=150098436819"
+++

## Can't create/write to file '.../[mysqld.pid](http://mysqld.pid/)' (Errcode: 2)

PID 디렉터리 없음.

```bash
mkdir -p /var/run/mysqld
chown mysql:mysql /var/run/mysqld
mysqld_safe --user=mysql &
```
