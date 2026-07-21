+++
title = "pm2 사용법"
date = "2022-05-20T00:28:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["BACK-END"]
tags = ["Node.js"]
toc = true

[extra]
source = "notion"
notion_id = "57a613f3-1e5a-46e7-91a9-a00430397b3e"
notion_url = "https://app.notion.com/p/pm2-57a613f31e5a46e791a9a00430397b3e"
external_url = "https://velog.io/@jsi06138/PM2%EB%A1%9C-%EB%AC%B4%EC%A4%91%EB%8B%A8-%EB%B0%B0%ED%8F%AC-%EA%B5%AC%ED%98%84%ED%95%98%EA%B8%B0"
+++

## pm2

```bash
npm install pm2 -g       # 설치
pm2 list                 # 프로세스 목록/구동
pm2 monit                # 모니터링
pm2 restart app.js       # 재시작
pm2 reload app.js        # 무중단 재시작
pm2 stop app.js          # 중지
pm2 delete app.js        # 삭제
pm2 logs                 # 로그 확인
```

- 이름(app name)으로도 restart/reload/stop/delete 가능

원문: [https://velog.io/@jsi06138/PM2로-무중단-배포-구현하기](https://velog.io/@jsi06138/PM2로-무중단-배포-구현하기)
