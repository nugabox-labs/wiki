+++
title = "MySQL PID file 미갱신 오류"
date = 2019-09-30T11:37:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["DB", "MySQL", "MACOS"]
toc = true

[extra]
source = "notion"
notion_id = "78c05e63-78b3-47e8-ba3f-caf8e7c57172"
notion_url = "https://app.notion.com/p/MySQL-PID-file-78c05e6378b347e8ba3fcaf8e7c57172"
external_url = "https://gmlwjd9405.github.io/2018/12/23/error-mysql-start.html"
+++

## ERROR! The server quit without updating PID file

버전 전환(예: 8.0 ↔ 5.7) 후 데이터 디렉터리/소유권 불일치 시 흔함.

데이터 경로 예: macOS `/usr/local/var/mysql/`, Linux `/var/lib/mysql/`

```bash
ps -ef | grep mysql
kill -15 <PID>          # 잔여 프로세스 종료
ls -la /usr/local/var/mysql/
sudo chown -R _mysql /usr/local/var/mysql/   # 환경에 맞는 mysql 유저
mysql.server start      # 또는 systemctl start mysqld
```

에러 로그(`*.err`)도 함께 확인.
