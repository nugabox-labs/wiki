+++
title = "my.cnf 샘플 utf8·InnoDB"
date = 2019-11-18T06:58:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "768ff7f8-a3a7-4260-9c14-b9a8c035c8f4"
notion_url = "https://app.notion.com/p/my-cnf-utf8-InnoDB-768ff7f8a3a742609c14b9a8c035c8f4"
external_url = "https://app.notion.com/p/25c032ef73b84ae7b39262de324ff34e"
+++

## my.cnf 샘플 (utf8 / InnoDB)

```
[mysqld]
user            = mysql
port            = 3306
pid-file        = /var/lib/mysql/mysqld.pid
socket          = /var/lib/mysql/mysql.sock
datadir         = /var/lib/mysql
basedir         = /usr
tmpdir          = /tmp
log-error       = /var/log/mysql/error.log
symbolic-links  = 0

character-set-server = utf8
collation-server     = utf8_general_ci
init_connect         = SET NAMES utf8
character-set-client-handshake = FALSE
lower_case_table_names = 1
skip-name-resolve
explicit_defaults_for_timestamp

max_connections     = 1000
max_connect_errors  = 1000
wait_timeout        = 60
max_allowed_packet  = 16M

default-storage-engine = InnoDB
innodb_buffer_pool_size         = 1G
innodb_data_file_path           = ibdata1:10M:autoextend
innodb_log_file_size            = 128M
innodb_log_buffer_size          = 8M
innodb_flush_log_at_trx_commit  = 1
innodb_lock_wait_timeout        = 120
innodb_read_io_threads          = 8
innodb_write_io_threads         = 8

[mysqld_safe]
pid-file = /var/run/mysqld/mysqld.pid

[client]
default-character-set = utf8
port   = 3306
socket = /var/lib/mysql/mysql.sock

[mysqldump]
default-character-set = utf8
max_allowed_packet    = 16M

[mysql]
default-character-set = utf8
no-auto-rehash
```
