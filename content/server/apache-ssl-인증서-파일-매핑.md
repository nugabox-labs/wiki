+++
title = "Apache SSL 인증서 파일 매핑"
date = "2021-08-04T04:51:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["SERVER"]
tags = ["WEB"]
toc = true

[extra]
source = "notion"
notion_id = "8dc3900c-a670-4fbd-b260-f5f62eb64260"
notion_url = "https://app.notion.com/p/Apache-SSL-8dc3900ca6704fbdb260f5f62eb64260"
+++

## 인증서 파일 역할

| 파일 | 용도 |
| --- | --- |
| `.key` | 개인키 (CSR 신청 시 생성, PEM, 패스워드 없음인 경우 많음) |
| `.crt` | 서버 인증서 (CA 발급) |
| `rsa-dv.chain-bundle.pem` | 체인 CA 병합본 (필수 체인 1개로 통합) |
| `AAACertificateServices.crt` 등 | 루트/중간 CA |
| `.pfx` | 개인키+서버인증서 PKCS#12 (설치 시 암호) |

체인 예: `SectigoRSAAddTrustCA.crt` + `SectigoRSADomainValidationSecureServerCA.crt` → `rsa-dv.chain-bundle.pem`

## httpd-ssl.conf

```javascript
SSLCertificateFile      /path/to/server.crt
SSLCertificateKeyFile   /path/to/server.key
SSLCertificateChainFile /path/to/rsa-dv.chain-bundle.pem
# 필요 시
SSLCACertificateFile    /path/to/AAACertificateServices.crt
```
