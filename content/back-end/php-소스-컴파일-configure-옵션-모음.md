+++
title = "PHP 소스 컴파일 configure 옵션 모음"
date = "2020-01-10T04:31:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["BACK-END"]
tags = ["PHP"]
toc = true

[extra]
source = "notion"
notion_id = "9688a60b-fe4f-4a5d-bc0b-07c232abb337"
notion_url = "https://app.notion.com/p/PHP-configure-9688a60bfe4f4a5dbc0b07c232abb337"
+++

## PHP 소스 컴파일 ./configure 옵션 모음 (Apache 연동, 소스 설치용)

**PHP 5.2.17 기본 옵션**

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

**MySQL 연동 + 안전모드 버전**

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

컴파일 후:

```bash
chmod 755 /usr/lib64/httpd/modules/libphp5.so
```

**한글(EUC-KR) 환경 옵션 추가 시**

```bash
--with-language=korean --with-charset=euc_kr
```

원본은 여러 서버 환경별 configure 옵션을 그대로 기록해둔 메모(중복·구버전 옵션 다수 포함)
