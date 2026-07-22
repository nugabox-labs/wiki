+++
title = "PHP cURL 에러 출력"
date = 2023-06-29T09:20:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "BACK-END", "TECH"]
tags = ["PHP", "TIP", "WEB"]
toc = true

[extra]
source = "notion"
notion_id = "df5e9b4c-6316-4a04-b586-6c7c44d16e4e"
notion_url = "https://app.notion.com/p/PHP-cURL-df5e9b4c63164a04b5866c7c44d16e4e"
external_url = "https://solbel.tistory.com/2421"
+++

## CURLOPT\_FAILONERROR + curl\_error

```php
curl_setopt($ch, CURLOPT_FAILONERROR, true);
echo curl_error($ch);
```
