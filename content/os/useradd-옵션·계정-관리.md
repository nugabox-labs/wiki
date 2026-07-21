+++
title = "useradd 옵션·계정 관리"
date = "2019-10-22T15:43:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "d22d17b6-58e4-4057-94f2-ba641161d814"
notion_url = "https://app.notion.com/p/useradd-d22d17b658e4405794f2ba641161d814"
external_url = "https://btyy.tistory.com/tag/useradd%20%EC%98%B5%EC%85%98"
+++

## useradd / 계정 관리

관련: `/etc/passwd` `/etc/shadow` `/etc/group` `/etc/skel`

```bash
useradd user01
useradd -u 1100 -g users -c "comment" -d /home/user01 -s /bin/bash user01
passwd user01
chown user01. /home/user01
# skel 복사(프롬프트 bash-4.2$ 방지)
cp -a /etc/skel/. /home/user01/
chown -R user01:user01 /home/user01
```
