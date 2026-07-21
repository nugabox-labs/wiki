+++
title = "virbr0 인터페이스 삭제"
date = "2020-08-28T11:07:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "24234a81-f787-477d-a215-de1475aa3b29"
notion_url = "https://app.notion.com/p/virbr0-24234a81f787477da215de1475aa3b29"
external_url = "https://fliedcat.tistory.com/167"
+++

## virbr0 제거 (libvirt NAT 브리지)

하이퍼바이저가 아니면 보통 불필요.

```bash
systemctl stop libvirtd
systemctl disable libvirtd
brctl show
ip link set virbr0 down
brctl delbr virbr0
# 또는: ip link delete virbr0
brctl show
```
