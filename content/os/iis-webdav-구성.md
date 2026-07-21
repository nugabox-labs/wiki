+++
title = "IIS WebDAV 구성"
date = 2022-08-20T16:57:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER", "TECH"]
tags = ["WINDOWS", "WEB", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "0a29362d-65ea-439d-afe5-593271c89632"
notion_url = "https://app.notion.com/p/IIS-WebDAV-0a29362d65ea439dafe5593271c89632"
external_url = "http://egloos.zum.com/looi/v/3466199"
+++

## Windows 기능

IIS → World Wide Web 서비스: WebDAV 게시, 기본/Windows 인증, 디렉터리 검색.

## IIS

1. **WebDAV 제작 규칙** → 제작 규칙 추가 (지정 사용자)
1. **인증** → Windows·기본 인증만
1. **사이트** 추가 → 포트/물리 경로/연결 계정(제작 규칙과 동일)
1. 사이트 → **WebDAV 작성자** 사용 / **디렉터리 검색** 사용

## 방화벽

사이트 포트(기본 80) 인바운드 허용.

## MIME 예 (`.mkv`)

사이트 → MIME 형식 → 추가

- 확장명: `.mkv`
- MIME: `video/x-matroska`

확인: `http://127.0.0.1:<port>`
