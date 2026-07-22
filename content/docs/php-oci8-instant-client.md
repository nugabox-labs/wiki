+++
title = "PHP OCI8 Instant Client"
date = 2020-09-04T15:53:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "BACK-END"]
tags = ["PHP", "Oracle"]
toc = true

[extra]
source = "notion"
notion_id = "65fce457-7465-47ac-b87f-40b12ffc2fc2"
notion_url = "https://app.notion.com/p/PHP-OCI8-Instant-Client-65fce457746547acb87f40b12ffc2fc2"
external_url = "https://zetawiki.com/wiki/PHP에서_오라클_DB_사용"
+++

## 확인

```bash
php -r 'oci_connect();'   # undefined → 미연동
```

## Instant Client + pecl oci8

```bash
rpm -ivh oracle-instantclient*-basic-*.rpm   # libaio 필요
rpm -ivh oracle-instantclient*-devel-*.rpm

pecl download oci8
cd oci8-* && phpize
./configure --with-oci8=shared,instantclient,/usr/lib/oracle/VERSION/client64/lib
ln -s /usr/include/oracle/VERSION/client64/ /usr/lib/oracle/VERSION/client64/lib/include
make all install

echo 'extension=oci8.so' > /etc/php.d/oci8.ini
service httpd restart
# 성공 시: oci_connect() expects at least 2 parameters
```

필요: pecl, php-devel, gcc, make.
