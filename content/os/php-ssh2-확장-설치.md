+++
title = "PHP ssh2 확장 설치"
date = 2019-03-26T01:19:00Z
updated = 2026-07-21T02:37:00Z
categories = ["OS", "BACK-END"]
tags = ["LINUX", "PHP"]
toc = true

[extra]
source = "notion"
notion_id = "78370915-e642-4ada-82ee-4675aef98af5"
notion_url = "https://app.notion.com/p/PHP-ssh2-78370915e6424ada82ee4675aef98af5"
external_url = "http://blog.sw4u.kr/2018/09/centos7-ssh2-extension-for-php-7.html"
+++

## PHP ssh2 확장 (PHP 7 / CentOS7)

```bash
yum install gcc php-devel libssh2 libssh2-devel   # php71w-devel 등 버전에 맞게
wget https://pecl.php.net/get/ssh2-1.1.2.tgz
tar zxvf ssh2-1.1.2.tgz && cd ssh2-1.1.2
phpize && ./configure && make && make install
echo 'extension=ssh2.so' > /etc/php.d/ssh2.ini
systemctl restart httpd
```
