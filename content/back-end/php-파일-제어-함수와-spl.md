+++
title = "PHP 파일 제어 함수와 SPL"
date = "2019-03-14T08:25:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["BACK-END"]
tags = ["PHP"]
toc = true

[extra]
source = "notion"
notion_id = "60549dc5-da11-44e2-be7a-fd072970b64c"
notion_url = "https://app.notion.com/p/PHP-SPL-60549dc5da1144e2be7afd072970b64c"
+++

## 파일 제어 함수

```php
is_file($path);
is_dir($path);
file_get_contents($path);
file_put_contents($path, $data);
```

## SPL (Standard PHP Library) — 객체지향 파일 제어

```php
$file = new SplFileObject('data.txt');
```
