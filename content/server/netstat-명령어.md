+++
title = "netstat 명령어"
date = 2019-09-26T08:56:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["NETWORK"]
toc = true

[extra]
source = "notion"
notion_id = "85e91393-b911-4da9-99b5-544a38138926"
notion_url = "https://app.notion.com/p/netstat-85e91393b9114da999b5544a38138926"
external_url = "https://blog.cafe24.com/1456"
+++

## netstat 옵션

```javascript
-n   호스트/포트명을 조회하지 않고 숫자로 표시
-a   모든 네트워크 상태 표시
-t   TCP만 표시
-u   UDP만 표시
-p   해당 포트를 사용하는 프로그램/PID 표시
-r   라우팅 테이블 출력
-s   프로토콜별(IP/ICMP/TCP/UDP) 통계
-c   1초 단위로 연속 출력
```

## TCP 연결 상태(State)

- `LISTEN`: 서버가 접속 요청 대기 중
- `SYN_SENT`: 클라이언트가 연결 요청 보낸 상태
- `SYN_RECEIVED`: 서버가 요청 받고 응답했지만 확인 응답 대기 중
- `ESTABLISHED`: 3-way handshake 완료, 연결됨
- `FIN_WAIT_1` / `CLOSE_WAIT` / `FIN_WAIT_2`: 연결 종료 진행 중
- `CLOSING`: 종료 확인 메시지 유실 등 드문 상태
- `TIME_WAIT`: 종료됐지만 지연 패킷 대비 소켓을 잠시 유지
- `CLOSED`: 완전 종료

## 자주 쓰는 조합

```bash
netstat -na                                   # 전체 세션 목록
netstat -na | grep ESTABLISHED                # 활성 세션만
netstat -nap | grep :80 | grep ESTABLISHED    # 80포트 동시 접속자 수
netstat -nltp                                 # LISTEN 중인 포트 정보
netstat -r                                    # 라우팅 테이블
```

원문: [https://blog.cafe24.com/1456](https://blog.cafe24.com/1456)
