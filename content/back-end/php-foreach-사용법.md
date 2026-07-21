+++
title = "PHP foreach 사용법"
date = 2019-03-20T09:18:00Z
updated = 2026-07-21T02:37:00Z
categories = ["BACK-END"]
tags = ["PHP"]
toc = true

[extra]
source = "notion"
notion_id = "7082f513-2d4f-4bf5-bb6e-1dfa0a055f14"
notion_url = "https://app.notion.com/p/PHP-foreach-7082f5132d4f4bf5bb6e1dfa0a055f14"
external_url = "http://jobdahan.net/language_php/17381"
+++

## foreach 기본 문법

```php
// 값만 사용
foreach ($my_arr as $value) { echo $value; }

// 키+값 사용
foreach ($my_arr as $key => $value) { echo "$key = $value"; }
```

- for문과 달리 배열 요소 수만큼만 순회(빈 인덱스 건너뜀)

## 활용: register\_globals=off 환경에서 $\_POST를 변수로 자동 매핑

```php
foreach ($_POST as $key => $value) {
    $$key = $value;   // 가변변수: $key의 값이 변수명이 됨
}
// $_POST["subject"] = "나의 게시물"; → $subject = "나의 게시물"; 와 동일 효과
```

- `$$변수`(가변변수): 변수명을 문자열로 참조하는 PHP 기능. `$fruit="apple"; $apple="사과"; echo $$fruit;` → "사과" 출력

원문: [http://jobdahan.net/language\_php/17381](http://jobdahan.net/language_php/17381)
