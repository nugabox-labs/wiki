+++
title = "TCP/IP와 HTTP의 차이"
date = 2019-11-14T14:28:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["NETWORK"]
toc = true

[extra]
source = "notion"
notion_id = "299486bd-fc8f-4cfe-8dbf-ef3a31050503"
notion_url = "https://app.notion.com/p/TCP-IP-HTTP-299486bdfc8f4cfe8dbfef3a31050503"
external_url = "http://blog.naver.com/PostView.nhn?blogId=k220j&logNo=220694238797"
+++

## TCP/IP vs HTTP

- 동작 계층이 다름: TCP/IP는 전송(Transport) 계층, HTTP는 응용(Application) 계층 (같은 계층에 SMTP, IMAP 등도 있음)
- HTTP/HTTPS/FTP 등은 TCP/IP 위에서 동작. HTTP는 TCP/IP 위에서 하이퍼텍스트를 전송하는 규약일 뿐

**데이터 형태**

- TCP: byte array(바이너리)로 통신
- HTTP: String으로 통신

**연결 방식**

- TCP: 서버와 항상 연결 유지, request 없이도 receive 가능
- HTTP: 기본은 요청-응답(request 있어야 receive), keep-alive로 연결 유지도 가능하지만 기본값은 close

**선택 기준**

- 속도가 중요하면 TCP/IP 기반 소켓 (HTTP 변환 과정 없어 더 빠름)
- 연결지향/동기식 통신이 필요하면 소켓 통신

원문: [http://blog.naver.com/PostView.nhn?blogId=k220j&logNo=220694238797](http://blog.naver.com/PostView.nhn?blogId=k220j&logNo=220694238797)
