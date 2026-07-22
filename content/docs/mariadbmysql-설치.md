+++
title = "MariaDB/MySQL 설치"
date = 2020-10-27T00:47:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "8acac988-28d8-4cf5-919e-4895d77b5da5"
notion_url = "https://app.notion.com/p/MariaDB-MySQL-8acac98828d84cf5919e4895d77b5da5"
external_url = "https://app.notion.com/p/25c032ef73b84ae7b39262de324ff34e"
+++

> 테스트 OS: CentOS 6/7 · DB: MariaDB 10.0·10.2 / MySQL 5.1·5.7·8.0

# OS 사전 설정

## ulimit

```bash
vim /etc/security/limits.conf
# 추가
root soft nofile 65535
root hard nofile 65535
*    soft nofile 65535
*    hard nofile 65535
```

## Hostname

```bash
# CentOS 6
vim /etc/sysconfig/network   # HOSTNAME=호스트네임
# CentOS 7
hostnamectl set-hostname 호스트네임 --static && reboot
```

## 시간대 (UTC→KST)

```bash
rm /etc/localtime
ln -s /usr/share/zoneinfo/Asia/Seoul /etc/localtime
date
```

# 패키지 설치

- RPM 저장소: [downloads.mariadb.org](https://downloads.mariadb.org/mariadb/repositories/) · [archive](https://archive.mariadb.org/)
- OS 호환: [mariadb.com OS compatibility](https://mariadb.com/docs/deploy/os-compatibility/#mariadb-community-server)

## 저장소 등록 (특정 버전)

```bash
vim /etc/yum.repos.d/MariaDB.repo
```

```
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.2/centos7-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1
```

```bash
yum clean all && yum repolist
yum install MariaDB-server MariaDB-client
# 또는: yum install mysql-server mysql-client
# RPM 직접: rpm -Uvh MySQL-*.rpm [--force]
rpm -qa | grep -iE 'MariaDB|mysql'
```

기본 경로: datadir `/var/lib/mysql` · 로그 `/var/log/mysqld.log` · cnf `/etc/my.cnf` 또는 `/etc/my.cnf.d/` · sock/pid `/var/run/mysqld/`

# 컴파일 설치

```bash
yum install gcc gcc-c++ libtermcap-devel gdbm-devel zlib* libxml* \
  freetype* libpng* libjpeg* iconv flex gmp ncurses-devel cmake.x86_64 libaio gnutls-devel
# MySQL 8.0+: cmake 3+, gcc 5.3+
cd /usr/local/src
wget https://downloads.mysql.com/archives/get/file/mysql-5.7.20.tar.gz
tar zxvf mysql-5.7.20.tar.gz && mkdir build-mysql && cd build-mysql
groupadd mysql && useradd -g mysql mysql
```

소스: [MariaDB releases](https://downloads.mariadb.org/mariadb/+releases/) · [MySQL archives](https://downloads.mysql.com/archives/community/)

**다중 설치 시 반드시 분리:** `CMAKE_INSTALL_PREFIX` · `MYSQL_DATADIR` · `MYSQL_UNIX_ADDR` · `MYSQL_TCP_PORT` · `INSTALL_SYSCONFDIR`

```bash
# MariaDB 10.2
cmake ../mariadb-10.2.x \
  -DCMAKE_INSTALL_PREFIX=/usr/local/mariadb-10.2 \
  -DMYSQL_DATADIR=/usr/local/mariadb-10.2/data \
  -DMYSQL_UNIX_ADDR=/tmp/mariadb.sock \
  -DMYSQL_TCP_PORT=3307 \
  -DDEFAULT_CHARSET=utf8 -DDEFAULT_COLLATION=utf8_general_ci \
  -DWITH_INNOBASE_STORAGE_ENGINE=1 -DENABLED_LOCAL_INFILE=1 \
  -DWITH_EXTRA_CHARSETS=all

# MySQL 5.7
cmake ../mysql-5.7.x \
  -DCMAKE_INSTALL_PREFIX=/usr/local/mysql-5.7 \
  -DMYSQL_DATADIR=/usr/local/mysql-5.7/data \
  -DMYSQL_UNIX_ADDR=/tmp/mysql.sock \
  -DMYSQL_TCP_PORT=3306 \
  -DDOWNLOAD_BOOST=1 -DWITH_BOOST=../boost_1_59_0 \
  -DDEFAULT_CHARSET=utf8 -DDEFAULT_COLLATION=utf8_general_ci \
  -DWITH_INNOBASE_STORAGE_ENGINE=1 -DENABLED_LOCAL_INFILE=1
```

```bash
make && make install
chown -R mysql:mysql /usr/local/mysql && chmod -R 755 /usr/local/mysql
# 초기 DB
./scripts/mysql_install_db --user=mysql --basedir=/usr/local/mysql --datadir=데이터경로
# 또는 버전별 mysqld --initialize
```

`my.cnf` 샘플·튜닝은 별도 글 참고. 다중 DB면 `/etc/my.cnf` 충돌 주의 → 인스턴스별 cnf.

# 기동·root·서비스

```bash
# 컴파일
cd /usr/local/mysql/bin && ./mysqld_safe &
# 패키지
mysqld_safe &
# 또는
systemctl start mariadb   # CentOS 7
service mysql start       # CentOS 6

mysqladmin -uroot password 'CHANGE_ME'
# MySQL 5.7+
# ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'CHANGE_ME';
# FLUSH PRIVILEGES;

mysql_secure_installation
netstat -anp | grep mysql | grep LISTEN
mysql --version
```

CentOS 7 systemd 유닛 예: `ExecStart=/usr/local/mysql/bin/mysqld_safe --user=mysql` → `systemctl daemon-reload`.

## 트러블슈팅

- socket 권한 (`/tmp/mysql.sock` 등) · `-S`로 지정
- `--defaults-file=`로 cnf 지정
- 에러 로그: `/var/log/mysqld.log` / `*.err`
