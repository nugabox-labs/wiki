+++
title = "Synology Docker 클라이언트 IP (iptables)"
date = 2024-11-26T07:30:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER", "TECH"]
tags = ["SYNOLOGY", "NETWORK", "ISSUE", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "497c55d2-a45e-4fd7-ab4e-ea7eea79d852"
notion_url = "https://app.notion.com/p/Synology-Docker-IP-iptables-497c55d2a45e4fd7ab4eea7eea79d852"
external_url = "https://svrforum.com/nas/366302"
+++

원인: Synology Docker 패키지에 일반 Docker용 iptables NAT 규칙이 빠져 클라이언트 IP가 안 보임.

## 해결

제어판 → 작업 스케줄러 → 트리거된 작업 → **부팅 시** / 사용자 **root**

```bash
#!/bin/bash
currentAttempt=0
totalAttempts=10
delay=15
while [ $currentAttempt -lt $totalAttempts ]; do
  currentAttempt=$((currentAttempt + 1))
  echo "Attempt $currentAttempt of $totalAttempts..."
  result=$(iptables-save)
  if [[ $result =~ "-A DOCKER -i docker0 -j RETURN" ]]; then
    echo "Docker rules found! Modifying..."
    iptables -t nat -A PREROUTING -m addrtype --dst-type LOCAL -j DOCKER
    iptables -t nat -A PREROUTING -m addrtype --dst-type LOCAL ! --dst 127.0.0.0/8 -j DOCKER
    echo "Done!"
    break
  fi
  echo "Docker rules not found! Sleeping for $delay seconds..."
  sleep $delay
done
```

즉시 적용: 작업 스케줄러에서 Run.

참고: [https://gist.github.com/pedrolamas/db809a2b9112166da4a2dbf8e3a72ae9](https://gist.github.com/pedrolamas/db809a2b9112166da4a2dbf8e3a72ae9)
