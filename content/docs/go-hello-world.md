+++
title = "Go Hello World"
date = 2019-10-22T18:16:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END"]
tags = ["GO"]
toc = true

[extra]
source = "notion"
notion_id = "6d375ee5-3ce6-4dba-a0bd-f9686b15cd4d"
notion_url = "https://app.notion.com/p/Go-Hello-World-6d375ee53ce64dbaa0bdf9686b15cd4d"
external_url = "http://pyrasis.com/book/GoForTheReallyImpatient/Unit05"
+++

`GOPATH/src/hello/hello.go`:

```go
package main

import "fmt"

func main() {
    fmt.Println("Hello, world!")
}
```

```bash
go build hello.go   # Linux/Mac: hello, Windows: hello.exe
./hello             # 또는 .\hello
```

- `go build`: 지정 파일만 컴파일 → 현재 디렉터리
- `go install`: 패키지 전체 → `bin`
- 실행은 `package main`의 `main()`부터
