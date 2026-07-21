+++
title = "Oracle 설치 및 설정"
date = 2020-10-27T00:44:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["DB", "LINUX", "Oracle"]
toc = true

[extra]
source = "notion"
notion_id = "34b02903-360f-45ee-8cd1-54f2433905bd"
notion_url = "https://app.notion.com/p/Oracle-34b02903360f45ee8cd154f2433905bd"
+++

## 1. RPM

```bash
yum -y install setarch make glibc libaio compat-libstdc++-33 compat-gcc-34 gcc libXp openmotif compat-db glibc-devel \
  binutils elfutils-libelf elfutils-libelf-devel glibc-common glibc-headers gcc-c++ libaio-devel \
  libgcc libstdc++ make sysstat unixODBC unixODBC-devel unzip
rpm -Uvh --nodeps pdksh-5.2.14-30.x86_64.rpm
```

## 2. 커널 파라미터 (`/etc/sysctl.conf` 등)

> Oracle 11g용 semaphore/shm/file-max 등 설정 후 `sysctl -p`

## 3. JDK

```bash
yum install java-1.8.0-openjdk-devel.x86_64
```

## 4. 계정

```bash
groupadd oinstall
groupadd dba
useradd -g oinstall -G dba -d /home/oracle oracle
passwd oracle
# /etc/security/limits.conf 등 정책 조정
su - oracle
```

### `~/.bash_profile` 예

```bash
export ORACLE_BASE=/oracle
export ORACLE_HOME=$ORACLE_BASE/product/11gr2
export ORACLE_SID=ORCL
export PATH=$PATH:$ORACLE_HOME/bin
# export NLS_LANG=AMERICAN_AMERICA.KO16MSWIN949
```

## 5. 설치 파일

```bash
su - root
# linux.x64_11gR2_database_1of2.zip / 2of2.zip 연속 압축 해제
mkdir -p /oracle
chown -R oracle:oinstall /oracle
```

## 6. runInstaller (X-Window)

```bash
su - root
xhost +
su - oracle
export LANG=C
cd /oracle/database
./runInstaller
```

### 설치 마법사 요약

- Database 생성 및 구성 / Server Class / 단독 인스턴스 / Advanced
- Korean 추가, SE, ORACLE\_BASE 경로, oraInventory=`/oracle/oraInventory` (oinstall)
- General Purpose, SID 설정, AMM, charset AL32UTF8 또는 KO16MSWIN949
- 동일 암호(데모/로컬용), SYSDBA·SYSOPER=`dba`
- root 스크립트 실행 후 Close

## 7. 접속

```bash
su - oracle
sqlplus / as sysdba
```

### SCOTT (데모)

Password Manager에서 SCOTT Unlock 후 사용 (`scott`/`tiger` 등 데모 계정).
