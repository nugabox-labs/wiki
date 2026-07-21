+++
title = "맥 PHP 개발환경 구축 (Homebrew+Apache+PHP+Oracle)"
date = "2020-12-25T13:46:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["OS", "BACK-END"]
tags = ["MACOS", "PHP"]
toc = true

[extra]
source = "notion"
notion_id = "ab1240aa-903a-492b-9df0-25ff8cf4fa78"
notion_url = "https://app.notion.com/p/PHP-Homebrew-Apache-PHP-Oracle-ab1240aa903a492b9df025ff8cf4fa78"
+++

# 설치

## Brew로 설치

1. [Homebrew 설치](https://app.notion.com/p/4efd3b62998845899b363dc8ae51645c#5f0fdfc50d3a4707a803487d017b5f26)
1. 필수 라이브러리: `brew install openssl`
1. Apache 설치 (macOS 빅서엔 Apache 2.4 기본 설치돼 있으나, Homebrew 버전으로 전환 권장)

```bash
sudo apachectl stop
sudo launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist 2>/dev/null

brew install httpd
brew services start httpd
ps -ef | grep httpd
# 정상 기동 확인: http://localhost:8080
```

**Apache 서비스 명령어**

```bash
brew services stop/start/restart httpd
/usr/local/bin/httpd -k start   # 직접 시작/중지
/usr/local/bin/httpd -k stop
/usr/local/bin/httpd -t         # 문법 검사
tail -f /usr/local/var/log/httpd/error_log   # 로그 확인
```

**사용자 Sites 폴더 연동**

```bash
mkdir ~/Sites
echo "<h1>My User Web Root</h1>" > ~/Sites/index.html

vim /usr/local/etc/httpd/httpd.conf
# Listen 8080 -> Listen 0.0.0.0:8000 (localhost는 0.0.0.0 붙일 것)
# DocumentRoot "/usr/local/var/www" -> DocumentRoot /Users/홈폴더명/Sites
# <Directory "/Users/홈폴더명/Sites"> AllowOverride All
# LoadModule rewrite_module lib/httpd/modules/mod_rewrite.so  (주석 제거)
# User 유저명(홈폴더명) / Group staff / ServerName localhost

brew services stop httpd && brew services start httpd
# 확인: http://localhost
```

**가상호스트 설정**

```bash
vim /usr/local/etc/httpd/extra/httpd-vhosts.conf
```

```javascript
Listen 0.0.0.0:1000
<VirtualHost *:1000>
    DocumentRoot "/Users/유저명/Sites/프로젝트명"
    DirectoryIndex index.php index.html
    ErrorLog "|/usr/local/bin/rotatelogs /usr/local/var/log/httpd/프로젝트명_error_log_%Y%m%d 86400"
    CustomLog "|/usr/local/bin/rotatelogs /usr/local/var/log/httpd/프로젝트명_access_log_%Y%m%d 86400" combined env=!do_not_log
</VirtualHost>
```

httpd.conf에서 vhosts 모듈 주석 해제 및 include 필요:

```javascript
LoadModule vhost_alias_module lib/httpd/modules/mod_vhost_alias.so
Include /usr/local/etc/httpd/extra/httpd-vhosts.conf
```

**트러블슈팅**

```bash
# 로그 정상 생성 안 될 때
rm -Rf /usr/local/var/log/httpd/*
brew services restart httpd

# Address already in use: AH00072 에러
vim /usr/local/etc/httpd/httpd.conf   # Listen 0.0.0.0:80
```

## PHP 설치

```bash
brew tap shivammathur/php
brew install shivammathur/php/php@7.4   # 필요한 버전으로 (5.6~8.0 지원)
```

- 버전별 php.ini 위치: `/usr/local/etc/php/{버전}/php.ini`
- 버전 전환: `brew unlink php && brew link --overwrite --force php@5.6` → `php -v`
- brew 설치 시 PATH 안내가 뜨면 `.zshrc`에 추가 후 `source ~/.zshrc`

# 설정

## Apache-PHP 연동

```bash
vim /usr/local/etc/httpd/httpd.conf
```

```javascript
# LoadModule rewrite_module 아래에 추가 (버전에 맞는 한 줄만 사용)
LoadModule php7_module /usr/local/opt/php@7.4/lib/httpd/modules/libphp7.so

<IfModule dir_module>
    DirectoryIndex index.php index.html
</IfModule>
<FilesMatch \.php$>
    SetHandler application/x-httpd-php
</FilesMatch>
```

```bash
brew services stop httpd && brew services start httpd
echo "<?php phpinfo();" > ~/Sites/info.php
# 확인: http://localhost/info.php (확인 후 삭제 권장 - 서버 정보 노출)
```

## PHP-Oracle(oci8) 연동

1. Oracle Instant Client 다운로드(macOS): [https://www.oracle.com/kr/database/technologies/instant-client/macos-intel-x86-downloads.html](https://www.oracle.com/kr/database/technologies/instant-client/macos-intel-x86-downloads.html)
   - basic, sqlplus, sdk 3개 dmg
1. 빌드

```bash
cd /Volumes/instantclient-basic-macos.x64-19.8.0.0.0dbru
./install_ic.sh
# 결과: instantclient_19_8 폴더 생성 → 원하는 위치로 이동
```

1. 쉘 프로필에 경로 추가

```bash
vim ~/.zshrc
export LD_LIBRARY_PATH="/경로/instantclient_19_8"
export PATH="$LD_LIBRARY_PATH:$PATH"
source ~/.zshrc
```

1. oci8 확장 설치

```bash
pecl install oci8-2.2.0
# ORACLE_HOME 경로 입력 프롬프트: instantclient,/경로/instantclient_19_8
head /usr/local/etc/php/7.4/php.ini   # extension="oci8.so" 확인
```

1. pdo\_oci 연동 시

```bash
# 해당 PHP 버전의 ext/pdo_oci 폴더에서
phpize
./configure --with-pdo-oci=instantclient,/경로/instantclient,19.8
make
sudo make install
```
