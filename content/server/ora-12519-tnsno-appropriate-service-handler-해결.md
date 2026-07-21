+++
title = "ORA-12519 TNS:no appropriate service handler 해결"
date = 2020-02-18T17:09:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["DB", "Oracle"]
toc = true

[extra]
source = "notion"
notion_id = "57521112-e16a-4ea1-b940-7b3cc6a49538"
notion_url = "https://app.notion.com/p/ORA-12519-TNS-no-appropriate-service-handler-57521112e16a4ea1b9407b3cc6a49538"
external_url = "https://luckybaby.tistory.com/70"
+++

## ORA-12519: TNS:no appropriate service handler found 해결

**원인**: 개발자별 DB Connection Process 수의 총합이 DBMS의 `PROCESSES` 설정값(max)을 초과할 때 발생

**해결**

```sql
SHOW PARAMETER PROCESSES;   -- 현재 설정값 확인

ALTER SYSTEM SET processes=100 SCOPE=SPFILE;   -- 여유있는 값으로 증가(재시작 필요)
```

- `spfile` 적용은 DB 재시작 후 반영됨

원문: [https://luckybaby.tistory.com/70](https://luckybaby.tistory.com/70)
