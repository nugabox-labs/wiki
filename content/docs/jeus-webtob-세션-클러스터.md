+++
title = "Jeus WebtoB 세션 클러스터"
date = 2019-09-16T01:01:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["WAS"]
toc = true

[extra]
source = "notion"
notion_id = "b34d51fa-4c60-4d16-99cb-e8a9ecc7c9a4"
notion_url = "https://app.notion.com/p/Jeus-WebtoB-b34d51fa4c604d1699cbe8a9ecc7c9a4"
+++

## 구성

1. Server1 앱을 target에서 제거 → Server1+Server2 Cluster 구성 → 앱을 Cluster에 재배포(datasource도 Cluster 체크)
1. Server1·2 Engine → Web Connection에 WebtoB Connector 추가(buffersize 20), Registration Id 동일(예: MyGroup)
1. WebtoB `http.m` MyGroup MinProc/MaxProc = 합산(예: 20+20=40)
1. WebtoB·서버1·2 재기동 후 `wsadmin` → `st -j`로 MyGroup에 서버1·2 확인

## 동작 확인

- 세션 생성 후 Session ID 끝자리(엔진 식별자)로 라우팅 서버 확인
- 해당 서버 shutdown 후 재요청 시 Session ID 유지·끝자리만 다른 서버로 바뀌면 정상
