+++
title = "비정상 종료 후 PID·lock 삭제"
date = 2020-01-20T06:16:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "1b2a7296-d103-463f-8be5-de5ce59abf44"
notion_url = "https://app.notion.com/p/PID-lock-1b2a7296d103463f8be5de5ce59abf44"
+++

서비스 비정상 종료 후 stale PID/lock 제거:

```bash
rm -f /var/run/서비스.pid
rm -f /var/lock/subsys/서비스명
```
