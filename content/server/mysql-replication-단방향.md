+++
title = "MySQL Replication 단방향"
date = 2021-05-04T09:26:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "fdbe4d4f-92b9-407c-ba2e-93b38dbf5418"
notion_url = "https://app.notion.com/p/MySQL-Replication-fdbe4d4f92b9407cba2e93b38dbf5418"
external_url = "https://server-talk.tistory.com/240"
+++

## MySQL Replication (Master → Slave)

Master: binlog 기록. Slave: binlog 적용. 기동 순서 Master → Slave. 버전은 가능하면 동일(다르면 Slave ≥ Master).

### Master

```sql
CREATE USER 'repl'@'%' IDENTIFIED BY 'password';
GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%';
FLUSH PRIVILEGES;
```

```
[mysqld]
server-id = 1
log-bin = mysql-bin
```

```sql
SHOW MASTER STATUS;  -- File, Position 기록
```

### Slave

```
[mysqld]
server-id = 2
replicate-do-db = appdb
```

Master DB dump → Slave restore 후:

```sql
CHANGE MASTER TO
  MASTER_HOST='master.example.com',
  MASTER_USER='repl',
  MASTER_PASSWORD='password',
  MASTER_LOG_FILE='mysql-bin.000010',
  MASTER_LOG_POS=1487;
START SLAVE;
SHOW SLAVE STATUS\G  -- Slave_IO_Running / Slave_SQL_Running = Yes
```

SQL 스레드 오류 시 원인 수정이 우선. 임시로만 `slave-skip-errors` 검토.
