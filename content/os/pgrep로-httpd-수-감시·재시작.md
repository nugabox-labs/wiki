+++
title = "pgrep로 httpd 수 감시·재시작"
date = 2021-07-06T06:12:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER", "DEV-OPS"]
tags = ["LINUX", "BASH", "WEB"]
toc = true

[extra]
source = "notion"
notion_id = "98f1a446-bf21-467e-a269-cd6d4fe2b374"
notion_url = "https://app.notion.com/p/pgrep-httpd-98f1a446bf21467ea269cd6d4fe2b374"
external_url = "https://app.notion.com/p/03861aea4b004e258d7d124a0d596882"
+++

httpd 프로세스 수가 임계치 이상이면 Apache 재시작.

```bash
if [ "`pgrep -x httpd | wc -l`" -ge "500" ]; then
  /usr/local/apache/bin/apachectl restart
fi
```

```bash
pgrep -x httpd          # 정확한 프로세스명 매칭
pgrep -c httpd          # 개수만
```
