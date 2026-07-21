+++
title = "macOS APM(Apache+PHP+MySQL) 가상호스트 구성"
date = 2023-03-11T14:02:00Z
updated = 2026-07-21T02:37:00Z
categories = ["OS"]
tags = ["MACOS"]
toc = true

[extra]
source = "notion"
notion_id = "486999a3-6659-48a7-861f-ecb4b7f0431e"
notion_url = "https://app.notion.com/p/macOS-APM-Apache-PHP-MySQL-486999a3665948a7861fecb4b7f0431e"
external_url = "https://labs.brandi.co.kr/2018/01/23/kwakjs.html"
+++

## macOS APM(Apache+PHP+MySQL) + 가상호스트 구성 (Homebrew, 구버전 기준)

**버전 확인**

```bash
httpd -v   # Apache 버전
php -v     # PHP 버전 (macOS 기본 PHP가 최신이면 Homebrew로 하위버전 추가 설치 필요)
```

**Homebrew 주요 명령어**

```bash
brew search 패키지명     # 검색
brew install 패키지명    # 설치
brew uninstall 패키지명  # 삭제
brew list                # 설치 목록
brew upgrade 패키지명    # 업그레이드
brew tap homebrew/저장소명 / brew untap ...  # 서드파티 저장소 추가/삭제
```

**구버전 PHP 설치 및 Apache 연동 (예: php56)**

```bash
brew tap homebrew/php
brew install php56 --with-apache
```

```javascript
# /etc/apache2/httpd.conf
LoadModule php5_module /경로/libphp5.so
#LoadModule php7_module libexec/apache2/libphp7.so   ← 기존 php7 모듈 주석 처리
```

```bash
apachectl restart
```

**MySQL 설치**

```bash
brew install mysql56
/usr/local/Cellar/mysql@5.6/버전/bin/mysql.server start
/usr/local/Cellar/mysql@5.6/버전/bin/mysql --version
```

**가상호스트 설정**

```javascript
# httpd.conf
Include /private/etc/apache2/extra/httpd-vhosts.conf   ← 주석 해제

# httpd-vhosts.conf
NameVirtualHost *:80   ← Apache 2.4 이전 버전에서만 필요
DocumentRoot "/프로젝트/경로"
ServerName 도메인주소
```

```bash
vi /etc/hosts   # 로컬 도메인 매핑 추가 (DNS보다 우선 적용)
```

원문: [https://labs.brandi.co.kr/2018/01/23/kwakjs.html](https://labs.brandi.co.kr/2018/01/23/kwakjs.html)
