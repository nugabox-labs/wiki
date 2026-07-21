+++
title = "macOS Bluetooth 재설정 (M1)"
date = 2022-05-26T05:20:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "TECH"]
tags = ["MACOS", "ISSUE", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "5afaf340-829b-4fba-b07d-7bacece4b7db"
notion_url = "https://app.notion.com/p/macOS-Bluetooth-M1-5afaf340829b4fbab07d7bacece4b7db"
external_url = "https://discussionskorea.apple.com/thread/253554220"
+++

## 참고

macOS Monterey+ 는 메뉴의 Bluetooth **재설정/디버그** 불가.

## plist 삭제 후 재시동

```bash
# Finder → 이동 → 폴더로 이동 (⇧⌘G)
# /Library/Preferences/com.apple.Bluetooth.plist

sudo rm /Library/Preferences/com.apple.Bluetooth.plist
# 재시동 후 장치 다시 페어링
```

그래도 안 되면 SMC/PRAM 리셋, 다른 기기에서 해당 장치 페어링 해제 후 재시도.
