+++
title = "Oracle 10g Linux 설치 (레거시 참고용)"
date = "2019-09-26T07:22:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["SERVER"]
tags = ["DB", "Oracle"]
toc = true

[extra]
source = "notion"
notion_id = "b8626fb8-3f7c-4567-afdc-1ac8f4b07aec"
notion_url = "https://app.notion.com/p/Oracle-10g-Linux-b8626fb83f7c4567afdc1ac8f4b07aec"
+++

## Oracle 10g Linux 설치 (레거시 참고용)

### 0) 사전 준비 - JRE 설치

```bash
chmod +x jre-1_5_0_11-linux-i586.bin
./jre-1_5_0_11-linux-i586.bin
ln -s /usr/local/jre1.5.0_11 /usr/local/jre   # 오라클은 /usr/local/jre 경로를 찾으므로 심볼릭 링크 필수
```

### 1) PATH 설정

```bash
# /etc/profile.d/class.sh
export PATH=$PATH:/usr/sbin:/sbin
```

### 2) OS 버전 우회 (10g는 인증된 OS만 설치 허용)

```bash
echo "redhat-3" > /etc/redhat-release
```

### 3) 사용자/그룹/디렉토리 생성

```bash
groupadd dba
groupadd oinstall
useradd -g oinstall -G dba oracle
passwd oracle

mkdir -p /u01/app/oracle
chown -R oracle.oinstall /u01
chmod -R 755 /u01/app/oracle
```

### 4) 커널 파라미터 (`/etc/sysctl.conf`에 추가)

```javascript
kernel.shmmax = 1073741824
kernel.sem = 250 32000 100 128
fs.file-max = 65536
```

```bash
/sbin/sysctl -p
```

### 5) oracle 계정 환경변수 (`~/.bashrc`)

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
xhost +   # root 권한, 로컬서버에서만
```

### 6) 설치 (oracle 계정, GUI)

```bash
su - oracle
unset LANG
sh runInstaller
```

설치 마법사: Inventory 디렉토리 지정 → 설치 경로 지정 → Global DB Name/SID(`ORCL`) + Character Set(`Korean KO16KSC5601`) 지정 → DB 관리 옵션 → 스토리지(File System) → 백업/복구 옵션(기본값) → SYS/SYSTEM 등 계정 비밀번호 설정 → 설치 진행

설치 완료 후 root로 스크립트 실행:

```bash
su -
/u01/app/oracle/product/10.2.0/db_1/root.sh
/u01/app/oracle/oraInventory/orainstRoot.sh
```

### 7) 초기화 파라미터 파일 (`$ORACLE_HOME/dbs/initORCL.ora`)

```javascript
db_name=orcl
db_files = 80
processes = 50
shared_pool_size = 60000000
control_files = /u01/app/oracle/oradata/orcl/control01.ctl
compatible = 10.2.0.1.0
```

### 8) 사용자 계정 초기 설정

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
