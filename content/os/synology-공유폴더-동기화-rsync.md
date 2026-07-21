+++
title = "Synology 공유폴더 동기화 rsync"
date = 2021-10-14T05:45:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["SYNOLOGY"]
toc = true

[extra]
source = "notion"
notion_id = "b2996526-7ced-42ee-adcc-5389f2ebf04e"
notion_url = "https://app.notion.com/p/Synology-rsync-b29965267ced42eeadcc5389f2ebf04e"
+++

Synology NAS 간 공유 폴더 동기화(rsync 기반).

## 대상 NAS — rsync 서비스

1. 제어판 → 파일 서비스 → rsync
1. **rsync 서비스 활성화** 체크 → 적용

## 원본 NAS — 동기화 작업

1. 제어판 → 파일 서비스 → 고급 → 공유 폴더 동기화 → 작업 목록 → 생성
1. 작업 이름 입력, 동기화할 공유 폴더 선택(복수 가능)
1. 대상 NAS 지정 후 옵션:
   - SSH 암호화 포트 사용자 지정
   - SSH 전송 암호화 (보안↑ / 미사용 시 성능↑)
   - 전송 압축 (대역폭↓ / CPU↑)
   - 블록 수준 동기화 (변경분만 전송, CPU↑)
1. 실행 시기: 수정 시 / 수동 / 고급 스케줄
1. 적용 → 작업 목록에 표시, 스케줄에 따라 실행
