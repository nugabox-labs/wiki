+++
title = "Socket.IO 실시간 통신"
date = 2019-11-05T10:13:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END"]
tags = ["Node.js"]
toc = true

[extra]
source = "notion"
notion_id = "2dbb20d2-9598-4bc3-8170-10aea9bd502b"
notion_url = "https://app.notion.com/p/Socket-IO-2dbb20d295984bc3817010aea9bd502b"
external_url = "https://hoony-gunputer.tistory.com/226"
+++

## socket.io 설치

```bash
yarn add socket.io          # 또는
npm i socket.io
npm i socket.io-client      # 클라이언트용
```

## 서버

```javascript
import http from "http";
import express from "express";
import io from "socket.io";

const app = express();
const httpServer = http.createServer(app).listen(3000, () => {
  console.log("포트 3000에 연결되었습니다.");
});
const socketServer = io(httpServer);

socketServer.on("connection", socket => {
  console.log("connect client by Socket.io");
  socket.on("first Request", req => {
    console.log(req);
    socket.emit("first Respond", { data: "firstRespond" });
  });
});
```

## 클라이언트

```javascript
import io from "socket.io-client";
const socketClient = io("http://서버IP:포트번호");

socketClient.on("connect", () => console.log("connection server"));
socketClient.emit("first Request", { data: "first Request" });
socketClient.on("first Respond", req => console.log(req));
```

## 서버에서 응답하는 3가지 방법

```javascript
socket.emit("이벤트이름", data);                          // 현재 연결된 클라이언트에게
socket.broadcast.emit("이벤트이름", data);                 // 나를 제외한 다른 클라이언트에게
socketServer.sockets().emit("이벤트이름", data);           // 특정 소켓 클라이언트에게
```

- HTTP는 요청-응답 후 연결이 끊김. 지속 통신이 필요하면 [Socket.io](http://socket.io/) 사용
- room, get/set 등 추가 기능은 별도
