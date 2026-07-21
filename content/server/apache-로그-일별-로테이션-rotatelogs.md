+++
title = "Apache 로그 일별 로테이션 rotatelogs"
date = 2019-09-26T07:50:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["WEB"]
toc = true

[extra]
source = "notion"
notion_id = "1fa064b9-517a-4d93-a7bb-695ec956da7a"
notion_url = "https://app.notion.com/p/Apache-rotatelogs-1fa064b9517a4d93a7bb695ec956da7a"
external_url = "https://app.notion.com/p/f4c85c26089b45069b713136069f6cc3"
+++

## rotatelogs로 일별 access 로그

```javascript
# 변경 전
CustomLog "${APACHE_LOG_DIR}/access.log" combined

# 변경 후 (86400초 = 1일)
CustomLog "|$(which rotatelogs) ${APACHE_LOG_DIR}/access.log.%Y_%m_%d 86400" combined
```

- `rotatelogs` 경로: `which rotatelogs`
- `combined`: `httpd.conf`의 LogFormat 이름
- VirtualHost별 CustomLog에도 동일 적용 가능
