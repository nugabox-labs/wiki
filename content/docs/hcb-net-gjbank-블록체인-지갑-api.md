+++
title = "HCB-NET-GJBANK 블록체인 지갑 API"
date = 2019-11-12T17:30:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END", "TECH"]
tags = ["GO", "BLOCKCHAIN"]
toc = true

[extra]
source = "notion"
notion_id = "f13400b8-6f8b-452e-a024-bc1617f162b6"
notion_url = "https://app.notion.com/p/HCB-NET-GJBANK-API-f13400b86f8b452ea024bc1617f162b6"
external_url = "https://sites.google.com/site/hcbnetgjbankprototype/3-guhyeon"
+++

입출력 모두 문자열. Go 대소문자 구분.

| 기능 | 명령 | 예시 | 출력 |
| --- | --- | --- | --- |
| 지갑 생성 | createWallet | `createWallet` | 주소 |
| 충전 | charge | `charge -to 주소 -amount 100` | `OK` / 에러 |
| 거래 | send | `send -from 주소 -to 주소 -amount 1000` | txID / 에러 |
| 잔고 | getBalance | `getBalance -address 주소` | 잔고 / 에러 |
| tx→블록 | searchBlockIDbyTxID | `searchBlockIDbyTxID -txid TXID` | blockID / 에러 |
| 블록 조회 | getBlock | `getBlock -blockid 블록ID` | Block{} / 에러 |
| UTXO 재계산 | reIndexUtxo | `reIndexUtxo` | `[SUCCESS] N transactions...` |
| 지갑 정보 | getWallet | `getWallet -address 주소` | 문자열 / 에러 |
