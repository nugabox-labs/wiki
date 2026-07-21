+++
title = "Jeus-WebtoB 세션 클러스터 구성"
date = 2019-09-16T01:01:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["WAS"]
toc = true

[extra]
source = "notion"
notion_id = "b34d51fa-4c60-4d16-99cb-e8a9ecc7c9a4"
notion_url = "https://app.notion.com/p/Jeus-WebtoB-b34d51fa4c604d1699cbe8a9ecc7c9a4"
+++

## Jeus WebtoB 세션 클러스터 구성 (별도 정리)

- 서버1에 배포된 애플리케이션을 target에서 제거 → Server1+Server2를 묶는 Cluster 구성 → 애플리케이션을 Cluster에 재배포(datasource도 개별 서버 대신 Cluster에서 체크하면 양쪽 서버에 유지됨)
- Server1, 2 모두 Engine > Web Connection에서 WebtoB Connector 추가(buffersize 20), Registration Id를 동일하게(예: MyGroup) 맞춤
- WebtoB `http.m`의 MyGroup MinProc/MaxProc를 합산값으로 조정(예: 20+20=40)
- WebtoB, 서버1·2 재기동 후 `wsadmin` > `st -j`로 MyGroup에 서버1·2가 모두 떠 있는지 확인

**동작 확인**

- 세션 생성 후 Session ID 끝자리(엔진 식별자)로 어느 서버로 라우팅됐는지 확인
- 해당 서버 shutdown 후 재요청 시 Session ID는 유지된 채 끝자리만 다른 서버로 바뀌면 클러스터링 정상 동작
