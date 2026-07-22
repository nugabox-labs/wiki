+++
title = "Linux useradd"
date = 2021-05-10T02:48:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "DEV-OPS", "TECH"]
tags = ["LINUX", "BASH", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "cc85275d-8d19-47ca-8b51-17238300c275"
notion_url = "https://app.notion.com/p/Linux-useradd-cc85275d8d1947ca8b5117238300c275"
external_url = "https://webdir.tistory.com/128"
+++

> 원본 스크린샷뿐 → 표준 명령으로 재구성.

관련: `/etc/passwd` `/etc/shadow` `/etc/group` `/etc/skel`

## useradd

```bash
useradd <user>
useradd -m -s /bin/bash <user>               # 홈·셸
useradd -u 1001 -g groupname <user>          # UID/GID
useradd -u 1100 -g users -c "comment" -d /home/user01 -s /bin/bash user01
useradd -G extra1,extra2 <user>              # 부가 그룹

passwd <user>
# skel 복사(프롬프트 bash-4.2$ 방지)
cp -a /etc/skel/. /home/<user>/
chown -R <user>:<user> /home/<user>

usermod -l <newname> <oldname>               # 이름 변경
usermod -L <user>                            # 잠금 / -U 해제
userdel <user>
userdel -r <user>                            # 홈까지 삭제

chage -l <user>
chage -M 90 -W 7 <user>
```
