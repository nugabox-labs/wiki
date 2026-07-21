+++
title = "백그라운드 실행 (jobs/bg/fg)"
date = 2019-11-27T09:47:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "d14a3dc9-a205-4f9f-8b41-9766c6150971"
notion_url = "https://app.notion.com/p/jobs-bg-fg-d14a3dc9a2054f9f8b419766c6150971"
external_url = "https://zetawiki.com/wiki/리눅스_백그라운드_실행"
+++

```bash
# 실행 중 일시정지 → 백그라운드
# Ctrl+Z
bg %1
fg %1          # 다시 포그라운드

cmd &          # 처음부터 백그라운드
jobs
kill -9 %2
```
