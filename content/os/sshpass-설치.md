+++
title = "sshpass 설치"
date = 2022-05-27T10:58:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "TECH"]
tags = ["LINUX", "MACOS", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "8af6231b-b212-457c-bd65-bdd42d09ee8c"
notion_url = "https://app.notion.com/p/sshpass-8af6231bb212457cbd65bdd42d09ee8c"
external_url = "https://zetawiki.com/wiki/%EB%A6%AC%EB%88%85%EC%8A%A4_sshpass_%EC%82%AC%EC%9A%A9%EB%B2%95"
+++

## sshpass

SSH 비밀번호를 배치/스크립트로 전달. 키 배포(`ssh-keygen` + `ssh-copy-id`) 병행 권장.

### 설치

```bash
# Ubuntu
apt-get install sshpass
# RHEL/CentOS
yum install sshpass
# macOS (Homebrew 미공식 → 소스)
curl -O -L https://fossies.org/linux/privat/sshpass-1.09.tar.gz && tar xvzf sshpass-1.09.tar.gz
cd sshpass-1.09 && ./configure && sudo make install
```

### 사용

```bash
sshpass -p "패스워드" ssh -o StrictHostKeyChecking=no -p 포트 ID@호스트
sshpass -p "패스워드" ssh-copy-id -p 포트 ID@호스트
sshpass -p "패스워드" ssh -o StrictHostKeyChecking=no ID@호스트 "명령"
sshpass -p "패스워드" scp -o StrictHostKeyChecking=no 로컬파일 ID@호스트:원격경로
```

포트 22면 `-p` 생략 가능. 예시 비번 `P@ssw0rd`는 데모.
