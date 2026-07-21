+++
title = "Python datetime 날짜 연산·포맷"
date = 2022-04-10T08:54:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END"]
tags = ["PYTHON"]
toc = true

[extra]
source = "notion"
notion_id = "298d66af-f588-4d35-bf4a-449db499cd8d"
notion_url = "https://app.notion.com/p/Python-datetime-298d66aff5884d35bf4a449db499cd8d"
external_url = "https://reakwon.tistory.com/172"
+++

## datetime

```python
import datetime

d = datetime.datetime.now()
print(d)
print(d.year, d.month, d.day)
print(d.hour, d.minute, d.second)

wuhan_covid19 = datetime.datetime(2019, 12, 12)
wuhan_covid19 = datetime.datetime(2019, 12, 12, 3, 3, 3)

now = datetime.datetime.now()
print(now.strftime("%Y/%m(%B)/%d %A %p %I:%m:%S, 일년 중 %U 번째주, 일년 중 %j번째 날"))
print(now.strftime("%c"))
print(now.strftime("%x"))
print(now.strftime("%X"))

birthday = datetime.datetime(1988, 12, 11)
elapsed = now - birthday  # timedelta
print(elapsed)
```

### Format Code
