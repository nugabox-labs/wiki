+++
title = "Apache 부하 시 KeepAlive·Timeout 조정"
date = 2021-03-18T08:57:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["WEB"]
toc = true

[extra]
source = "notion"
notion_id = "0ecab5a7-eb6a-488c-afeb-fac7817eae2b"
notion_url = "https://app.notion.com/p/Apache-KeepAlive-Timeout-0ecab5a7eb6a488cafebfac7817eae2b"
+++

## 부하 시 빠른 조정 (`httpd.conf`)

```javascript
KeepAlive Off
Timeout 8
```

고동시접속·짧은 요청 위주일 때 KeepAlive Off + Timeout 축소로 프로세스 점유를 줄일 수 있음.

## 동시접속·메모리 확인

```bash
# 실시간 ESTABLISHED 수
watch 'netstat -an | grep EST | wc -l'

# :80 동시 접속
netstat -nap | grep :80 | grep ESTABLISHED | wc -l

# Apache 메모리(MB)
ps aux | grep apache | awk '{print $6}' | awk '{total+=$1} END {print total/1024}'
```
