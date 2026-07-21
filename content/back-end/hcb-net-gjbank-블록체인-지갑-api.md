+++
title = "HCB-NET-GJBANK 블록체인 지갑 API"
date = "2019-11-12T17:30:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["BACK-END", "TECH"]
tags = ["GO", "BLOCKCHAIN"]
toc = true

[extra]
source = "notion"
notion_id = "f13400b8-6f8b-452e-a024-bc1617f162b6"
notion_url = "https://app.notion.com/p/HCB-NET-GJBANK-API-f13400b86f8b452ea024bc1617f162b6"
external_url = "https://sites.google.com/site/hcbnetgjbankprototype/3-guhyeon"
+++

## HCB-NET-GJBANK-PROTOTYPE API (블록체인 지갑)

- 입출력 형식: 모두 문자열(string). golang은 대소문자 구분 주의.

| 기능 | 명령 | 예시 입력 | 출력 |
| --- | --- | --- | --- |
| 지갑 생성 | createWallet | `createWallet` | 새 지갑 주소 (예: `1F1tAaz5x...`) |
| 충전 | charge | `charge -to 주소 -amount 100` | `OK` 또는 에러코드 |
| 거래 | send | `send -from 주소 -to 주소 -amount 1000` | txID 또는 에러코드 |
| 잔고 조회 | getBalance | `getBalance -address 주소` | 잔고 값 또는 에러코드 |
| tx로 블록 검색 | searchBlockIDbyTxID | `searchBlockIDbyTxID -txid TXID` | blockID 또는 에러코드 |
| 블록 조회 | getBlock | `getBlock -blockid 블록ID` | Block{} 문자열 또는 에러코드 |
| UTXO 재계산 | reIndexUtxo | `reIndexUtxo` | `[SUCCESS] N transactions in the UTXO set` |
| 지갑 정보 조회 | getWallet | `getWallet -address 주소` | 지갑 정보 문자열 또는 에러 |

원문: [https://sites.google.com/site/hcbnetgjbankprototype/3-guhyeon](https://sites.google.com/site/hcbnetgjbankprototype/3-guhyeon)
