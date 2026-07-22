+++
title = "DNS 서버 구축 Bind 설치"
date = 2021-04-30T00:11:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["LINUX", "NETWORK"]
toc = true

[extra]
source = "notion"
notion_id = "21420a8e-99da-457a-92b2-1d9ecd099c25"
notion_url = "https://app.notion.com/p/DNS-Bind-21420a8e99da457a92b21d9ecd099c25"
+++

## Bind 패키지 설치

---

bind로 시작하는 패키지를 모두 설치한다.

```bash
yum install -y bind-*
```

## DNS 필수 설정 파일

※ 아래 파일들은 `named` 소유자 권한 확인할 것

---

### /etc/named.conf

- options
  ```bash
options {
	listen-on port 53 { 127.0.0.1; }; # DNS Port 53에 접근할 수 있는 IP (기본 any)
	listen-on-v6 port 53 { ::1; };    # IPv6 사용 시 Port 53에 접근 가능한 IP
	version		"unknown";
	directory	"/var/named";           # 실제 서비스할 DNS의 zone 파일 디렉토리 경로
	dump-file                         # DNS cache dump 파일 생성 디렉토리 경로
	statistics-file                   # 통계 파일 생성 디렉토리 경로
	memstatistics-file                # 메모리 통계 파일 생성 디렉토리 경로
	recursing-file                    # 반복 요청 파일 생성 파일 디렉토리 경로
	secroots-file
	recursion	yes;                    # 반복 질의에 대한 요청(DNS Cache Server) 여부
  
	## 요청에 대한 허용 IP 설정
	allow-transfer	{ 27.101.98.11; };
	allow-recursion {127.0.0.1; 27.101.98.0/24; }
	allow-query		{ 127.0.0.1; 192.168.0.0/24; };
	allow-query-cache	{ 127.0.0.1; 192.168.0.0/24; };

	## DNS-SEC에 관한 설정
	dnssec-enable yes;
	dnssec-validation yes;
	/* Path to ISC DLV key */
	bindkeys-file "/etc/named.root.key";         
	managed-keys-directory "/var/named/dynamic";
	pid-file "/run/named/named.pid";              # DNS의 PID가 작성된 파일
	session-keyfile "/run/named/session.key";     # TSIG session key (Master ↔ Slave 보안 트랜잭션 설정)
};
  ```
- logging : DNS 서버 실행 시 로그 파일에 대한 옵션
  ```bash
logging
{
	category lame-servers { null; };
	category network { null; };
	category notify { null; };
	category unmatched { null; };

	# 디버그 수준의 로그 파일 남기기 
	channel default_debug { 
		file "data/named.run";
		severity dynamic;
	};
	category default { default_syslog; default_debug; };
};
  ```
- controls
  ```bash
controls {
	inet 127.0.0.1 port 953 allow { localhost; } keys { "gwangsan-key"; };
};
  ```
- include : 해당 경로에 있는 파일 내용을 불러온다.
  - `rndc.key` : DNS-SEC에 관한 설정
  - `named.rfc1912.zones` : zone 파일 등록에 대한 정보

  ```bash
include "/etc/rndc.key";
include "/etc/named.rfc1912.zones";
  ```
- zone : 참조할 zone 파일과 rev 파일에 대한 정보를 입력한다.
  ```bash
zone "98.101.27.in-addr.arpa"	IN { type master; file "gwangsan.rev"; allow-update { none; }; };
zone "gwangsan.go.kr"		IN { type master; file "gwangsan.zone"; allow-update { none; }; };
zone "gwangsan.kr"		IN { type master; file "gwangsan.kr.zone"; allow-update { none; }; };
  ```

### /etc/named.rfc1912.zones

`/etc/named.conf` 에서 별도로 디렉토리 경로를 설정하지 않은 경우  `/var/named` 를 기준으로 상대 경로를 사용해 zone 파일을 등록하게 됨.

- zone 파일의 구조
  ```bash
## zone 파일 등록 (기본 설정)
zone "도메인명" IN {
    type master; # Master & Slave 타입 중 선택 (기본 Master)
    file "zone 파일명";
    allow-update { none; };
			# Dynamic Update를 위해 어떤 IP로부터 zone파일 갱신할 지 설정 옵션
			# Master & Slave 구성일 때는 any보다 Slave 서버의 IP 입력이 보안상 유리
			# Master & Slave 구성이 아닐 때는 none으로 기능 Off
};

## 예)
zone "nugabox.com" IN {
    type master;
    file "nugabox.com.zone";
    allow-update { none; };
};
  ```

### /var/named/\*.zone

※ 주의할 점

- 도메인명은 항상 마침표(.) 또는 ORIGIN(@)으로 끝나야 함. 없으면 named.rfc1912.zones에 등록한 도메인명이 붙음

```bash
$TTL 600
@				IN	SOA	ns1.gwangsan.go.kr. root.gwangsan.go.kr. (
				2020021016 ; Serial
				600  	; Reresh
				600  	; Retry
				432000	; Expire
				600 	; Minimum
				);
;
; ns
; mx
				IN	NS	ns.gwangsan.go.kr.
				IN	MX	0	antispam.korea.kr.
				IN	A	27.101.98.36
eais.gwangsan.go.kr.		IN	TXT	"v=spf1 ip4:211.253.121.18 ip4:211.253.121.34 ~all"
;gwangsan.go.kr.			IN	TXT	"v=spf1 ip4:27.101.98.145 -all"
gwangsan.go.kr.			IN	TXT	"v=spf1 ip4:125.60.33.0/24 -all"
mail.gwangsan.go.kr.		IN	TXT	"v=spf1 ip4:27.101.98.25 -all"

; host address
gwangsan.go.kr.     		        IN      A       27.101.98.36
ns					IN	A	27.101.98.35
ns1					IN	A	27.101.98.35
;2016_RENEWER
m					IN	A	27.101.98.36
www					IN	A	27.101.98.36
;english					IN	A	27.101.98.36
```

### /var/named/\*.rev

```bash
;$TTL 86400
$TTL 600
@	IN	SOA	ns1.gwangsan.go.kr root.gwangsan.go.kr (
				20101214 ; Serial
				600		; Reresh
				600		;Retry
				432000	; Expire
				600		; Minimum
				)
; Name Server
		IN	NS	ns.gwangsan.go.kr.

; in.addr-arpa
;
3		IN	PTR	gwangsan.go.kr.
4		IN	PTR	rtms.gwangsan.go.kr.
4		IN	PTR	open.gwangsan.go.kr.
4		IN	PTR	eminwon.gwangsan.go.kr.
```

## 파일 검증

---

- named.conf 검증
  ```bash
named-checkconf /etc/named.conf
  ```
- zone 파일 검증 :  `named-checkzone [domain] [zone file]`
  ```bash
named-checkzone nugabox.com nugabox.com.zone
  ```

## 서비스 구동

---

- 서비스 시작
  ```bash
systemctl start named
  ```
- 서버 재기동 시 서비스 자동 시작
  ```bash
systemctl enable named
  ```
- 프로세스 실행 확인
  ```bash
ps -ef | grep named
  ```
- DNS 포트(53) 개방 확인
  ```bash
netstat -anp | grep 53 | grep "LISTEN "
  ```
