+++
title = "VMware Fusion 백그라운드 실행"
date = "2024-09-13T01:42:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["OS"]
tags = ["MACOS"]
toc = true

[extra]
source = "notion"
notion_id = "4f861347-4aad-4ede-9f8f-c0e2ea8e1e90"
notion_url = "https://app.notion.com/p/VMware-Fusion-4f8613474aad4ede9f8fc0e2ea8e1e90"
+++

## VMware Fusion을 터미널 alias로 백그라운드(nogui) 실행

`~/.zshrc`에 추가 후 `source ~/.zshrc`:

**Fusion 12 이전**

```bash
alias vmrun='/Applications/VMware\ Fusion.app/Contents/Library/vmrun'
alias vmsee="vmrun list"
alias vm="vmrun start Virtual\ Machines.localized/Windows\ 11\ 64-bit\ Arm.vmwarevm nogui"
alias vmbye="vmrun suspend Virtual\ Machines.localized/Windows\ 11\ 64-bit\ Arm.vmwarevm"
```

**Fusion 13 이후** (VM 암호 입력 필수, `-vp` 옵션으로 전달)

```bash
VMPASS="본인암호"
alias vmrun='/Applications/VMware\ Fusion.app/Contents/Library/vmrun'
alias vmsee="vmrun list"
alias vm="vmrun -vp $VMPASS start Virtual\ Machines.localized/Windows\ 11\ 64-bit\ Arm.vmwarevm nogui"
alias vmbye="vmrun -vp $VMPASS suspend Virtual\ Machines.localized/Windows\ 11\ 64-bit\ Arm.vmwarevm"
```
