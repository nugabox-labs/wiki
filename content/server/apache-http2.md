+++
title = "Apache HTTP/2"
date = 2021-07-07T01:04:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["WEB"]
toc = true

[extra]
source = "notion"
notion_id = "1085819d-c709-45cf-a212-c9897da7ed2c"
notion_url = "https://app.notion.com/p/Apache-HTTP-2-1085819dc70945cfa212c9897da7ed2c"
external_url = "https://httpd.apache.org/docs/current/mod/mod_http2.html"
+++

## 개요

HTTP/1.1 호환을 유지하며 프레임·전송 방식을 바꿔 로드 시간을 줄인 프로토콜. Apache는 2.4.17+ `mod_http2`(libnghttp2, OpenSSL 1.0.2+). Prefork MPM 미지원.

## Safari NSURLErrorDomain -1017

개발 HTTPS에서 Safari/macOS·iOS가 응답 파싱 실패할 때. 참고: [Plesk 스레드](https://talk.plesk.com/threads/ios-mac-devices-could-not-open-website.358985/)

## 점검·조치

1. 브라우저에서 HTTP/2 사용 여부 확인
1. `conf/httpd.conf` 또는 `conf.modules.d/10-h2.conf`:

```javascript
LoadModule http2_module modules/mod_http2.so

<IfModule http2_module>
ProtocolsHonorOrder On
Protocols h2 h2c http/1.1
</IfModule>
```

1. HTTP/2가 원인이면 위 블록 주석 후 Apache 재시작 → 접속 확인
