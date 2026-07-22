+++
title = "MySQL Access denied 로그인 실패"
date = 2019-11-18T17:21:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "8ad25687-5152-4fd7-9023-aaeb36f41991"
notion_url = "https://app.notion.com/p/MySQL-Access-denied-8ad2568751524fd79023aaeb36f41991"
external_url = "https://babytiger.tistory.com/entry/mysql%EC%97%90-%EB%A1%9C%EA%B7%B8%EC%9D%B8%EC%9D%B4-%EC%95%88-%EB%90%A0-%EA%B2%BD%EC%9A%B0"
+++

## Access denied / 로그인 실패

1. `using password: NO` → `-p`로 비밀번호 입력
1. `using password: YES`인데 비번 맞음 → `FLUSH PRIVILEGES` 누락 또는 재기동

```sql
UPDATE mysql.user SET authentication_string=PASSWORD('새비번') WHERE user='root';
FLUSH PRIVILEGES;
```

1. 비번 분실 → root 패스워드 재설정
