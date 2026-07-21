+++
title = "PHP 소스 컴파일 configure 옵션"
date = 2020-01-10T04:31:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END"]
tags = ["PHP"]
toc = true

[extra]
source = "notion"
notion_id = "9688a60b-fe4f-4a5d-bc0b-07c232abb337"
notion_url = "https://app.notion.com/p/PHP-configure-9688a60bfe4f4a5dbc0b07c232abb337"
+++

## PHP 5.2.17 + Apache

```bash
./configure \
--prefix=/usr/local/php-5.2.17 \
--with-apxs2=/usr/sbin/apxs \
--with-config-file-path=/etc/httpd/conf \
--with-charset=utf8 --enable-mod-charset \
--with-openssl --with-zlib --with-bz2 --with-curl \
--enable-mbstring --with-mysql=/usr/bin --enable-sockets \
--with-gd-native-ttf --with-jpeg-dir --with-png-dir --with-freetype-dir \
--enable-calendar --enable-dba --enable-exif --enable-ftp --enable-wddx \
--with-iconv --with-xsl --with-libdir=/usr/local/lib64
```

## MySQL + safe-mode

```bash
./configure \
--prefix=/usr/local/php \
--with-apxs2=/usr/sbin/apxs \
--with-mysql=/usr/local/mysql \
--with-mysqli=/usr/local/mysql/bin/mysql_config \
--with-curl --with-mcrypt=/usr \
--enable-safe-mode --enable-sockets --enable-ftp --enable-magic-quotes \
--with-ttf --enable-gd-native-ttf --enable-bcmath \
--with-zlib --with-gd --with-gettext \
--enable-exif --enable-mbstring --with-openssl \
--with-libdir=lib64
```

```bash
chmod 755 /usr/lib64/httpd/modules/libphp5.so
```

## EUC-KR

```bash
--with-language=korean --with-charset=euc_kr
```

구버전·환경별 옵션 메모(중복·폐기 옵션 포함).
