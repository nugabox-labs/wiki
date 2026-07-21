+++
title = "SFTP 파일 리스트 셸"
date = 2023-03-10T02:21:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER", "DEV-OPS"]
tags = ["LINUX", "BASH", "NETWORK"]
toc = true

[extra]
source = "notion"
notion_id = "5549ed66-041d-419e-82c7-896f97af3c4e"
notion_url = "https://app.notion.com/p/SFTP-5549ed66041d419e82c7896f97af3c4e"
external_url = "https://twofootdog.tistory.com/110"
+++

```bash
#!/bin/bash
REMOTE_ADDR="REMOTE_IP"
REMOTE_USER="USER"
REMOTE_DIR="/remote/dir"
LOCAL_DIR="/local/dir"

# 동시 실행 방지
SHELL_EXEC=`ps -ef | grep "/bin/sh -c /path/to/get_file.sh" | grep -v grep | wc -l`
if [ "$SHELL_EXEC" -gt 1 ]; then
  exit 0
fi

# 원격 파일 리스트
FILES=`sftp -b - $REMOTE_USER@$REMOTE_ADDR <<EOF
cd $REMOTE_DIR
ls FILE_*.txt
EOF`
FILES=`echo $FILES | sed "s/.*sftp> ls FILE_\*.txt//"`
[ -z "$FILES" ] && exit 0

# get + rename to backup
(
  echo cd $REMOTE_DIR
  echo lcd $LOCAL_DIR
  for FILE in $FILES; do
    echo get $FILE
    echo rename $FILE $REMOTE_DIR/backup/$FILE
  done
) | sftp -b - $REMOTE_USER@$REMOTE_ADDR
```

- 사전: ssh-keygen 등으로 무암호 sftp
