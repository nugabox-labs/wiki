+++
title = "Ubuntu 부팅 시 스크립트 실행"
date = 2023-11-29T23:55:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "DEV-OPS", "TECH"]
tags = ["LINUX", "BASH", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "ace32fde-82f5-45ba-912a-672f6916f842"
notion_url = "https://app.notion.com/p/Ubuntu-ace32fde82f545ba912a672f6916f842"
external_url = "https://minimin2.tistory.com/121"
+++

## 1. crontab `@reboot`

```bash
vi scripts.sh
# #!/bin/bash
chmod +x scripts.sh
crontab -e
# @reboot /full/path/scripts.sh > /full/path/scripts.sh.log 2>&1
```

## 2. `/etc/init.d` + update-rc.d

```bash
cd /etc/init.d
sudo vi scripts.sh
sudo update-rc.d scripts.sh defaults
reboot
```
