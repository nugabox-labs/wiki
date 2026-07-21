+++
title = "yum 기본 명령"
date = "2020-11-18T09:12:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "6bb26f7c-920d-47dd-8e4f-a0ab73ded03c"
notion_url = "https://app.notion.com/p/yum-6bb26f7c920d47dd8e4fa0ab73ded03c"
external_url = "https://dololak.tistory.com/331"
+++

## yum 기본 명령

```bash
yum install [-y] PKG
yum localinstall file.rpm
yum install --nogpgcheck PKG
yum check-update
yum update [PKG]
yum remove PKG
yum info PKG
yum clean all
yum list | grep NAME
yum list updates
yum list available
yum list installed
```

repo: `/etc/yum.conf`, `/etc/yum.repos.d/`

EOL vault → [yum vault·lock·timeout](https://app.notion.com/p/09de93b21f57459f96f482e616eaa5bc)
