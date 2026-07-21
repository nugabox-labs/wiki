+++
title = "CLI REST API 클라이언트 (cURL/HTTPie)"
date = 2022-09-29T00:21:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "DEV-OPS", "TECH"]
tags = ["BASH", "NETWORK", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "be4f5a94-f424-4359-a03e-506f168747ff"
notion_url = "https://app.notion.com/p/CLI-REST-API-cURL-HTTPie-be4f5a94f4244359a03e506f168747ff"
external_url = "https://bakyeono.net/post/2016-05-02-rest-api-client-for-cli.html"
+++

## CLI에서 REST API 호출

### cURL

```bash
sudo apt-get install curl

curl -i -X GET  http://127.0.0.1:3000/api/users/id
curl -X POST http://127.0.0.1:3000/api/items
curl -X PUT  -H "Content-Type: application/json" -d '{"message":"hello"}' http://127.0.0.1:3000/api/chat
curl -X GET  --data-urlencode "id=1000&category=post" http://127.0.0.1:3000/api/data
```

옵션: `-i` 응답헤더, `-v` 전체, `-X` 메소드, `-H` 헤더, `-d` 본문

### resty (cURL 래퍼)

```bash
curl -L https://github.com/micha/resty/raw/master/resty > resty
source resty
resty 127.0.0.1:3000/api
GET /users/id
PUT -H 'Content-Type: application/json' -d '{"message":"hello"}' /chat
```

### HTTPie

```bash
sudo apt-get install httpie
http GET 127.0.0.1:3000/api/users/id
http -v PUT 127.0.0.1:3000/api/chat body='{"message":"hello"}'
http -v --form PUT 127.0.0.1:3000/api/users/id name='Name' photo@file.png
```

### Vim REST Console

`.rest` 파일에 요청 작성 후 `<C-j>` 실행:

```javascript
http://127.0.0.1:3000
GET /api/users/id
```
