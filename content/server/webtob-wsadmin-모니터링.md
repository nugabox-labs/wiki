+++
title = "WebtoB wsadmin 모니터링"
date = 2019-09-18T06:20:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["WEB", "WAS"]
toc = true

[extra]
source = "notion"
notion_id = "a765df4b-69f6-4306-a787-3e6f8a1a6d7f"
notion_url = "https://app.notion.com/p/WebtoB-wsadmin-a765df4b69f64306a7873e6f8a1a6d7f"
+++

`wsadmin` 콘솔 주요 명령.

| 명령 | 설명 |
| --- | --- |
| `quit` / `q` | 종료 |
| `wi` | 환경·라이선스 |
| `ci` / `ci -s` | 클라이언트 정보·통계 (unique IP ≈ 대략 실사용자) |
| `hist` / `!` / `!n` | 히스토리·재실행 |
| `cr` | 응답 캐시 비우기 |
| `cachelist` | 캐시 목록 |
| `st` / `st -v`/`-p`/`-j`/`-h` | 서버·프로세스·인스턴스·요청 통계 |
| `si` | 서버 정보 (`st -v`와 유사) |
| `cfg` / `-d`/`-n`/`-v`/`-u` | 실행 중 config (도메인·노드·서버·URI) |

`st -p`: html 쪽 이슈 → WebtoB / 그 외 svr → JEUS 쪽 확인.
