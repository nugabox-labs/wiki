+++
title = "SFTP 파일 전송"
date = 2021-11-15T08:46:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["LINUX", "NETWORK"]
toc = true

[extra]
source = "notion"
notion_id = "05d35186-3489-4c72-a5b9-9ee94a872cb7"
notion_url = "https://app.notion.com/p/SFTP-05d3518634894c72a5b99ee94a872cb7"
external_url = "https://cccding.tistory.com/100"
+++

## 접속

```bash
sftp user@host
sftp -oPort=[port] user@host
```

## 전송

```bash
get [file]          # 다운로드
put [file]          # 업로드
mget [pattern]      # 다중 다운로드
mput [pattern]      # 다중 업로드
```

## 기타

```bash
ls                  # 원격 목록
!ls                 # 로컬 목록
!{cmd}              # 로컬 명령
```
