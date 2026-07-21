+++
title = "MySQL 비밀번호 변경"
date = 2019-09-26T09:12:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "8be5f288-5a1d-415b-9ced-10f120688224"
notion_url = "https://app.notion.com/p/MySQL-8be5f2885a1d415b9ced10f120688224"
external_url = "https://zetawiki.com/wiki/MySQL_%ED%8C%A8%EC%8A%A4%EC%9B%8C%EB%93%9C_%EB%B3%80%EA%B2%BD"
+++

## MySQL 비밀번호 변경

```sql
-- 5.7+/8.0 권장
ALTER USER 'user'@'%' IDENTIFIED BY 'new_password';
-- 구버전
SET PASSWORD FOR 'user'@'%' = PASSWORD('new_password');
UPDATE mysql.user SET authentication_string=PASSWORD('new_password')
 WHERE User='user' AND Host='%';
FLUSH PRIVILEGES;
```

```bash
mysqladmin -uuser -poldpassword password newpassword
```

분실 재설정 → [root 패스워드 분실 재설정](https://app.notion.com/p/edf47ff37f13423b8b9d8b57dda99904)
