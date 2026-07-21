+++
title = "Django 로그 날짜별 파일 저장"
date = 2022-09-11T07:41:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END", "TECH"]
tags = ["PYTHON", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "a2d942a4-57d3-4d79-9436-12cab1ffb2b0"
notion_url = "https://app.notion.com/p/Django-a2d942a457d34d79943612cab1ffb2b0"
external_url = "https://fblens.com/entry/%EC%9E%A5%EA%B3%A0-%EB%A1%9C%EA%B7%B8-%EB%82%A0%EC%A7%9C%EB%B3%84-%ED%8C%8C%EC%9D%BC-%EC%A0%80%EC%9E%A5"
+++

`settings.py` — TimedRotatingFileHandler:

```python
from pathlib import Path
BASE_DIR = Path(__file__).resolve().parent.parent
LOG_DIR = BASE_DIR / 'logs'
LOG_DIR.mkdir(exist_ok=True)

LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'formatters': {
        'verbose': {'format': '[{asctime}] {levelname} {name} {message}', 'style': '{'},
    },
    'handlers': {
        'file': {
            'level': 'INFO',
            'class': 'logging.handlers.TimedRotatingFileHandler',
            'filename': str(LOG_DIR / 'django.log'),
            'when': 'midnight',
            'interval': 1,
            'backupCount': 30,
            'encoding': 'utf-8',
            'formatter': 'verbose',
        },
    },
    'root': {'handlers': ['file'], 'level': 'INFO'},
}
```

- 당일: `django.log`
- 이전일: `django.log.YYYY-MM-DD`
- `when`/`interval`로 분·시간 단위 로테이션 가능

참고: [Python logging](https://docs.python.org/3/library/logging.html) · [Django logging](https://docs.djangoproject.com/en/stable/topics/logging/)

![image](/notion-assets/a2d942a4-57d3-4d79-9436-12cab1ffb2b0/2.png)

|  |
|  |
|  |
