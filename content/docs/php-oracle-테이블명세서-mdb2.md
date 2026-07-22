+++
title = "PHP Oracle 테이블명세서 MDB2"
date = 2020-09-10T02:41:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END"]
tags = ["PHP"]
toc = true

[extra]
source = "notion"
notion_id = "06da8e73-1a6f-483b-9a08-c5cdcf8f615e"
notion_url = "https://app.notion.com/p/PHP-Oracle-MDB2-06da8e731a6f483b9a08c5cdcf8f615e"
+++

## PHP Oracle 테이블명세서 (MDB2)

- 확장: `pecl` / `oci8` 필요
- `Fatal error: Class 'XMLWriter' not found`:

```bash
yum install php-xml
# 아파치 재시작
```

- MDB2·PHPExcel 라이브러리 경로 맞출 것

## MDB2 주의

- `fetchRow()`: 호출마다 다음 행(반복문에서 중복 호출 주의)
- `numRows()`: 결과 없을 때 제약/인덱스/시퀀스 표시 숨김용
