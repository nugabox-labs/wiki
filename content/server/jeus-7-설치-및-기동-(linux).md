+++
title = "Jeus 7 설치 및 기동 (Linux)"
date = 2019-09-16T04:49:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["WAS"]
toc = true

[extra]
source = "notion"
notion_id = "475decc8-3e31-405c-9eb4-b8cabb47ed85"
notion_url = "https://app.notion.com/p/Jeus-7-Linux-475decc83e31405c9eb4b8cabb47ed85"
external_url = "https://onestone-note.tistory.com/44"
+++

## Jeus 7 설치 및 기동 (Linux)

**사용자 생성**

```bash
useradd -d /home/jeus7 -m -s /bin/bash jeus7
passwd jeus7
su - jeus7
```

**환경변수 설정** (`~/.bash_profile`에 JEUS\_HOME, JAVA\_HOME, DOMAIN\_NAME 등)

**설치**

```bash
chmod u+x jeus70_unix-generic_ko.bin
./jeus70_unix-generic_ko.bin
```

- 설치 중 선택: 라이선스 동의(Y) → 플랫폼(Linux) → 설치 디렉토리(JEUS\_HOME) → 서버 타입(기본 Domain Admin Server) → 설치 모드(기본 Production) → JDK 위치(`/usr/java`) → 관리자 계정(기본 ID `administrator`, 비밀번호는 설치 시 직접 지정) → 도메인명(기본 `jeus_domain`) → 노드 매니저 타입(기본 java)

**설치 확인**

```bash
jeusadmin -fullversion       # 버전 확인
jeusadmin -licenseinfo       # 라이선스 확인 (JEUS_HOME/license)
```

## 기동 순서: DAS → Node Manager → MS(Managed Server)

`JEUS_HOME/bin`의 스크립트로 기동/중지. 편의상 아래처럼 스크립트로 만들어 사용:

```bash
# dsboot (DAS 기동)
startDomainAdminServer -domain 도메인명 -server adminServer -u 관리자ID -p 비밀번호

# dsdown (DAS 중지)
jeusadmin -host localhost:9736 -domain 도메인명 -u 관리자ID -p 비밀번호 local-shutdown

# nmboot (Node Manager 기동)
nohup startNodeManager > /home/jeus7/jeus7/nodemanager/logs/nm.log &

# nmdown (Node Manager 중지)
stopNodeManager -host localhost -port 7730
```

```bash
chmod +x *   # bin 폴더 내 스크립트 실행권한 부여
```

**웹어드민 접속**: `http://IP주소:9736/webadmin` ("Server Is Running" 확인 후)

**접속 안 될 때**

```bash
jcfg
vi domain.xml   # BASE 리스너의 listen-address를 0.0.0.0 대신 실제 IP로 설정
```

원문: [https://onestone-note.tistory.com/44](https://onestone-note.tistory.com/44)
