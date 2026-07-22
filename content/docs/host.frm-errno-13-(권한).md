+++
title = "host.frm errno 13 (권한)"
date = 2020-05-12T18:24:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "8e3a1bee-3de0-41e5-8c26-2395e75521ab"
notion_url = "https://app.notion.com/p/host-frm-errno-13-8e3a1bee3de041e58c262395e75521ab"
+++

## Can't find file: './mysql/host.frm' (errno: 13)

권한 문제. datadir은 mysql 유저 소유로:

```bash
chown -R mysql:mysql /usr/local/mysql/data
# basedir은 환경에 맞게 (예시는 설치 루트)
chgrp -R mysql /usr/local/mysql
```
