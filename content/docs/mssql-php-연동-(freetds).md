+++
title = "MSSQL PHP 연동 (FreeTDS)"
date = 2021-05-06T04:47:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "BACK-END"]
tags = ["DB", "PHP"]
toc = true

[extra]
source = "notion"
notion_id = "835722dd-7fed-434c-b942-5ef17f2f3ad6"
notion_url = "https://app.notion.com/p/MSSQL-PHP-FreeTDS-835722dd7fed434cb9425ef17f2f3ad6"
external_url = "https://only1004.tistory.com/39"
+++

## FreeTDS + PHP-MSSQL

1. `yum install freetds freetds-devel php-mssql`
1. `/etc/freetds.conf`에 DB 등록
1. `tsql -S <db명> -U <user> -P <pass>` 로 연결 테스트

## PHP 연동 예

```php
$conn = mssql_connect($host, $user, $pass);
mssql_select_db($db, $conn);
$results = mssql_query("SELECT * FROM table", $conn);
while ($row = mssql_fetch_array($results, MSSQL_ASSOC)) { print_r($row); }
mssql_close($conn);
```
