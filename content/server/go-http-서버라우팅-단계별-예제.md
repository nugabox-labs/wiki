+++
title = "Go HTTP 서버/라우팅 단계별 예제"
date = 2019-10-29T15:01:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["NETWORK"]
toc = true

[extra]
source = "notion"
notion_id = "ce2fdb46-b1e2-4c60-a246-b295a0ea066b"
notion_url = "https://app.notion.com/p/Go-HTTP-ce2fdb46b1e24c60a246b295a0ea066b"
external_url = "https://github.com/bear2u/til/tree/master/golang/restfulapi"
+++

## Go HTTP 서버/라우팅 단계별 예제

**1) 기본 서버**

```go
package main
import ("io"; "log"; "net/http")

func myServer(w http.ResponseWriter, req *http.Request) {
    io.WriteString(w, "hello world\n")
}
func main() {
    http.HandleFunc("/", myServer)
    log.Fatal(http.ListenAndServe(":8000", nil))
}
```

**2) 커스텀 멀티플렉서 (ServeHTTP 구현)**

```go
type CustomServeMux struct{}
func (p *CustomServeMux) ServeHTTP(w http.ResponseWriter, r *http.Request) {
    if r.URL.Path == "/" { giveRandom(w, r); return }
    http.NotFound(w, r)
}
// ServeHTTP를 구현한 struct는 뭐든 멀티플렉서로 쓸 수 있음
mux := &CustomServeMux{}
http.ListenAndServe(":8000", mux)
```

**3) http.NewServeMux로 라우팅 추가**

```go
mux := http.NewServeMux()
mux.HandleFunc("/randomFloat", func(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintln(w, rand.Float64())
})
mux.HandleFunc("/randomInt", func(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintln(w, rand.Intn(100))
})
http.ListenAndServe(":8000", mux)
```

**4) httprouter 사용 (경로 파라미터 지원)**

```bash
go get github.com/julienschmidt/httprouter
```

```go
func showParams(w http.ResponseWriter, r *http.Request, params httprouter.Params) {
    fmt.Fprintf(w, params.ByName("name"))
}
router := httprouter.New()
router.GET("/api/v1/go-version", goVersion)
router.GET("/api/v1/t/:name", showParams)
router.ServeFiles("/static/*filepath", http.Dir("d:\\test"))  // 정적 파일 제공
log.Fatal(http.ListenAndServe(":8000", router))
```

- 서버 명령 실행 결과 가져오기: `os/exec`의 `exec.Command(...).Start()/Wait()`로 stdout 캡처 가능

**5) gorilla/mux 사용 (정규식 경로 매칭)**

```bash
go get -u github.com/gorilla/mux
```

```go
func ArticleHandler(w http.ResponseWriter, r *http.Request) {
    vars := mux.Vars(r)
    fmt.Fprintf(w, "Category: %v, ID: %v\n", vars["category"], vars["id"])
}
router := mux.NewRouter()
router.HandleFunc("/articles/{category}/{id:[0-9]+}", ArticleHandler)
srv := &http.Server{Handler: router, Addr: "127.0.0.1:8000", WriteTimeout: 15*time.Second, ReadTimeout: 15*time.Second}
log.Fatal(srv.ListenAndServe())
// 예: /articles/books/123 → Category: books, ID: 123
```

원문: [https://github.com/bear2u/til/tree/master/golang/restfulapi](https://github.com/bear2u/til/tree/master/golang/restfulapi)
