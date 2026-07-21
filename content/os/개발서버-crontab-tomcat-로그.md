+++
title = "개발서버 crontab Tomcat 로그"
date = 2020-04-21T01:43:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["LINUX", "WAS"]
toc = true

[extra]
source = "notion"
notion_id = "ad5ac7a6-bc83-41fb-b2bf-72ed60028d77"
notion_url = "https://app.notion.com/p/crontab-Tomcat-ad5ac7a6bc8341fbb2bf72ed60028d77"
+++

```bash
crontab -e
# 매시 1분
1 * * * * /root/script/tomcat_log_delete.sh
```

`/root/script/tomcat_log_delete.sh` 예:

```bash
#!/bin/sh
# 즉시 삭제 (주의)
find /usr/local/tomcat/logs -name 'catalina.*' -exec rm -f {} \;
# 또는 mtime 기준 (예: 3일+)
find /usr/local/tomcat7/logs -name 'catalina.*' -mtime +3 -exec rm -f {} \;
find /usr/local/tomcat8/logs -name 'catalina.*' -mtime +3 -exec rm -f {} \;
# host-manager / localhost / manager 동일 패턴
```
