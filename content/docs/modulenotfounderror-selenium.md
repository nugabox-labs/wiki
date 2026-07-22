+++
title = "ModuleNotFoundError: selenium"
date = 2024-03-12T15:18:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END", "TECH"]
tags = ["PYTHON", "ISSUE"]
toc = true

[extra]
source = "notion"
notion_id = "2d79a71c-dee2-40c3-95fa-ce4826c4f7d3"
notion_url = "https://app.notion.com/p/ModuleNotFoundError-selenium-2d79a71cdee240c395face4826c4f7d3"
external_url = "https://blog.finxter.com/fixed-modulenotfounderror-no-module-named-selenium-2/"
+++

## ModuleNotFoundError: No module named 'selenium'

```bash
pip install selenium
pip3 install selenium
python -m pip install selenium
python3 -m pip install selenium

# Linux 권한
sudo pip3 install selenium
pip3 install selenium --user

# Windows py launcher
py -m pip install selenium

# Anaconda
conda install -c anaconda selenium

# pip 업그레이드 후 재설치
python -m pip install --upgrade pip
pip install selenium
```

- 버전 불일치 시: `python3 -m pip install selenium` / `pip3 install selenium`
- PyCharm: 프로젝트 venv에 설치 (`pip install selenium` 또는 Interpreter → +)
