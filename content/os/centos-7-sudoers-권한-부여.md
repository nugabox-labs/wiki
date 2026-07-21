+++
title = "CentOS 7 sudoers 권한 부여"
date = 2022-11-05T08:51:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "DEV-OPS"]
tags = ["LINUX", "BASH"]
toc = true

[extra]
source = "notion"
notion_id = "29cd2703-28fd-4a6e-9f88-8ff9630a4bdc"
notion_url = "https://app.notion.com/p/CentOS-7-sudoers-29cd270328fd4a6e9f888ff9630a4bdc"
external_url = "https://yoon1seok.tistory.com/45"
+++

## CentOS 7 sudoers

권장: `visudo`로 편집 (문법 검사).

```bash
visudo
# 또는
visudo -f /etc/sudoers.d/<user>
```

```
root     ALL=(ALL)    ALL
<user>   ALL=(ALL)    ALL
```

직접 `/etc/sudoers`를 `chmod +w`로 여는 방식은 비권장(오타 시 sudo 잠김).
