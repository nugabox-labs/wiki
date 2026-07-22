+++
title = "Gemini API key 발급"
date = 2026-02-19T01:27:00Z
updated = 2026-07-21T06:47:00Z
categories = ["TECH"]
tags = ["TIP", "ETC"]
toc = true

[extra]
source = "notion"
notion_id = "f50e0c7f-a42d-4768-9266-8f3ed9203ecd"
notion_url = "https://app.notion.com/p/Gemini-API-key-f50e0c7fa42d476892668f3ed9203ecd"
external_url = "https://flextudio.com/blog/gemini-1"
+++

## Gemini API key 발급

> 실제 API 키는 본문에 두지 않음. 키는 비밀번호와 동일 — 외부 공유 금지.

### 절차

1. [Google AI Studio](https://aistudio.google.com/) 로그인 → **Get API key**
1. 프로젝트 없으면 **새 프로젝트 만들기**
1. Projects → **API 키 만들기** → 이름·프로젝트 선택 → 발급
1. 키는 로컬 환경변수/시크릿 매니저에만 저장

```bash
export GEMINI_API_KEY="<your-key>"
```
