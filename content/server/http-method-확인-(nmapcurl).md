+++
title = "HTTP METHOD 확인 (nmap/curl)"
date = 2019-05-17T02:08:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["WEB", "NETWORK"]
toc = true

[extra]
source = "notion"
notion_id = "ab073480-4dd8-4bea-be6b-f5e5b9b9602f"
notion_url = "https://app.notion.com/p/HTTP-METHOD-nmap-curl-ab0734804dd84beabe6bf5e5b9b9602f"
+++

```bash
# HTTP METHODS (nmap NSE)
nmap TARGET -p 80 --script http-methods

# curl
curl -I URL              # HEAD
curl -v -X GET URL       # 임의 메서드: -X OPTIONS 등
```
