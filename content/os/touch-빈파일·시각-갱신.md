+++
title = "touch 빈파일·시각 갱신"
date = 2022-07-12T12:17:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "4fff93e2-2e12-4812-9238-e4382693f117"
notion_url = "https://app.notion.com/p/touch-4fff93e22e1248129238e4382693f117"
external_url = "https://www.lesstif.com/lpt/linux-touch-105644078.html"
+++

빈 파일 생성 또는 atime/mtime 갱신.

```bash
touch file1                    # 없으면 생성, 있으면 시각 갱신
touch -a file1                # atime만
touch -m file1                # mtime만
touch -t 202001231122 myfile  # [[YYYY]MMDDHHMM[.SS]
```
