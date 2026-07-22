+++
title = "CentOS 7 PHP 환경 구축 (Remi)"
date = 2021-11-03T00:58:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "BACK-END"]
tags = ["LINUX", "PHP"]
toc = true

[extra]
source = "notion"
notion_id = "72bae2e0-1e58-4f4a-8385-bc0afa52ab19"
notion_url = "https://app.notion.com/p/CentOS-7-PHP-Remi-72bae2e01e584f4a8385bc0afa52ab19"
+++

### EPEL 및 Remi 레포지토리 설치

```bash
yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
```

### 기본 저장소 설정 (버전별 선택)

```bash
yum-config-manager --enable remi-php55   # Install PHP 5.5
yum-config-manager --enable remi-php56   # Install PHP 5.6
yum-config-manager --enable remi-php72   # Install PHP 7.2
```

### PHP 설치

```bash
yum install php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo
```

### PHP 설치 확인

```bash
php -v
```

### 추가 설치

```bash
yum install php-mysql php-pear php-process php-devel php-xml php-mbstring php-pecl
```
