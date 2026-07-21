+++
title = "포트 점유 프로세스 종료 (fuser/lsof)"
date = 2019-04-05T02:15:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "78f34f92-fb96-476b-952c-85ba857dae1c"
notion_url = "https://app.notion.com/p/fuser-lsof-78f34f92fb96476b952c85ba857dae1c"
external_url = "https://yadw.tistory.com/306"
+++

```bash
netstat -nap | grep 1099
lsof -i TCP:1099
fuser -k -n tcp 1099
```
