+++
title = "yum vault·lock·timeout"
date = 2021-02-19T06:11:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "09de93b2-1f57-459f-96f4-82e616eaa5bc"
notion_url = "https://app.notion.com/p/yum-vault-lock-timeout-09de93b21f57459f96f482e616eaa5bc"
external_url = "https://vault.centos.org/"
+++

## RPM 저장소

- [https://vault.centos.org/](https://vault.centos.org/)
- [http://ftp.iij.ad.jp/pub/linux/centos-vault/](http://ftp.iij.ad.jp/pub/linux/centos-vault/)
- [https://www.rpmfind.net/](https://www.rpmfind.net/) · [http://rpm.pbone.net/](http://rpm.pbone.net/) · [https://www.rpmseek.com/](https://www.rpmseek.com/)

```bash
cat /etc/redhat-release
yum install 패키지명 --downloadonly --downloaddir=경로
```

## yum lock

`Another app is currently holding the yum lock`

```bash
rm -rf /var/run/yum.pid
```

## EOL mirror (vault)

`All mirror URLs are not using ftp, http[s] or file` → EOL로 mirrorlist 무효.

`/etc/yum.repos.d/CentOS-Base.repo`에서 mirrorlist 주석, baseurl을 vault로:

```
baseurl=http://vault.centos.org/$releasever/os/$basearch/
# updates/extras/centosplus/contrib도 동일 패턴
```

`$releasever` 인식 실패 시 `6.10`처럼 명시. 후:

```bash
yum clean all && yum repolist
```

## timeout

`/etc/yum.conf`:

```
[main]
timeout=60
```
