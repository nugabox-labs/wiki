+++
title = "Tibero Unable to open a session"
date = 2025-05-27T00:45:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "BACK-END", "TECH"]
tags = ["DB", "Tibero", "JAVA", "ISSUE"]
toc = true

[extra]
source = "notion"
notion_id = "ce7e015f-ac30-4763-a546-d458fd05bb38"
notion_url = "https://app.notion.com/p/Tibero-Unable-to-open-a-session-ce7e015fac304763a546d458fd05bb38"
external_url = "https://worldforest9.tistory.com/452"
+++

## 증상

- `TBS-70004` / `Unable to open a session` / `Not connected to the server`
- `JDBC-12003`

## 점검

1. Tibero 재기동으로 일시 해소되는지 확인
1. `$TB_HOME/config/tibero.tip` — `MAX_SESSION` 등 세션 상한
1. **Connection close 누수** (주원인)

## 원인 예

이미지 로깅·거래제어 등에서 `DBConnection`을 각각 open했는데, 일부 경로에서만 close.

## 해결

```java
Connection conn = null;
try {
    conn = getConnection();
    // SQL ...
} finally {
    if (conn != null) {
        try { conn.close(); } catch (SQLException ignore) {}
    }
}
// try-with-resources 권장
try (Connection conn = getConnection()) { ... }
```

세션 고갈 시 `MAX_SESSION`만 올리지 말고 close 경로 먼저 점검.
