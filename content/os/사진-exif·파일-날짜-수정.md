+++
title = "사진 EXIF·파일 날짜 수정"
date = 2024-08-02T02:07:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "DEV-OPS", "TECH"]
tags = ["ISSUE", "MACOS", "BASH", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "bd96cc01-08b9-4618-9e83-24990f654045"
notion_url = "https://app.notion.com/p/EXIF-bd96cc0108b946189e8324990f654045"
+++

```bash
# 사진의 촬영일자 변경
exiftool "-AllDates=2024:08:02 09:00:00" *

# 파일의 수정일자 변경
find . -type f -exec touch -mt 202408020900.00 {} \;
```
