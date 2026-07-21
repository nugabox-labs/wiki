+++
title = "Go time 패키지"
date = 2019-11-28T16:25:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END"]
tags = ["GO"]
toc = true

[extra]
source = "notion"
notion_id = "e71c4bc2-6396-4a4d-bcbc-c51d0a0dc360"
notion_url = "https://app.notion.com/p/Go-time-e71c4bc263964a4dbcbcc51d0a0dc360"
external_url = "http://jeonghwan-kim.github.io/dev/2019/01/14/go-time.html"
+++

## 생성

```go
time.Now()
time.Date(year, month, day, h, m, s, ns, loc)
time.Unix(sec, nsec)
```

- `Month`: 1(January)부터 (JS는 0부터)
- `time.UTC`: UTC Location

## 조회

```go
t := time.Now()
t.Year(), t.Month(), t.Day(), t.Hour(), t.Minute(), t.Second()
t.Weekday(), t.Unix(), t.Nanosecond(), t.UnixNano()
```

## 포맷 (레이아웃: `Mon Jan 2 15:04:05 -0700 MST 2006`)

```go
time.Now().Format("2006-01-02 15:04:05")
time.Parse("2006-01-02 15:04:05", s)
```

상수: `time.RFC3339`, `time.ANSIC`, `time.Kitchen` 등

## 타임존

```go
loc, _ := time.LoadLocation("Asia/Seoul")
kst := utc.In(loc)
kst.UTC()
time.ParseInLocation(layout, value, loc)
```

## Duration / 비교

```go
time.Second, time.Minute, time.Hour
t.Add(time.Hour * 10)
t.Before(other) / t.After(other) / t.Equal(other)
```

## Timer / Ticker

```go
t1 := time.NewTimer(time.Second * 2)
<-t1.C
t1.Stop()

ticker := time.NewTicker(time.Second)
go func() {
  for t := range ticker.C { fmt.Println(t) }
}()
ticker.Stop()
```

- Timer: 1회 / Ticker: 주기
