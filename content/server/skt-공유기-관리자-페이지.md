+++
title = "SKT 공유기 관리자 페이지"
date = "2019-09-26T09:06:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["SERVER"]
tags = ["NETWORK"]
toc = true

[extra]
source = "notion"
notion_id = "ec2feb66-82bd-4ea3-9461-708bfbcbbece"
notion_url = "https://app.notion.com/p/SKT-ec2feb6682bd4ea39461708bfbcbbece"
+++

## SKT/SK브로드밴드 공유기 관리자 접속

- 접속 주소: `192.168.35.1` (안 되면 `cmd` > `ipconfig` > 기본 게이트웨이 값 사용)
- 계정: `admin` / 비밀번호: `공유기 MAC 뒤 6자리 + _admin` (숫자+영문, 대소문자 구분, MAC은 공유기 뒷면 스티커에서 확인)
- 예: rush-337ac 모델도 동일 규칙 적용

## 참고

- 기본적으로 80, 21, 22 등 주요 포트가 잠겨 있음 → 필요한 포트를 관리자 페이지 고급 설정에서 열어야 함 (예: DLNA로 TV 시청 시 80번 포트 개방 필요)
