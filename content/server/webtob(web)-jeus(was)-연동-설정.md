+++
title = "WebtoB(WEB)-Jeus(WAS) 연동 설정"
date = 2019-10-07T18:11:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["WEB", "WAS"]
toc = true

[extra]
source = "notion"
notion_id = "8066602a-b2ce-4dbd-82b5-be4e12921f2f"
notion_url = "https://app.notion.com/p/WebtoB-WEB-Jeus-WAS-8066602ab2ce4dbd82b5be4e12921f2f"
external_url = "https://itstory07.tistory.com/539"
+++

## WebtoB(WEB) - Jeus(WAS) 연동

**기동/종료 순서**: START는 WEB→WAS, STOP은 WAS→WEB

### 1) WebtoB 환경파일 설정

```bash
vi /경로/webtob/config/http.m
```

- NODE절: `JSVPORT = 9900` (주석 해제, 없으면 추가 — 기본값 9900)
- SVRGROUP절: SVRTYPE이 JSV인 서버그룹 추가 → `jsvg SVRTYPE = JSV`
- SERVER절: 서버 추가 → `MyGroup SVGNAME = jsvg, MinProc = 20, MaxProc = 20`

### 2) 환경파일 컴파일 및 재기동

```bash
wscfl -i http.m
wsdown
wsboot
```

- 웹브라우저 `http://WEB서버IP:8080/`로 접근 확인
- `wsadmin` > `si` 로 상태 확인 시 Jeus 연동 전에는 `MyGroup`이 `NRDY`(Not Ready) 상태

### 3) Jeus 기동

```bash
startDomainAdminServer -u administrator -p <password>      # 안되면 재부팅 후 재실행
startManagedServer -domain jeus_domain -server server1 -u administrator -p <password>
jeusadmin -u administrator -p <password>
```

- 프롬프트가 다시 뜨면 정상 기동
- 웹어드민: `http://localhost:9736/webadmin`

### 4) 웹어드민에서 WebtoB 연동 등록

- IP Address: WebtoB 서버 IP
- Thread Pool Number: `http.m`의 MinProc/MaxProc 값과 일치시킴 (예: 50이면 Number=50, min50, max50)
- registration-id: WebtoB의 SERVER명과 동일하게 (예: `www`)

연동 완료 후 `wsadmin` > `si`에서 `MyGroup` 상태가 `RDY`로 바뀌면 성공

### 재기동 순서 (문제 발생 시)

```javascript
WAS 종료: Jeus 콘솔에서 local-admin(local-shutdown) → exit → reboot
WEB 종료: WebtoB 콘솔에서 wsdown
WEB 시작: wsboot
WAS 시작: startDomainAdminServer → startManagedServer → jeusadmin (순서대로)
```

- 여기서 failed가 뜨면 WebtoB, Jeus 모두 종료 후 처음부터 재진행

원문: [https://itstory07.tistory.com/539](https://itstory07.tistory.com/539) ([technet.tmaxsoft.com](http://technet.tmaxsoft.com/) 참고)
