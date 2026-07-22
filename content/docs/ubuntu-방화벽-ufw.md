+++
title = "Ubuntu 방화벽 ufw"
date = 2022-05-14T18:01:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER", "DEV-OPS", "TECH"]
tags = ["LINUX", "NETWORK", "BASH", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "91dfd4da-7c3d-4a49-bb7c-897996b3fd2e"
notion_url = "https://app.notion.com/p/Ubuntu-ufw-91dfd4da7c3d4a49bb7c897996b3fd2e"
external_url = "https://mrgamza.tistory.com/792"
+++

## Ubuntu ufw

```bash
sudo ufw enable
sudo ufw disable

sudo ufw allow 1234/tcp
sudo ufw deny 1234/tcp
sudo ufw delete allow 1234/tcp
sudo ufw delete deny 1234/tcp

sudo ufw deny from <IP>
sudo ufw status
```
