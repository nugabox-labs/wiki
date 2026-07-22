+++
title = "HTTPS 환경에서 IE11 FontAwesome 미표시 문제"
date = 2023-03-11T13:58:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["WINDOWS"]
toc = true

[extra]
source = "notion"
notion_id = "83421338-bbbc-4902-862a-adf3e7e4bcd7"
notion_url = "https://app.notion.com/p/HTTPS-IE11-FontAwesome-83421338bbbc4902862aadf3e7e4bcd7"
external_url = "https://nakanara.tistory.com/227"
+++

## HTTPS + IE11에서 FontAwesome 미표시 문제

- 원인: IE11 버그. SSL 환경에서 폰트 캐시를 사용하지 않으면 미표시. 캐시 사용하도록 설정하면 해결
- 환경: Apache 2.4, Tomcat 8.5.x, fontawesome 4.4.0

## 해결: Apache httpd.conf에서 폰트 확장자 캐시 설정

```javascript
LoadModule headers_module modules/mod_headers.so

<LocationMatch "\.(eot|otf|woff|ttf)$">
   Header set Access-Control-Allow-Origin "*"
   Header set Cache-Control "max-age=3600"
   Header set Pragma "none"
</LocationMatch>
```

- `Access-Control-Allow-Origin`: CORS 허용(모든 도메인)
- `Cache-Control`: 캐시 설정
- `Pragma "none"`: HTTP 1.0의 no-cache 설정을 해제

## 그 외 해결 방안 (효과는 케이스에 따라 다름)

- IE11 인터넷 옵션 > 보안 > 신뢰할 수 있는 사이트에 해당 사이트 등록
- `<head>` 최상단에 X-UA-Compatible 배치

```html
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
</head>
```
