+++
title = "NFS 서버·클라이언트 설정"
date = 2023-03-20T06:24:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["LINUX", "NETWORK"]
toc = true

[extra]
source = "notion"
notion_id = "95b52328-a1d5-448e-ad10-2ad0af20f41a"
notion_url = "https://app.notion.com/p/NFS-95b52328a1d5448ead102ad0af20f41a"
external_url = "https://m.blog.naver.com/PostView.naver?blogId=songariq&logNo=80033573576"
+++

## 서버 (`/etc/exports`)

```bash
# /data 192.168.3.220/255.255.255.0(rw)
/data 192.168.0.0/24(rw,sync,no_subtree_check)
/pub *(ro,root_squash)

yum -y install nfs-utils
systemctl enable --now nfs-server   # CentOS 7+
# /etc/init.d/nfs start             # CentOS 6
exportfs -arv
chmod 775 /data   # 필요 시
```

주요 옵션: `ro`/`rw`, `root_squash`/`no_root_squash`, `insecure`, `noaccess`

## 클라이언트

```bash
yum -y install nfs-utils
mkdir -p /mnt/data
mount -t nfs 192.168.0.10:/data /mnt/data

# fstab
# 192.168.0.10:/data  /mnt/data  nfs  timeo=15,intr  0  0
```

## 확인

```bash
rpcinfo -p
exportfs -v
showmount -e [서버]
cat /proc/filesystems | grep nfs   # 없으면 modprobe nfs
```
