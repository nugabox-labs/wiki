+++
title = "Go RESTful JSON API"
date = 2019-10-28T10:55:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END"]
tags = ["GO"]
toc = true

[extra]
source = "notion"
notion_id = "c699a1f2-997c-45e1-92d0-facdf6c7de03"
notion_url = "https://app.notion.com/p/Go-RESTful-JSON-API-c699a1f2997c45e192d0facdf6c7de03"
external_url = "https://medium.com/the-andela-way/build-a-restful-json-api-with-golang-85a83420c9da"
+++

## 프로젝트 골격

```bash
mkdir go-rest-api && cd go-rest-api
touch main.go
go build
./go-rest-api
```

- `package main` + `func main`: 실행 진입점

## Gorilla Mux 라우팅

```bash
go get -u github.com/gorilla/mux
```

- 요청 라우터. `/` 핸들러 연결 후 `http://localhost:8080` 에서 실행
