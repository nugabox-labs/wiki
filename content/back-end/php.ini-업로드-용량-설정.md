+++
title = "php.ini 업로드 용량 설정"
date = 2019-11-26T11:20:00Z
updated = 2026-07-21T02:37:00Z
categories = ["BACK-END"]
tags = ["PHP"]
toc = true

[extra]
source = "notion"
notion_id = "e15db3ca-d063-4006-81de-4ae5c511b214"
notion_url = "https://app.notion.com/p/php-ini-e15db3cad063400681de4ae5c511b214"
external_url = "https://conory.com/blog/44009"
+++

## php.ini 업로드 용량 설정

```bash
vi /etc/php.ini
```

```
upload_max_filesize = 100M   ; 파일 업로드 최대 용량 (기본 2M)
post_max_size = 110M         ; POST 전송 최대 용량 (업로드 용량 + 여유분 10M 정도)
max_execution_time = 30      ; PHP 실행 제한시간(초), 무한루프 방지. 대용량 처리 시 늘릴 것
max_input_time = 60          ; 입력 데이터(GET/POST/업로드) 수신 제한시간. 대용량(1G+)이면 -1(무제한) 권장
memory_limit = 128M          ; PHP 메모리 사용량, 업로드 파일은 먼저 메모리에 적재됨
```

**관계식**: `post_max_size > upload_max_filesize >= memory_limit` 을 만족해야 업로드 실패 없음 (memory\_limit이 사실상 최대 업로드 가능 용량)

설정 후 재시작:

```bash
systemctl restart php-fpm
```

원문: [https://conory.com/blog/44009](https://conory.com/blog/44009)
