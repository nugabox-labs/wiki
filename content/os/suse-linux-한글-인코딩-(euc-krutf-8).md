+++
title = "SuSE Linux 한글 인코딩 (EUC-KR/UTF-8)"
date = 2021-07-14T08:02:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "DEV-OPS", "TECH"]
tags = ["LINUX", "TIP", "BASH"]
toc = true

[extra]
source = "notion"
notion_id = "b8142303-b4d1-4d35-a180-912879b33784"
notion_url = "https://app.notion.com/p/SuSE-Linux-EUC-KR-UTF-8-b8142303b4d14d35a180912879b33784"
external_url = "https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=echo700&logNo=50009144084"
+++

## SuSE Linux 한글 인코딩 (EUC-KR / UTF-8)

```bash
locale

# 세션 적용
export LANG=ko_KR.EUC-KR
# 또는
export LANG=ko_KR.UTF-8

# 영구 적용: ~/.bash_profile 에 추가
echo 'export LANG=ko_KR.UTF-8' >> ~/.bash_profile
```
