+++
title = "shell ^M (CRLF) 오류 제거"
date = 2020-12-02T18:39:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "6e2853a0-52b7-4153-bb4c-8a82418c26af"
notion_url = "https://app.notion.com/p/shell-M-CRLF-6e2853a052b74153bb4c8a82418c26af"
external_url = "https://idchowto.com/?p=28611"
+++

```bash
vi -b script.sh
# Ctrl+V Ctrl+M 로 ^M 입력 후
:%s/^M//g

# 또는
dos2unix script.sh
sed -i 's/\r$//' script.sh
```
