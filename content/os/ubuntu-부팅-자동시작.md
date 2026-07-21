+++
title = "Ubuntu 부팅 자동시작"
date = 2022-08-21T16:46:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "TECH"]
tags = ["LINUX", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "0b138b8b-fb43-4828-a859-a2b66fe2ff04"
notion_url = "https://app.notion.com/p/Ubuntu-0b138b8bfb434828a859a2b66fe2ff04"
external_url = "https://horae.tistory.com/entry/%EB%A6%AC%EB%88%85%EC%8A%A4-%EC%9A%B0%EB%B6%84%ED%88%AC-%EC%9E%90%EB%8F%99%EC%8B%9C%EC%9E%91-%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%A8-%EC%84%A4%EC%A0%95-%EB%B6%80%ED%8C%85%EC%8B%9C-%EC%8B%9C%EC%9E%91-%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%A8-%EC%84%A4%EC%A0%95"
+++

## GUI (데스크톱)

```bash
sudo apt-get install bum   # Boot-Up Manager
```

## 서비스 자동시작 (SysV)

```bash
sudo update-rc.d 서비스명 defaults   # 등록
sudo update-rc.d 서비스명 remove     # 제거
# CUI: sysv-rc-conf
```

## Runlevel / 스크립트

```bash
runlevel   # 또는 who -r
ln -s /etc/init.d/실제스크립트 /etc/rcN.d/S99이름
# 부팅 한 줄: /etc/rc.local (chmod +x)
# 종료 시: /etc/rc6.d/K99_이름
```
