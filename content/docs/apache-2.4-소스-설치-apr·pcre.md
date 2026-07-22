+++
title = "Apache 2.4 소스 설치 apr·pcre"
date = 2020-12-21T17:56:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["WEB", "LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "1ff012db-4f93-433d-81fd-b0bc84c54e3f"
notion_url = "https://app.notion.com/p/Apache-2-4-apr-pcre-1ff012db4f93433d81fdb0bc84c54e3f"
external_url = "https://fmd1225.tistory.com/43"
+++

> CentOS 7 + Apache 2.4 소스. 의존: apr, apr-util, pcre, gcc

## 준비

```bash
yum install gcc* expat-devel
mkdir -p /app/source/{apache,apr}
```

## apr

```bash
cd /app/source/apr
wget http://apache.mirror.cdnetworks.com/apr/apr-1.5.0.tar.gz
tar -xvzf apr-1.5.0.tar.gz && cd apr-1.5.0
./configure --prefix=/usr/local/apr
# libtoolT 에러: cp -arp libtool libtoolT
make && make install
```

## apr-util

```bash
cd /app/source/apr
wget http://apache.mirror.cdnetworks.com/apr/apr-util-1.5.3.tar.gz
tar -xvzf apr-util-1.5.3.tar.gz && cd apr-util-1.5.3
./configure --with-apr=/usr/local/apr --prefix=/usr/local/apr-util
# expat.h 없으면: yum install expat-devel
make && make install
```

## pcre

```bash
cd /app/source/apr
wget http://sourceforge.net/projects/pcre/files/pcre/8.31/pcre-8.31.tar.gz/download -O pcre-8.31.tar.gz
tar xvfz pcre-8.31.tar.gz && cd pcre-8.31
./configure --prefix=/usr/local/pcre && make && make install
```

## httpd 2.4

```bash
cd /app/source/apache
wget http://apache.mirror.cdnetworks.com/httpd/httpd-2.4.7.tar.gz
tar -xvzf httpd-2.4.7.tar.gz && cd httpd-2.4.7

./configure --prefix=/app/web/httpd \
  --with-apr=/usr/local/apr \
  --with-apr-util=/usr/local/apr-util \
  --with-pcre=/usr/local/pcre \
  --enable-so --enable-rewrite
# SSL 예: --with-mpm=worker --enable-ssl --with-ssl=/usr
make && make install
```

### OpenSSL 버전 오류 시

```bash
wget http://www.openssl.org/source/openssl-1.0.1i.tar.gz
tar -zxf openssl-1.0.1i.tar.gz && cd openssl-1.0.1i
./config --prefix=/usr --openssldir=/usr/local/openssl shared
make && make test && make install
```

## 설정·기동

`httpd.conf`: `Listen`, `User`/`Group nobody`, `Include conf/extra/httpd-vhosts.conf`

```bash
/app/web/httpd/bin/apachectl start
ps axf | grep httpd
# iptables: -A INPUT ... --dport 80 -j ACCEPT && service iptables restart
```
