+++
title = "Go time 패키지"
date = 2019-11-28T16:25:00Z
updated = 2026-07-21T02:37:00Z
categories = ["BACK-END"]
tags = ["GO"]
toc = true

[extra]
source = "notion"
notion_id = "e71c4bc2-6396-4a4d-bcbc-c51d0a0dc360"
notion_url = "https://app.notion.com/p/Go-time-e71c4bc263964a4dbcbcc51d0a0dc360"
external_url = "http://jeonghwan-kim.github.io/dev/2019/01/14/go-time.html"
+++

## Time 생성

```go
time.Now()                                              // 현재 시간
time.Date(year, month, day, h, m, s, ns, loc)            // 특정 시점
time.Unix(sec, nsec)                                     // 유닉스 타임
```

- `Month`: 1(January)부터 시작(JS는 0부터라 차이 있음)
- `time.UTC`: 미리 정의된 UTC Location

## 조회

```go
t := time.Now()
t.Year(), t.Month(), t.Day(), t.Hour(), t.Minute(), t.Second()
t.Weekday(), t.Unix(), t.Nanosecond(), t.UnixNano()
```

## 포맷 (레이아웃 기준: `Mon Jan 2 15:04:05 -0700 MST 2006`)

```go
time.Now().Format("2006-01-02 15:04:05")   // 출력 포맷
time.Parse("2006-01-02 15:04:05", s)        // 문자열 → Time 파싱
```

주요 상수: `time.RFC3339`, `time.ANSIC`, `time.Kitchen` 등

## 타임존

```go
loc, _ := time.LoadLocation("Asia/Seoul")
kst := utc.In(loc)          // 타임존 변경
kst.UTC()                   // UTC로 역변환
time.ParseInLocation(layout, value, loc)   // 파싱+타임존 한번에
```

## Duration / 계산 / 비교

```go
time.Second, time.Minute, time.Hour   // Duration 상수(나노초 기반)
t.Add(time.Hour * 10)                 // 시간 더하기
t.Before(other) / t.After(other) / t.Equal(other)
```

## Timer / Ticker

```go
t1 := time.NewTimer(time.Second * 2)
<-t1.C                          // 2초 후 채널 수신까지 대기
t1.Stop()                       // 타이머 정지

ticker := time.NewTicker(time.Second * 1)
go func() {
  for t := range ticker.C { fmt.Println(t) }
}()
ticker.Stop()
```

- Timer: 1회성 지연 실행 / Ticker: 주기 반복

원문: [http://jeonghwan-kim.github.io/dev/2019/01/14/go-time.html](http://jeonghwan-kim.github.io/dev/2019/01/14/go-time.html)
