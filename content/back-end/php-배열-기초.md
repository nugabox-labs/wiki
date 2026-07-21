+++
title = "PHP 배열 기초"
date = 2019-03-14T05:21:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END"]
tags = ["PHP"]
toc = true

[extra]
source = "notion"
notion_id = "fbccdca6-e901-4052-89d7-c92f3bc34c76"
notion_url = "https://app.notion.com/p/PHP-fbccdca6e901405289d7c92f3bc34c76"
+++

## 배열 생성/접근

```php
$member = ['egoing', 'k8088', 'sorialgi'];   // PHP 5.4+ 축약형
$member = array('egoing', 'k8088', 'sorialgi');  // 5.4 이하

echo $member[0];
```

## 함수 리턴값이 배열일 때

```php
function get_members() {
    return ['egoing', 'k8088', 'sorialgi'];
}
$tmp = get_members();
echo $tmp[1];
```

## 반복문

```php
for ($i = 0; $i < count($members); $i++) {
    echo ucfirst($members[$i]) . '<br />';
}
```

## 배열 조작 함수

```php
array_push($arr, 'f');            // 끝에 1개 추가
array_merge($li, ['f', 'g']);     // 끝에 여러 개 추가(병합)
array_unshift($li, 'z');          // 시작점에 추가
array_splice($li, 2, 0, 'B');     // 원하는 위치에 추가
array_shift($li);                 // 첫 요소 제거
array_pop($li);                   // 마지막 요소 제거
sort($li);                        // 오름차순 정렬
rsort($li);                       // 내림차순 정렬
count($members);                  // 배열 크기
```

## 연관배열

```php
$grades = array('egoing' => 10, 'k8805' => 6, 'sorialgi' => 80);
// 또는
$grades = [];
$grades['egoing'] = 10;

echo $grades['sorialgi'];

foreach ($grades as $key => $value) {
    echo "key: {$key} value: {$value}<br />";
}
```
