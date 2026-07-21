+++
title = "로그인 시 bash-4.x$"
date = 2019-04-26T04:40:00Z
updated = 2026-07-21T02:37:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "b41a7a4d-ca2b-48c4-84ae-09cf2cdc4da8"
notion_url = "https://app.notion.com/p/bash-4-x-b41a7a4dca2b48c484ae09cf2cdc4da8"
+++

## bash-4.x$ 프롬프트 (/etc/profile)

관련: [bash-4.2$ → skel 복사](https://app.notion.com/p/7191efdd5fe44417b749a348c9cd79da)

```bash
# /etc/profile 에 bashrc 로드 추가 후
source /etc/profile
# 또는 홈에 skel 복사
cp -a /etc/skel/. /home/USER/
chown -R USER:USER /home/USER
```
