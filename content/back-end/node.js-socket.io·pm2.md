+++
title = "Node.js Socket.io·PM2"
date = 2020-07-16T10:51:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END"]
tags = ["Node.js"]
toc = true

[extra]
source = "notion"
notion_id = "43e83508-807e-4a78-81d6-90a8984606c7"
notion_url = "https://app.notion.com/p/Node-js-Socket-io-PM2-43e83508807e4a7881d690a8984606c7"
external_url = "https://pm2.keymetrics.io/docs/usage/quick-start/"
+++

## 프로젝트 구조 예

- `node_modules`: 의존성
- `package.json`: 패키지·스크립트
- `src`: 소스

## PM2

```bash
pm2 start <서버명.js> --name <이름>   # 등록·시작
pm2 stop <이름>
pm2 restart <이름>
pm2 show <이름>
pm2 delete <이름>
pm2 list
```

## 제어 스크립트 (프로젝트 루트)

```bash
./start.sh
./stop.sh
./restart.sh
```

## Socket.io 소스 예

- `server.js`: 포트·페이지 연결
- `conn/connect.js`: 소켓 선언·서버 연결
- `js/`: 클라이언트 JS
- `view/`: HTML
