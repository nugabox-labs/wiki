+++
title = "passwd --stdin 한 줄 변경"
date = 2020-12-30T11:35:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "31ac0e9a-7abe-4612-bd2f-9a1eba9ef17e"
notion_url = "https://app.notion.com/p/passwd-stdin-31ac0e9a7abe4612bd2f9a1eba9ef17e"
external_url = "https://www.snoopybox.co.kr/1655"
+++

root만 `passwd --stdin` 가능(자동화용).

```bash
passwd --stdin username
# 또는 한 줄
echo 'NewPassword' | passwd --stdin username
```

스크립트/히스토리에 평문 비밀번호가 남으니 운영에서는 주의.
