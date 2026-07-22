+++
title = "Tibero 7 Docker 구성"
date = 2025-05-26T23:37:00Z
updated = 2026-07-22T01:30:00Z
categories = ["SERVER", "TECH"]
tags = ["Tibero", "DB", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "c3dcf48a-c9a9-44cc-a2cb-8bf57898ceb9"
notion_url = "https://app.notion.com/p/Tibero-7-Docker-c3dcf48ac9a944cca2cb8bf57898ceb9"
external_url = "https://velog.io/@person813/%ED%8B%B0%EB%B2%A0%EB%A1%9C%EB%A5%BC-%EB%8F%84%EC%BB%A4%EB%9D%BC%EC%9D%B4%EC%A7%95-%ED%95%B4%EB%B3%B4%EC%9E%90"
+++

## Tibero 7 Docker 구성

> 기본 계정 예: `sys` / `tibero` (데모·문서용). 실서비스 비밀번호는 별도 관리.

### Dockerfile

```docker
FROM ubuntu:18.04
ENV TB_HOME=/tibero7 TB_SID=tibero
ENV LD_LIBRARY_PATH=$TB_HOME/lib:$TB_HOME/client/lib
ENV PATH=$PATH:$TB_HOME/bin:$TB_HOME/client/bin
COPY tibero7.tar.gz /usr/local/tibero7.tar.gz
RUN apt-get update && apt-get install -y libaio1 libncurses5 \
 && tar -xzvf /usr/local/tibero7.tar.gz \
 && chmod +x /tibero7/bin/tbboot
```

```bash
docker build -t keesung/tibero:7.0.0 .
# 또는: docker pull keesung/tibero:7.0.0
```

### 초기화 (`initial.sql` 요약)

```sql
create database "tibero"
  user sys identified by tibero
  maxinstances 8 maxdatafiles 100
  character set MSWIN949 national character set UTF16
  logfile group 1 'log001.log' size 100M,
          group 2 'log002.log' size 100M,
          group 3 'log003.log' size 100M
  noarchivelog
  datafile 'system001.dtf' size 100M autoextend on
  default temporary tablespace TEMP tempfile 'temp001.dtf' size 100M autoextend on
  undo tablespace UNDO datafile 'undo001.dtf' size 100M autoextend on;
exit;
```

### [start-tibero.sh](http://start-tibero.sh/)

```bash
#!/bin/sh
cp /usr/local/license.xml /tibero7/license/
/tibero7/config/gen_tip.sh
mkdir -p /usr/bin/pstack
/tibero7/bin/tbboot nomount
tbsql sys/tibero @'/usr/local/initial.sql'
/tibero7/bin/tbboot
/tibero7/scripts/system.sh -p1 tibero -p2 syscat -a1 y -a2 y -a3 y -a4 y -sod y
tail -f /dev/null
```

### docker-compose.yml

```yaml
version: '3.3'
services:
  tibero:
    image: keesung/tibero:7.0.0
    container_name: tibero
    ports: ["8629:8629"]
    hostname: localhost   # 라이선스 Host Name과 일치
    volumes: ["./tibero:/usr/local"]
    command: "/usr/local/start-tibero.sh"
```

```bash
docker compose up -d
docker logs -f tibero
```
