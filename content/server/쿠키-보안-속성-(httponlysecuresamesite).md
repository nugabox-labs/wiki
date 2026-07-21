+++
title = "쿠키 보안 속성 (HttpOnly/Secure/SameSite)"
date = 2021-10-25T01:08:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "TECH"]
tags = ["WEB", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "92e54e73-9011-4ac2-90c4-e680ef675ed6"
notion_url = "https://app.notion.com/p/HttpOnly-Secure-SameSite-92e54e7390114ac290c4e680ef675ed6"
+++

## 쿠키 보안 속성

| 속성 | 역할 |
| --- | --- |
| **HttpOnly** | JS `document.cookie` 접근 차단 (XSS 완화) |
| **Secure** | HTTPS에서만 전송 |
| **SameSite** | `Strict` / `Lax` / `None` — CSRF 완화 (`None`은 Secure 필수) |
| **Path / Domain** | 전송 범위 제한 |
| **Max-Age / Expires** | 수명 |

### Set-Cookie 예

```javascript
Set-Cookie: session=abc; Path=/; HttpOnly; Secure; SameSite=Lax
```

### 삭제

```javascript
Set-Cookie: session=; Path=/; Max-Age=0
```

```javascript
// 브라우저에서 (HttpOnly 아닌 쿠키만)
document.cookie = "session=; path=/; max-age=0";
```

관련 헤더(참고): `X-Frame-Options`, `X-Content-Type-Options`, `X-XSS-Protection`
