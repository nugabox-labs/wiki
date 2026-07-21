+++
title = "nohup 백그라운드 실행"
date = 2021-07-28T08:28:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "dac33aec-7f67-487a-bf31-5335c9610307"
notion_url = "https://app.notion.com/p/nohup-dac33aec7f67487abf315335c9610307"
external_url = "https://medium.com/@jinnyjinnyjinjin/nohup-명령어로-어플리케이션-실행하기-d66cc85d4f9"
+++

터미널 종료 후에도 프로세스 유지. 로그 기본: `nohup.out`

```bash
nohup sh shell.sh &
nohup java -jar sample.jar &
kill -9 <pid>

# Node는 forever/pm2 권장 (크래시 재기동)
forever start app.js
```
