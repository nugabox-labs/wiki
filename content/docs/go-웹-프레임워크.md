+++
title = "Go 웹 프레임워크"
date = 2019-10-29T01:54:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END"]
tags = ["GO"]
toc = true

[extra]
source = "notion"
notion_id = "4d676289-79fd-42f6-a249-ac8817731966"
notion_url = "https://app.notion.com/p/Go-4d67628979fd42f6a249ac8817731966"
+++

## 종류

- MVC: revel, buffalo, beego
- 마이크로: gin, echo, iris

## Gin

- 컴파일·고루틴 기반, 마이크로라 MVC보다 가벼움
- 주의: response 후 `return` 없으면 핸들러 계속 실행
- `gin.Context`에서 요청값을 매번 꺼내야 해 코드가 길어질 수 있음

## Gin RESTful 설계 요지

- 자원=구조체, 행위=메서드
- 매개변수 파싱 → URL 규칙 생성 → 해당 메서드 실행
