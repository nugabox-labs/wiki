+++
title = "Alpine Linux curl 설치"
date = 2022-05-18T06:32:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "DEV-OPS"]
tags = ["LINUX", "MSA"]
toc = true

[extra]
source = "notion"
notion_id = "193433a9-42f1-4683-9b64-0359eec820ce"
notion_url = "https://app.notion.com/p/Alpine-Linux-curl-193433a942f146839b640359eec820ce"
+++

## Alpine apk curl

```bash
apk --no-cache add curl
```

## Dockerfile

```docker
RUN apk --no-cache add curl
# 이미 있는 curl 갱신
RUN apk add --update curl && rm -rf /var/cache/apk/*
```
