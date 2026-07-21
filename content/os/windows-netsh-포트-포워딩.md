+++
title = "Windows netsh 포트 포워딩"
date = 2019-10-09T18:32:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER", "TECH"]
tags = ["WINDOWS", "NETWORK", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "a2e2fbe2-f2e0-4312-8a3c-f603085a1563"
notion_url = "https://app.notion.com/p/Windows-netsh-a2e2fbe2f2e043128a3cf603085a1563"
external_url = "https://learn.microsoft.com/en-us/windows-server/networking/technologies/netsh/netsh-interface-portproxy"
+++

관리자 CMD.

## 추가

```shell
netsh interface portproxy add v4tov4 listenport=<외부포트> listenaddress=0.0.0.0 connectport=<내부포트> connectaddress=<대상IP>
```

## 조회 / 삭제

```shell
netsh interface portproxy show all
netsh interface portproxy delete v4tov4 listenport=<외부포트> listenaddress=0.0.0.0
```

## 방화벽 (인바운드)

```shell
netsh advfirewall firewall add rule name="PortProxy" dir=in action=allow protocol=TCP localport=<외부포트>
```
