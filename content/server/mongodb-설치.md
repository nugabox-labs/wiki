+++
title = "MongoDB 설치"
date = 2023-11-17T06:05:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["DB", "MongoDB"]
toc = true

[extra]
source = "notion"
notion_id = "925c0070-a3a8-467d-af1d-96576fae5e80"
notion_url = "https://app.notion.com/p/MongoDB-925c0070a3a8467daf1d96576fae5e80"
+++

## MongoDB Replica Set 구성

```javascript
rs.initiate({
  _id: "rs0",
  members: [
    { _id: 0, host: "localhost:27017" },
    { _id: 1, host: "localhost:27018" },
    { _id: 2, host: "localhost:27019" },
    { _id: 3, host: "localhost:27020" }
  ]
})
```

## admin 계정 생성

```javascript
db.createUser({
  user: "root",
  pwd: "비밀번호",
  roles: ["root"]
})
```
