+++
title = "Jeus Security 계정 관리"
date = 2019-09-18T01:41:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["WAS"]
toc = true

[extra]
source = "notion"
notion_id = "6fcedf43-f635-4162-85eb-0765af843198"
notion_url = "https://app.notion.com/p/Jeus-Security-6fcedf43f635416285eb0765af843198"
+++

## Jeus Security 계정 관리

- 계정을 서버기동/중지, 모니터링, 디플로이 전용 등 권한별로 분리 운영 권장

## 계정 비밀번호 변경

**직접 수정**

```bash
jcfg   # 또는 cd /home/jeus7/jeus7/domains/jeus_domain/config/
cd security/SYSTEM_DOMAIN
vi accounts.xml
```

**웹 어드민(권장)**: Security > SYSTEM\_DOMAIN > Accounts & Policies Management 에서 계정 선택 후 암호화 저장

- 최초 도메인 구성 시에만 xml 직접 수정, 이후에는 웹어드민에서 암호화 설정 권장
- 관리자 비밀번호 변경 후 `dsboot`, `dsdown` 등 비밀번호가 박힌 기동 스크립트도 함께 변경 필요

## 스크립트에 비밀번호 노출 안 하는 방법 (암호화)

```bash
# bin 폴더의 encryption 스크립트로 암호화
encryption AES "administrator:비밀번호"
# 도메인 그룹이 여럿이면
encryption AES "administrator:비밀번호" -domain jeus_domain
```

결과값을 `bin/jeusEncode` 파일에 저장:

```bash
vi jeusEncode
# 형식: 도메인명:서버명 [공백] 암호화결과값
```

기동 스크립트(`dsboot`) 수정: 노출된 `-u`/`-p` 옵션 대신

```bash
-f /home/jeus7/jeus7/bin/jeusEncode -cachelogin
```

## Multiple Domain 환경

- 도메인이 여럿이면 `-domain 도메인이름` 옵션 명시 필요
- 재설치 등으로 도메인이 여러 개 남아있는지 `/home/jeus7/jeus7/domains`에서 확인
