+++
title = "macOS PHP 개발환경 (Homebrew·Apache·PHP·OCI8)"
date = 2020-12-25T13:46:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "BACK-END"]
tags = ["MACOS", "PHP"]
toc = true

[extra]
source = "notion"
notion_id = "ab1240aa-903a-492b-9df0-25ff8cf4fa78"
notion_url = "https://app.notion.com/p/macOS-PHP-Homebrew-Apache-PHP-OCI8-ab1240aa903a492b9df025ff8cf4fa78"
+++

## Homebrew Apache (httpd)

전제: Homebrew, `brew install openssl`

```bash
sudo apachectl stop
sudo launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist 2>/dev/null
brew install httpd
brew services start httpd
# http://localhost:8080
```

- 서비스: `brew services start/stop/restart httpd`
- 직접: `/usr/local/bin/httpd -k start` / `httpd -k stop`
- 문법: `httpd -t`
- 로그: `tail -f /usr/local/var/log/httpd/error_log`

### Sites·가상호스트

```bash
mkdir -p ~/Sites
# httpd.conf: Listen 0.0.0.0:8000, DocumentRoot ~/Sites, AllowOverride All
# rewrite_module 주석 해제, User/Group/ServerName 설정
vim /usr/local/etc/httpd/extra/httpd-vhosts.conf
```

```bash
<VirtualHost *:1000>
    DocumentRoot "/Users/유저명/Sites/프로젝트"
    DirectoryIndex index.php index.html
</VirtualHost>
```

`httpd.conf`에서 `vhost_alias_module`·`Include .../httpd-vhosts.conf` 활성화.

## PHP

```bash
brew tap shivammathur/php
brew install shivammathur/php/php@7.4
# php.ini: /usr/local/etc/php/{버전}/php.ini
# 전환: brew unlink php && brew link --overwrite --force php@7.4
```

`httpd.conf`:

```javascript
LoadModule php7_module /usr/local/opt/php@7.4/lib/httpd/modules/libphp7.so
<IfModule dir_module>
    DirectoryIndex index.php index.html
</IfModule>
<FilesMatch \.php$>
    SetHandler application/x-httpd-php
</FilesMatch>
```

```bash
brew services restart httpd
echo "<?php phpinfo();" > ~/Sites/info.php   # 확인 후 삭제
```

## OCI8

1. Instant Client(basic·sqlplus·sdk) 설치 → `install_ic.sh`
1. `~/.zshrc`: `export LD_LIBRARY_PATH="/경로/instantclient_19_8"`
1. `pecl install oci8-2.2.0` → `instantclient,/경로/instantclient_19_8`
1. pdo\_oci: `phpize` → `./configure --with-pdo-oci=instantclient,/경로,19.8` → `make && sudo make install`

다운로드: [https://www.oracle.com/kr/database/technologies/instant-client/macos-intel-x86-downloads.html](https://www.oracle.com/kr/database/technologies/instant-client/macos-intel-x86-downloads.html)
