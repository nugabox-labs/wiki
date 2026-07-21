+++
title = "Oracle 10g Linux 설치 레거시"
date = 2019-09-26T07:22:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["DB", "Oracle"]
toc = true

[extra]
source = "notion"
notion_id = "b8626fb8-3f7c-4567-afdc-1ac8f4b07aec"
notion_url = "https://app.notion.com/p/Oracle-10g-Linux-b8626fb83f7c4567afdc1ac8f4b07aec"
+++

> 레거시 참고용. `scott`/`tiger`는 Oracle 샘플 계정 관례.

## 0) JRE

```bash
chmod +x jre-1_5_0_11-linux-i586.bin
./jre-1_5_0_11-linux-i586.bin
ln -s /usr/local/jre1.5.0_11 /usr/local/jre   # 오라클이 /usr/local/jre 를 찾음
```

## 1) PATH

```bash
# /etc/profile.d/class.sh
export PATH=$PATH:/usr/sbin:/sbin
```

## 2) OS 버전 우회 (10g 인증 OS만 허용)

```bash
echo "redhat-3" > /etc/redhat-release
```

## 3) 사용자/그룹/디렉터리

```bash
groupadd dba
groupadd oinstall
useradd -g oinstall -G dba oracle
passwd oracle

mkdir -p /u01/app/oracle
chown -R oracle.oinstall /u01
chmod -R 755 /u01/app/oracle
```

## 4) 커널 (`/etc/sysctl.conf`)

```
kernel.shmmax = 1073741824
kernel.sem = 250 32000 100 128
fs.file-max = 65536
```

```bash
/sbin/sysctl -p
```

## 5) oracle 환경변수 (`~/.bashrc`)

```bash
export ORACLE_BASE=/u01/app/oracle
export ORACLE_SID=ORCL
export ORACLE_HOME=$ORACLE_BASE/product/10.2.0/db_1
export PATH=$PATH:$ORACLE_HOME/bin
export DISPLAY=:0.0
export NLS_LANG=AMERICAN_AMERICA.KO16KSC5601
export LANG=ko_KR.eucKR
```

```bash
xhost +   # root, 로컬만
```

## 6) 설치 (oracle, GUI)

```bash
su - oracle
unset LANG
sh runInstaller
```

마법사: Inventory → 설치 경로 → Global DB Name/SID(`ORCL`) + Character Set(`Korean KO16KSC5601`) → 관리/스토리지/백업 옵션 → SYS/SYSTEM 비밀번호 → 설치.

완료 후 root:

```bash
su -
/u01/app/oracle/product/10.2.0/db_1/root.sh
/u01/app/oracle/oraInventory/orainstRoot.sh
```

## 7) init 파라미터 (`$ORACLE_HOME/dbs/initORCL.ora`)

```
db_name=orcl
db_files = 80
processes = 50
shared_pool_size = 60000000
control_files = /u01/app/oracle/oradata/orcl/control01.ctl
compatible = 10.2.0.1.0
```

## 8) 샘플 계정

```bash
su - oracle
sqlplus /nolog
```

```sql
conn /as sysdba;
startup;
drop user scott cascade;
create user scott identified by tiger;
grant connect, resource to scott;
alter user scott default tablespace system;
conn scott/tiger;
alter session set nls_territory='AMERICA';
alter session set nls_language='AMERICAN';
```
