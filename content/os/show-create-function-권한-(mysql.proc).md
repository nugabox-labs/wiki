+++
title = "SHOW CREATE FUNCTION 권한 (mysql.proc)"
date = 2021-05-28T02:12:00Z
updated = 2026-07-21T02:37:00Z
categories = ["OS", "SERVER"]
tags = ["DB", "MySQL", "SYNOLOGY"]
toc = true

[extra]
source = "notion"
notion_id = "5eb4ee3f-1c4d-4b49-9add-ef4f7415e659"
notion_url = "https://app.notion.com/p/SHOW-CREATE-FUNCTION-mysql-proc-5eb4ee3f1c4d4b499addef4f7415e659"
+++

## GRANT / mysql.proc

```javascript
root has insufficient privileges to show create function
GRANT SELECT ON mysql.proc TO root@'%';
-- GRANT command denied to user 'root'@'localhost' for table 'proc'
-- → 'root'@'%' 계정으로 실행
```
