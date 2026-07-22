+++
title = "CentOS zlib 설치"
date = 2021-05-26T10:02:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "DEV-OPS"]
tags = ["LINUX", "BASH"]
toc = true

[extra]
source = "notion"
notion_id = "58033337-5c34-417d-9d6c-f07f534e3322"
notion_url = "https://app.notion.com/p/CentOS-zlib-580333375c34417d9d6cf07f534e3322"
external_url = "http://pchero21.com/?p=75"
+++

gzip 등 압축 라이브러리. 홈: [zlib.org](http://www.zlib.org/)

```bash
wget http://www.zlib.net/zlib-1.2.13.tar.gz
tar xvfz zlib-1.2.13.tar.gz
cd zlib-1.2.13

./configure --prefix=/usr/local/zlib
make
make install
```

설치 경로(`--prefix`)는 이후 링크 시 기억할 것.
