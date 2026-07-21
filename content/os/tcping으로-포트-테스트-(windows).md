+++
title = "Tcping으로 포트 테스트 (Windows)"
date = 2019-04-04T01:30:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["NETWORK", "WINDOWS"]
toc = true

[extra]
source = "notion"
notion_id = "21fc2899-2dbc-4969-86ef-450b5e6f65a4"
notion_url = "https://app.notion.com/p/Tcping-Windows-21fc28992dbc496986ef450b5e6f65a4"
external_url = "https://www.elifulkerson.com/projects/tcping.php"
+++

## Tcping (Windows에서 특정 IP:포트 핑 테스트)

1. [https://www.elifulkerson.com/projects/tcping.php](https://www.elifulkerson.com/projects/tcping.php) 에서 tcping.exe 다운로드
1. `C:\Windows\System32` 폴더로 이동

```shell
tcping 192.168.1.40 22        # 서버주소 포트로 접속 테스트
tcping -t 192.168.1.40 22     # -t: Ctrl+C 누를 때까지 반복
```
