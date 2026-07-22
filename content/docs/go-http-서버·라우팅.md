+++
title = "Go HTTP 서버·라우팅"
date = 2019-10-29T15:01:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "BACK-END"]
tags = ["GO", "NETWORK"]
toc = true

[extra]
source = "notion"
notion_id = "ce2fdb46-b1e2-4c60-a246-b295a0ea066b"
notion_url = "https://app.notion.com/p/Go-HTTP-ce2fdb46b1e24c60a246b295a0ea066b"
external_url = "https://github.com/bear2u/til/tree/master/golang/restfulapi"
+++

## 1) 기본 서버

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

## 2) 커스텀 멀티플렉서 (ServeHTTP)

```go
type CustomServeMux struct{}
func (p *CustomServeMux) ServeHTTP(w http.ResponseWriter, r *http.Request) {
    if r.URL.Path == "/" { giveRandom(w, r); return }
    http.NotFound(w, r)
}
mux := &CustomServeMux{}
http.ListenAndServe(":8000", mux)
```

## 3) http.NewServeMux

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

## 4) httprouter (경로 파라미터)

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
router.ServeFiles("/static/*filepath", http.Dir("d:\\test"))
log.Fatal(http.ListenAndServe(":8000", router))
```

- 외부 명령 stdout: `os/exec` `Command(...).Start()/Wait()`

## 5) gorilla/mux (정규식 경로)

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
srv := &http.Server{Handler: router, Addr: "127.0.0.1:8000",
    WriteTimeout: 15*time.Second, ReadTimeout: 15*time.Second}
log.Fatal(srv.ListenAndServe())
// /articles/books/123 → Category: books, ID: 123
```
