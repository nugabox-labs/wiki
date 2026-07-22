+++
title = "Tibero tip 설정·기동 순서"
date = 2021-05-11T06:18:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "TECH"]
tags = ["Tibero", "DB", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "d0432ced-56fb-42b3-ba5b-9422c5d3f033"
notion_url = "https://app.notion.com/p/Tibero-tip-d0432ced56fb42b3ba5b9422c5d3f033"
external_url = "http://blog.naver.com/PostView.nhn?blogId=pridria&logNo=40195673621"
+++

## Tibero 환경설정 · 기동 순서

문서/라이선스: [technet.tmax.co.kr](http://technet.tmax.co.kr/)

### `$TB_SID.tip` (`$TB_HOME/config/`)

| 파라미터 | 의미 |
| --- | --- |
| `DB_NAME` | Create DB 기본명. 생성 후 임의 변경 시 nomount+에러 |
| `LISTENER_PORT` | 접속 포트 (관련: `LISTENER_IP`) |
| `CONTROL_FILES` | 컨트롤파일 경로(다중화 가능) |
| `DB_CREATE_FILE_DEST` | data/redo 기본 경로 |
| `LOG_ARCHIVE_DEST` | archive 경로 |
| `MAX_SESSION_COUNT` | WP×WT, 10 배수 권장 |
| `TOTAL_SHM_SIZE` | DB 공유 메모리 |
| `EX_MEMORY_HARD_LIMIT` | PGA 한도(기본=TOTAL\_SHM\_SIZE) |
| `_USGMT_UNIFORM_EXTSIZE` | UNDO extent 고정 |
| `USE_NET_KEEPALIVE` | 끊긴 세션 정리 |

### `tbdsn.tbr`

`tbsql user/password@network_alias` (`network_alias=$TB_SID`면 생략 가능)

### 기동 (`tbboot`)

```
tbboot
  → tip/OS환경 확인 → Instance 생성
  → nomount (control file 읽기 실패 시 여기서 종료)
  → mount (TSN 체크, Crash Recovery)
  → normal (alter database open 가능)
```

- nomount 실패: kernel/cc, `TB_SID`/`TB_HOME`, tip, 엔진 설치, 라이선스
- mount에서 Media Recovery 필요 시 수동 복구
- Oracle과 달리 nomount→mount `alter database mount` 미지원
