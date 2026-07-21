+++
title = "HTTP 헤더 종류 및 항목 정리"
date = 2019-10-30T18:15:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["NETWORK"]
toc = true

[extra]
source = "notion"
notion_id = "96f23e8c-66e5-4531-b568-c94822afaa58"
notion_url = "https://app.notion.com/p/HTTP-96f23e8c66e54531b568c94822afaa58"
external_url = "https://gmlwjd9405.github.io/2019/01/28/http-header-types.html"
+++

## 일반(공통) 헤더

- `Date`: 메시지 생성 일시
- `Connection`: `close`(TCP 즉시 종료) / `Keep-Alive`(연결 유지)
- `Cache-Control`, `Pragma`, `Trailer`: 캐시/기타 제어

## 엔티티(Entity) 헤더 — 본문 콘텐츠 설명

- `Content-Type`: 미디어 타입+인코딩 (예: `text/html; charset=utf-8`)
- `Content-Language`: 컨텐츠 언어
- `Content-Encoding`: 압축 방식 (예: `gzip`)
- `Content-Length`: 바이트 길이
- `Content-Location`: 리소스 실제 위치
- `Content-Disposition`: `inline`(화면 표시) / `attachment; filename=...`(다운로드)
- `Content-Security-Policy`: 허용할 외부 리소스 출처 지정 (XSS 방어). 예: `default-src 'self'`
- `Location`: 리다이렉트/생성된 리소스 주소 (300번대, 201 응답과 함께)
- `Last-Modified`: 마지막 수정 일시
- `Transfer-Encoding: chunked`: 길이 모를 때 조각 전송

## 요청 헤더

- `Host` (필수, HTTP/1.1+): 요청 호스트/포트
- `User-Agent`: 클라이언트 소프트웨어 정보
- `Cookie`: 서버가 Set-Cookie로 설정한 쿠키
- `Referer`: 직전 페이지 주소
- `If-Modified-Since`: 지정 일시 이후 변경분만 요청
- `Authorization`: 인증 토큰 (예: `Bearer xxx`)
- `Origin`: 요청 시작 주소 (다르면 CORS 에러, 응답의 `Access-Control-Allow-Origin`과 연동)
- `Accept` / `Accept-Charset` / `Accept-Encoding` / `Accept-Language`: 클라이언트가 원하는 타입/인코딩/언어

## 응답 헤더

- `Server`: 서버 소프트웨어 정보
- `Set-Cookie`: 세션 쿠키 설정
- `Expires`: 캐시 만료 일시(단, `Cache-Control: max-age`가 있으면 무시됨)
- `Age`: max-age 대비 경과 시간(초)
- `ETag`: 컨텐츠 변경 감지용 태그
- `Allow`: 지원 가능한 HTTP 메소드 목록 (예: `GET,HEAD`, 405 에러 시 함께 응답)
- `Access-Control-Allow-Origin`: CORS 허용 출처 (`*`는 전체 허용, 보안 약화 주의)

## CORS 동작 개요

- cross-origin 요청은 브라우저가 보안상 제한 → CORS로 서버가 명시적으로 허용
- Preflight(사전 요청): `OPTIONS`로 서버에 허용 여부 확인 → `Access-Control-Request-Method`/`-Headers`로 실제 보낼 내용 통지 → 서버가 `Access-Control-Allow-*`로 응답 → 일치하면 실제 요청 진행

## 캐시 관련

- `Cache-Control`: `no-store`(캐싱 안함) / `no-cache`(매번 서버 확인) / `must-revalidate`(만료된 것만 확인) / `public`·`private`(공유 여부) / `max-age`(유효시간)
- `If-None-Match`: ETag 비교, 다르면 재수신 / 같으면 서버가 304 응답

## 쿠키 관련 (Set-Cookie 옵션)

- `Expires` / `Max-Age`: 만료 설정(Max-Age 우선)
- `Secure`: HTTPS에서만 전송
- `HttpOnly`: JS 접근 차단 (XSS 방어에 권장)
- `Domain`: 지정 도메인에서만 전송
- `Path`: 지정 경로에서만 전송

참고: 쿠키/세션 차이 [https://doooyeon.github.io/2018/09/10/cookie-and-session.html](https://doooyeon.github.io/2018/09/10/cookie-and-session.html)

원문: [https://gmlwjd9405.github.io/2019/01/28/http-header-types.html](https://gmlwjd9405.github.io/2019/01/28/http-header-types.html)
