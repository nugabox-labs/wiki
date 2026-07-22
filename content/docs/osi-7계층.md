+++
title = "OSI 7계층"
date = 2025-01-09T02:33:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["NETWORK"]
toc = true

[extra]
source = "notion"
notion_id = "674da90a-9e6f-4a6d-b9e1-039f9be901d1"
notion_url = "https://app.notion.com/p/OSI-7-674da90a9e6f4a6db9e1039f9be901d1"
external_url = "https://velog.io/@yiseungyun/OSI-7%EA%B3%84%EC%B8%B5-%EC%9D%B4%ED%95%B4%ED%95%A0-%EB%95%8C%EA%B9%8C%EC%A7%80-%EA%B3%B5%EB%B6%80%ED%95%98%EA%B8%B0"
+++

## OSI 7계층

| 계층 | 역할 | 주요 프로토콜/장비 |
| --- | --- | --- |
| 7 응용 | UI, 사용자 의도↔네트워크 데이터 | HTTP/HTTPS, FTP, SMTP/POP3/IMAP, DNS, DHCP |
| 6 표현 | 인코딩·압축·암복호화·포맷 | SSL/TLS, JPEG, MPEG |
| 5 세션 | 세션 수립·유지·복구, 동기화 | NetBIOS, SSH, PPTP |
| 4 전송 | 포트 전달, 신뢰성·흐름·혼잡 제어 | TCP(연결·신뢰), UDP(비연결·저지연) |
| 3 네트워크 | 라우팅, IP, 패킷 분할/포워딩 | IP, ICMP, 라우터 |
| 2 데이터링크 | 인접 노드, MAC, 프레임 | Ethernet, ARP, 스위치 |
| 1 물리 | 비트↔전기/광/전파 | 케이블, NIC, 허브 |

## 계층 분리 이유

- 역할 분리로 복잡도↓, 한 계층 교체가 다른 계층에 영향 적음

## IP vs MAC

- IP: 전체 경로(다른 네트워크), 라우터
- MAC: 같은 네트워크 구간, 스위치
- 라우터 통과 시 MAC 헤더는 교체, IP(출발/목적)는 유지. ARP로 다음 hop MAC 확인

## 캡슐화

송신: 응용→표현→세션→전송(세그먼트)→네트워크(패킷)→데이터링크(프레임)→물리(신호)

수신: 역순으로 헤더 제거·재조립
