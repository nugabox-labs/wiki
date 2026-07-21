+++
title = "CentOS 6.5 Oracle 11gR2 설치"
date = 2019-11-22T16:47:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["DB", "Oracle"]
toc = true

[extra]
source = "notion"
notion_id = "e915f433-8607-4593-9e60-27547545c208"
notion_url = "https://app.notion.com/p/CentOS-6-5-Oracle-11gR2-e915f433860745939e6027547545c208"
external_url = "http://blog.beany.co.kr/archives/3198"
+++

## 의존 패키지

```bash
yum -y groupinstall "X Window System"
yum -y install compat-libstdc++-33.x86_64 binutils elfutils-libelf elfutils-libelf-devel
yum -y install glibc glibc-common glibc-devel glibc-headers gcc gcc-c++ libaio-devel
yum -y install libaio libgcc libstdc++ make sysstat unixODBC unixODBC-devel unzip

wget ftp://ftp.pbone.net/mirror/www.whiteboxlinux.org/whitebox/4/en/os/x86_64/WhiteBox/RPMS/pdksh-5.2.14-30.x86_64.rpm
rpm -Uvh --nodeps pdksh-5.2.14-30.x86_64.rpm
```

## 커널 (`/etc/sysctl.conf`에 없는 것만)

```
kernel.shmall = 10523004
kernel.shmmax = 6465333657
kernel.shmmni = 4096
kernel.sem = 250 32000 100 128
fs.aio-max-nr = 1048576
fs.file-max = 6815744
net.ipv4.ip_local_port_range = 9000 65500
net.core.rmem_default = 262144
net.core.rmem_max = 4194304
net.core.wmem_default = 262144
net.core.wmem_max = 1048586
```

```bash
/sbin/sysctl -p
```

## 리소스 제한 (`/etc/security/limits.conf`)

```
oracle soft nproc 2048
oracle hard nproc 65536
oracle soft nofile 1024
oracle hard nofile 65536
oracle soft stack 10240
```

## PAM / SELinux / hostname

```bash
# /etc/pam.d/login
session required pam_limits.so

# /etc/selinux/config
SELINUX=disabled

echo oracle > /proc/sys/kernel/hostname
# 영구: /etc/sysconfig/network HOSTNAME=oracle
# /etc/hosts 에 127.0.0.1 oracle
```

## 계정·디렉터리

```bash
groupadd oinstall
groupadd dba
useradd -g oinstall -G dba oracle
passwd oracle

mkdir -p /app/oracle /app/oraInventory /data/database/oracle
chown -R oracle:oinstall /app/oracle /app/oraInventory /data/database/oracle
chmod -R 775 /app/oracle /app/oraInventory /data/database/oracle
```

## oracle `.bash_profile`

```bash
export TMP=/tmp
export TMPDIR=$TMP
export ORACLE_BASE=/app/oracle
export ORACLE_HOME=$ORACLE_BASE/product/11.2.0/db_1
export ORACLE_HOME_LISTENER=$ORACLE_HOME/bin/lsnrctl
export ORACLE_SID=ORCL
export LD_LIBRARY_PATH=$ORACLE_HOME/lib:/lib:/usr/lib
export PATH=$ORACLE_HOME/bin:$PATH
```

## 설치

Oracle 사이트에서 11gR2 file1/file2 다운로드(XE 아님) → `su - oracle` → 압축 해제 → `cd database` → `./runInstaller`

- Server Class → Single instance → Advanced → Korea 언어 → Enterprise → 경로 확인 → oraInventory=`oinstall` → General Purpose → SID → Unicode → 계정 비밀번호 통일 → dba 그룹 → 의존성 경고 무시(설치됨) → 설치

완료 후 root:

```bash
su - root
/app/oraInventory/orainstRoot.sh
/app/oracle/product/11.2.0/db_1/root.sh
```

## 확인

- EM: `https://localhost:1158/em`

```bash
su - oracle
cd $ORACLE_HOME/bin
./sqlplus / as sysdba
SQL> select instance_name from v$instance;
```

## 부팅 자동시작

`/etc/oratab`: `ORCL:/app/oracle/product/11.2.0/db_1:Y`

`/etc/init.d/oracle`:

```bash
#!/bin/bash
# chkconfig: 345 90 10
. /etc/rc.d/init.d/functions
ORACLE_HOME=/app/oracle/product/11.2.0/db_1
ORACLE_USER=oracle
case "$1" in
  start)
    su - $ORACLE_USER -c "$ORACLE_HOME/bin/lsnrctl start"
    su - $ORACLE_USER -c "$ORACLE_HOME/bin/dbstart $ORACLE_HOME"
    su - $ORACLE_USER -c "$ORACLE_HOME/bin/emctl start dbconsole"
    ;;
  stop)
    su - $ORACLE_USER -c "$ORACLE_HOME/bin/lsnrctl stop"
    su - $ORACLE_USER -c "$ORACLE_HOME/bin/dbshut"
    su - $ORACLE_USER -c "$ORACLE_HOME/bin/emctl stop dbconsole"
    ;;
esac
```

```bash
chmod 755 /etc/init.d/oracle
chkconfig --add oracle
chkconfig oracle on
```
