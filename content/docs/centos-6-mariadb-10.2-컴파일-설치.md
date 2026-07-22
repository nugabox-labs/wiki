+++
title = "CentOS 6 MariaDB 10.2 컴파일 설치"
date = 2020-05-12T06:45:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["DB", "MySQL", "LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "5947b5d5-abb7-41f1-b011-d3eb10414edd"
notion_url = "https://app.notion.com/p/CentOS-6-MariaDB-10-2-5947b5d5abb741f1b011d3eb10414edd"
+++

다중 인스턴스 시 basedir·datadir·port·socket·user 분리.

## cmake

```bash
cmake . \
  -DCMAKE_INSTALL_PREFIX=/usr/local/mariadb-10.2 \
  -DMYSQL_DATADIR=/usr/local/mariadb-10.2/data \
  -DMYSQL_UNIX_ADDR=/tmp/mariadb.sock \
  -DMYSQL_TCP_PORT=3307 \
  -DMYSQL_USER=mariadb \
  -DDEFAULT_CHARSET=utf8 \
  -DDEFAULT_COLLATION=utf8_general_ci \
  -DWITH_INNOBASE_STORAGE_ENGINE=1 \
  -DWITH_EXTRA_CHARSETS=all \
  -DENABLED_LOCAL_INFILE=1 \
  -DDOWNLOAD_BOOST=1 -DWITH_BOOST=../boost_1_59_0
make && make install
```

## 초기화·기동

```bash
./scripts/mysql_install_db --user=mariadb \
  --basedir=/usr/local/mariadb --datadir=/usr/local/mariadb/data \
  --socket=/tmp/mariadb.sock
./mysqld_safe --user=mariadb --basedir=/usr/local/mariadb \
  --datadir=/usr/local/mariadb/data --socket=/tmp/mariadb.sock --port=3307 &
```
