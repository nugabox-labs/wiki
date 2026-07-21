+++
title = "SVN 저장소 이관"
date = 2023-07-17T02:10:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "DEV-OPS", "TECH"]
tags = ["GIT/SVN", "BASH", "LINUX", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "eaa1b8dd-a1f0-48a5-8de9-d98502eeb8cc"
notion_url = "https://app.notion.com/p/SVN-eaa1b8dda1f048a58de9d98502eeb8cc"
external_url = "https://bigcode.tistory.com/4"
+++

## 1. 덤프

```bash
mkdir -p /path/to/dump
svnadmin dump /path/to/repos/repo1 > /path/to/dump/repo1.dump
# conf 백업: authz, passwd, svnserve.conf
```

## 2. 전송

```bash
sftp user@new-host
put repo1.dump
```

## 3. 복원 (신규 서버)

```bash
sudo apt-get install subversion
sudo svnadmin create /path/to/repos/repo1
sudo svnadmin load /path/to/repos/repo1 < /path/to/dump/repo1.dump

# conf/authz, conf/passwd 재설정 후
svnserve -d -r /path/to/repos
# 부팅 자동: /etc/rc.local 등에 동일 명령
```

클라이언트(TortoiseSVN): Relocate로 URL 변경.
