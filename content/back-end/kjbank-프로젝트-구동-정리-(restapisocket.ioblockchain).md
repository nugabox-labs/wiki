+++
title = "kjbank 프로젝트 구동 정리 (restapi/socket.io/blockchain)"
date = 2020-07-16T10:47:00Z
updated = 2026-07-21T02:37:00Z
categories = ["BACK-END"]
tags = ["GO", "Node.js"]
toc = true

[extra]
source = "notion"
notion_id = "636f241c-fd22-4ea5-b5f6-ff69471664a5"
notion_url = "https://app.notion.com/p/kjbank-restapi-socket-io-blockchain-636f241cfd224ea5b5f6ff69471664a5"
+++

## restapi (Go)

- 실행: `/home/kjbank/restapi/bin` 에서 `start.sh`
- 주소: `192.168.1.203:8282` → `kjbankrest.comin.com`

## [socket.io](http://socket.io/) (Node.js)

- 실행: `/home/kjbank/socketio/bin` 에서 `start.sh`
- 주소: `192.168.1.203:5000` → `kjbanknode.comin.com`

## blockchain (Go)

- 위치: `/home/kjbank/blockchain`, shell 4개 필요

```bash
./central -startnode              # 중앙노드 (port:3000)
./miner -startnode <miner키>      # 마이너노드 (port:3001)
./wallet -startnode               # 지갑노드 (port:3002)
./new -startnode                  # restapi용 지갑노드 (port:3004)
```

- 4개 노드 연동 확인 필요
- 지갑 주소: central `15gam9hxzH7C1Cy5nVKKJTsYnpyPSc9GnD` / miner `1HGbqxsnUqaSjptuYrEKjq5W2b3Vc2dKF6`

## kjbank (JSP)

- 주소: `192.168.1.203:106` → `kjbank.comin.com`
- 소비자: `kjbank.comin.com?u=u1` / 가맹점: `kjbank.comin.com?u=s1`
