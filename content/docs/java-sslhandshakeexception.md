+++
title = "Java SSLHandshakeException"
date = 2023-07-21T07:37:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "BACK-END", "TECH"]
tags = ["JAVA", "NETWORK", "ISSUE"]
toc = true

[extra]
source = "notion"
notion_id = "8c1a5279-62fe-4f1f-bb07-90a3cb773c15"
notion_url = "https://app.notion.com/p/Java-SSLHandshakeException-8c1a527962fe4f1fbb0790a3cb773c15"
external_url = "https://junspapa-itdev.tistory.com/m/14"
+++

## 증상

Java HTTPS 클라이언트에서 인증서·프로토콜 불일치 시 `SSLHandshakeException`.

## 점검

1. 서버 인증서가 신뢰 CA인지 (자체서명 → truststore 등록)
1. JDK `cacerts`에 중간/루트 CA 포함 여부
1. TLS 버전 (서버 TLS1.2+ vs 구 클라이언트)
1. SNI / 호스트명 불일치

```bash
openssl s_client -connect host:443 -servername host </dev/null \
  | openssl x509 -noout -dates -subject

keytool -import -trustcacerts -alias myca -file ca.crt \
  -keystore "$JAVA_HOME/lib/security/cacerts"
```

운영에서 인증서 검증 우회는 비권장.
