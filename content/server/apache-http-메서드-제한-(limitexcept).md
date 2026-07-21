+++
title = "Apache HTTP 메서드 제한 (LimitExcept)"
date = 2019-12-31T09:54:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["WEB"]
toc = true

[extra]
source = "notion"
notion_id = "6b5a8558-06a2-4362-8770-8826a47b562c"
notion_url = "https://app.notion.com/p/Apache-HTTP-LimitExcept-6b5a855806a2436287708826a47b562c"
external_url = "https://shyrilla.tistory.com/19"
+++

GET·POST만 허용, PUT/DELETE/OPTIONS/TRACE 등 차단.

## Location (전역, 권장)

`<Directory>`는 경로마다 반복 필요 → `<Location />`이 하위까지 일괄 적용.

```javascript
<Location />
    <LimitExcept GET POST>
        Order deny,allow
        Deny from all
    </LimitExcept>
</Location>
```

## Directory (경로별)

```javascript
<Directory "/var/www/html">
    <LimitExcept GET POST>
        Order deny,allow
        Deny from all
    </LimitExcept>
</Directory>
```

적용 후 httpd 재시작. 검증은 HTTP 메서드 테스트 도구(구 WFetch 등)로.
