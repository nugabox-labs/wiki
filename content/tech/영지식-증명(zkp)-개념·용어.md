+++
title = "영지식 증명(ZKP) 개념·용어"
date = 2021-07-28T05:55:00Z
updated = 2026-07-21T06:47:00Z
categories = ["TECH"]
tags = ["BLOCKCHAIN", "DID", "TIL"]
toc = true

[extra]
source = "notion"
notion_id = "6b7dd6c5-d9ed-426f-810c-3312c3eb8c39"
notion_url = "https://app.notion.com/p/ZKP-6b7dd6c5d9ed426f810c3312c3eb8c39"
external_url = "https://medium.com/coinplug-tech/%EB%B8%94%EB%A1%9D%EC%B2%B4%EC%9D%B8-%EB%8D%B0%EC%9D%B4%ED%84%B0-%ED%94%84%EB%9D%BC%EC%9D%B4%EB%B2%84%EC%8B%9C-%EB%B3%B4%ED%98%B8%EB%A5%BC-%EC%9C%84%ED%95%9C-%EC%95%94%ED%98%B8%ED%95%99-60a7d37e9b3c"
+++

## ZKP (Zero-Knowledge Proof)

비밀(Witness)을 노출하지 않고 Statement가 참임을 증명.

### 3알고리즘

- **Setup**: CRS(Common Reference String) 생성
- **Prove**: Statement + Witness → Proof
- **Verify**: CRS + Proof로 검증 (Witness 미노출)

### 안전성

- **Completeness**: 정당한 증명은 항상 통과
- **Soundness**: Witness 없이는 통과 불가
- **Zero-knowledge**: 검증자가 Witness를 알 수 없음

### 용어

| 용어 | 의미 |
| --- | --- |
| Statement | 증명할 내용 (예: 나이>19) |
| Witness | 비밀값 (예: 나이=23) |
| Instance | 공개 파라미터 |
| CRS | NIZK용 공통 참조 문자열 |
| zk-SNARK | Succinct NIZK Argument of Knowledge |

### 사례

Zcash(거래 은닉), Hyperledger Indy(DID), Mina(블록 압축 증명), ZK Rollup(ETH L2)
