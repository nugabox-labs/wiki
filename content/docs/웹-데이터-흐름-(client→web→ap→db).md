+++
title = "웹 데이터 흐름 (Client→Web→AP→DB)"
date = 2024-09-19T02:18:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "TECH"]
tags = ["WEB", "WAS", "DB", "TIL"]
toc = true

[extra]
source = "notion"
notion_id = "106aac4e-32a5-81d3-b1bf-cea92ebc8a3b"
notion_url = "https://app.notion.com/p/Client-Web-AP-DB-106aac4e32a581d3b1bfcea92ebc8a3b"
external_url = "https://velog.io/@jydecn4869/%EC%9B%B9-%EB%8D%B0%EC%9D%B4%ED%84%B0-%ED%9D%90%EB%A6%84"
+++

## 웹 데이터 흐름 (5단계)

1. **Client → Web**: DNS 해석 → HTTP 요청 → httpd가 정적/동적 판별
1. **Web → AP**: 동적 요청은 WAS(JVM)로 위임
1. **AP → DB**: JDBC 드라이버·연결 풀 → SQL 실행 (캐시→디스크)
1. **AP → Web**: HTML/XML 등 응답 생성
1. **Web → Client**: httpd가 AP 결과를 브라우저에 반환

## 핵심 용어

- **정적 콘텐츠**: 디스크 파일 그대로 전송 (로고·CSS 등)
- **동적 콘텐츠**: AP가 DB·캐시 조회 후 생성 (잔고·장바구니 등)
- **CDN**: 정적 대용량 전송·전 세계 캐시 복제
- **JVM/WAS**: Tomcat·Jeus 등 — 스레드가 요청 처리·DB 풀 사용
