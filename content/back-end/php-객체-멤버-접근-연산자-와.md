+++
title = "PHP 객체 멤버 접근 연산자 -> 와 ::"
date = "2019-03-20T09:11:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["BACK-END"]
tags = ["PHP"]
toc = true

[extra]
source = "notion"
notion_id = "931f4bb6-7bd2-4641-b9e5-8c014a4c98a4"
notion_url = "https://app.notion.com/p/PHP-931f4bb67bd24641b9e58c014a4c98a4"
external_url = "http://jobdahan.net/language_php/17384"
+++

## `->` 연산자 (객체 멤버 접근)

```php
class test {
    var $a;   // 멤버변수 (class 안에서는 var 필수, var=public)
    var $b;
    function aaa() {           // 메소드
        $this->a = "알파벳";    // 메소드 안에서 자기 멤버변수 접근 시 $this 사용
    }
}

$obj = new test;
echo $obj->a;        // 멤버변수 출력
$tmp = $obj->aaa();   // 메소드 실행
```

- `->` 해석: "~ 안에 있는" (예: `$obj->a` = `$obj` 안에 있는 `$a`)
- `$this`: 메소드 안에서 자기 자신이 속한 객체를 가리킴

## 체이닝 예시

```php
$this->cut_str_size = $data->info->cut_str_size;
// "현재 객체의 cut_str_size에 $data 객체 안의 info 객체 안의 cut_str_size 값을 저장"
```

- DB 조회 결과가 객체로 반환되는 경우(`mysql_fetch_object()` 등) 필드도 `->필드명`으로 접근

## `::` (Scope Resolution / static 접근)

```php
$tmp->url = zUrl::getViewUrl($tmp->article_srl);
```

- `::`는 객체를 미리 생성하지 않고 클래스의 static 메소드/속성에 바로 접근할 때 사용

원문: [http://jobdahan.net/language\_php/17384](http://jobdahan.net/language_php/17384)
