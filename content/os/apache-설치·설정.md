+++
title = "Apache 설치·설정"
date = 2020-10-23T07:34:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["WEB", "LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "8b443d12-11c0-449f-b66d-a9d63f34d96f"
notion_url = "https://app.notion.com/p/Apache-8b443d1211c0449fb66da9d63f34d96f"
external_url = "https://httpd.apache.org/docs/current/install.html"
+++

## 1. 패키지 설치

```bash
yum install httpd httpd-devel
systemctl enable --now httpd
# nmap localhost → 80, 443
```

## 2. 소스 컴파일

다운로드: [httpd](https://archive.apache.org/dist/httpd/) · [apr](https://apr.apache.org/download.cgi) · [pcre](https://sourceforge.net/projects/pcre/files/pcre/)

```bash
yum install gcc* make pcre-devel expat-devel
```

### Apache 2.2 — apr/apr-util 별도 설치

```bash
mkdir [httpd]/srclib/apr [httpd]/srclib/apr-util
cd apr-* && ./configure --prefix=[apr경로] && make && make install
# libtoolT 없으면: cp -arp libtool libtoolT
cd apr-util-* && ./configure --prefix=[apr-util경로] --with-apr=[apr경로] && make && make install
# expat.h 없으면: yum install expat-devel
```

### Apache 2.4 — srclib에 포함

```bash
mv apr-* [httpd]/srclib/apr
mv apr-util-* [httpd]/srclib/apr-util
```

### pcre · httpd

```bash
cd pcre-* && ./configure --prefix=/usr/local/pcre && make && make install

./configure --prefix=/usr/local/apache2 \
  --with-pcre=/usr/local/pcre --with-included-apr \
  --enable-so --enable-ssl --with-ssl=[openssl경로]
# apr 별도 설치 시: --with-apr=... --with-apr-util=...
make && make install
# 실패 시 make clean. 기존 옵션: httpd/build/config.nice
```

## 3. 서비스

```bash
# CentOS 7+: systemctl enable|start|stop|restart|status httpd
# CentOS 6:  chkconfig --add httpd / service httpd start|stop|restart
apachectl start|stop|restart|graceful
# 또는 httpd -k start|stop|restart
apachectl configtest   # 또는 httpd -t
```

## 4. 설정 요지

`httpd.conf`: `ServerTokens prod`, `ServerSignature Off`, `ServerName`, `Timeout`, `User`/`Group`, `<Directory /> Require all granted`

`httpd-vhosts.conf` 예:

```javascript
Listen 80
<VirtualHost *:80>
    ServerName example.com
    ServerAlias www.example.com
    DocumentRoot "/home/app/public_html"
    DirectoryIndex index.php index.html
    ErrorLog "|/usr/sbin/rotatelogs /etc/httpd/logs/error_%Y%m%d 86400"
    CustomLog "|/usr/sbin/rotatelogs /etc/httpd/logs/access_%Y%m%d 86400" combined
    # JkMount /* workername
    # RewriteEngine on → HTTPS 리다이렉트
</VirtualHost>
```

Chrome `ERR_UNSAFE_PORT` 피하기: 1,7,9,21,22,25,53,80 외 well-known 등.

`httpd-ssl.conf` 요지: `Listen 443`, `SSLEngine on`, cert/key/CA, `SSLProtocol`/`SSLCipherSuite`. `httpd -l`에 mod\_so, `mod_ssl`·openssl 패키지 확인.

## 5. Tomcat(mod\_jk)

```bash
yum install autoconf libtool
cd tomcat-connectors/native
./configure --with-apxs=$(which apxs) && make && make install
```

`workers.properties`: `worker.list`와 워커명 일치(불일치 시 503).

`httpd.conf`: `LoadModule jk_module` + `JkWorkersFile`/`JkLogFile`/`JkShmFile`.

VHost: `JkMount /* workername`.

## 6. 비root 기동

80 바인딩은 root 권한 필요. 일반 계정 시:

```bash
# httpd.conf: User/Group = 일반계정
cd httpd/bin
chown root:testuser httpd && chmod +s httpd
chown testuser:testuser apachectl && ./apachectl start
```

## 7. 403 Forbidden

1. SELinux: `disabled` 후 reboot, 또는 `chcon -R -h -t httpd_sys_content_t /path`
1. Directory: 2.2 `Order/Allow`, 2.4 `Require all granted`. `Options Indexes`는 목록 노출 주의.
1. 경로 상위 디렉터리 실행권한(755/711) 필요.
