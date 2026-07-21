+++
title = "mysqldump DEFINER 1449 오류"
date = 2020-09-21T11:01:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "dcf53167-7237-4a73-ba10-7a2ceb5efbb6"
notion_url = "https://app.notion.com/p/mysqldump-DEFINER-1449-dcf5316772374a73ba107a2ceb5efbb6"
+++

> 원본이 스크린샷 이미지뿐. 주제: dump 시 DEFINER 사용자 없음(ERROR 1449)

```
ERROR: The user specified as a definer ('user'@'%') does not exist
```

뷰·프로시저·트리거의 DEFINER가 대상 서버에 없을 때.

## 해결

```bash
# dump SQL에서 DEFINER 제거/치환
sed -i 's/DEFINER=[^*]*\*/\*/g' dump.sql
```

```sql
-- 또는 임포트 전 동일 계정 생성
CREATE USER 'user'@'%' IDENTIFIED BY 'password';
GRANT ALL ON db.* TO 'user'@'%';
```
