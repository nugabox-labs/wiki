+++
title = "pm2 기본 명령"
date = 2022-05-20T00:28:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END"]
tags = ["Node.js"]
toc = true

[extra]
source = "notion"
notion_id = "57a613f3-1e5a-46e7-91a9-a00430397b3e"
notion_url = "https://app.notion.com/p/pm2-57a613f31e5a46e791a9a00430397b3e"
external_url = "https://velog.io/@jsi06138/PM2%EB%A1%9C-%EB%AC%B4%EC%A4%91%EB%8B%A8-%EB%B0%B0%ED%8F%AC-%EA%B5%AC%ED%98%84%ED%95%98%EA%B8%B0"
+++

```bash
npm install pm2 -g
pm2 list                 # 목록
pm2 monit                # 모니터링
pm2 restart app.js       # 재시작
pm2 reload app.js        # 무중단 재시작
pm2 stop app.js
pm2 delete app.js
pm2 logs
```

이름(app name)으로도 restart/reload/stop/delete 가능.
