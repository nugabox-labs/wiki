+++
title = "반디집 네이트메일 ZIP 파일명 깨짐 해결"
date = "2023-03-11T13:58:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["OS"]
tags = ["WINDOWS"]
toc = true

[extra]
source = "notion"
notion_id = "43a60ac4-b220-44c4-9c06-01303c9d4439"
notion_url = "https://app.notion.com/p/ZIP-43a60ac4b22044c49c0601303c9d4439"
external_url = "https://kr.bandisoft.com/bandizip/help/kr.nate-mail-problem/"
+++

## 네이트메일 ZIP 다운로드 → 반디집에서 파일명 깨짐

- 원인: 네이트메일이 생성하는 ZIP은 UNIX 헤더값을 쓰면서 파일명은 UTF-8이 아닌 EUC-KR(CP949)로 인코딩함

**해결**

- 반디집 7.x: UTF-8 자동 인식 지원 — 별도 설정 불필요
- 반디집 5.x/6.x: 환경설정 > 압축 풀기 > "유닉스에서 압축한 ZIP 파일의 코드페이지를 UTF8로 처리" 옵션 끄고 재실행

원문: [https://kr.bandisoft.com/bandizip/help/kr.nate-mail-problem/](https://kr.bandisoft.com/bandizip/help/kr.nate-mail-problem/)
