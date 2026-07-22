+++
title = "HTTP 헤더"
date = 2019-10-30T18:15:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["NETWORK"]
toc = true

[extra]
source = "notion"
notion_id = "96f23e8c-66e5-4531-b568-c94822afaa58"
notion_url = "https://app.notion.com/p/HTTP-96f23e8c66e54531b568c94822afaa58"
external_url = "https://gmlwjd9405.github.io/2019/01/28/http-header-types.html"
+++

## 일반

- `Date`, `Connection`(`close`/`Keep-Alive`), `Cache-Control`, `Pragma`, `Trailer`

## 엔티티(본문)

- `Content-Type` / `Content-Language` / `Content-Encoding` / `Content-Length`
- `Content-Location`, `Content-Disposition`(`inline`/`attachment`)
- `Content-Security-Policy`(예: `default-src 'self'`), `Location`(리다이렉트·201), `Last-Modified`
- `Transfer-Encoding: chunked`

## 요청

- `Host`(필수 1.1+), `User-Agent`, `Cookie`, `Referer`, `Authorization`
- `If-Modified-Since`, `Origin`(CORS), `Accept`/`Accept-Charset`/`Accept-Encoding`/`Accept-Language`

## 응답

- `Server`, `Set-Cookie`, `Expires`, `Age`, `ETag`, `Allow`
- `Access-Control-Allow-Origin`(`*` 주의)

## CORS

1. Preflight: `OPTIONS` + `Access-Control-Request-Method`/`-Headers`
1. 서버 `Access-Control-Allow-*` 응답
1. 일치 시 실제 요청

## 캐시·쿠키

- `Cache-Control`: `no-store` / `no-cache` / `must-revalidate` / `public`·`private` / `max-age`
- `If-None-Match` → 동일 ETag면 304
- Set-Cookie: `Expires`/`Max-Age`, `Secure`, `HttpOnly`, `Domain`, `Path`
