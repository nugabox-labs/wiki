+++
title = "Bash expect 임베드"
date = 2020-12-30T13:49:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "ac428425-3931-44ff-b2c2-0cea332ff3b1"
notion_url = "https://app.notion.com/p/Bash-expect-ac428425393144ffb2c20cea332ff3b1"
external_url = "https://zetawiki.com/wiki/Bash_%EC%8A%A4%ED%81%AC%EB%A6%BD%ED%8A%B8%EC%97%90_expect_%EC%8A%A4%ED%81%AC%EB%A6%BD%ED%8A%B8_%EB%84%A3%EA%B8%B0"
+++

## Bash + expect (HEREDOC)

```bash
#!/bin/sh
USER=testuser
IP=192.0.2.10
PW='PASSWORD'
expect <<EOF
set timeout 3
spawn ssh -o StrictHostKeyChecking=no $USER@$IP "hostname"
expect "password:"
send "$PW\r"
expect eof
EOF
```

대안: `sshpass`. 비밀번호는 스크립트에 두지 않는 편이 안전. (`PASSWORD`는 플레이스홀더)
