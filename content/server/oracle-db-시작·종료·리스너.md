+++
title = "Oracle DB 시작·종료·리스너"
date = 2020-02-18T23:24:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["DB", "Oracle"]
toc = true

[extra]
source = "notion"
notion_id = "9b9e545f-97cf-4df0-bad9-bd10ffa89405"
notion_url = "https://app.notion.com/p/Oracle-DB-9b9e545f97cf4df0bad9bd10ffa89405"
external_url = "https://webprogrammer.tistory.com/651"
+++

## Oracle DB 시작·종료·리스너

DB 시작/종료는 oracle 계정·sysdba(또는 sysoper)로 수행.

### 시작

```bash
su - oracle
sqlplus /nolog
SQL> connect / as sysdba
SQL> startup
```

`startup` = nomount → mount → open. 단계별:

```sql
startup nomount;
alter database mount;
alter database open;
```

- **sysdba**: 시작/종료, 아카이브/복구, ALTER DATABASE(OPEN/MOUNT/BACKUP/CHANGE CHARACTER SET) 등
- **sysoper**: 시작/종료, 아카이브/복구, ALTER DATABASE(OPEN/MOUNT/BACKUP)
- 버전: `SELECT * FROM v$version;`

### 종료

```sql
sqlplus /nolog
SQL> connect / as sysdba
SQL> shutdown immediate;
```

### 재시작 (리스너 포함)

```bash
sudo su - oracle
lsnrctl stop
sqlplus /nolog
SQL> connect / as sysdba
SQL> shutdown immediate;
SQL> startup
lsnrctl start
```

### 부팅 자동 시작 (oratab + init)

```bash
# /etc/oratab — SID:ORACLE_HOME:Y
ora9:/opt/oracle/product/9.2.0.1.0:Y

cp /usr/local/src/oracle9i /etc/rc.d/init.d/
chmod 755 /etc/rc.d/init.d/oracle9i
ln -s /etc/rc.d/init.d/oracle9i /etc/rc.d/rc2.d/S99oracle9i
ln -s /etc/rc.d/init.d/oracle9i /etc/rc.d/rc3.d/S99oracle9i
ln -s /etc/rc.d/init.d/oracle9i /etc/rc.d/rc4.d/S99oracle9i
ln -s /etc/rc.d/init.d/oracle9i /etc/rc.d/rc0.d/K01oracle9i
ln -s /etc/rc.d/init.d/oracle9i /etc/rc.d/rc6.d/K01oracle9i

/etc/rc.d/init.d/oracle9i restart
ps ax | grep LISTENER
```

### SQL\*Plus 접속

```bash
sqlplus 사용자명/비밀번호@SID
# 예(demo): sqlplus scott/tiger@orcl

sqlplus /nolog
SQL> connect 사용자명/비밀번호@SID
```

```sql
select * from tab;
```

### Listener

```bash
lsnrctl start
lsnrctl stop
lsnrctl reload
lsnrctl status
```

- **listener.ora**: 서버 `$ORACLE_HOME/network/ADMIN/`
- **tnsnames.ora**: 클라이언트 접속 정보
