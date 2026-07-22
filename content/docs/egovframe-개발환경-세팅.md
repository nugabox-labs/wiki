+++
title = "eGovFrame 개발환경 세팅"
date = 2025-02-24T01:34:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "BACK-END", "TECH"]
tags = ["JAVA", "WAS", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "33906644-9dca-49ea-a0ff-d12219c5811d"
notion_url = "https://app.notion.com/p/eGovFrame-339066449dca49eaa0ffd12219c5811d"
external_url = "https://velog.io/@house1021/%EC%A0%84%EC%9E%90%EC%A0%95%EB%B6%80%ED%91%9C%EC%A4%80%ED%94%84%EB%A0%88%EC%9E%84%EC%9B%8C%ED%81%AC"
+++

## 환경

1. eGovFrame IDE 압축 해제 → Workspace 지정 후 Launch
1. Perspective → **eGovFrame**
1. DB: Data Source Explorer → 드라이버 JAR 추가 → 접속 정보
1. Tomcat 서버 경로 등록 (버전 충돌 시 다운그레이드)

## 실습

1. Dynamic Web Project 생성(테스트)
1. SQL 스크립트 작성 후 실행 (`Alt+X`)
1. **eGovFrame Web Project** 생성(예제 포함)
1. 서버에 Add → 실행

## 메모

- eGov 3.1.0 오류 시 **4.1.0** 재설치로 완화되는 경우 있음
- Eclipse와 사용감 유사
