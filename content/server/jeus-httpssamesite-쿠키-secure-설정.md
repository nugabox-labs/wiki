+++
title = "Jeus HTTPS/SameSite 쿠키 Secure 설정"
date = 2021-01-26T06:31:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["WAS"]
toc = true

[extra]
source = "notion"
notion_id = "9e95ad91-1d47-4608-a7ad-72e0ce2d6f35"
notion_url = "https://app.notion.com/p/Jeus-HTTPS-SameSite-Secure-9e95ad911d474608a7ad72e0ce2d6f35"
+++

## Jeus HTTPS/SameSite 쿠키 Secure 설정

**JEUS 6**

- `JEUSMain.xml`: `<node><engine-container><command-option>-Djeus.servlet.response.cookie.sameSite=None`
- `WEBMain.xml`: `<web-container><session-config><session-cookie><secure>true`

**JEUS 7/8** (웹어드민)

1. Servers > MS 선택 > Basic 탭 > Basic Info: Lock&Edit > JVM Option에 `-Djeus.servlet.response.cookie.sameSite=None` 추가 > 확인 > Activate Changes
1. Servers > MS 선택 > Engine 탭 > Web Engine > Session Config: Lock&Edit > Secure 옵션 체크 > 확인 > Activate Changes

## 배경: Chrome 80+ SameSite 쿠키 정책 변경

- Chrome 80부터 SameSite 속성 미지정 쿠키의 기본값이 `None`→`Lax`로 변경
- `SameSite=None`: 동일사이트+크로스사이트 모두 전송 가능(CSRF 취약, HTTPS 필수)
- `SameSite=Strict`: 다른 도메인에서 전송 불가(CSRF 방지, 사용성 저하)
- `SameSite=Lax`(신규 기본값): Strict에 일부 예외(GET, `<a href>`, `<link href>`) 허용한 절충안
- 즉시 수정이 어려운 레거시 시스템은 임시로 `SameSite=None` + `Secure` 설정으로 기존 동작 유지 가능
