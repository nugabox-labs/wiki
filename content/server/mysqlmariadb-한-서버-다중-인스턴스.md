+++
title = "MySQL/MariaDB 한 서버 다중 인스턴스"
date = 2019-11-18T06:24:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "824c6433-3eae-44cf-b555-dedf81c974d8"
notion_url = "https://app.notion.com/p/MySQL-MariaDB-824c64333eae44cfb555dedf81c974d8"
+++

## 한 서버에 MySQL/MariaDB 다중 인스턴스

인스턴스마다 **반드시 분리**할 항목:

1. basedir (설치 경로)
1. datadir
1. socket 파일
1. my.cnf (또는 `--defaults-file`)
1. TCP 포트
1. init/systemd 유닛 (`/etc/init.d/mysql` 등)

```bash
# my.cnf 를 각 datadir 쪽에 두고 기동 예
mysqld_safe --defaults-file=/path/to/instance1/my.cnf &
mysqld_safe --defaults-file=/path/to/instance2/my.cnf &
```

`/etc/my.cnf` 하나만 쓰면 충돌 → 인스턴스별 cnf + 포트/소켓 분리.
