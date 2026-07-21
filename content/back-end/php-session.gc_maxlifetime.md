+++
title = "PHP session.gc_maxlifetime"
date = 2021-04-28T01:55:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END"]
tags = ["PHP"]
toc = true

[extra]
source = "notion"
notion_id = "2338596d-ac2e-4038-b319-53c6bf438c11"
notion_url = "https://app.notion.com/p/PHP-session-gc_maxlifetime-2338596dac2e4038b31953c6bf438c11"
external_url = "https://darkstart.tistory.com/140"
+++

## 현재 값

```bash
php -r 'echo ini_get("session.gc_maxlifetime"), "\n";'
php --ini
```

## GC 동작

```
session.gc_probability = 1
session.gc_divisor = 1000
session.gc_maxlifetime = 1440   ; 기본 24분(초)
```

- GC 확률 = `gc_probability / gc_divisor` (예: 1/1000)
- GC 실행 시 `gc_maxlifetime`초 지난 세션 파일 삭제(확률적이라 시각이 정확하진 않음)

## 변경

```
session.gc_maxlifetime = 259200   ; 3일
```

```bash
sudo /opt/bitnami/ctlscript.sh restart apache
```

- 클라우드(Lightsail 등) soft reboot만으로는 미반영될 수 있음 → 인스턴스 완전 종료 후 재시작
- 예전 “최대 65535” 정보는 틀릴 수 있음(그 이상도 반영 확인)

## 세션 쿠키 만료

```php
session_set_cookie_params(259200, "/");
session_start();
```

응답 `Set-Cookie`에 `expires` 추가 여부 확인.

`phpinfo()`는 확인 후 공개 URL에서 제거.
