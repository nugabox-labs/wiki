+++
title = "ps|grep 에서 grep 제외"
date = 2019-11-20T14:27:00Z
updated = 2026-07-21T02:37:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "bd5416df-4e4c-4c1f-ba67-a56bb1b912de"
notion_url = "https://app.notion.com/p/ps-grep-grep-bd5416df4e4c4c1fba67a56bb1b912de"
+++

## ps | grep 에서 grep 자신 제외

```bash
ps aux | grep nginx | grep -v grep
# 또는 패턴 trick
ps aux | grep [n]ginx
pgrep -a nginx
```
