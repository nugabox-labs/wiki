+++
title = "PHP 내장함수 모음"
date = 2019-03-20T10:09:00Z
updated = 2026-07-21T02:37:00Z
categories = ["BACK-END"]
tags = ["PHP"]
toc = true

[extra]
source = "notion"
notion_id = "d0e4b7bb-592e-455d-99b6-3f6fdaf97a54"
notion_url = "https://app.notion.com/p/PHP-d0e4b7bb592e455d99b63f6fdaf97a54"
external_url = "http://jobdahan.net/index.php?mid=language_php&page=2&document_srl=1434780"
+++

## PHP 내장함수 모음 (⚠️ mysql\_*는 PHP7에서 완전 제거됨, mysqli\_* 또는 PDO로 대체)

**문자열**

```javascript
strlen, strpos, strrpos, substr, substr_replace, str_replace, str_repeat
strtolower, strtoupper, ucfirst, ucwords, trim/ltrim/rtrim, strrev
strcmp, strcasecmp, strstr, stristr, strchr, strrchr, strtok, strtr
explode(문자열→배열), implode/join(배열→문자열)
sprintf/printf(포맷 출력), nl2br(개행→<br>), strip_tags(HTML/PHP태그 제거)
htmlspecialchars, htmlentities(특수문자→HTML엔티티)
addslashes/stripslashes, addcslashes/stripcslashes(따옴표 이스케이프)
```

**배열**

```javascript
array, array_merge, array_push/pop, array_shift/unshift, array_splice
array_keys, array_values, array_flip, array_reverse, array_walk
sort/rsort/asort/arsort/ksort/krsort/uasort/uksort/usort
in_array, count/sizeof, range, shuffle, compact/extract
current/next/prev/reset/end/key(배열 내부 포인터)
```

**타입 확인/변환**

```javascript
isset, empty, unset, gettype, settype
is_array, is_string, is_int, is_float, is_object
intval, strval, doubleval
```

**수학**

```javascript
abs, ceil, floor, round, pow, sqrt, max, min
sin/cos/tan/asin/acos/atan, log/log10, pi
rand/mt_rand, srand/mt_srand, getrandmax/mt_getrandmax
decbin/dechex/decoct, bindec/hexdec/octdec, base_convert
```

**날짜/파일/기타**

```javascript
date, mktime
fopen/fclose, feof, fgets, fgetc, fgetcsv
copy, chmod, chown, chgrp, basename, dirname
md5, base64_encode/decode
urlencode/urldecode, rawurlencode/rawurldecode
parse_url, parse_str
session_start, session_id, session_destroy, session_save_path
```

**GD 라이브러리 (이미지 처리)**

```javascript
imagecreate, imagecreatefromgif, imagecolorallocate, imagefill
imageline/imagerectangle/imagearc/imagepolygon(도형)
imagestring/imagettftext(문자열 출력), imagegif(출력), imagedestroy
```

**MySQL (구 mysql\_\* 확장, PHP7+ 제거 — mysqli\_connect/mysqli\_query 등으로 대체)**

```javascript
mysql_connect, mysql_select_db, mysql_query
mysql_fetch_array/_object/_row, mysql_num_rows/_fields
mysql_insert_id, mysql_close
```

원문: [http://jobdahan.net/index.php?mid=language\_php&page=2&document\_srl=1434780](http://jobdahan.net/index.php?mid=language_php&page=2&document_srl=1434780)
