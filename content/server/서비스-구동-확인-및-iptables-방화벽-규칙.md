+++
title = "서비스 구동 확인 및 iptables 방화벽 규칙"
date = 2019-09-26T08:55:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["NETWORK"]
toc = true

[extra]
source = "notion"
notion_id = "b98ca560-4db6-4c3a-b536-fff0999d6d99"
notion_url = "https://app.notion.com/p/iptables-b98ca5604db64c3ab536fff0999d6d99"
+++

## 서비스 설치/구동 여부 확인

```bash
rpm -qa | grep telnet          # 텔넷 설치 여부 (telnet=클라이언트, telnet-server=서버)
ps aux | grep telnet | grep -v grep    # 텔넷 서비스 구동 여부

netstat -ntlp                  # 21번 포트로 FTP 사용 여부 확인
rpm -qa | grep vsftpd          # FTP 설치 여부
ps -ax | grep vsftpd           # FTP 구동 여부

netstat -an                    # 현재 통신 중인 상대 IP 확인
```

## 보안 점검 체크리스트

- 통신 중인 상대 IP의 업무 관계 확인, 불필요하면 연결 차단
- 서비스 계정 접속 성공 여부 확인
- 계정 비밀번호 난이도(문자·숫자·특수문자 포함 8자 이상) 확인
- 외부에서 불필요한 포트 접근 차단 (예: 21, 22, 23, 3389, 1521, 1433)

## iptables 규칙 예시

현재 설정 확인:

```bash
iptables -nL
```

특정 IP만 22(SSH) 허용, 전체에 80(웹) 허용, 나머지 차단 (전체 차단이 이미 설정된 상태에서 위쪽에 허용 규칙을 끼워넣기 위해 `-I` 사용):

```bash
iptables -I INPUT -p tcp -s 0.0.0.0/0 -d 192.168.0.18 --dport 80 -j ACCEPT
iptables -I INPUT -p tcp -s 192.168.0.2 -d 192.168.0.18 --dport 22 -j ACCEPT
```

설정 영구 저장:

```bash
iptables-save > /etc/sysconfig/iptables
```

특정 IP/대역 차단:

```bash
iptables -A INPUT -s 111.222.33.44 -j DROP      # 단일 IP 차단
iptables -A INPUT -s 111.222.33.0/24 -j DROP    # 대역 차단
```
