+++
title = "OpenSSL 소스 업그레이드"
date = "2020-12-21T17:35:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "c228da71-d690-4d14-8317-13a61119e687"
notion_url = "https://app.notion.com/p/OpenSSL-c228da71d6904d14831713a61119e687"
external_url = "https://m.blog.naver.com/PostView.nhn?blogId=eunjiban&logNo=221538357782"
+++

## OpenSSL 소스 업그레이드 (예시 1.1.1)

```bash
openssl version
yum install gcc
cd /usr/local/src
wget https://www.openssl.org/source/openssl-1.1.1b.tar.gz
tar xzf openssl-1.1.1b.tar.gz && cd openssl-1.1.1b
./config --prefix=/usr/local/ssl --openssldir=/usr/local/ssl shared
make && make install
echo /usr/local/ssl/lib > /etc/ld.so.conf.d/openssl-1.1.1b.conf
ldconfig -v
mv /usr/bin/openssl /usr/bin/openssl.bak
ln -s /usr/local/ssl/bin/openssl /usr/bin/openssl
openssl version
```
