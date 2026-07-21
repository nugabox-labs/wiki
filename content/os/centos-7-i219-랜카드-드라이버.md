+++
title = "CentOS 7 I219 랜카드 드라이버"
date = 2024-04-30T06:34:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER", "TECH"]
tags = ["LINUX", "NETWORK", "ISSUE"]
toc = true

[extra]
source = "notion"
notion_id = "9c4b46db-0f2c-473c-8592-759103b0e5cd"
notion_url = "https://app.notion.com/p/CentOS-7-I219-9c4b46db0f2c473c8592759103b0e5cd"
external_url = "https://burndogfather.com/266"
+++

## CentOS 7 I219 랜카드 드라이버

```bash
sudo lshw -C network
# intel I219-V

cd /tmp
mkdir /tmp/usb
fdisk -l
mount -t vfat /dev/sdb1 /tmp/usb

cd /tmp/usb
tar xvfz e1000e-3.8.4.tar.gz
cd e1000e-3.8.4/src
sudo make install
sudo modprobe e1000e

# ping 안 되면 reboot
```
