+++
title = "Tomcat 로그 삭제 스크립트"
date = 2020-08-03T01:15:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["LINUX", "WAS"]
toc = true

[extra]
source = "notion"
notion_id = "bfffef3b-96f3-4250-8130-9e97d0d36657"
notion_url = "https://app.notion.com/p/Tomcat-bfffef3b96f3425081309e97d0d36657"
+++

## 30일 이상 로그 삭제

crontab 일일 실행 예.

```bash
#!/bin/sh
LOGDIR=/usr/local/tomcat/logs
for pat in 'catalina.*' 'host-manager.*' 'localhost.*' 'manager.*'; do
  find "$LOGDIR" -name "$pat" -ctime +30 -exec rm -f {} \;
done
```
