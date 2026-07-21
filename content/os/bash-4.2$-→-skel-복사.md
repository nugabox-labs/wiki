+++
title = "bash-4.2$ → skel 복사"
date = 2020-03-10T05:17:00Z
updated = 2026-07-21T02:37:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "7191efdd-5fe4-4417-b749-a348c9cd79da"
notion_url = "https://app.notion.com/p/bash-4-2-skel-7191efdd5fe44417b749a348c9cd79da"
external_url = "https://xbb123.tistory.com/48"
+++

## bash-4.2$ 프롬프트 (skel 미복사)

홈에 `.bashrc` 등이 없을 때 발생.

```bash
cp -a /etc/skel/. /home/계정/
# 또는
cp -rp /etc/skel/. /home/계정/
chown -R 계정:계정 /home/계정
su - 계정
```
