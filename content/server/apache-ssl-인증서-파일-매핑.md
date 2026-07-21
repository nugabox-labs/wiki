+++
title = "Apache SSL 인증서 파일 매핑"
date = 2021-08-04T04:51:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["WEB"]
toc = true

[extra]
source = "notion"
notion_id = "8dc3900c-a670-4fbd-b260-f5f62eb64260"
notion_url = "https://app.notion.com/p/Apache-SSL-8dc3900ca6704fbdb260f5f62eb64260"
external_url = "https://app.notion.com/p/b01443fb53db4075af3aa271af160e93"
+++

## 인증서 파일 역할

| 파일 | 용도 |
| --- | --- |
| `.key` | 개인키 (CSR 시 생성, PEM, 패스워드 없는 경우 많음) |
| `.crt` | 서버 인증서 (CA 발급) |
| `rsa-dv.chain-bundle.pem` | 체인 CA 병합본 |
| `AAACertificateServices.crt` 등 | 루트/중간 CA |
| `.pfx` | 개인키+서버인증서 PKCS#12 |

체인 예: `SectigoRSAAddTrustCA.crt` + `SectigoRSADomainValidationSecureServerCA.crt` → `rsa-dv.chain-bundle.pem`

## httpd-ssl.conf

```javascript
SSLCertificateFile      /path/to/server.crt
SSLCertificateKeyFile   /path/to/server.key
SSLCertificateChainFile /path/to/rsa-dv.chain-bundle.pem
# 필요 시
SSLCACertificateFile    /path/to/AAACertificateServices.crt
```
