+++
title = "lower_case_table_names (대소문자)"
date = 2021-09-06T07:04:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "14433acc-28b7-4f12-ab7c-6c02e3938b30"
notion_url = "https://app.notion.com/p/lower_case_table_names-14433acc28b74f12ab7c6c02e3938b30"
+++

## lower\_case\_table\_names

| 값 | 동작 |
| --- | --- |
| 0 | 디스크에 대소문자 그대로 저장·참조도 구분 (Linux 등) |
| 1 | 소문자로 저장·참조 (대소문자 무시) |
| 2 | 저장은 구분, 참조는 소문자 (macOS 등) |

```
[mysqld]
lower_case_table_names = 1
```

변경 후 재시작. **기존** 대문자 테이블은 rename 필요:

```sql
SELECT CONCAT('RENAME TABLE ', table_name, ' TO ', LOWER(table_name), ';')
FROM information_schema.tables
WHERE table_schema = 'your_schema';
```
