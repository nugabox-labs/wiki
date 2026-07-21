+++
title = "SiiRU PHP CMS 리스트 프로그램 파악"
date = "2019-09-26T07:17:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["BACK-END"]
tags = ["PHP"]
toc = true

[extra]
source = "notion"
notion_id = "0c2b26b7-a5f8-4657-8e4d-932e95b18cf0"
notion_url = "https://app.notion.com/p/SiiRU-PHP-CMS-0c2b26b7a5f846578e4d932e95b18cf0"
+++

## SiiRU PHP CMS 구조 파악 메모 (레거시 프로젝트)

**환경/공통 로드**

- `com/globalConstant.php` 마지막 줄에서 `globalHeader.php` 호출 → 공통 환경파일 전부 로드 및 객체 생성

```php
require_once 'globalFunction.php';
$GS_Function = new globalFunction();
// 이후 어디서든: $GS_Function->CM_isNull();
```

- 모든 프로그램 공통: `include/common.php`

**표준 페이지 구조**: 변수/키값/배열 선언 → 액션 처리(switch-case) → 함수 선언 → 템플릿 출력(`include/template.php`) → DB 종료(`dbClose.php`)

**리스트 프로그램 공통 함수 네이밍**

```javascript
lf_getList()          목록 조회
lf_getView()           데이터 조회(상세)
lf_newRecordset()      등록폼
lf_inserted()          등록 처리
lf_updated()           수정 처리
lf_deleted()           삭제 처리
lf_selectDeleted()     선택 삭제
lf_formRead()          폼값 읽기
```

**게시판 모듈 디렉토리** (`siiru/bb`): bb, co, css, fonts, images, include, js, pj, sa, st, sy
