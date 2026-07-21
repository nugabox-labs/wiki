+++
title = "scp 파일 전송"
date = 2019-03-19T01:25:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["LINUX", "NETWORK"]
toc = true

[extra]
source = "notion"
notion_id = "d9af8b03-d63f-4599-aff1-816086677877"
notion_url = "https://app.notion.com/p/scp-d9af8b03d63f4599aff1816086677877"
+++

```bash
# 원격 → 로컬
scp -P PORT user@HOST:/path/file /local/dir/

# 로컬 → 원격
scp -P PORT /local/file user@HOST:/path/

# 디렉터리
scp -r -P PORT /local/dir user@HOST:/path/
```
