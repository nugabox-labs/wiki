+++
title = "OSI 7계층 정리"
date = 2025-01-09T02:33:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["NETWORK"]
toc = true

[extra]
source = "notion"
notion_id = "674da90a-9e6f-4a6d-b9e1-039f9be901d1"
notion_url = "https://app.notion.com/p/OSI-7-674da90a9e6f4a6db9e1039f9be901d1"
external_url = "https://velog.io/@yiseungyun/OSI-7%EA%B3%84%EC%B8%B5-%EC%9D%B4%ED%95%B4%ED%95%A0-%EB%95%8C%EA%B9%8C%EC%A7%80-%EA%B3%B5%EB%B6%80%ED%95%98%EA%B8%B0"
+++

## OSI 7계층 요약

| 계층 | 역할 | 주요 프로토콜/장비 |
| --- | --- | --- |
| 7 응용(Application) | 사용자 인터페이스, 사용자 의도↔네트워크 데이터 변환 | HTTP/HTTPS, FTP, SMTP/POP3/IMAP, DNS, DHCP |
| 6 표현(Presentation) | 문자 인코딩, 압축, 암호화/복호화, 데이터 포맷 변환 | SSL/TLS, JPEG, MPEG |
| 5 세션(Session) | 세션 수립·유지·복구, 동기화, 대화(발언권) 제어 | NetBIOS, SSH, PPTP |
| 4 전송(Transport) | 포트 기반 전달, 신뢰성/순서 보장, 흐름·혼잡 제어 | TCP(연결지향·신뢰성), UDP(비연결·저지연) |
| 3 네트워크(Network) | 라우팅(최적 경로), IP 주소 지정, 패킷 분할/포워딩 | IP, ICMP |
| 2 데이터링크(Data Link) | 인접 노드 간 전송, MAC 주소, 프레임화, 오류/흐름 제어 | Ethernet, ARP, 스위치 |
| 1 물리(Physical) | 비트를 전기/광/전파 신호로 변환 | 케이블, NIC, 리피터, 허브 |

## 계층을 나눈 이유

- 복잡성 관리: 각 계층이 자기 역할만 처리 (예: 응용 계층은 전송 방식을 몰라도 됨)
- 유지보수: 한 계층 기술을 바꿔도 다른 계층에 영향 없음

## IP 주소 vs MAC 주소

- IP: 전체 경로(다른 네트워크까지) 지정용, 라우터가 처리
- MAC: 같은 네트워크 내 구간별 직접 통신용, 스위치가 처리
- 다른 네트워크로 갈 때는 ARP로 라우터의 MAC을 알아내고, 라우터를 거칠 때마다 MAC 헤더는 교체되지만 IP 헤더(출발지/목적지)는 그대로 유지됨

## 데이터 전송 과정 (캡슐화 → 역캡슐화)

**송신측**: 응용(데이터 생성) → 표현(인코딩/압축/암호화, 헤더 추가) → 세션(세션ID 추가) → 전송(세그먼트 분할, TCP/UDP 헤더) → 네트워크(패킷 변환, IP 헤더) → 데이터링크(프레임 변환, MAC 헤더) → 물리(비트열→신호)

**수신측**: 물리(신호→비트) → 데이터링크(MAC 헤더 제거) → 네트워크(IP 헤더 제거, 재조립) → 전송(TCP/UDP 헤더 제거, 순서 확인) → 세션(세션 헤더 제거) → 표현(복호화/압축해제/디코딩) → 응용(최종 데이터 사용)

원문: [https://velog.io/@yiseungyun/OSI-7계층-이해할-때까지-공부하기](https://velog.io/@yiseungyun/OSI-7계층-이해할-때까지-공부하기)
