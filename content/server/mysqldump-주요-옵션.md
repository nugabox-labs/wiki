+++
title = "mysqldump 주요 옵션"
date = 2019-04-26T04:41:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "dde7d632-a30d-456b-8195-4f927fab2584"
notion_url = "https://app.notion.com/p/mysqldump-dde7d632a30d456b81954f927fab2584"
+++

## mysqldump 자주 쓰는 옵션

| 옵션 | 용도 |
| --- | --- |
| `--skip-extended-insert` | VALUES 한 행씩 (편집·찾기 쉬움) |
| `--complete-insert` / `-c` | 컬럼명 포함 INSERT |
| `--allow-keywords` | 예약어 필드명에 백틱 |
| `--no-data` | 스키마만 |
| `--no-create-info` | CREATE TABLE 생략 |
| `--quick` / `-q` | 대용량 한 행씩 |
| `--default-character-set=` | 클라이언트 charset |
| `--routines --triggers` | 프로시저·트리거 포함 |

```bash
mysqldump --allow-keywords --default-character-set=utf8mb4 \
  --routines --triggers -u user -p dbname > dump.sql
```

관련: [Export/Import](https://app.notion.com/p/f5415070160a4161bce8d66a6a75c5a4)
