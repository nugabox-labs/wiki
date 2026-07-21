+++
title = "MySQL Unknown table engine InnoDB"
date = 2022-02-21T15:47:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "TECH"]
tags = ["DB", "MySQL", "ISSUE"]
toc = true

[extra]
source = "notion"
notion_id = "3bbbb61c-ab50-45fb-b2d9-e4599b4935bf"
notion_url = "https://app.notion.com/p/MySQL-Unknown-table-engine-InnoDB-3bbbb61cab5045fbb2d9e4599b4935bf"
external_url = "https://app.notion.com/p/768ff7f8a3a742609c14b9a8c035c8f4"
+++

## 증상

```
Unknown table engine 'InnoDB'
```

InnoDB가 메모리/버퍼 설정 문제로 로드되지 않은 경우가 많음.

## 조치

1. 에러 로그에서 InnoDB·memory 메시지 확인
1. `innodb_buffer_pool_size` 등을 가용 RAM에 맞게 줄인 뒤 재기동

```bash
tail -n 200 /var/log/mysql/error.log
# 또는
tail -n 200 /var/lib/mysql/*.err
# 또는 /var/log/mysqld.log
```

관련: my.cnf 샘플
