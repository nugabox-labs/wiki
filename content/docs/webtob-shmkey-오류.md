+++
title = "WebtoB SHMKEY 오류"
date = 2023-11-07T23:41:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER", "TECH"]
tags = ["WAS", "ISSUE", "LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "901abac4-eca4-4e24-a30d-e3ae727bdc02"
notion_url = "https://app.notion.com/p/WebtoB-SHMKEY-901abac4eca44e24a30de3ae727bdc02"
external_url = "https://blog.naver.com/blueday9404/110187465674"
+++

## 증상

```
Please make sure that SHMEMKEY, WEBTOBDIR and PATH are set appropriately.
...
4. SHMKEY shared memory segment is not used by another WebtoB instance. errno=17(File exists)
BOOT0010: Failed to start process (.../bin/wsm). exec failed. status=1 errno=10
```

## 점검

1. `WEBTOBDIR` / `PATH`가 올바른 WebtoB 버전·bin을 가리키는지
1. 업그레이드 후 `wscfl` 재실행 여부
1. **SHMKEY 충돌** (다른 WebtoB 인스턴스와 공유 메모리 키 중복)

## 해결

```bash
ipcs -m                    # 기존 SHM 확인
ipcrm -m <shmid>           # 잔여 세그먼트 정리 (주의)
# http.m 등에서 SHMKEY를 인스턴스별로 다르게 설정 후
wscfl -i http.m
wsboot
```
