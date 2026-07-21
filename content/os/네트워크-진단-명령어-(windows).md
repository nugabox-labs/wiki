+++
title = "네트워크 진단 명령어 (Windows)"
date = 2021-04-12T01:11:00Z
updated = 2026-07-21T02:37:00Z
categories = ["OS", "SERVER"]
tags = ["WINDOWS", "NETWORK"]
toc = true

[extra]
source = "notion"
notion_id = "16cf35c8-b463-4e25-9bd5-c427e1b74403"
notion_url = "https://app.notion.com/p/Windows-16cf35c8b4634e259bd5c427e1b74403"
external_url = "https://developer-ankiwoong.tistory.com/302?category=795676"
+++

## Windows 네트워크 진단 명령어

```shell
ping IP주소              # 호스트 상태 점검, -t 옵션으로 계속 핑
ping 127.0.0.1           # 루프백(자기 자신)

ipconfig                 # 기본 네트워크 정보
ipconfig /all             # 전체 정보

tracert IP주소또는사이트주소   # 경로상의 라우터 및 지연시간 확인

arp -a IP주소             # 특정 IP의 MAC 주소 확인

nbtstat -a IP주소         # NetBios PC 이름 나열
nbtstat -A IP주소         # PC 이름 테이블을 IP로 나열

netstat -e                # 이더넷 통계
netstat -a                # 모든 연결/수신 포트
netstat -r                # 라우팅 테이블
netstat -s                # 프로토콜별 통계
netstat -n                # 주소/포트를 숫자로 표시

pathping IP주소또는DNS주소     # ping + tracert 결합

nslookup IP주소또는DNS주소     # 호스트명↔IP 상호 조회
```

원문: [https://developer-ankiwoong.tistory.com/302?category=795676](https://developer-ankiwoong.tistory.com/302?category=795676)
