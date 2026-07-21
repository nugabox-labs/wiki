+++
title = "Lock wait timeout exceeded"
date = "2021-03-16T07:32:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["SERVER"]
tags = ["DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "3a79383e-2726-4dab-b132-4e9a6951b3ac"
notion_url = "https://app.notion.com/p/Lock-wait-timeout-exceeded-3a79383e27264dabb1324e9a6951b3ac"
external_url = "https://highavailability.tistory.com/6"
+++

## Lock wait timeout exceeded; try restarting transaction

InnoDB row/gap lock 대기 초과. 긴 트랜잭션·REPEATABLE-READ gap lock이 흔한 원인.

```
[mysqld]
innodb_lock_wait_timeout = 240
transaction-isolation = READ-COMMITTED
```

확인:

```sql
SHOW VARIABLES LIKE '%wait_timeout%';
SHOW VARIABLES LIKE '%tx_isolation%';
-- 또는 transaction_isolation
```

앱 쪽: 트랜잭션 짧게, 데드락/락 보유 세션 점검 (`SHOW ENGINE INNODB STATUS`).
