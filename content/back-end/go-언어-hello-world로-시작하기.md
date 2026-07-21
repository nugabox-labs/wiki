+++
title = "Go 언어 Hello World로 시작하기"
date = "2019-10-22T18:16:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["BACK-END"]
tags = ["GO"]
toc = true

[extra]
source = "notion"
notion_id = "6d375ee5-3ce6-4dba-a0bd-f9686b15cd4d"
notion_url = "https://app.notion.com/p/Go-Hello-World-6d375ee53ce64dbaa0bdf9686b15cd4d"
external_url = "http://pyrasis.com/book/GoForTheReallyImpatient/Unit05"
+++

## Go Hello World

`GOPATH/src/hello/hello.go`:

```go
package main

import "fmt"

func main() {
    fmt.Println("Hello, world!")
}
```

```bash
go build hello.go   # 실행 파일 생성 (Linux/Mac: hello, Windows: hello.exe)
./hello              # 또는 .\hello (PowerShell)
```

- `go build`: 지정 파일만 컴파일, 실행 파일은 현재(src) 디렉터리에 생성
- `go install`: 관련 패키지 전체 컴파일, 실행 파일은 `bin` 디렉터리에 생성
- 모든 Go 소스는 패키지 선언(`package main`)으로 시작하며, `main` 패키지의 `main()` 함수부터 실행

원문(저작권상 재게시·발췌 금지 명시됨, 요약만 기재): [http://pyrasis.com/book/GoForTheReallyImpatient/Unit05](http://pyrasis.com/book/GoForTheReallyImpatient/Unit05)
