+++
title = "Oracle Linux 백업 쉘·크론탭"
date = 2022-04-06T09:03:00Z
updated = 2026-07-22T01:32:00Z
categories = ["OS", "SERVER", "DEV-OPS"]
tags = ["Oracle", "LINUX", "BASH"]
toc = true

[extra]
source = "notion"
notion_id = "6e3a3adb-2f75-457b-898d-17655fac71a1"
notion_url = "https://app.notion.com/p/Oracle-Linux-6e3a3adb2f75457b898d17655fac71a1"
external_url = "https://m.blog.naver.com/xogstar/221764350268"
+++

## RMAN 전체(주간) crontab

```bash
10 20 * * 0 /data/rman_bck/rman_bck.sh > /dev/null 2>&1
```

## RMAN 아카이브(일일) crontab

```bash
10 20 * * 1,2,3,4,5,6 /data/rman_bck/archive_bck.sh > /dev/null 2>&1
```

## Data Pump 논리백업 crontab

```bash
30 12,18 * * * /share/backup/dump/backup.sh > /share/backup/dump/backup.log
```

## Data Pump 예 (자격증명 포함 → Post)

```bash
$ORACLE_HOME/bin/expdp USER/PASS directory=everyday schemas=SCHEMA parallel=8 \
  dumpfile=full%U.dmp logfile=full_$(date '+%Y%m%d%H').log
```

## Hot backup crontab 예

```bash
30 3 * * 0 /oracle/.../hot_bck.sh >> /dev/null
```

- 상세 스크립트·환경변수는 원본 블로그/이전 본문 참고. DB 계정·FTP 계정 포함 페이지.
