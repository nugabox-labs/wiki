+++
title = "MyISAM→InnoDB 엔진 변경"
date = 2019-11-21T15:41:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "a660f14b-3e9e-42eb-a730-76236d572a34"
notion_url = "https://app.notion.com/p/MyISAM-InnoDB-a660f14b3e9e42eba73076236d572a34"
external_url = "https://sarc.io/index.php/mariadb/1126-myisam-innodb"
+++

## MyISAM → InnoDB

- InnoDB: 트랜잭션·복구·row lock·DML 많음
- MyISAM: SELECT 위주·FULLTEXT(구버전)

```sql
ALTER TABLE 테이블명 ENGINE=InnoDB;
```

## 일괄 (덤프 치환)

```bash
mysqldump -u root -p DB명 > dump.sql
sed -e 's/ENGINE=MyISAM/ENGINE=InnoDB/g' dump.sql > dump_innodb.sql
mysql -u root -p DB명 < dump_innodb.sql
```
