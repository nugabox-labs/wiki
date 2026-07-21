+++
title = "/dev/null 2>&1"
date = 2020-08-03T10:21:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "92448f1c-ec71-4079-97f0-cdcf478d4953"
notion_url = "https://app.notion.com/p/dev-null-2-1-92448f1cec71407997f0cdcf478d4953"
external_url = "https://jybaek.tistory.com/115"
+++

## `/dev/null 2>&1`

- `1` stdout, `2` stderr, `0` stdin

```bash
cmd > /dev/null          # stdout만 버림
cmd > /dev/null 2>&1     # stdout+stderr 버림
cmd 1>out.log 2>err.log  # 분리 저장
```
