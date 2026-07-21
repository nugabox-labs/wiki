+++
title = "TCP/IP와 HTTP 차이"
date = 2019-11-14T14:28:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["NETWORK"]
toc = true

[extra]
source = "notion"
notion_id = "299486bd-fc8f-4cfe-8dbf-ef3a31050503"
notion_url = "https://app.notion.com/p/TCP-IP-HTTP-299486bdfc8f4cfe8dbfef3a31050503"
external_url = "http://blog.naver.com/PostView.nhn?blogId=k220j&logNo=220694238797"
+++

## 계층

- TCP/IP: 전송(Transport)
- HTTP: 응용(Application). SMTP·IMAP 등과 동일 계층
- HTTP/HTTPS/FTP 등은 TCP 위에서 동작

## 데이터·연결

|  | TCP | HTTP |
| --- | --- | --- |
| 형태 | byte array | 문자열(메시지) |
| 연결 | 상시 연결, request 없이 receive 가능 | 요청-응답 기본, keep-alive 가능(기본 close) |

## 선택

- 지연↓·바이너리: 소켓(TCP)
- 웹·표준 메서드/상태코드: HTTP
