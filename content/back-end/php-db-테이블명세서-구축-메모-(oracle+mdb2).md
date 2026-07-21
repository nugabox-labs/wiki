+++
title = "PHP DB 테이블명세서 구축 메모 (Oracle+MDB2)"
date = 2020-09-10T02:41:00Z
updated = 2026-07-21T02:37:00Z
categories = ["BACK-END"]
tags = ["PHP"]
toc = true

[extra]
source = "notion"
notion_id = "06da8e73-1a6f-483b-9a08-c5cdcf8f615e"
notion_url = "https://app.notion.com/p/PHP-DB-Oracle-MDB2-06da8e731a6f483b9a08c5cdcf8f615e"
+++

## Oracle 기반 DB 테이블명세서 (PHP) 구축 메모

- PHP 확장모듈: `pecl`, `oci8` 설치 필요
- `Fatal error: Class 'XMLWriter' not found` 발생 시:

```bash
yum install php-xml
# 이후 아파치 재시작
```

- 경로 세팅 시 MDB2, PHPExcel 라이브러리 경로 맞춰줄 것

## MDB2 함수 주의사항

- `fetchRow()`: 호출 시점부터 1번째 행부터 순차 출력됨 (한 번 호출 후 반복문에서 또 호출하면 다음 행이 나오는 식으로 헷갈리기 쉬움)
- `numRows()`: SQL 결과가 없을 때 제약조건/인덱스/시퀀스 표시를 숨기는 용도로 활용
