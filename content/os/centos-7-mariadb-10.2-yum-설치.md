+++
title = "CentOS 7 MariaDB 10.2 yum 설치"
date = 2020-08-25T18:31:00Z
updated = 2026-07-21T02:37:00Z
categories = ["OS", "SERVER"]
tags = ["DB", "MySQL", "LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "8f9923dc-1507-43a8-88c7-94ce8d08390c"
notion_url = "https://app.notion.com/p/CentOS-7-MariaDB-10-2-yum-8f9923dc150743a888c794ce8d08390c"
external_url = "https://xshine.tistory.com/309"
+++

## CentOS 7 — MariaDB 10.2 yum 설치

### repo (`/etc/yum.repos.d/MariaDB.repo`)

```
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.2/centos7-amd64
gpgkey = https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck = 1
```

레포 선택: [https://downloads.mariadb.org/mariadb/repositories/](https://downloads.mariadb.org/mariadb/repositories/)

### 설치·기동

```bash
yum install MariaDB-server MariaDB-client
# yum timeout 시 /etc/yum.conf 에 timeout=60
systemctl start mariadb
systemctl enable mariadb
```

### 방화벽 (필요 시)

```bash
firewall-cmd --permanent --zone=public --add-port=3306/tcp
firewall-cmd --reload
```
