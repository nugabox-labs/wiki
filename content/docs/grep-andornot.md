+++
title = "grep AND/OR/NOT"
date = 2021-05-10T02:48:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "0cb6df7e-ef35-4a57-a8dd-8230b2ce08f3"
notion_url = "https://app.notion.com/p/grep-AND-OR-NOT-0cb6df7eef354a57a8dd8230b2ce08f3"
external_url = "https://twpower.github.io/173-grep-and-or-not"
+++

```bash
grep PATTERN file

# AND — 파이프 연쇄
grep pat1 file | grep pat2

# AND — 순서 무관 (ERE)
grep -E 'pat1.*pat2|pat2.*pat1' file

# OR
grep -e pat1 -e pat2 file
grep -E 'pat1|pat2' file

# NOT
grep -v pat file
```
