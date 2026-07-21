+++
title = "PHP 객체 멤버 접근 연산자"
date = 2019-03-20T09:11:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END"]
tags = ["PHP"]
toc = true

[extra]
source = "notion"
notion_id = "931f4bb6-7bd2-4641-b9e5-8c014a4c98a4"
notion_url = "https://app.notion.com/p/PHP-931f4bb67bd24641b9e58c014a4c98a4"
external_url = "http://jobdahan.net/language_php/17384"
+++

## `->` (객체 멤버)

```php
class test {
    var $a;   // PHP4식; 현재는 public
    var $b;
    function aaa() {
        $this->a = "알파벳";
    }
}

$obj = new test;
echo $obj->a;
$tmp = $obj->aaa();
```

- `$obj->a` = 객체 `$obj`의 멤버 `$a`
- `$this`: 메소드 안에서 자기 객체

## 체이닝

```php
$this->cut_str_size = $data->info->cut_str_size;
```

DB 결과가 객체(`mysql_fetch_object()` 등)면 필드도 `->필드명`.

## `::` (static / Scope Resolution)

```php
$tmp->url = zUrl::getViewUrl($tmp->article_srl);
```

인스턴스 없이 클래스 static 멤버에 접근.
