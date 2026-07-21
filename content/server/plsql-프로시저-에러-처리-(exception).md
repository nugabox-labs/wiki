+++
title = "PL/SQL 프로시저 에러 처리 (EXCEPTION)"
date = "2020-11-17T04:29:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["SERVER"]
tags = ["DB", "Oracle"]
toc = true

[extra]
source = "notion"
notion_id = "90a12411-e202-40a3-abc7-fa36dbbdeebf"
notion_url = "https://app.notion.com/p/PL-SQL-EXCEPTION-90a12411e20240a3abc7fa36dbbdeebf"
+++

## PL/SQL 프로시저 에러 처리 (EXCEPTION)

```sql
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        O_RESULT_CODE := SQLCODE;
        O_RESULT_MSG  := SQLERRM;
```

- `SQLCODE`: 에러 코드 / `SQLERRM`: 에러 메시지
- OUT 파라미터(`O_RESULT_CODE`, `O_RESULT_MSG`)로 호출부에 에러 정보 전달하는 패턴
