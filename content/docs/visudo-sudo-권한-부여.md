+++
title = "visudo sudo 권한 부여"
date = 2022-05-15T16:28:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "2f8a1db8-e857-430d-b768-6464cc59cf46"
notion_url = "https://app.notion.com/p/visudo-sudo-2f8a1db8e857430db7686464cc59cf46"
external_url = "https://projooni.tistory.com/entry/리눅스ubuntu에서-sudoers-수정해서-sudo-권한-부여하기"
+++

```bash
sudo visudo   # 직접 vi /etc/sudoers 보다 권장

# 사용자에게 전체 sudo (비밀번호 묻기)
username ALL=(ALL:ALL) ALL

# 비밀번호 없이
username ALL=(ALL:ALL) NOPASSWD:ALL
```

CentOS/RHEL은 `wheel` 그룹 + `/etc/pam.d/su`의 `pam_wheel`도 자주 사용.
