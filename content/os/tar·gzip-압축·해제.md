+++
title = "tar·gzip 압축·해제"
date = 2019-11-19T09:14:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "e619718b-854e-4da1-a224-701da213c283"
notion_url = "https://app.notion.com/p/tar-gzip-e619718b854e4da1a224701da213c283"
external_url = "https://nota.tistory.com/53"
+++

```bash
tar -cvf aaa.tar abc          # tar 묶기
tar -xvf aaa.tar              # 풀기
tar -zcvf aaa.tar.gz abc      # gzip
tar -zxvf aaa.tar.gz
```

| 옵션 | 의미 |
| --- | --- |
| `-c` | 생성 |
| `-x` | 해제 |
| `-z` | gzip |
| `-v` | 진행 출력 |
| `-f` | 파일명 |
| `-C` | 경로 |
| `-p` | 권한 보존 |
