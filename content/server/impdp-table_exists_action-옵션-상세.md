+++
title = "impdp TABLE_EXISTS_ACTION 옵션 상세"
date = 2020-02-18T16:58:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["DB", "Oracle"]
toc = true

[extra]
source = "notion"
notion_id = "c6b2c670-aa2f-4f8b-9d78-9733b14f46c4"
notion_url = "https://app.notion.com/p/impdp-TABLE_EXISTS_ACTION-c6b2c670aa2f4f8b9d789733b14f46c4"
external_url = "https://dbaclass.com/article/table_exists_action-option-impdp/"
+++

## impdp TABLE\_EXISTS\_ACTION 옵션 상세

가져올 테이블이 이미 DB에 있을 때 동작 지정. 기본 가이드는 Oracle Data Pump 종합 가이드 참고, 여기는 옵션별 상세

**APPEND**: 기존 데이터에 새 데이터를 추가(메타데이터는 스킵)

```bash
impdp dumpfile=emp_tab.dmp logfile=emp_tab.log directory=VEN table_exists_action=APPEND
# Table "DBATEST"."EMP_TAB" exists. Data will be appended to existing table
# but all dependent metadata will be skipped due to table_exists_action of append
```

**TRUNCATE**: 기존 테이블을 truncate 후 데이터 로드(메타데이터는 스킵)

```bash
impdp dumpfile=emp_tab.dmp logfile=emp_tab.log directory=VEN table_exists_action=TRUNCATE
```

**REPLACE**: 기존 테이블을 삭제하고 덤프에서 재생성(메타데이터 포함 완전 교체)

```bash
impdp dumpfile=emp_tab.dmp logfile=emp_tab.log directory=VEN table_exists_action=REPLACE
```

**SKIP (기본값)**: 테이블이 존재하면 건너뜀

```bash
# ORA-39151: Table "DBATEST"."EMP_TAB" exists. All dependent metadata and data
# will be skipped due to table_exists_action of skip
```
