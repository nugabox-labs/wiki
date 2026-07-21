+++
title = "신규 사이트 추가 절차 (Tibero+WebtoB+Jeus)"
date = 2020-07-09T00:03:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["WEB", "WAS"]
toc = true

[extra]
source = "notion"
notion_id = "ec00dd58-46ad-4c40-8226-f0289f23bc19"
notion_url = "https://app.notion.com/p/Tibero-WebtoB-Jeus-ec00dd5846ad4c408226f0289f23bc19"
+++

## 신규 사이트 추가 절차 (Tibero + WebtoB + Jeus)

**1) Tibero**

- Tablespace 생성
- User 생성 및 권한 부여

**2) WebtoB**

- `config/http.m`에 NODE, VHOST, SVRGROUP, SERVER, URI, LOGGING 항목 추가

```bash
wscfl -i http.m   # 설정 컴파일
wsdown && wsboot  # 재기동
```

**3) Jeus 웹어드민**

- Resource > Data Source: 기존 항목 DUP(복제) 후 새 DB 정보 입력
- Servers: 기존 서버 DUP 후 포트번호만 새로 지정
  - 상세편집 > Basic > Data Sources에서 방금 만든 DB 선택
  - Engine > Web Connections > webtob에서 Registration Id를 WebtoB SERVER명과 일치시킴(예: `MyGroup2020`)
  - 저장 후 서버 start (RUNNING 상태 확인)
- Application > + Deploy: Id, Path(서버 내 실제 경로, Jeus 접근 권한 있는 계정 소유여야 함), Type(WAR), Target Server 선택, Context Path(`/`) 지정 후 저장
- 해당 서버 stop → start로 재기동

**4) 도메인 추가 및 사이트 접속 확인**
