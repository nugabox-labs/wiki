+++
title = "Oracle sys/system 계정 비밀번호 찾기/변경"
date = 2020-02-18T16:57:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["DB", "Oracle"]
toc = true

[extra]
source = "notion"
notion_id = "e34b3f9e-e9fa-4b51-a572-7173e27648a9"
notion_url = "https://app.notion.com/p/Oracle-sys-system-e34b3f9ee9fa4b51a5727173e27648a9"
+++

> 원본이 스크린샷 이미지뿐(텍스트 추출 불가)

## Oracle 관리자(system, sys) 계정 비밀번호 확인/변경 (일반 참고)

```bash
sqlplus '/as sysdba'
```

```sql
ALTER USER sys IDENTIFIED BY 새비밀번호;
ALTER USER system IDENTIFIED BY 새비밀번호;
```

- sys/system 비밀번호는 암호화 저장되어 직접 "조회"는 불가, OS 인증(`/as sysdba`)으로 접속해 재설정하는 것이 일반적
- 비밀번호 파일 방식 사용 시 `orapwd` 유틸리티로 재생성 가능:

```bash
orapwd file=$ORACLE_HOME/dbs/orapw$ORACLE_SID password=새비밀번호 force=y
```
