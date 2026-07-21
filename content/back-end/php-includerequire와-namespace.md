+++
title = "PHP include/require와 namespace"
date = 2019-03-14T06:05:00Z
updated = 2026-07-21T02:37:00Z
categories = ["BACK-END"]
tags = ["PHP"]
toc = true

[extra]
source = "notion"
notion_id = "298f2e93-e4f1-461f-a1c8-14447a219063"
notion_url = "https://app.notion.com/p/PHP-include-require-namespace-298f2e93e4f1461fa1c814447a219063"
+++

## 외부 PHP 파일 로드

- `include`: 파일 없으면 warning (계속 진행)
- `include_once`: include 방식, 중복 로드 방지
- `require`: 파일 없으면 fatal error (엄격)
- `require_once`: require 방식, 중복 로드 방지

```php
include 'greeting.php';
```

## 네임스페이스

- 디렉토리처럼 여러 모듈을 구분. 같은 이름 함수를 서로 다른 파일에서 정의해도 충돌 방지

```php
// greeting_ko.php
namespace language\ko;
function welcome() {}

// greeting_en.php
namespace language\en;
function welcome() {}

// 사용
require_once 'greeting_ko.php';
require_once 'greeting_en.php';
echo language\ko\welcome();
echo language\en\welcome();
```

- 네임스페이스 없이 같은 함수명을 여러 파일에서 선언하면 fatal error 발생
