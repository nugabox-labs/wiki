+++
title = "Python 밑줄(_) 의미"
date = 2022-05-03T01:35:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END", "TECH"]
tags = ["PYTHON", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "3f87a37a-698c-41e3-a597-bec797e7fef1"
notion_url = "https://app.notion.com/p/Python-_-3f87a37a698c41e3a597bec797e7fef1"
external_url = "https://velog.io/@keywookim/%ED%8C%8C%EC%9D%B4%EC%8D%AC%EC%97%90%EC%84%9C-%EC%93%B0%EC%9D%B4%EB%8A%94-%EB%B0%91%EC%A4%84%EC%9D%98-%EC%9D%98%EB%AF%B8"
+++

## Python 밑줄(`_`) 의미

### Single `_`

| 용도 | 예 |
| --- | --- |
| snake\_case 네이밍 | `def get_user_name():` |
| 무시 변수 | `for _ in range(5):` |
| “내부용” 관례 | `_private_method` (`from m import *`에서 제외) |
| 숫자 구분자 (3.6+) | `1_000_000` |

```python
class T:
    _internal = 1
    def _helper(self): ...
```

### Double `__` (맹글링)

```python
class X:
    def __m(self): ...   # → _X__m
class Y:
    def __m(self): ...   # → _Y__m
```

상속 시 이름 충돌 완화.

### Magic / dunder

```python
class A:
    def __init__(self): ...
    def __call__(self): ...
    def __len__(self): ...

a = A()
a()          # __call__
len(a)       # __len__
```
