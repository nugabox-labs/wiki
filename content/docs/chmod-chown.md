+++
title = "chmod chown"
date = 2019-03-15T08:11:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "39eade9c-c71f-466c-9018-559cdc9d4eba"
notion_url = "https://app.notion.com/p/chmod-chown-39eade9cc71f466c9018559cdc9d4eba"
+++

## chmod / chown

```bash
chmod 755 file
chmod -R 644 dir/
chmod u+x,g-w file
chmod 2775 dir/          # setgid
chown user file
chown user:group file
chown user: file         # user+동일그룹
chown -R user:group dir/
```
