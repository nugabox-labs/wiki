+++
title = "실행 중 컨테이너 port·volume 추가"
date = 2022-04-23T14:30:00Z
updated = 2026-07-21T06:47:00Z
categories = ["DEV-OPS"]
tags = ["MSA"]
toc = true

[extra]
source = "notion"
notion_id = "8d35e642-66bc-445d-86d8-a81cb68a288f"
notion_url = "https://app.notion.com/p/port-volume-8d35e64266bc445d86d8a81cb68a288f"
external_url = "https://app.notion.com/p/e860da48fcf741ee859a9012d7d3468e"
+++

실행 중 컨테이너에는 `-p`/`-v`를 추가할 수 없음 → commit 후 재실행.

```bash
# 컨테이너 이름: test 가정
docker stop test
docker commit test myimage:latest
docker run -d -p 80:80 -v /host/path:/container/path --name test myimage:latest
```
