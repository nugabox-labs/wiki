+++
title = "Python logging 모듈"
date = 2022-09-17T10:08:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END", "TECH"]
tags = ["PYTHON", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "9108f8d1-8e91-4030-bd25-c14fd577ad5a"
notion_url = "https://app.notion.com/p/Python-logging-9108f8d18e914030bd25c14fd577ad5a"
external_url = "https://hwangheek.github.io/2019/python-logging/"
+++

레벨: DEBUG < INFO < WARNING < ERROR < CRITICAL (기본 root=WARNING).

### basicConfig

```python
import logging
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(name)s: %(message)s",
    datefmt="%Y-%m-%d %H:%M:%S",
    filename="dummy.log",  # 생략 시 콘솔
)
logging.info("hello")
logging.warning("warn")
```

### Logger + Handler

```python
import logging

logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)
fmt = logging.Formatter("%(asctime)s [%(levelname)s] %(name)s: %(message)s")

sh = logging.StreamHandler(); sh.setLevel(logging.INFO); sh.setFormatter(fmt)
fh = logging.FileHandler("debug.log"); fh.setLevel(logging.DEBUG); fh.setFormatter(fmt)
eh = logging.FileHandler("error.log"); eh.setLevel(logging.ERROR); eh.setFormatter(fmt)
logger.addHandler(sh); logger.addHandler(fh); logger.addHandler(eh)

try:
    1 / 0
except Exception:
    logger.exception("failed")
```

### dictConfig

```python
import json, logging.config
with open("logger.json") as f:
    logging.config.dictConfig(json.load(f))  # disable_existing_loggers: false
```

참고: [logging HOWTO](https://docs.python.org/3/howto/logging.html) · [Cookbook](https://docs.python.org/3/howto/logging-cookbook.html)

![image](/notion-assets/9108f8d1-8e91-4030-bd25-c14fd577ad5a/2.jpeg)

|  |
|  |
|  |
|  |
|  |
|  |
|  |
|  |

|  |
|  |
|  |
|  |
|  |
|  |
|  |
|  |

|  |
|  |
|  |

|  |
|  |
|  |

|  |
|  |
|  |

|  |
|  |
|  |

|  |
|  |
|  |

![image](/notion-assets/9108f8d1-8e91-4030-bd25-c14fd577ad5a/3.png)

|  |
|  |
|  |

|  |
|  |
|  |

|  |
|  |
|  |

|  |
|  |
|  |

|  |
|  |
|  |

|  |
|  |
|  |

|  |
|  |
|  |

![image](/notion-assets/9108f8d1-8e91-4030-bd25-c14fd577ad5a/3.png)
