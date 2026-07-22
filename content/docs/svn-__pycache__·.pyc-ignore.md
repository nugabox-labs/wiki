+++
title = "SVN __pycache__·.pyc ignore"
date = 2024-09-12T00:14:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END", "TECH"]
tags = ["SVN", "PYTHON", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "fbe3221e-70c3-4360-8e27-f44bc7c3d822"
notion_url = "https://app.notion.com/p/SVN-__pycache__-pyc-ignore-fbe3221e70c343608e27f44bc7c3d822"
external_url = "https://blog.metts.today/18"
+++

```bash
# 한 번에 ignore (두 번 propset하면 덮어씀)
svn propset -R svn:ignore "*.pyc
__pycache__" .

# 이미 커밋된 경우 제거
find . -name "*.pyc" | xargs svn rm --force
find . -name "__pycache__" -type d | xargs svn rm --force
```
