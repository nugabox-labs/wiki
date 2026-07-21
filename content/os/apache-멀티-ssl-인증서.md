+++
title = "Apache 멀티 SSL 인증서"
date = 2021-12-29T00:26:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["WEB", "LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "d7c4d8f9-e964-4528-8bc0-00de1ed81886"
notion_url = "https://app.notion.com/p/Apache-SSL-d7c4d8f9e96445288bc000de1ed81886"
external_url = "https://www.ucert.co.kr/wiki/w/Apache_%EB%A9%80%ED%8B%B0_%EC%9D%B8%EC%A6%9D%EC%84%9C_%EC%84%A4%EC%B9%98"
+++

## 인증서 준비

```bash
ps -ef | grep httpd
mkdir -p conf.d/ssl
cp www.example.com* conf.d/ssl
ls -la conf.d/ssl
```

## ssl.conf (멀티 VirtualHost)

```javascript
LoadModule ssl_module modules/mod_ssl.so
Listen 443
# SSLPassPhraseDialog exec:/etc/httpd/conf.d/pass.sh  # 키 비번 있을 때만

SSLSessionCache         shmcb:/var/cache/mod_ssl/scache(512000)
SSLSessionCacheTimeout  300

<VirtualHost *:443>
DocumentRoot "/var/www/html"
ServerName www.example1.com:443
SSLEngine on
SSLProtocol all -SSLv2
SSLCipherSuite DEFAULT:!EXP:!SSLv2:!DES:!IDEA:!SEED:+3DES
SSLCertificateFile /etc/httpd/conf.d/ssl/www.example1.com.crt
SSLCertificateKeyFile /etc/httpd/conf.d/ssl/www.example1.com.key
SSLCertificateChainFile /etc/httpd/conf.d/ssl/www.example1.com.ca-bundle
SSLCACertificateFile /etc/httpd/conf.d/ssl/www.example1.com.root-bundle
</VirtualHost>

<VirtualHost *:443>
DocumentRoot "/var/dev/html"
ServerName www.example2.com:443
SSLEngine on
SSLProtocol all -SSLv2
SSLCipherSuite DEFAULT:!EXP:!SSLv2:!DES:!IDEA:!SEED:+3DES
SSLCertificateFile /etc/httpd/conf.d/ssl/www.example2.com.crt
SSLCertificateKeyFile /etc/httpd/conf.d/ssl/www.example2.com.key
SSLCertificateChainFile /etc/httpd/conf.d/ssl/www.example2.com.ca-bundle
SSLCACertificateFile /etc/httpd/conf.d/ssl/www.example2.com.root-bundle
</VirtualHost>
```

## 검증·재시작

```bash
/usr/sbin/httpd -t
# RHEL7+: systemctl restart httpd
# 소스: {$httpd_home}/bin/httpd -k restart
ps -ef | grep httpd
netstat -nlp | grep httpd
openssl s_client -connect localhost:443 | openssl x509 -noout -dates
```
