+++
title = "crontab 예제·로깅"
date = 2019-09-26T08:59:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "DEV-OPS"]
tags = ["LINUX", "BASH"]
toc = true

[extra]
source = "notion"
notion_id = "dd25e5fe-7f9d-46b2-9a68-49deecd974b4"
notion_url = "https://app.notion.com/p/crontab-dd25e5fe7f9d46b29a6849deecd974b4"
+++

## 기본

```bash
crontab -e    # 편집
crontab -l    # 목록
crontab -r    # 전체 삭제
```

## 필드

```
분(0-59) 시(0-23) 일(1-31) 월(1-12) 요일(0-7, 0·7=일)
```

## 예제

```bash
* * * * * /home/script/test.sh                 # 매분
45 5 * * 5 /home/script/test.sh                # 금 05:45
0,20,40 * * * * /home/script/test.sh           # 0/20/40분
0-30 1 * * * /home/script/test.sh              # 1시 0~30분
*/10 * * * * /home/script/test.sh              # 10분마다
*/10 2,3,4 5-6 * * /home/script/test.sh        # 5~6일 2~4시 10분마다
```

## 로깅·무시

```bash
* * * * * /home/script/test.sh > /home/script/test.sh.log 2>&1
* * * * * /home/script/test.sh >> /home/script/test.sh.log 2>&1
* * * * * /home/script/test.sh > /dev/null 2>&1
```

## 백업

```bash
crontab -l > /home/bak/crontab_bak.txt
50 23 * * * crontab -l > /home/bak/crontab_bak.txt
```

한 줄에 스케줄+명령. `#` 주석 가능.

> 관련: Linux cron 작업 예약
