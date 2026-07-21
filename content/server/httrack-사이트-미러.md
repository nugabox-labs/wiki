+++
title = "HTTrack 사이트 미러"
date = 2025-11-06T08:17:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "TECH"]
tags = ["ISSUE", "WEB", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "2a3aac4e-32a5-80ef-8023-cc07cf64a1ea"
notion_url = "https://app.notion.com/p/HTTrack-2a3aac4e32a580ef8023cc07cf64a1ea"
+++

```bash
httrack "https://baby.toourguest.com/preview/crayon" \
  -O "./baby-crayon" \
  "+https://baby.toourguest.com/*" \
  --robots=0 -r5 -%v -%e0
```

사이트 미러·오프라인 복제용 HTTrack CLI 예시.
