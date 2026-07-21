+++
title = "MySQL lower_case_table_names"
date = "2020-03-26T10:32:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["SERVER"]
tags = ["DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "3b350f7d-ccc5-468c-b6bf-0157c654c956"
notion_url = "https://app.notion.com/p/MySQL-lower_case_table_names-3b350f7dccc5468cb6bf0157c654c956"
external_url = "https://allthatlinux.com/dokuwiki/doku.php?id=mysql_8_%EB%8C%80%EC%86%8C%EB%AC%B8%EC%9E%90_%EA%B5%AC%EB%B6%84%EC%84%A4%EC%A0%95"
+++

## MySQL lower\_case\_table\_names

Linux/Unix 기본은 대소문자 구분. Windows는 보통 무시.

```
[mysqld]
lower_case_table_names = 1
```

이미 대문자 DB/테이블이 있으면 기동 실패할 수 있음.

### 대응

1. **초기화**: `systemctl stop mysqld` → datadir 비움 → 설정 추가 → 재시작 (데이터 소실)
1. **이름 소문자화 후 재기동**:

```sql
SELECT CONCAT('RENAME TABLE ', table_name, ' TO ', LOWER(table_name), ';')
FROM information_schema.tables
WHERE table_schema = 'your_schema';
```

1. **dump → 초기화 → restore**

참고: [https://stackoverflow.com/questions/1262258/mysql-case-sensitive-tables-conversion](https://stackoverflow.com/questions/1262258/mysql-case-sensitive-tables-conversion)
