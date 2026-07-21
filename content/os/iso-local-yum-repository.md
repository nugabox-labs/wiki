+++
title = "ISO local yum repository"
date = "2020-12-02T18:39:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "84f55505-31a9-401a-8a3e-eccc2e43e8f4"
notion_url = "https://app.notion.com/p/ISO-local-yum-repository-84f5550531a9401a8a3eeccc2e43e8f4"
external_url = "https://www.lesstif.com/system-admin/iso-local-yum-repository-7634963.html"
+++

## ISO로 local yum repo

### 로컬 마운트

```bash
mkdir -p /mnt/iso
mount -o loop CentOS-x86_64-DVD.iso /mnt/iso
cat > /etc/yum.repos.d/local.repo <<'EOF'
[local-repo]
name=Local Repository
baseurl=file:///mnt/iso
enabled=1
gpgcheck=0
EOF
yum clean all && yum repolist
```

(RHEL DVD는 `baseurl=file:///mnt/iso/Server` 인 경우 있음)

### HTTP로 배포

```bash
mkdir -p /var/www/html/repos/centos
mount -o loop CentOS.iso /var/www/html/repos/centos/iso
yum install -y createrepo
cd /var/www/html/repos/centos && createrepo .
# 클라이언트 /etc/yum.repos.d/internal.repo
# baseurl=http://REPO_HOST/repos/centos/iso
```
