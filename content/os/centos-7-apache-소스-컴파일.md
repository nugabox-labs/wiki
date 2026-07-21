+++
title = "CentOS 7 Apache 소스 컴파일"
date = 2020-03-02T17:08:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["LINUX", "WEB"]
toc = true

[extra]
source = "notion"
notion_id = "90198bf2-e1e5-431a-9a6e-48995e770822"
notion_url = "https://app.notion.com/p/CentOS-7-Apache-90198bf2e1e5431a9a6e48995e770822"
external_url = "https://goddaehee.tistory.com/75"
+++

> CentOS 7 소스 컴파일.

## 의존성

```bash
yum -y install gcc make gcc-c++ pcre-devel expat-devel
```

## 소스

```bash
cd /tmp
wget http://mirror.apache-kr.org/httpd/httpd-2.4.29.tar.gz
wget http://apache.mirror.cdnetworks.com/apr/apr-1.6.3.tar.gz
wget http://apache.mirror.cdnetworks.com/apr/apr-util-1.6.1.tar.gz
# pcre: https://www.pcre.org

tar xvfz httpd-2.4.29.tar.gz && mv httpd-2.4.29 /usr/local/src/
tar xvfz apr-1.6.3.tar.gz && mv apr-1.6.3 /usr/local/src/
tar xvfz apr-util-1.6.1.tar.gz && mv apr-util-1.6.1 /usr/local/src/
# pcre도 /usr/local/src
```

## APR / APR-util / PCRE

```bash
cd /usr/local/src/apr-1.6.3
./configure --prefix=/usr/local/apr && make && make install

cd /usr/local/src/apr-util-1.6.1
./configure --prefix=/usr/local/apr-util --with-apr=/usr/local/apr
make && make install
# expat.h 없으면: yum install expat-devel

cd /usr/local/src/pcre-*
./configure --prefix=/usr/local/pcre && make && make install
```

## httpd

```bash
cd /usr/local/src/httpd-2.4.29
./configure --prefix=/usr/local/apache2 \
  --enable-modules=most --enable-mods-shared=all --enable-so \
  --with-apr=/usr/local/apr --with-apr-util=/usr/local/apr-util \
  --with-pcre=/usr/local/pcre
make && make install
```

## 기동·방화벽·자동시작

```bash
vi /usr/local/apache2/conf/httpd.conf   # ServerName 127.0.0.1:80
/usr/local/apache2/bin/httpd -k start
firewall-cmd --permanent --add-port=80/tcp && firewall-cmd --reload

cp /usr/local/apache2/bin/apachectl /etc/init.d/httpd
# chkconfig: 2345 90 90 / description 주석 추가 후
chkconfig httpd on
```

## yum 대안

```bash
yum install httpd && httpd -v && systemctl enable --now httpd
```
