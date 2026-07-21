+++
title = "Go MySQL 드라이버 (go-sql-driver)"
date = "2020-10-20T01:59:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["SERVER", "BACK-END"]
tags = ["DB", "MySQL", "GO"]
toc = true

[extra]
source = "notion"
notion_id = "8c47da2d-353d-492c-aa2d-ce4c6205afe6"
notion_url = "https://app.notion.com/p/Go-MySQL-go-sql-driver-8c47da2d353d492caa2dce4c6205afe6"
+++

## Go MySQL 드라이버

```bash
go get -u github.com/go-sql-driver/mysql
# (구) go get -u github.com/streadway/amqp  # RabbitMQ
```

### 관련 트러블

- gopacket cgo: `_Ctype_struct_` → `C.struct_` ([커밋](https://github.com/google/gopacket/commit/0c245453667e53d789b6dc8e74134345437f3312))
- `pcap.h: No such file` → `yum install libpcap*`
