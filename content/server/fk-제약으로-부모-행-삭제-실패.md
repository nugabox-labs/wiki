+++
title = "FK 제약으로 부모 행 삭제 실패"
date = 2020-05-31T02:46:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "584a0f94-fb79-4b13-b034-8fa137dea358"
notion_url = "https://app.notion.com/p/FK-584a0f94fb794b13b0348fa137dea358"
+++

> 원본이 스크린샷 이미지뿐. 주제: FK 때문에 부모 행 삭제 실패

```javascript
Cannot delete or update a parent row: a foreign key constraint fails
```

자식이 참조 중이면 부모 DELETE/UPDATE 불가.

### 해결

```sql
-- 1) 자식부터 삭제하거나 ON DELETE CASCADE 설계
-- 2) 일시 비활성(마이그레이션·일회성만)
SET FOREIGN_KEY_CHECKS = 0;
-- DELETE / TRUNCATE ...
SET FOREIGN_KEY_CHECKS = 1;
```
