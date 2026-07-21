+++
title = "Go언어 웹 프레임워크"
date = "2019-10-29T01:54:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["BACK-END"]
tags = ["GO"]
toc = true

[extra]
source = "notion"
notion_id = "4d676289-79fd-42f6-a249-ac8817731966"
notion_url = "https://app.notion.com/p/Go-4d67628979fd42f6a249ac8817731966"
+++

## Go 웹 프레임워크 종류

- MVC형: revel, buffalo, beego
- 마이크로 웹프레임워크: gin, echo, iris

## Gin Framework

**장점**

- 컴파일 언어라 인터프리터 언어(Python/Ruby)보다 빠름, 그중에서도 성능 좋은 편
- 고루틴 기반 병행 프로그래밍 활용 가능
- 마이크로 웹프레임워크라 MVC 패턴보다 가벼움

**단점**

- response 전달 후 명시적으로 return 안 하면 함수가 계속 실행됨(주의 필요)
- handle 함수 형태가 고정적이라 동적 처리가 번거로움
- `gin.Context`에서 요청 정보를 매번 꺼내야 해서 nil 체크 등 코드가 길어짐
- 프로젝트 규모 커지면 구조/코드 복잡도 증가

**Gin으로 RESTful 설계 시**

- 자원을 구조체로, 자원에 대한 행위를 메서드로 정의
- 함수 매개변수를 파싱해 URL 규칙 자동 생성
- 요청에 해당하는 자원의 메서드 실행
