+++
title = "KSCHAIN 성능평가 테스트 절차"
date = 2020-07-15T02:08:00Z
updated = 2026-07-21T02:37:00Z
categories = ["BACK-END", "TECH"]
tags = ["GO", "BLOCKCHAIN"]
toc = true

[extra]
source = "notion"
notion_id = "bae1ff82-65ab-4073-98fe-8645f1a68b83"
notion_url = "https://app.notion.com/p/KSCHAIN-bae1ff8265ab407398fe8645f1a68b83"
+++

## 1. 초당 거래 처리 건수 (TPS)

- 경로: `C:\go_workspace\src\tps`
- `cmd > go run main.go`
- 결과 예시: 10000건 970ms (tps.txt에 저장)
- 카운트 변경: main.go 110행 / 출력문 변경: main.go 141행

## 2. 거래승인(합의) 시간

- cmd 창 속성 > 레이아웃 > 창 너비 30으로 맞추고 4개 순서대로 띄움
- 경로: `C:\go_workspace\src\CBFT\pbft`
- `network/node.go` 36행: fail 노드 수 변경 (1 → 최대 4개)
- `network/node.go` 49~50행: IP주소/포트 시작번호 변경 (예: 1000부터 4개면 1000)
- `network/node.go` 60행: 리더노드 포트 지정

```bash
cd C:\go_workspace\src\CBFT\pbft
go build
```

- 4개 창에 순서대로 실행: `pbft P1000`, `P1001`, `P1002`, `P1003`
- 5번째 창에서 트랜잭션 발생:

```bash
curl -H "Content-Type:application/json" -X POST -d '{"timestamp":1111}' http://192.168.1.207:1000/req
```

- 리더노드(P1000)에서 트랜잭션 발생 → 합의 시작~종료 시간 차 측정

## 3. 최대확장노드

- Build Path: `C:\go_workspace\src\CBFT`
- Achain/Bchain/Circlechain Engine: `C:\go_workspace\src\github.com\bigpicturelabs\consensusPBFT\pbft\Test1~3\node.go`
- 측정 로그(노드 수 : 소요시간): 100개 216초 · 200개 462초 · 300개 681초 · 400개 952초 · 500개 1525초(490에서 종료) · 600개 2042초(595에서 종료) · 700개 2695초(695에서 종료) · 800개 실패
- 이후 내부 2대/3대 조합별 Block Generation 세부 실험 로그 다수 기록됨(환경별 수치 변동 큼, 세부는 참고용)

## 4. 동적 암호키 생성 속도

- 경로: `C:\go_workspace\src\Create_key`
- `cmd > go run main.go`
- 결과 예시: 10000건 970ms (KEY.txt에 저장)
- 카운트 변경: main.go 13행

## 5. 무결성지표 / 6. 상호연동 수

- 315행 `func` 뒤에 `error` 추가
- 346~349, 354행 주석 해제

## 7. 로드밸런싱

- (원본 내용 없음)

---

KSCHAIN 블록체인 프로젝트 성능평가 테스트 절차 기록. 관련: [KSCHAIN 기본 동작](https://app.notion.com/p/aef03dac87d64ef2865a8fd997d947bc), [KSCHAIN 세팅](https://app.notion.com/p/f964742e60894aab932a2754077080a2)
