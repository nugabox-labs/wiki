+++
title = "그누보드5 CSRF uid 스킨 수정"
date = 2023-04-02T12:55:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END", "TECH"]
tags = ["PHP", "ISSUE"]
toc = true

[extra]
source = "notion"
notion_id = "670954d7-5071-4079-a558-f6fb7f4fff9d"
notion_url = "https://app.notion.com/p/5-CSRF-uid-670954d750714079a558f6fb7f4fff9d"
external_url = "https://www.happyjung.com/lecture/2156"
+++

## G5 "올바른 방법으로 이용해 주십시오" (CSRF/uid)

### 1. `skin/board/.../write.skin.php`

form에 uid 추가:

```php
<input type="hidden" name="uid" value="<?php echo get_uniqid(); ?>">
```

제출 버튼은 `type="submit"` 사용 (button/image면 CSRF 오류).

### 2. `skin/board/.../view_comment.skin.php`

- form에 uid hidden 유지
- 게스트: `<?php if($is_guest) echo chk_captcha_js(); ?>` + `set_comment_token(f);`
- 쿼리 문자열:

```php
$query_string = clean_query_string($_SERVER['QUERY_STRING']);
```

- 댓글 수정(`$w == 'cu'`) 시 본인/관리자만 내용 조회:

```php
$sql = " select wr_id, wr_content, mb_id from $write_table where wr_id = '$c_id' and wr_is_comment = '1' ";
$cmt = sql_fetch($sql);
if (!($is_admin || ($member['mb_id'] == $cmt['mb_id'] && $cmt['mb_id'])))
    $cmt['wr_content'] = '';
$c_wr_content = $cmt['wr_content'];
```

### 3. jQuery 중복 로드 제거

동일/다른 버전 `jquery.min.js` 중복 호출 확인.

### 4. 관리자 → 환경설정 → 세션 삭제 후 브라우저 캐시 확인

참고: [http://sir.kr/g5\_tip/4524](http://sir.kr/g5_tip/4524) , [http://sir.kr/g5\_tip/4837](http://sir.kr/g5_tip/4837)
