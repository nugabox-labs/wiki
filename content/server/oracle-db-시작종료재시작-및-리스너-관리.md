+++
title = "Oracle DB 시작/종료/재시작 및 리스너 관리"
date = "2020-02-18T23:24:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["SERVER"]
tags = ["DB", "Oracle"]
toc = true

[extra]
source = "notion"
notion_id = "9b9e545f-97cf-4df0-bad9-bd10ffa89405"
notion_url = "https://app.notion.com/p/Oracle-DB-9b9e545f97cf4df0bad9bd10ffa89405"
+++

## Oracle DB 시작/종료/재시작 및 리스너 관리

DB 시작/종료는 반드시 oracle 계정으로 수행

### 시작

```bash
su - oracle
sqlplus /nolog
SQL> connect / as sysdba
SQL> startup
```

- `startup`은 nomount → mount → open 단계를 자동 진행. 단계별로 수동 진행도 가능:

```sql
startup nomount;
alter database mount;
alter database open;
```

- DB 시작/종료에는 sysdba 또는 sysoper 시스템 권한 필요
  - sysdba: 시작/종료, 아카이브/복구, ALTER DATABASE(OPEN/MOUNT/BACKUP/CHANGE CHARACTER SET) 등 전권
  - sysoper: 시작/종료, 아카이브/복구, ALTER DATABASE(OPEN/MOUNT/BACKUP)까지만
- 버전 확인: `SELECT * FROM v$version;`

### 종료

```sql
sqlplus /nolog
SQL> connect / as sysdba
SQL> shutdown immediate;
```

### 재시작 순서 (리스너 포함 전체)

```bash
sudo su - oracle
lsnrctl stop                    # 1. 리스너 중지
sqlplus /nolog
SQL> connect / as sysdba
SQL> shutdown immediate;        # 2. DB 종료
SQL> startup                    # 3. DB 시작
lsnrctl start                   # 4. 리스너 시작
```

### 부팅 시 자동 시작 설정

```bash
# /etc/oratab 편집 (SID:ORACLE_HOME:자동실행플래그)
ora9:/opt/oracle/product/9.2.0.1.0:Y

# 스크립트 등록
cp /usr/local/src/oracle9i /etc/rc.d/init.d/
chmod 755 /etc/rc.d/init.d/oracle9i
ln -s /etc/rc.d/init.d/oracle9i /etc/rc.d/rc2.d/S99oracle9i
ln -s /etc/rc.d/init.d/oracle9i /etc/rc.d/rc3.d/S99oracle9i
ln -s /etc/rc.d/init.d/oracle9i /etc/rc.d/rc4.d/S99oracle9i
ln -s /etc/rc.d/init.d/oracle9i /etc/rc.d/rc0.d/K01oracle9i
ln -s /etc/rc.d/init.d/oracle9i /etc/rc.d/rc6.d/K01oracle9i

/etc/rc.d/init.d/oracle9i restart
ps ax | grep LISTENER   # 확인
```

### 특정 사용자로 SQL\*Plus 접속

```bash
sqlplus 사용자명/비밀번호@SID
# 예: sqlplus GILDDAENG/testpass@orcl

# 또는 접속 후 connect
sqlplus /nolog
SQL> connect 사용자명/비밀번호@SID
```

```sql
select * from tab;   -- 접속 계정의 테이블 목록 확인
```

### 리스너(Listener) 개요

- 클라이언트가 오라클 서버에 네트워크로 접속할 때 이를 중개하는 오라클 네트워크 관리자
- `lsnrctl` 명령어로 관리

```javascript
lsnrctl start     -- 시작
lsnrctl stop      -- 중지
lsnrctl reload    -- 재시작
lsnrctl status    -- 상태 확인
```

- **listener.ora**: 서버 측 설정 파일(프로토콜/포트 등), 위치는 `$ORACLE_HOME/network/ADMIN/`
- **tnsnames.ora**: 클라이언트 측 접속 정보(프로토콜/포트/서버주소/인스턴스), 클라이언트에 위치
- 둘 다 설치 시 Net8 Configuration 과정에서 자동 생성됨

원문: [https://webprogrammer.tistory.com/651](https://webprogrammer.tistory.com/651) , [https://lovelynoa.tistory.com/185](https://lovelynoa.tistory.com/185)
