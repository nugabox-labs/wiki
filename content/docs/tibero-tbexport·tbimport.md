+++
title = "Tibero tbexport·tbimport"
date = 2020-09-02T16:03:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["DB", "Tibero"]
toc = true

[extra]
source = "notion"
notion_id = "e2242e50-5bc3-4b41-b4f0-2c9edff6704c"
notion_url = "https://app.notion.com/p/Tibero-tbexport-tbimport-e2242e505bc34b41b4f02c9edff6704c"
external_url = "https://m.blog.naver.com/PostView.nhn?blogId=songsunsang&logNo=110168989386"
+++

> `password=PASS`는 플레이스홀더. 문서 데모 기본값 `tibero`는 실계정 아님.

## 모드

`full` | `user` | `table` 중 **하나만**. import 전 tablespace·user 준비. `FROMUSER`면 `TOUSER` 필수.

```bash
# export (로컬)
tbexport username=sys password=PASS port=8629 sid=SID file=out.dat full=y
tbexport username=sys password=PASS port=8629 sid=SID file=out.dat user=SCHEMA
tbexport username=sys password=PASS port=8629 sid=SID file=out.dat table=SCHEMA.TBL

# export (원격 — 파일은 원격에 생성)
tbexport username=sys password=PASS ip=HOST port=8629 sid=SID file=out.dat full=y

# import
tbimport username=sys password=PASS port=8629 sid=SID file=out.dat full=y
tbimport username=sys password=PASS port=8629 sid=SID file=out.dat fromuser=A touser=B
```
