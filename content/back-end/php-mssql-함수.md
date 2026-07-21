+++
title = "PHP-MSSQL 함수"
date = "2019-04-12T04:47:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["BACK-END"]
tags = ["PHP"]
toc = true

[extra]
source = "notion"
notion_id = "05f2e832-06dc-49f5-b54b-9ab39b23bfed"
notion_url = "https://app.notion.com/p/PHP-MSSQL-05f2e83206dc49f5b54b9ab39b23bfed"
external_url = "http://docs.php.net/manual/kr/function.mssql-connect.php"
+++

## PHP mssql\_\* 함수 목록 (⚠️ PHP7부터 제거된 구 확장, PDO\_SQLSRV/sqlsrv로 대체 필요)

```javascript
mssql_connect / mssql_pconnect   연결(일반/영구)
mssql_select_db                  DB 선택
mssql_query                      쿼리 실행
mssql_fetch_array / _assoc / _row / _object   결과 행 가져오기(형태별)
mssql_fetch_batch                다음 배치 레코드
mssql_num_rows / mssql_num_fields  행/필드 수
mssql_field_name / _length / _type / _seek    필드 정보
mssql_data_seek                  내부 행 포인터 이동
mssql_rows_affected              영향받은 레코드 수
mssql_result                     결과 데이터 조회
mssql_free_result / _statement   메모리 해제
mssql_init / mssql_bind / mssql_execute       저장 프로시저 준비/파라미터/실행
mssql_get_last_message           서버 마지막 메시지
mssql_min_error_severity / _min_message_severity  에러/메시지 심각도 설정
mssql_next_result                다음 결과셋 이동
mssql_close                      연결 종료
```

원문(공식 매뉴얼): [http://docs.php.net/manual/kr/function.mssql-connect.php](http://docs.php.net/manual/kr/function.mssql-connect.php)
