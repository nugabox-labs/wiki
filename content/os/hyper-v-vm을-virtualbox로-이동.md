+++
title = "Hyper-V VM을 VirtualBox로 이동"
date = 2024-06-03T08:24:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "DEV-OPS", "TECH"]
tags = ["WINDOWS", "TIP", "BASH"]
toc = true

[extra]
source = "notion"
notion_id = "3ce42694-b49c-4188-ad47-0e364f9f8e21"
notion_url = "https://app.notion.com/p/Hyper-V-VM-VirtualBox-3ce42694b49c4188ad470e364f9f8e21"
external_url = "https://blog.djjproject.com/184"
+++

## vhdx → vhd 변환 (PowerShell, Hyper-V 필요)

```powershell
Convert-VHD -Path C:\ubuntu.vhdx -DestinationPath C:\ubuntu.vhd
```

변환된 `.vhd`를 VirtualBox 디스크에 추가.

## 물리 디스크 raw VMDK

```bash
# Windows: VirtualBox 설치 경로에서 실행
VBoxManage internalcommands createrawvmdk -filename "C:\path\disk1.vmdk" -rawdisk \\.\PhysicalDrive1
```

- 디스크는 오프라인 상태여야 함 (디스크 관리에서 번호 확인).
- Linux: `-rawdisk /dev/sda` 형태.

## 부팅 시 VM 자동 시작/종료

[vboxvmservice](http://vboxvmservice.sourceforge.net/) 설치 후 `VBoxVmService.ini`:

- `VmName` = VirtualBox 관리자 VM 이름과 동일
- `ShutdownMethod` = `savestate` 또는 `acpipowerbutton`
