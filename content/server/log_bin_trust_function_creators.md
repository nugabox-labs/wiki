+++
title = "log_bin_trust_function_creators"
date = 2020-04-29T17:03:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "8bd9735c-f71c-4508-bd4b-462a56c12019"
notion_url = "https://app.notion.com/p/log_bin_trust_function_creators-8bd9735cf71c4508bd4b462a56c12019"
+++

> 원본이 스크린샷 이미지뿐. 주제: function/procedure 생성 시 `log_bin_trust_function_creators`

```sql
-- 임시
SET GLOBAL log_bin_trust_function_creators = 1;
```

```
[mysqld]
log_bin_trust_function_creators = 1
```

binary log 사용 환경에서 deterministic이 아닌 루틴 생성 시 필요.
