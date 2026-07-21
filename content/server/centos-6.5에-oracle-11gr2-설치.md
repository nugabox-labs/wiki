+++
title = "CentOS 6.5에 Oracle 11gR2 설치"
date = 2019-11-22T16:47:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["DB", "Oracle"]
toc = true

[extra]
source = "notion"
notion_id = "e915f433-8607-4593-9e60-27547545c208"
notion_url = "https://app.notion.com/p/CentOS-6-5-Oracle-11gR2-e915f433860745939e6027547545c208"
external_url = "http://blog.beany.co.kr/archives/3198"
+++

## CentOS 6.5에 Oracle 11gR2 설치

**X-Window 및 의존 라이브러리 설치**

```bash
yum -y groupinstall "X Window System"
yum -y install compat-libstdc++-33.x86_64 binutils elfutils-libelf elfutils-libelf-devel
yum -y install glibc glibc-common glibc-devel glibc-headers gcc gcc-c++ libaio-devel
yum -y install libaio libgcc libstdc++ make sysstat unixODBC unixODBC-devel unzip

wget ftp://ftp.pbone.net/mirror/www.whiteboxlinux.org/whitebox/4/en/os/x86_64/WhiteBox/RPMS/pdksh-5.2.14-30.x86_64.rpm
rpm -Uvh --nodeps pdksh-5.2.14-30.x86_64.rpm
```

**커널 파라미터** (`/etc/sysctl.conf`에 추가, 없는 것만)

```javascript
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
/sbin/sysctl -p   # 적용
```

**사용자 리소스 제한** (`/etc/security/limits.conf`)

```javascript
oracle soft nproc 2048
oracle hard nproc 65536
oracle soft nofile 1024
oracle hard nofile 65536
oracle soft stack 10240
```

**인증/SELinux/hostname 설정**

```bash
# /etc/pam.d/login에 추가
session required pam_limits.so

# /etc/selinux/config
SELINUX=disabled

# hostname 즉시변경
echo oracle > /proc/sys/kernel/hostname
# 영구변경: /etc/sysconfig/network의 HOSTNAME=oracle
# /etc/hosts에 127.0.0.1 oracle 추가
```

**계정 및 디렉토리 준비**

```bash
groupadd oinstall
groupadd dba
useradd -g oinstall -G dba oracle
passwd oracle

mkdir -p /app/oracle /app/oraInventory /data/database/oracle
chown -R oracle:oinstall /app/oracle /app/oraInventory /data/database/oracle
chmod -R 775 /app/oracle /app/oraInventory /data/database/oracle
```

**oracle 계정 환경변수** (`/home/oracle/.bash_profile`)

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

**설치**: Oracle 홈페이지에서 XE 아닌 file1/file2로 구성된 11gR2 다운로드 → `su - oracle` → 압축 해제 → `cd database` → `./runInstaller`

- 설치 마법사에서: Server Class → Single instance → Advanced install → Korea 언어 추가 → Enterprise Edition → 설치 경로 확인 → oraInventory Group을 oinstall로 → General Purpose/Transaction Processing → SID 입력 → Unicode 선택 → 계정 비밀번호 통일 지정 → dba 그룹 선택 → 의존성 체크 무시(설치돼있으면) → 최종 확인 후 설치

**설치 완료 후 root로 실행**

```bash
su - root
/app/oraInventory/orainstRoot.sh
/app/oracle/product/11.2.0/db_1/root.sh
```

**설치 확인**

```javascript
https://localhost:1158/em   # 로그인 창 뜨면 완료
```

```bash
su - oracle
cd $ORACLE_HOME/bin
./sqlplus / as sysdba
SQL> select instance_name from v$instance;
```

**부팅 시 자동시작 서비스 등록**

```bash
# /etc/oratab에서 해당 SID의 끝문자를 Y로
ORCL:/app/oracle/product/11.2.0/db_1:Y
```

```bash
# /etc/init.d/oracle 생성
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

원문: [http://blog.beany.co.kr/archives/3198](http://blog.beany.co.kr/archives/3198)
