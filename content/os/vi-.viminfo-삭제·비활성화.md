+++
title = "vi .viminfo 삭제·비활성화"
date = 2020-12-21T17:05:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "45dfa997-acff-4492-b841-9d87f693ddde"
notion_url = "https://app.notion.com/p/vi-viminfo-45dfa997acff4492b8419d87f693ddde"
external_url = "https://m.blog.naver.com/PostView.nhn?blogId=kameo5&logNo=130019873192"
+++

vi 히스토리(`~/.viminfo`) 제거·비활성화:

```bash
rm -f ~/.viminfo
ln -s /dev/null ~/.viminfo
# 또는 /etc/vimrc (또는 ~/.vimrc)
set viminfo=
```
