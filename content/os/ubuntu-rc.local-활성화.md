+++
title = "Ubuntu rc.local 활성화"
date = 2022-08-21T16:46:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "DEV-OPS", "TECH"]
tags = ["LINUX", "BASH", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "550afd36-d0c0-4e34-9b1b-45f95877f7c8"
notion_url = "https://app.notion.com/p/Ubuntu-rc-local-550afd36d0c04e349b1b45f95877f7c8"
external_url = "https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=sw4r&logNo=221744290073"
+++

## Ubuntu rc.local 활성화 (systemd)

```bash
sudo systemctl status rc-local

# 유닛트가 없으면 생성
sudo tee /etc/systemd/system/rc-local.service <<'EOF'
[Unit]
Description=/etc/rc.local Compatibility
ConditionPathExists=/etc/rc.local

[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99

[Install]
WantedBy=multi-user.target
EOF

# rc.local 생성·권한
sudo tee /etc/rc.local <<'EOF'
#!/bin/bash
# 부팅 시 실행할 명령
exit 0
EOF
sudo chmod +x /etc/rc.local

sudo systemctl enable rc-local
sudo systemctl start rc-local
sudo systemctl status rc-local
```
