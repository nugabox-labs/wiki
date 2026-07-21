+++
title = "Java keystore SSL 인증서 import"
date = 2024-02-14T23:49:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END", "TECH"]
tags = ["JAVA", "ISSUE", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "5db4764f-7d44-4624-b1fb-428a203aefef"
notion_url = "https://app.notion.com/p/Java-keystore-SSL-import-5db4764f7d444624b1fb428a203aefef"
external_url = "https://www.lesstif.com/system-admin/java-validatorexception-keystore-ssl-tls-import-12451848.html"
+++

## 증상

```
javax.net.ssl.SSLHandshakeException:
sun.security.validator.ValidatorException: PKIX path building failed
```

## 원인

상대 서버 CA가 JDK `cacerts`에 없거나 TLS·cipher 불일치.

## keytool import

```bash
# 기본 저장소 암호: changeit
keytool -importcert -alias myca -file cert.pem \
  -keystore "${JAVA_HOME}/lib/security/cacerts" -storepass changeit

keytool -delete -alias myca \
  -keystore "${JAVA_HOME}/lib/security/cacerts" -storepass changeit

keytool -list -keystore "${JAVA_HOME}/lib/security/cacerts" -storepass changeit | grep -i myca
```

## InstallCert

```bash
javac InstallCert.java
java InstallCert host:443
# jssecacerts 생성 → cacerts로 이전 또는 -Djavax.net.ssl.trustStore=jssecacerts
```

## 확인

```bash
openssl s_client -connect host:443 -showcerts
curl -vI https://host/
```

WAS는 JDK/`cacerts` 변경 후 재기동.
