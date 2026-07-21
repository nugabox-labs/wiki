+++
title = "Go로 RESTful JSON API 만들기"
date = "2019-10-28T10:55:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["BACK-END"]
tags = ["GO"]
toc = true

[extra]
source = "notion"
notion_id = "c699a1f2-997c-45e1-92d0-facdf6c7de03"
notion_url = "https://app.notion.com/p/Go-RESTful-JSON-API-c699a1f2997c45e192d0facdf6c7de03"
external_url = "https://medium.com/the-andela-way/build-a-restful-json-api-with-golang-85a83420c9da"
+++

## Go로 RESTful JSON API 만들기 (기본 골격)

```bash
mkdir go-rest-api && cd go-rest-api
touch main.go
```

- `package main` + `func main`: 실행 프로그램의 진입점

```bash
go build
./go-rest-api
```

## Gorilla Mux로 라우팅

```bash
go get -u github.com/gorilla/mux
```

- 요청 라우터/디스패처 패키지. "/" 엔드포인트에 핸들러 연결 후 `http://localhost:8080` 에서 서버 실행

원문: [https://medium.com/the-andela-way/build-a-restful-json-api-with-golang-85a83420c9da](https://medium.com/the-andela-way/build-a-restful-json-api-with-golang-85a83420c9da)

소스 코드: [https://github.com/Duncanian/go-rest-api](https://github.com/Duncanian/go-rest-api)
