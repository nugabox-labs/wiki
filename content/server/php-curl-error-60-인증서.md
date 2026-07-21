+++
title = "PHP cURL error 60 인증서"
date = 2023-06-29T09:20:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "BACK-END", "TECH"]
tags = ["PHP", "ISSUE", "WEB"]
toc = true

[extra]
source = "notion"
notion_id = "03ad2c89-fe52-48de-8ea4-cd5bbe97dd6e"
notion_url = "https://app.notion.com/p/PHP-cURL-error-60-03ad2c89fe5248de8ea4cd5bbe97dd6e"
external_url = "https://rootjs.tistory.com/138"
+++

## 증상

```
cURL error 60: Peer's Certificate issuer is not recognized
```

## 임시 우회 (검증 비활성 — 운영 비권장)

```php
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
```

가능하면 CA 번들/`CURLOPT_CAINFO`로 원인 해결.
