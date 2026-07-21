+++
title = "CentOS 6 Docker 1.7.1 설치"
date = 2022-04-04T00:09:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "c302b569-a103-4dbb-864d-4dd434b2dc7d"
notion_url = "https://app.notion.com/p/CentOS-6-Docker-1-7-1-c302b569a1034dbb864d4dd434b2dc7d"
external_url = "https://dreamsea77.tistory.com/335"
+++

> CentOS 6 EOL. Docker 최대 1.7.1.

## vault mirror · libcgroup · docker-engine

```bash
echo "http://vault.centos.org/6.10/sclo/x86_64/sclo" > /var/cache/yum/x86_64/6/base/mirrorlist.txt
echo "http://vault.centos.org/6.10/sclo/x86_64/sclo" > /var/cache/yum/x86_64/6/extras/mirrorlist.txt
echo "http://vault.centos.org/6.10/sclo/x86_64/sclo" > /var/cache/yum/x86_64/6/updates/mirrorlist.txt

wget https://vault.centos.org/6.6/os/x86_64/Packages/libcgroup-0.40.rc1-12.el6.x86_64.rpm
rpm -ivhf libcgroup-0.40.rc1-12.el6.x86_64.rpm

wget https://get.docker.com/rpm/1.7.1/centos-6/RPMS/x86_64/docker-engine-1.7.1-1.el6.x86_64.rpm
rpm -ivhf docker-engine-1.7.1-1.el6.x86_64.rpm

service docker start
chkconfig docker on
usermod -aG docker <user>
```
