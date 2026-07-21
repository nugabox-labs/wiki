+++
title = "PHP 파일 업로드"
date = 2019-03-14T07:08:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END"]
tags = ["PHP"]
toc = true

[extra]
source = "notion"
notion_id = "bbda8c7d-ec41-4363-8acd-d822029ada70"
notion_url = "https://app.notion.com/p/PHP-bbda8c7dec4143638acdd822029ada70"
+++

## 업로드 폼 (HTML)

```html
<form enctype="multipart/form-data" action="1.php" method="POST">
  <input type="hidden" name="MAX_FILE_SIZE" value="30000" />
  <input name="userfile" type="file" />
  <input type="submit" value="upload" />
</form>
```

## 업로드 처리 (PHP)

```php
<?php
ini_set("display_errors", "1");
$uploaddir = '/path/to/upload/';
$uploadfile = $uploaddir . basename($_FILES['userfile']['name']);

if (move_uploaded_file($_FILES['userfile']['tmp_name'], $uploadfile)) {
    echo "파일이 유효하고, 성공적으로 업로드 되었습니다.\n";
} else {
    print "파일 업로드 공격의 가능성이 있습니다!\n";
}
print_r($_FILES);   // 디버깅용
?>
```
