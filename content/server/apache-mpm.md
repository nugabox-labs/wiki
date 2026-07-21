+++
title = "Apache MPM"
date = 2021-05-25T07:36:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["WEB"]
toc = true

[extra]
source = "notion"
notion_id = "03861aea-4b00-4e25-8d7d-124a0d596882"
notion_url = "https://app.notion.com/p/Apache-MPM-03861aea4b004e258d7d124a0d596882"
external_url = "https://app.notion.com/p/0ecab5a7eb6a488cafebfac7817eae2b"
+++

## MPM 종류

| 방식 | 특징 |
| --- | --- |
| **prefork** | 프로세스당 1 스레드. 메모리 많이 쓰지만 안정. 기본으로 많이 사용 |
| **worker** | 프로세스당 다중 스레드, 메모리 공유. 통신량 많은 서버에 적합 |
| **event** (2.4+) | worker 기반. keepalive 대기용 listener로 스레드 점유 완화 |

> 값은 모니터링하며 조정. 대부분 prefork, 고부하 시 worker/event.

## 현재 MPM 확인

```bash
apachectl -V | grep -i mpm
```

## prefork (`httpd-mpm.conf`)

```javascript
<IfModule mpm_prefork_module>
    StartServers          5
    MinSpareServers       5
    MaxSpareServers      10
    MaxRequestWorkers   300
    ServerLimit         300
    MaxConnectionsPerChild 0
</IfModule>
```

- `StartServers`: 시작 시 자식 수
- `Min/MaxSpareServers`: 유휴 프로세스 범위
- `MaxRequestWorkers`/`ServerLimit`: 최대 동시(기본 256 초과 시 동일 값)
- `MaxConnectionsPerChild`: 자식당 처리 후 재시작(0=무제한)

## worker / event

```javascript
<IfModule mpm_worker_module>
    StartServers 3
    MaxClients 150
    MinSpareThreads 75
    MaxSpareThreads 250
    ThreadsPerChild 25
    MaxRequestWorkers 400
    MaxConnectionsPerChild 0
</IfModule>

<IfModule mpm_event_module>
    StartServers 3
    MinSpareThreads 75
    MaxSpareThreads 250
    ThreadsPerChild 25
    MaxRequestWorkers 400
    MaxConnectionsPerChild 0
</IfModule>
```

## httpd.conf 성능 옵션

- `Timeout` — 무응답 시 세션 종료
- `KeepAlive` — 지속 연결 On/Off
- `MaxKeepAliveRequests` — 연결당 최대 요청(0=무제한)
- `KeepAliveTimeout` — 다음 요청 대기

## 동시접속·메모리 / 벤치

```bash
netstat -nltp | grep :80.*ESTABLISHED | wc -l
ps aux | grep apache | awk '{print $6}' | awk '{total+=$1} END {print total/1024}'
ab -n 3000 -c 300 http://localhost/
```

가용 동시연결 ≈ 여유 메모리 / 연결당 메모리. `-n` 총 요청, `-c` 동시. URL 끝 `/` 필수.
