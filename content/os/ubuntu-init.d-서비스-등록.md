+++
title = "Ubuntu init.d 서비스 등록"
date = 2024-05-23T08:11:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "b982e02b-7a87-4373-a356-a41f36182567"
notion_url = "https://app.notion.com/p/Ubuntu-init-d-b982e02b7a874373a356a41f36182567"
+++

## 서비스 등록 (SysV init.d)

```bash
cp /data/myservice.sh /etc/init.d/
chmod 755 /etc/init.d/myservice.sh
service myservice start
```

## 부팅 자동 실행

```bash
update-rc.d -f <daemon> defaults   # 등록
update-rc.d -f <daemon> remove     # 제거
```

## 상태 목록

```bash
service --status-all
```

참고: 최신 Ubuntu는 systemd 권장 (`systemctl enable --now`).
