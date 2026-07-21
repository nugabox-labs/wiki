+++
title = "CentOS 6 yum vault mirror (EOL)"
date = "2020-12-22T14:38:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "08acd4d3-b52b-4e3e-b402-473862a9ad59"
notion_url = "https://app.notion.com/p/CentOS-6-yum-vault-mirror-EOL-08acd4d3b52b4e3eb402473862a9ad59"
external_url = "https://lhjin.tistory.com/entry/CentOS-6-yum-update-%EC%98%A4%EB%A5%98-%ED%95%B4%EA%B2%B0-%EB%B0%A9%EB%B2%95"
+++

## CentOS 6 EOL — yum mirror 오류

```javascript
Error: Cannot find a valid baseurl for repo: base
YumRepo Error: All mirror URLs are not using ftp, http[s] or file.
```

EOL 후 공식 미러 종료 → vault 사용.

### 64bit

```bash
echo "https://vault.centos.org/6.10/os/x86_64/" > /var/cache/yum/x86_64/6/base/mirrorlist.txt
echo "http://vault.centos.org/6.10/extras/x86_64/" > /var/cache/yum/x86_64/6/extras/mirrorlist.txt
echo "http://vault.centos.org/6.10/updates/x86_64/" > /var/cache/yum/x86_64/6/updates/mirrorlist.txt
yum clean all && yum update
```

32bit는 경로 `i386`으로 동일.
