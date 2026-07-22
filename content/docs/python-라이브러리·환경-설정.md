+++
title = "Python 라이브러리·환경 설정"
date = 2021-04-13T05:29:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END"]
tags = ["PYTHON"]
toc = true

[extra]
source = "notion"
notion_id = "c6c1a274-7634-4a51-9ada-b4a93812ae48"
notion_url = "https://app.notion.com/p/Python-c6c1a27476344a519adab4a93812ae48"
external_url = "https://www.selenium.dev/downloads/"
+++

## VS Code

1. Extensions → Python 설치
1. `.py` 저장 후 Run and Debug → Python File
1. `launch.json` 생성(Python File) 후 실행

## pip

```bash
python -m pip install --upgrade pip

# SSL 인증서 오류 시
pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org 패키지명
```

## 자주 쓰는 패키지

```bash
pip install uiautomation   # UI Automation
pip install openpyxl       # Excel
pip install selenium       # 브라우저
pip install pyautogui      # 데스크톱
```

- ChromeDriver: [chromedriver](https://chromedriver.chromium.org/downloads)
- Selenium: [selenium.dev/downloads](https://www.selenium.dev/downloads/)
