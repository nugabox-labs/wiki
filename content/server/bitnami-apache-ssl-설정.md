+++
title = "Bitnami Apache SSL 설정"
date = 2020-06-23T10:48:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER", "TECH"]
tags = ["WEB", "TIL"]
toc = true

[extra]
source = "notion"
notion_id = "b01443fb-53db-4075-af3a-a271af160e93"
notion_url = "https://app.notion.com/p/Bitnami-Apache-SSL-b01443fb53db4075af3aa271af160e93"
external_url = "https://luckyyowu.tistory.com/364"
+++

> Bitnami AMI: APT Apache(`/usr/sbin/apache2`, `/etc/apache2/`)와 Bitnami(`/opt/bitnami/apache2/`)가 공존할 수 있음. `ps -ef | grep httpd`로 **실제 기동 바이너리** 확인.

## 유효했던 SSL conf

`/opt/bitnami/apache2/conf/bitnami/bitnami.conf` (또는 `/opt/apache2/conf/bitnami/bitnami.conf`)

실패하기 쉬운 위치: `/etc/apache2/apache2.conf`, `extra/httpd-ssl.conf`, 앱별 `httpd-vhost.conf`만 수정.

## VirtualHost 443 예

```javascript
<IfModule !ssl_module>
    LoadModule ssl_module modules/mod_ssl.so
</IfModule>
Listen 443
SSLProtocol all -SSLv2 -SSLv3

<VirtualHost *:443>
    DocumentRoot "/opt/bitnami/apache2/htdocs"
    SSLEngine on
    SSLCertificateFile    "/etc/ssl/ssl.crt/server.crt"
    SSLCertificateKeyFile "/etc/ssl/ssl.key/server.key"
    <IfVersion < 2.4.8>
        SSLCertificateChainFile "/etc/ssl/ssl.crt/server.ca-bundle"
    </IfVersion>
    <IfVersion >= 2.4.8>
        SSLCACertificateFile "/etc/ssl/ssl.crt/server.ca-bundle"
    </IfVersion>
</VirtualHost>
```

> 2.4.8+에서 `SSLCertificateChainFile` deprecated → `SSLCACertificateFile` 권장.
