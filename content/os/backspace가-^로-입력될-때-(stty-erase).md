+++
title = "Backspace가 ^?로 입력될 때 (stty erase)"
date = 2021-02-18T18:05:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "b1fef8c0-25f9-49f8-a5b5-cbe3356df230"
notion_url = "https://app.notion.com/p/Backspace-stty-erase-b1fef8c025f949f8a5b5cbe3356df230"
external_url = "https://keefojifo.tistory.com/31"
+++

## 임시

```bash
stty erase ^?
```

## 영구

```bash
# 전체 사용자
echo 'stty erase ^?' >> /etc/profile

# 특정 사용자
echo 'stty erase ^?' >> ~/.bashrc   # 또는 ~/.profile
source ~/.bashrc
```

| stty | 기본 | 의미 |
| --- | --- | --- |
| erase | `^?` | 한 글자 삭제 (Delete/`^H`=Backspace) |
| kill | `^u` | 행 전체 삭제 |
| intr | `^c` | 프로세스 종료 |
| eof | `^d` | EOF |
| susp | `^z` | suspend |
