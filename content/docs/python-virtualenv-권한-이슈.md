+++
title = "Python virtualenv 권한 이슈"
date = 2022-09-17T16:35:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "BACK-END", "TECH"]
tags = ["PYTHON", "ISSUE", "LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "d307674b-5037-4d4d-a193-e50b0c0fc425"
notion_url = "https://app.notion.com/p/Python-virtualenv-d307674b50374d4da193e50b0c0fc425"
external_url = "https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=knight7024&logNo=221597465850"
+++

## 증상

`virtualenv`에서 `pip3 install` 시 권한 오류. `--user`로 재시도해도 추가 오류.

## 원인

venv를 **root**로 생성함.

## 해결

```bash
# 잘못된 venv 삭제 후, 일반 계정으로 재생성
rm -rf /path/to/venv
virtualenv /path/to/venv
source /path/to/venv/bin/activate
pip install <package>
```

> `sudo pip install` 금지 (시스템 Python 오염).
