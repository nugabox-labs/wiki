+++
title = "OpenSSL 업데이트·Apache 적용"
date = 2020-12-22T00:16:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["WEB", "NETWORK", "LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "49752389-4732-43dd-9da4-3aa704f27649"
notion_url = "https://app.notion.com/p/OpenSSL-Apache-49752389473243dd9da43aa704f27649"
external_url = "https://app.notion.com/p/b01443fb53db4075af3aa271af160e93"
+++

> TLS 1.0/1.1은 주요 브라우저에서 차단. TLS 1.2는 OpenSSL 1.0.1+. `SSLProtocol: Illegal protocol 'TLSv1.2'` → OpenSSL/mod\_ssl 버전 부족.

> Apache 2.2.x는 OpenSSL 1.1.1 비호환(1.0.2까지). CVE-2021-3712 → OpenSSL 1.0.2/1.1.1i+ 권고.

# 1. 패키지 설치

```bash
yum install openssl-devel
yum update openssl mod_ssl
apachectl stop && apachectl start
ps -ef | grep httpd
```

# 2. 컴파일 설치

## 환경 확인

```bash
$APACHE/bin/httpd -v
cat $APACHE/build/config.nice   # --with-ssl 경로 확인
# with-ssl 경로의 openssl 또는 시스템
$SSL_PREFIX/bin/openssl version || openssl version
```

## OpenSSL 빌드 예 (1.1.1b)

```bash
yum install gcc pcre
wget -c https://www.openssl.org/source/openssl-1.1.1b.tar.gz
tar zxvf openssl-1.1.1b.tar.gz && cd openssl-1.1.1b
./config --prefix=/usr/local/openssl --openssldir=/usr/local/openssl shared -fPIC
make && make install

echo /usr/local/openssl/lib > /etc/ld.so.conf.d/openssl-1.1.1b.conf
ldconfig -v
mv /usr/bin/openssl /usr/bin/openssl.old
ln -s /usr/local/openssl/bin/openssl /usr/bin/openssl
openssl version
```

## Apache 재컴파일

`httpd -l`에 `mod_ssl` 정적 포함 시 재빌드 필요. 동적(`ldd …/mod_ssl.so`)이면 OpenSSL만 갱신해도 되는 경우 있음.

실서버: 기존 prefix 백업 → configure/make까지 준비 → 중단 후 make install → conf/modules 복원.

```bash
# apr/apr-util을 httpd-*/srclib/ 에 두고
./configure --prefix=/usr/local/apache \
  --with-included-apr --with-included-apr-util \
  --with-mpm=worker --enable-so --enable-rewrite --enable-ssl \
  --enable-mods-shared=all --with-ssl=/usr/local/openssl
make && make install
```

트러블: `Bundled APR not found` → srclib/with-included-apr · `expat.h` → `yum install expat-devel` · `SSLv2_client_method` → `--with-ssl` 경로(bin 유무) 조정.

## 기동·TLS 확인

```bash
cp -Rp $OLD/conf/* $NEW/conf/
apachectl configtest && apachectl start
# httpd-ssl.conf
# SSLProtocol -all +TLSv1.2
# SSLHonorCipherOrder on
curl -I https://example.com
# Server: Apache/2.4.x … OpenSSL/1.1.x …
```

브라우저 Security 탭 / SSL Labs 등으로 프로토콜·점수 확인.
