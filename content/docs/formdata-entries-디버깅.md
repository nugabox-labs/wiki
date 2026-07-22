+++
title = "FormData entries 디버깅"
date = 2021-04-26T08:32:00Z
updated = 2026-07-21T06:47:00Z
categories = ["FRONT-END"]
tags = ["HTML", "JS"]
toc = true

[extra]
source = "notion"
notion_id = "1b4144c5-c683-4579-9259-5a38f5afd880"
notion_url = "https://app.notion.com/p/FormData-entries-1b4144c5c683457992595a38f5afd880"
+++

```javascript
for (var pair of formData.entries()) {
     console.log(pair[0]+ ', ' + pair[1]);
}
```
