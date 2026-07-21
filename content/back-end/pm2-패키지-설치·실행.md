+++
title = "PM2 패키지 설치·실행"
date = 2022-05-16T07:23:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END", "DEV-OPS"]
tags = ["Node.js", "BASH"]
toc = true

[extra]
source = "notion"
notion_id = "4544cff0-859d-474d-a688-15fa34d72bf8"
notion_url = "https://app.notion.com/p/PM2-4544cff0859d474da68815fa34d72bf8"
external_url = "https://dydals5678.tistory.com/100"
+++

```bash
npm install -g pm2

pm2 start app.js
pm2 start app.js --watch
pm2 start app.js --watch --no-daemon
pm2 start app.js --watch --ignore-watch="path/to/ignore" --no-daemon

pm2 list
pm2 logs
pm2 stop app
pm2 delete app
pm2 save
pm2 startup
```
