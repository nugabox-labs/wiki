+++
title = "ApacheBench ab"
date = 2021-08-02T06:56:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["WEB"]
toc = true

[extra]
source = "notion"
notion_id = "bbde5f4b-9d39-4117-9d8d-7d7c26cd1e17"
notion_url = "https://app.notion.com/p/ApacheBench-ab-bbde5f4b9d3941179d8d7d7c26cd1e17"
external_url = "https://app.notion.com/p/22d21d24c299445aa555bbacc18e27de"
+++

가벼운 CLI 웹 벤치. 정적·단순 API에 적합. HTML/CSS/이미지 해석 없음. HTTP/1.0. KeepAlive는 동적(Content-Length 없는) 페이지에서 제한적.

```bash
ab -n 10 -c 3 http://example.com/
ab -n 100 -c 10 -g result.plot http://example.com/index.html
```

`-n` 총 요청, `-c` 동시, `-g` gnuplot 데이터.

주요 결과: Requests per second, Time per request, Failed requests.

## gnuplot

```bash
brew install gnuplot
# result.plot 컬럼: starttime, seconds, ctime, dtime, ttime, wait
gnuplot script.plot   # ttime(5열) 플롯 → result.png
```
