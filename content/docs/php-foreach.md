+++
title = "PHP foreach"
date = 2019-03-20T09:18:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END"]
tags = ["PHP"]
toc = true

[extra]
source = "notion"
notion_id = "7082f513-2d4f-4bf5-bb6e-1dfa0a055f14"
notion_url = "https://app.notion.com/p/PHP-foreach-7082f5132d4f4bf5bb6e1dfa0a055f14"
external_url = "http://jobdahan.net/language_php/17381"
+++

## 문법

```php
foreach ($my_arr as $value) { echo $value; }
foreach ($my_arr as $key => $value) { echo "$key = $value"; }
```

배열 요소 수만큼만 순회(빈 인덱스 건너뜀).

## $\_POST → 가변변수 (register\_globals=off)

```php
foreach ($_POST as $key => $value) {
    $$key = $value;
}
// $_POST["subject"] = "나의 게시물" → $subject = "나의 게시물"
```

`$fruit="apple"; $apple="사과"; echo $$fruit;` → "사과"
