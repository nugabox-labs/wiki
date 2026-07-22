+++
title = "yum GPG/Peer cert 검증 실패"
date = 2020-10-27T13:34:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "TECH"]
tags = ["LINUX", "ISSUE"]
toc = true

[extra]
source = "notion"
notion_id = "c16942d4-7e0c-4e14-bf65-726244e9a0ed"
notion_url = "https://app.notion.com/p/yum-GPG-Peer-cert-c16942d47e0c4e14bf65726244e9a0ed"
+++

## 증상

```javascript
GPG key retrieval failed: [Errno 14] Peer cert cannot be verified or peer cert invalid
```

주로 CA 인증서/NSS/OpenSSL이 오래되어 HTTPS 미러 검증 실패(특히 CentOS 6 EOL).

## 임시: sslverify 끄기

```bash
# 단일 실행
yum --setopt=sslverify=false install ca-certificates

# 또는 /etc/yum.conf / repo 파일에
# sslverify=false
```

## CA 인증서 수동 갱신 (CentOS 6 예)

```bash
wget --no-check-certificate \
  https://vault.centos.org/6.10/updates/x86_64/Packages/ca-certificates-2020.2.41-65.1.el6_10.noarch.rpm
rpm -Uvh ca-certificates-2020.2.41-65.1.el6_10.noarch.rpm
yum install ca-certificates openssl nss
yum clean all
```

## Vault HTTP baseurl로 전환

`/etc/yum.repos.d/*.repo`의 `baseurl`을 `http://…/centos-vault/…` 등으로 바꾸고 `mirrorlist`는 주석.

> 보안상 `sslverify=false`는 임시 조치. CA 갱신·Vault 이전이 정석.
