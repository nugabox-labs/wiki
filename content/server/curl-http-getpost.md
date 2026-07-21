+++
title = "cURL HTTP GET/POST"
date = 2019-11-21T17:20:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["NETWORK"]
toc = true

[extra]
source = "notion"
notion_id = "f6f76b25-6a64-4f72-aca1-f1a2d781639e"
notion_url = "https://app.notion.com/p/cURL-HTTP-GET-POST-f6f76b256a644f72aca1f1a2d781639e"
external_url = "https://m.blog.naver.com/PostView.nhn?blogId=wideeyed&logNo=221350638501"
+++

## cURL 설치

```bash
sudo apt-get install curl
```

## GET/POST 호출

자주 쓰는 옵션: `-d`(전송 데이터), `-H`(헤더), `-X`(메소드)

```bash
# GET (URL형식 데이터)
curl -d "key1=value1&key2=value2" -H "Content-Type: application/x-www-form-urlencoded" -X GET http://localhost:8000/data

# POST (URL형식 데이터)
curl -d "key1=value1&key2=value2" -H "Content-Type: application/x-www-form-urlencoded" -X POST http://localhost:8000/data

# POST (JSON 데이터)
curl -d '{"key1":"value1", "key2":"value2"}' -H "Content-Type: application/json" -X POST http://localhost:8000/data

# Windows curl: 작은따옴표(') → 큰따옴표("), 큰따옴표(") → 이스케이프("")로 변경
curl -d "{""key1"":""value1"", ""key2"":""value2""}" -H "Content-Type: application/json" -X POST http://localhost:8000/data
```
