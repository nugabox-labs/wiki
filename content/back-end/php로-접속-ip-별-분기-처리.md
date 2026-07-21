+++
title = "PHP로 접속 IP 별 분기 처리"
date = "2020-03-09T09:50:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["BACK-END"]
tags = ["PHP"]
toc = true

[extra]
source = "notion"
notion_id = "2a5bfee6-27c5-48c8-93d6-c94e92dd83f6"
notion_url = "https://app.notion.com/p/PHP-IP-2a5bfee627c548c893d6c94e92dd83f6"
+++

## 접속 IP로 조건 분기 (디버그 코드 노출 방지 등)

```php
if ($_SERVER['REMOTE_ADDR'] == "허용할IP") {
    // 특정 IP(예: 개발자 본인)에서 접속했을 때만 실행할 코드
    // print_r($배열);
}
```
