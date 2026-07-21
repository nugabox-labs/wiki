+++
title = "MySQL DATE_FORMAT"
date = 2019-10-25T16:38:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["DB", "MySQL", "SQL"]
toc = true

[extra]
source = "notion"
notion_id = "3c314db3-4c6f-41ba-baf9-1264d8b7a190"
notion_url = "https://app.notion.com/p/MySQL-DATE_FORMAT-3c314db34c6f41babaf91264d8b7a190"
external_url = "http://www.w3schools.com/sql/func_date_format.asp"
+++

## 현재 시각

```sql
SELECT CURDATE(), CURTIME(), NOW(), SYSDATE();
```

- `CURDATE()` / `CURTIME()` / `NOW()`: 쿼리 시작 시각
- `SYSDATE()`: 함수 실행 시점 시각 (느린 쿼리에서 `NOW()`와 달라질 수 있음)

## 형식 변환

```sql
SELECT DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:%s');
-- 예: 2015-05-19 09:09:18
```

| 포맷 | 의미 |
| --- | --- |
| `%Y` / `%y` | 연 4자리 / 2자리 |
| `%m` / `%c` / `%M` / `%b` | 월 2자리 / 1자리 / 영문 / 약어 |
| `%d` / `%e` / `%D` | 일 2자리 / 1자리 / 서수 |
| `%H` / `%h` / `%k` / `%l` | 시 24/12 / 한자리 |
| `%i` | 분 |
| `%S` / `%s` | 초 |
| `%f` | 마이크로초 |
| `%p` | AM/PM |
| `%T` / `%r` | hh:mm:ss / 12h+AM/PM |
| `%j` | 연중 일(001-366) |
| `%w` | 요일 숫자(0=일) |
| `%W` / `%a` | 요일 영문 / 약어 |
| `%U` / `%u` | 주(일/월 시작) |
| `%X%V` / `%x%v` | 주 시작 연+주 |

> 참고: [http://www.w3schools.com/sql/func\_date\_format.asp](http://www.w3schools.com/sql/func_date_format.asp)

> 클리핑: [https://m.blog.naver.com/PostView.nhn?blogId=callsonda&logNo=220363810001](https://m.blog.naver.com/PostView.nhn?blogId=callsonda&logNo=220363810001)
