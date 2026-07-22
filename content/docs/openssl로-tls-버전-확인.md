+++
title = "OpenSSL로 TLS 버전 확인"
date = 2020-06-22T18:05:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["WEB"]
toc = true

[extra]
source = "notion"
notion_id = "a69772b0-8e74-4cd0-9063-929e77a2eaa6"
notion_url = "https://app.notion.com/p/OpenSSL-TLS-a69772b08e744cd09063929e77a2eaa6"
external_url = "https://seoeuitae.synology.me/wordpress/archives/702"
+++

서버가 협상한 SSL/TLS 버전 확인:

```bash
openssl s_client -connect example.com:443 </dev/null 2>/dev/null | grep -i Protocol
```

출력 예: `Protocol  : TLSv1.2`

특정 프로토콜만 테스트:

```bash
openssl s_client -connect example.com:443 -tls1_2
openssl s_client -connect example.com:443 -tls1_3
```
