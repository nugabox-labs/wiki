+++
title = "CentOS 백스페이스 ^? 해결"
date = 2023-08-31T09:22:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "DEV-OPS", "TECH"]
tags = ["LINUX", "BASH", "ISSUE", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "81769cdc-d91f-4b9f-8d11-0556550e42a7"
notion_url = "https://app.notion.com/p/CentOS-81769cdcd91f4b9f8d110556550e42a7"
external_url = "https://keefojifo.tistory.com/31"
+++

## CentOS 백스페이스가 `^?`로 입력될 때

### 임시

```bash
stty erase ^?
```

### 영구 (전체 사용자)

```bash
echo "stty erase ^?" >> /etc/profile
```

### 영구 (특정 사용자)

```bash
echo "stty erase ^?" >> $HOME/.profile
source ~/.bash_profile
```

`stty erase` = 한 문자 삭제 키. Backspace≈`^H`, Delete≈`^?`.
