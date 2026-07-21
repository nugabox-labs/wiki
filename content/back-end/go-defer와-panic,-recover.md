+++
title = "Go defer와 panic, recover"
date = "2019-11-26T18:34:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["BACK-END"]
tags = ["GO"]
toc = true

[extra]
source = "notion"
notion_id = "0e0225d5-c858-43f4-bb92-91d4433c2bcf"
notion_url = "https://app.notion.com/p/Go-defer-panic-recover-0e0225d5c85843f4bb9291d4433c2bcf"
external_url = "http://golang.site/go/article/20-Go-defer%EC%99%80-panic"
+++

## defer — 지연 실행

- 함수가 리턴하기 직전에 실행(C#/Java의 finally와 유사). 파일 Close 등 정리 작업에 사용.

```go
f, err := os.Open("1.txt")
if err != nil {
    panic(err)
}
defer f.Close()   // main 종료 직전 실행
```

## panic — 즉시 중단

- 현재 함수를 멈추고 등록된 defer들을 실행한 뒤 리턴 → 콜스택을 타고 올라가며 반복 → 결국 프로그램이 에러로 종료됨

```go
func openFile(fn string) {
    f, err := os.Open(fn)
    if err != nil {
        panic(err)   // 이후 코드(예: main의 println)는 실행 안 됨
    }
    defer f.Close()
}
```

## recover — panic 복구

- defer 안에서 호출하면 panic 상태를 정상으로 되돌려 프로그램이 계속 진행됨

```go
func openFile(fn string) {
    defer func() {
        if r := recover(); r != nil {
            fmt.Println("OPEN ERROR", r)
        }
    }()
    f, err := os.Open(fn)
    if err != nil {
        panic(err)
    }
    defer f.Close()
}
```

원문: [http://golang.site/go/article/20-Go-defer와-panic](http://golang.site/go/article/20-Go-defer와-panic)
