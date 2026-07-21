+++
title = "윈도우 Python 환경 구축"
date = 2021-04-13T04:56:00Z
updated = 2026-07-21T02:37:00Z
categories = ["OS", "BACK-END"]
tags = ["PYTHON", "WINDOWS"]
toc = true

[extra]
source = "notion"
notion_id = "469c63df-bb0e-4d43-b23f-6bd48a15da2c"
notion_url = "https://app.notion.com/p/Python-469c63dfbb0e4d43b23f6bd48a15da2c"
+++

# 설치

## Python 다운로드 설치

[https://www.python.org/downloads/](https://www.python.org/downloads/)

1. 설치 시 "Add Path" 항목 체크
1. 설치 후 CMD에서 `python -V` 로 버전 확인

## win32com 설치

[https://sourceforge.net/projects/pywin32/files/?source=navbar](https://sourceforge.net/projects/pywin32/files/)

1. Python 버전에 맞는 파일 다운로드
1. 관리자 권한으로 실행 후 설치
1. 관리자 권한 CMD에서 Python 설치 디렉토리의 Scripts 폴더로 이동

```javascript
cd C:\ProgramData\Anaconda\Scripts
# 또는
cd C:\Users\사용자명\AppData\Local\Programs\Python\Python버전\Scripts
```

1. 아래 명령 실행

```javascript
python pywin32_postinstall.py -install
```

- Inspect.exe: [https://github.com/yinkaisheng/Python-UIAutomation-for-Windows/raw/master/inspect/InspectX86.exe](https://github.com/yinkaisheng/Python-UIAutomation-for-Windows/raw/master/inspect/InspectX86.exe)
