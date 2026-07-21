+++
title = "FLUSH PRIVILEGES"
date = "2019-09-26T07:49:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["SERVER"]
tags = ["DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "dfe2cd38-33d3-4b26-a316-ce102f191401"
notion_url = "https://app.notion.com/p/FLUSH-PRIVILEGES-dfe2cd3833d34b26a316ce102f191401"
+++

## FLUSH PRIVILEGES

`mysql.user` 등을 **직접** INSERT/UPDATE/DELETE 한 뒤 grant 테이블을 다시 로드할 때 사용.

`GRANT`/`ALTER USER`/`CREATE USER`만 쓰면 보통 불필요.

```sql
FLUSH PRIVILEGES;
```

```bash
mysqladmin -u root -p reload
# 또는
mysqladmin -u root -p flush-privileges
```

습관적 남발은 부하 큼.
