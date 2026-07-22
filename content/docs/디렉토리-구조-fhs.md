+++
title = "디렉토리 구조 FHS"
date = 2019-04-04T08:46:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "119e358a-14fe-48dd-b294-4876b2cfaa14"
notion_url = "https://app.notion.com/p/FHS-119e358a14fe48ddb2944876b2cfaa14"
+++

## 디렉토리 구조 FHS

| 경로 | 용도 |
| --- | --- |
| `/` | 루트 |
| `/bin` `/sbin` | 일반/관리 명령 |
| `/boot` | 커널·부트 |
| `/dev` | 장치 |
| `/etc` | 설정 |
| `/home` `/root` | 사용자 홈 |
| `/lib` | 공유 라이브러리 |
| `/mnt` `/media` | 마운트 |
| `/proc` `/sys` | 가상 FS |
| `/tmp` | 임시 |
| `/usr` | 패키지/프로그램 |
| `/var` | 로그·spool·DB 등 가변 데이터 |

```bash
mount /dev/sr0 /mnt/cdrom
mount /dev/sda1 /mnt/usb
```
