+++
title = "CentOS 6 MySQL 소스 컴파일 설치"
date = 2019-11-18T15:56:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["DB", "MySQL", "LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "36b51ce1-c9cd-457f-bf83-9719c31a4955"
notion_url = "https://app.notion.com/p/CentOS-6-MySQL-36b51ce1c9cd457fbf839719c31a4955"
external_url = "https://downloads.mysql.com/archives/community/"
+++

## CentOS 6 MySQL 소스 설치

- **≤5.1**: `./configure` → make
- **≥5.5**: `cmake` → make

### 5.1 configure 예

```bash
./configure \\
  --prefix=/usr/local/mysql \\
  --localstatedir=/usr/local/mysql/data \\
  --sysconfdir=/usr/local/mysql \\
  --without-debug \\
  --with-charset=utf8 --with-extra-charsets=all \\
  --with-plugins=innobase \\
  --with-tcp-port=3307 --with-mysqld-user=mysql
make && make install
```

### 5.7+ cmake 예

```bash
cmake . \\
  -DCMAKE_INSTALL_PREFIX=/usr/local/mysql-5.7 \\
  -DMYSQL_DATADIR=/usr/local/mysql-5.7/data \\
  -DMYSQL_UNIX_ADDR=/tmp/mysql.sock \\
  -DMYSQL_TCP_PORT=3308 \\
  -DDEFAULT_CHARSET=utf8 -DDEFAULT_COLLATION=utf8_general_ci \\
  -DDOWNLOAD_BOOST=1 -DWITH_BOOST=../boost_1_59_0 \\
  -DWITH_INNOBASE_STORAGE_ENGINE=1
```

### 설치 후

```bash
groupadd mysql; useradd -r -g mysql mysql
chown -R mysql:mysql /usr/local/mysql
bin/mysql_install_db --user=mysql --datadir=/usr/local/mysql/data
cp share/mysql/my-medium.cnf /usr/local/mysql/my.cnf
bin/mysqld_safe --user=mysql &
# 서비스: support-files/mysql.server → /etc/init.d/mysqld + chkconfig
mysqladmin -u root password '새비밀번호'
```

원격 허용 예(플레이스홀더):

```sql
GRANT ALL ON *.* TO 'root'@'허용할IP' IDENTIFIED BY '비밀번호';
FLUSH PRIVILEGES;
-- my.cnf: bind-address 주석 처리 후 재시작
```
