+++
title = "Tibero tbdsn.tbr 설정"
date = 2021-05-11T06:18:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "TECH"]
tags = ["Tibero", "DB", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "502aed3f-31e4-4a28-a9f4-8873a1e11d7e"
notion_url = "https://app.notion.com/p/Tibero-tbdsn-tbr-502aed3f31e44a28a9f48873a1e11d7e"
external_url = "https://lelecoder.com/84"
+++

## Tibero `tbdsn.tbr` (클라이언트 접속, Oracle tnsnames.ora 대응)

경로 예: `C:\TmaxData\tibero6\client\config\tbdsn.tbr`

```
tibero=(
    (INSTANCE=(HOST=localhost)
              (PORT=8629)
              (DB_NAME=tibero)
    )
)
```

- `HOST` / `PORT`(기본 8629) / `DB_NAME`
- SID = 바깥 이름(`tibero`). 복수 SID 가능
- 옵션: `TB_NLS_LANG`, `TBCLI_LOG_LVL`, `TBCLI_LOG_DIR`

### 이중화 / LB / Failover

```
tibero=(
    (INSTANCE=(HOST=localhost)(PORT=8629)(DB_NAME=tibero))
    (INSTANCE=(HOST=192.168.x.x)(PORT=8629)(DB_NAME=tibero2))
    (LOAD_BALANCE=Y)
    (USE_FAILOVER=Y)
    (FORCE_FAILOVER_DELAY=10)
)
```

이중화 SID는 CTF(Connection Time FailOver) 지원.
