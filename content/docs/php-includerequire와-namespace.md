+++
title = "PHP include/require와 namespace"
date = 2019-03-14T06:05:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END"]
tags = ["PHP"]
toc = true

[extra]
source = "notion"
notion_id = "298f2e93-e4f1-461f-a1c8-14447a219063"
notion_url = "https://app.notion.com/p/PHP-include-require-namespace-298f2e93e4f1461fa1c814447a219063"
+++

## include / require

- `include`: 없으면 warning, 계속
- `include_once`: 중복 로드 방지
- `require`: 없으면 fatal error
- `require_once`: require + 중복 방지

```php
include 'greeting.php';
```

## namespace

같은 이름 함수를 모듈별로 구분.

```php
// greeting_ko.php
namespace language\ko;
function welcome() {}

// greeting_en.php
namespace language\en;
function welcome() {}

require_once 'greeting_ko.php';
require_once 'greeting_en.php';
echo language\ko\welcome();
echo language\en\welcome();
```

네임스페이스 없이 동일 함수명 중복 선언 시 fatal error.
