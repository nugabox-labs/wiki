+++
title = "OpenSSL ROOT CA·SSL 인증서 발급"
date = 2024-05-17T08:11:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER", "DEV-OPS"]
tags = ["LINUX", "NETWORK", "BASH"]
toc = true

[extra]
source = "notion"
notion_id = "10ae1210-b8bb-4a2e-9b2a-58ba803a3f00"
notion_url = "https://app.notion.com/p/OpenSSL-ROOT-CA-SSL-10ae1210b8bb4a2e9b2a58ba803a3f00"
external_url = "https://www.lesstif.com/system-admin/openssl-root-ca-ssl-6979614.html"
+++

## ROOT CA

```bash
openssl genrsa -aes256 -out rootca.key 2048
chmod 600 rootca.key
openssl req -new -key rootca.key -out rootca.csr -config rootca_openssl.conf
openssl x509 -req -days 3650 -extensions v3_ca -set_serial 1 \
  -in rootca.csr -signkey rootca.key -out rootca.crt -extfile rootca_openssl.conf
openssl x509 -text -in rootca.crt
```

## SSL 호스트 인증서

```bash
openssl genrsa -aes256 -out host.key 2048
cp host.key host.key.enc
openssl rsa -in host.key.enc -out host.key
chmod 600 host.key*
openssl req -new -key host.key -out host.csr -config host_openssl.conf
openssl x509 -req -days 1825 -extensions v3_user -in host.csr \
  -CA rootca.crt -CAcreateserial -CAkey rootca.key \
  -out host.crt -extfile host_openssl.conf
openssl x509 -text -in host.crt
cp host.crt /etc/pki/tls/certs/
cp host.key /etc/pki/tls/private/
```

## rootca\_openssl.conf 핵심

```
[ v3_ca ]
basicConstraints = critical, CA:TRUE, pathlen:0
keyUsage = keyCertSign, cRLSign
```

## host\_openssl.conf 핵심

```
[ v3_user ]
basicConstraints = CA:FALSE
extendedKeyUsage = serverAuth,clientAuth
subjectAltName = @alt_names
[ alt_names ]
DNS.1 = www.example.com
DNS.2 = example.com
```
