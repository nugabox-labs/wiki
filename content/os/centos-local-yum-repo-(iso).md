+++
title = "CentOS Local Yum Repo (ISO)"
date = "2021-07-28T02:23:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "b0a2eae3-2ca7-4455-978c-9ab5e7362006"
notion_url = "https://app.notion.com/p/CentOS-Local-Yum-Repo-ISO-b0a2eae32ca74455978c9ab5e7362006"
+++

> 폐쇄망에서 ISO 기반 local yum repo.

## ISO 준비

```bash
mkdir /root/iso
mount -o loop /root/CentOS-6.10.iso /root/iso
cp -rP /root/iso /root/repo
```

## `/etc/yum.repos.d/local.repo`

```
[local-repository]
name=local-repo
baseurl=file:///root/repo
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY
gpgcheck=1
enabled=1
```

인터넷 repo 파일은 백업/이동.

## 적용·언마운트

```bash
yum clean all
yum repolist
df -h
umount /dev/loop0
```
