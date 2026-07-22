+++
title = "KSCHAIN 성능평가 테스트 절차"
date = 2020-07-15T02:08:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END", "TECH"]
tags = ["GO", "BLOCKCHAIN"]
toc = true

[extra]
source = "notion"
notion_id = "bae1ff82-65ab-4073-98fe-8645f1a68b83"
notion_url = "https://app.notion.com/p/KSCHAIN-bae1ff8265ab407398fe8645f1a68b83"
+++

## 1. TPS

- `C:\go_workspace\src\tps` → `go run main.go`
- 예: 10000건 970ms → tps.txt
- 카운트 main.go 110행 / 출력 141행

## 2. 합의 시간

- `C:\go_workspace\src\CBFT\pbft`
- `network/node.go`: fail 노드(36), IP·포트(49~50), 리더 포트(60)

```bash
cd C:\go_workspace\src\CBFT\pbft && go build
pbft P1000   # 창마다 P1001~P1003
curl -H "Content-Type:application/json" -X POST -d '{"timestamp":1111}' http://192.168.1.207:1000/req
```

- 리더(P1000)에서 합의 시작~종료 측정

## 3. 최대 확장 노드

- Build: `C:\go_workspace\src\CBFT`
- Engine: `...\consensusPBFT\pbft\Test1~3\node.go`
- 로그(노드:초): 100:216 · 200:462 · 300:681 · 400:952 · 500:1525(490 종료) · 600:2042 · 700:2695 · 800 실패

## 4. 동적 암호키 생성

- `C:\go_workspace\src\Create_key` → `go run main.go`
- 예: 10000건 970ms → KEY.txt (카운트 13행)

## 5~6. 무결성·상호연동

- 315행 `func` 뒤 `error` 추가, 346~349·354 주석 해제

## 7. 로드밸런싱

- (원본 없음)
