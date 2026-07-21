+++
title = "crontab으로 PHP/URL 실행"
date = "2019-08-30T04:50:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "2eef6b57-41ab-488d-8ae3-0f0173c16b19"
notion_url = "https://app.notion.com/p/crontab-PHP-URL-2eef6b5741ab488d8ae30f0173c16b19"
+++

## crontab으로 URL 주기 호출

```bash
crontab -e
# 매시 1분
01 * * * * wget -q --spider http://example.com/cron/job.php

service crond restart   # CentOS 6
# systemctl restart crond  # CentOS 7+
```
