+++
title = "PHP 페이징"
date = 2023-04-20T20:17:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "BACK-END"]
tags = ["PHP", "MySQL", "SQL", "WEB"]
toc = true

[extra]
source = "notion"
notion_id = "4de2828e-cb85-478e-9e42-af7ffc19bff8"
notion_url = "https://app.notion.com/p/PHP-4de2828ecb85478e9e42af7ffc19bff8"
external_url = "https://velog.io/@dpdnjs402/qnwsh7kt"
+++

## 페이지·블록 계산

```php
$list_num = 5;
$page_num = 3;
$page = isset($_GET["page"]) ? $_GET["page"] : 1;
$total_page = ceil($num / $list_num);
$total_block = ceil($total_page / $page_num);
$now_block = ceil($page / $page_num);
$s_pageNum = ($now_block - 1) * $page_num + 1;
if ($s_pageNum <= 0) { $s_pageNum = 1; }
$e_pageNum = $now_block * $page_num;
if ($e_pageNum > $total_page) { $e_pageNum = $total_page; }

$start = ($page - 1) * $list_num;
$sql = "select * from members limit $start, $list_num;";
$result = mysqli_query($dbcon, $sql);
$cnt = $start + 1;

while ($array = mysqli_fetch_array($result)) {
  // echo $cnt, $array["u_name"], ...
  $cnt++;
}
```

## 링크 UI

```php
<?php if ($page <= 1) { ?>
<a href="list.php?page=1">이전</a>
<?php } else { ?>
<a href="list.php?page=<?php echo ($page-1); ?>">이전</a>
<?php } ?>

<?php for ($print_page = $s_pageNum; $print_page <= $e_pageNum; $print_page++) { ?>
<a href="list.php?page=<?php echo $print_page; ?>"><?php echo $print_page; ?></a>
<?php } ?>

<?php if ($page >= $total_page) { ?>
<a href="list.php?page=<?php echo $total_page; ?>">다음</a>
<?php } else { ?>
<a href="list.php?page=<?php echo ($page+1); ?>">다음</a>
<?php } ?>
```
