+++
title = "Apache LimitRequestBody (업로드 크기)"
date = 2019-11-26T11:18:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["WEB"]
toc = true

[extra]
source = "notion"
notion_id = "4380361f-12e3-4fc2-aa2e-c1f36fa733a4"
notion_url = "https://app.notion.com/p/Apache-LimitRequestBody-4380361f12e34fc2aa2ec1f36fa733a4"
external_url = "https://zetawiki.com/wiki/%EC%95%84%ED%8C%8C%EC%B9%98_%EC%97%85%EB%A1%9C%EB%93%9C_%ED%8C%8C%EC%9D%BC%ED%81%AC%EA%B8%B0_%EC%A0%9C%ED%95%9C_LimitRequestBody"
+++

HTTP 요청 body(대략 업로드) 크기 제한. 범위 0~2147483647, **0=무제한(기본)**.

```javascript
<Directory "/var/www/html/uploads">
    LimitRequestBody 5000000
</Directory>
```

5000000 ≈ 약 4.8MB.
