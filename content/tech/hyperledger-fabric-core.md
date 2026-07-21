+++
title = "Hyperledger Fabric Core"
date = 2024-01-16T02:57:00Z
updated = 2026-07-21T06:47:00Z
categories = ["TECH"]
tags = ["BLOCKCHAIN"]
toc = true

[extra]
source = "notion"
notion_id = "b7594e45-d53f-414d-aa4b-677ff8a48bd4"
notion_url = "https://app.notion.com/p/Hyperledger-Fabric-Core-b7594e45d53f414daa4b677ff8a48bd4"
+++

## Fabric 특징

1. 허가형(PKI 멤버십)
1. Go / Java / Node.js 체인코드
1. 내장 암호화폐 없음
1. 병렬 처리
1. 교체 가능한 합의 모듈
1. 채널별 독립 원장

## 역할 분리 (비트코인/이더와의 차이)

| 역할 | 담당 |
| --- | --- |
| Orderer | 블록 생성만 |
| Peer | 시뮬레이트 + 원장 보관 |
| App | 인증서로 트랜잭션 생성·상호작용 |

- 인증서 기반
- 동일 키를 한 블록에서 여러 번 변경 불가(일반적)

## 구성요소

- **Peer**: 트랜잭션 시뮬레이트
- **Orderer**: 트랜잭션 모아 블록 생성 (시뮬레이트 X)
- **App**: Peer/Orderer와 상호작용

## 트랜잭션 흐름 (요약)

1. Client → Peer(들): Endorse 요청
1. Peer: 체인코드 시뮬레이트 → Endorse 응답
1. Client → Orderer: Endorse된 트랜잭션 제출
1. Orderer: 블록 생성 → Peer에 배포
1. Peer: 검증 후 원장 커밋

## 채널 / MSP / CA

- **Channel**: 참여자·원장 격리
- **MSP**: 신원·권한
- **CA**: 인증서 발급
