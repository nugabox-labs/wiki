+++
title = "PID로 프로세스 이름 확인"
date = 2019-11-01T16:45:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "00c35d59-ab12-4034-905c-f94b9991b6e6"
notion_url = "https://app.notion.com/p/PID-00c35d59ab124034905cf94b9991b6e6"
external_url = "https://zetawiki.com/wiki/리눅스_PID로_프로세스_이름_확인"
+++

```bash
cat /proc/PID/status | grep Name
PROC_NAME=$(awk '/Name/{print $2}' /proc/PID/status)

ps PID
ps -f PID
```
