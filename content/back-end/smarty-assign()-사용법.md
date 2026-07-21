+++
title = "Smarty assign() 사용법"
date = 2019-03-19T09:00:00Z
updated = 2026-07-21T02:37:00Z
categories = ["BACK-END"]
tags = ["PHP"]
toc = true

[extra]
source = "notion"
notion_id = "d7e05e26-2d07-4f5c-be3a-e073a934e274"
notion_url = "https://app.notion.com/p/Smarty-assign-d7e05e262d074f5cbe3ae073a934e274"
external_url = "https://www.smarty.net/docsv2/en/api.assign.tpl"
+++

## Smarty assign() — 템플릿에 값 전달

```php
// 이름/값 쌍
$smarty->assign('Name', 'Fred');
$smarty->assign('Address', $address);

// 연관 배열
$smarty->assign(array('city' => 'Lincoln', 'state' => 'Nebraska'));

// 배열
$myArray = array('no' => 10, 'label' => 'Peanuts');
$smarty->assign('foo', $myArray);

// DB 조회 결과(adodb 예시)
$sql = "select id, name, email from contact where id=" . $id;
$smarty->assign('contact', $db->getRow($sql));
```

원문: [https://www.smarty.net/docsv2/en/api.assign.tpl](https://www.smarty.net/docsv2/en/api.assign.tpl)
