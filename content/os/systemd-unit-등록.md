+++
title = "systemd unit 등록"
date = "2019-11-18T17:22:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "30e0b367-eb44-4bd9-ae67-b4ec0d4cbfd5"
notion_url = "https://app.notion.com/p/systemd-unit-30e0b367eb444bd9ae67b4ec0d4cbfd5"
external_url = "https://victorydntmd.tistory.com/215"
+++

## systemd unit 등록 (CentOS 7+)

파일: `/usr/lib/systemd/system/이름.service` (또는 `/etc/systemd/system/`)

```
[Unit]
Description=My App
After=network.target

[Service]
Type=forking
ExecStart=/path/to/start.sh
ExecStop=/path/to/stop.sh
Restart=on-failure

[Install]
WantedBy=multi-user.target
```

```bash
systemctl daemon-reload
systemctl enable --now 이름
systemctl status 이름
journalctl -u 이름 -e
```

CentOS 6: `chkconfig` / `/etc/rc.d/init.d/`
