+++
title = "Tibero 세션 제한·tbboot 공유메모리 오류"
date = 2021-05-06T04:46:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["DB", "Tibero", "LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "9249cece-30ad-419b-b0ee-f900b8b9dfbe"
notion_url = "https://app.notion.com/p/Tibero-tbboot-9249cece30ad419bb0eef900b8b9dfbe"
external_url = "https://app.notion.com/p/ce7e015fac304763a546d458fd05bb38"
+++

## MAX\_SESSION\_COUNT

`tibero6/config/tibero.tip`에서 세션 상한.

```bash
# tip 예시
MAX_SESSION_COUNT=...
```

## tbboot shared memory / semaphore

증상 예:

- Cannot attach to shared memory segment
- a shared memory segment with the same key already exists
- Cannot get semaphore

### 상태 확인·정리

```bash
ipcs
ipcs -s
ipcs -m

ipcrm -m <shmid>
ipcrm -s <semid>
ipcrm -a
```

### kernel.sem 부족 (errno=28)

```bash
sudo vi /etc/sysctl.conf
# kernel.sem = 10000 32000 10000 10000
sudo sysctl -p
tbboot
```
