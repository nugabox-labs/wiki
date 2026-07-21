+++
title = "Go MySQL 드라이버"
date = 2020-10-20T01:59:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "BACK-END"]
tags = ["DB", "MySQL", "GO"]
toc = true

[extra]
source = "notion"
notion_id = "8c47da2d-353d-492c-aa2d-ce4c6205afe6"
notion_url = "https://app.notion.com/p/Go-MySQL-8c47da2d353d492caa2dce4c6205afe6"
external_url = "https://github.com/go-sql-driver/mysql"
+++

## 설치

```bash
go get -u github.com/go-sql-driver/mysql
```

## 연결

```go
import (
    "database/sql"
    _ "github.com/go-sql-driver/mysql"
)

db, err := sql.Open("mysql", "user:pass@tcp(127.0.0.1:3306)/dbname")
if err != nil {
    panic(err)
}
defer db.Close()
```
