+++
title = "Node.js/Socket.io 프로젝트 구조 및 PM2 명령어"
date = "2020-07-16T10:51:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["BACK-END"]
tags = ["Node.js"]
toc = true

[extra]
source = "notion"
notion_id = "43e83508-807e-4a78-81d6-90a8984606c7"
notion_url = "https://app.notion.com/p/Node-js-Socket-io-PM2-43e83508807e4a7881d690a8984606c7"
+++

## Node.js 프로젝트 구조 (예시: /home/kjbank/node/websocket)

- `node_modules`: 라이브러리
- `package.json`: 노드 환경설정
- `src`: 소스

## PM2 명령어

```bash
pm2 start <서버명.js> --name <이름>   # 등록 및 시작
pm2 stop <이름>                        # 중지
pm2 restart <이름>                     # 재시작
pm2 show <이름>                        # 상세 정보
pm2 delete <이름>                      # 삭제
pm2 list                               # 리스트
```

## PM2 제어 쉘 스크립트

- 디렉토리: `/home/kjbank/node`

```bash
./start.sh
./stop.sh
./restart.sh
```

## [Socket.io](http://socket.io/) 프로젝트 구조

- 소스 위치: `/home/kjbank/node/websocket/src`
- `server.js`: 서버 실행 파일(포트번호, 페이지 연결)
- `/conn/connect.js`: 소켓 선언 및 서버 연결
- `/js`: JavaScript 파일
- `/view`: HTML 파일
