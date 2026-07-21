+++
title = "Go defer·panic·recover"
date = 2019-11-26T18:34:00Z
updated = 2026-07-21T06:47:00Z
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

함수 리턴 직전 실행(정리·Close 등).

```go
f, err := os.Open("1.txt")
if err != nil {
    panic(err)
}
defer f.Close()   // 함수 종료 직전
```

## panic — 즉시 중단

현재 함수 중단 → 등록된 defer 실행 → 콜스택 전파 → 미복구 시 프로세스 종료.

```go
func openFile(fn string) {
    f, err := os.Open(fn)
    if err != nil {
        panic(err)
    }
    defer f.Close()
}
```

## recover — panic 복구

defer 안에서 호출하면 panic을 잡고 계속 진행.

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
