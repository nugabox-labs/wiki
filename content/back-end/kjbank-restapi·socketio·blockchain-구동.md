+++
title = "kjbank restapi·socketio·blockchain 구동"
date = 2020-07-16T10:47:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END"]
tags = ["GO", "Node.js"]
toc = true

[extra]
source = "notion"
notion_id = "636f241c-fd22-4ea5-b5f6-ff69471664a5"
notion_url = "https://app.notion.com/p/kjbank-restapi-socketio-blockchain-636f241cfd224ea5b5f6ff69471664a5"
+++

## restapi (Go)

- 실행: `/home/kjbank/restapi/bin` → `start.sh`
- `192.168.1.203:8282` → `kjbankrest.comin.com`

## socketio (Node.js)

- 실행: `/home/kjbank/socketio/bin` → `start.sh`
- `192.168.1.203:5000` → `kjbanknode.comin.com`

## blockchain (Go)

경로 `/home/kjbank/blockchain`, 셸 4개:

```bash
./central -startnode              # :3000
./miner -startnode <miner키>      # :3001
./wallet -startnode               # :3002
./new -startnode                  # :3004 restapi용
```

- 4노드 연동 확인
- 지갑 주소: central `15gam9hxzH7C1Cy5nVKKJTsYnpyPSc9GnD` / miner `1HGbqxsnUqaSjptuYrEKjq5W2b3Vc2dKF6`

## kjbank (JSP)

- `192.168.1.203:106` → `kjbank.comin.com`
- 소비자 `?u=u1` / 가맹점 `?u=s1`
