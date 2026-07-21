+++
title = "macOS MS Office 업데이트 끄기"
date = 2026-03-19T07:25:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "TECH"]
tags = ["MACOS", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "bc8d419e-4fbd-4606-8d2f-8720b300abdb"
notion_url = "https://app.notion.com/p/macOS-MS-Office-bc8d419e4fbd46068d2f8720b300abdb"
external_url = "https://yespickbible.tistory.com/entry/macOS-MS-Office-%EC%97%85%EB%8D%B0%EC%9D%B4%ED%8A%B8-%EB%81%84%EB%8A%94-%EB%B2%95"
+++

## Microsoft AutoUpdate 삭제

```bash
# Finder: Cmd+Shift+G
/Library/Application Support/Microsoft/
# MAU 또는 MAU2.0 → Microsoft AutoUpdate.app 삭제
```

## LaunchAgent / Daemon / Helper 제거

```bash
# Cmd+Shift+G
/Library/LaunchAgents/com.microsoft.update.agent.plist
/Library/LaunchDaemons/com.microsoft.autoupdate.helper.plist
/Library/PrivilegedHelperTools/com.microsoft.autoupdate.helper
```
