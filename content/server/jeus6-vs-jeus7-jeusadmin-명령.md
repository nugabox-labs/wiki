+++
title = "JEUS6 vs JEUS7 JeusAdmin 명령"
date = 2022-10-18T06:12:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "BACK-END", "TECH"]
tags = ["JAVA", "WAS", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "9696b203-dd3e-4282-a089-677146dbf82c"
notion_url = "https://app.notion.com/p/JEUS6-vs-JEUS7-JeusAdmin-9696b203dd3e4282a089677146dbf82c"
external_url = "https://sicylove.tistory.com/m/41"
+++

`ja`(JeusAdmin) 접속은 6/7 동일. Container → Managed Server(MS).

## MS 상태

```bash
si          # 또는 server-info  → status Running 확인
```

## MS 기동/종료 (Node Manager 필요)

```bash
stop-server <MS명>
start-server <MS명>   # started 되면 완료
```

## 애플리케이션

```bash
# app 리스트/상태 → Target Servers별 State=Running 확인, 아니면 deploy
application-info
# (환경별 단축 명령은 매뉴얼 참고)
```

## Thread (WEB-WAS 정체)

```bash
ti          # thread-info, rt(runtime) 길면 hang 의심 → thread dump
```

## Connection Pool (WAS-DB)

```bash
cpinfo -server <MS명>
cpinfo -server <MS명> -repeat 3 -interval 10
```

Idle Size=0이 장시간 → DB 커넥션 유실 의심.

JEUS7/8 명령은 거의 동일.
