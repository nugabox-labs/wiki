+++
title = "리눅스 ulimit 확인·설정"
date = 2021-02-19T00:59:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "90640fb5-93d5-4c78-8dca-51d27df960d4"
notion_url = "https://app.notion.com/p/ulimit-90640fb593d54c788dca51d27df960d4"
+++

## 확인

```bash
ulimit -a     # soft
ulimit -aH    # hard
```

## 세션 임시 변경

```bash
ulimit -n 2048
```

## 영구 (`/etc/security/limits.conf`)

```
root soft nproc 2048
root hard nproc 2048
root soft nofile 2048
root hard nofile 2048
```

재로그인 후 반영.
