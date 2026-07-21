+++
title = "macOS 초기 설정"
date = 2021-01-21T15:59:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["MACOS"]
toc = true

[extra]
source = "notion"
notion_id = "5b1cc5e5-5b46-4245-b992-55d8b380def4"
notion_url = "https://app.notion.com/p/macOS-5b1cc5e55b464245b99255d8b380def4"
+++

> Sonoma 기준 메모. 앱 목록은 필요에 맞게 가감.

## 시스템

- iCloud, 트랙패드 세 손가락 드래그, 키보드 단축키, 사운드 피드백
- Apple Silicon Rosetta:

```bash
/usr/sbin/softwareupdate --install-rosetta --agree-to-license
```

## 필수 단축키

| 동작 | 키 |
| --- | --- |
| Spotlight | ⌘Space |
| 복사/붙여넣기/되돌리기/저장 | ⌘C / ⌘V / ⌘Z / ⌘S |
| 앱 종료 / 창 닫기 | ⌘Q / ⌘W |
| 강제 종료 / 잠금 | ⌘⌥Esc / ⌃⌘Q |
| 스크린샷 | ⌘⇧3·4 |

## 앱·패키지

nugaBox:

```bash
bash <(curl -s https://raw.githubusercontent.com/nugaBox/essential/main/mac/essential.sh)
```

- Homebrew: macOS Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

- 브라우저·에디터: Chrome / VS Code / Notion / Rectangle / AppCleaner / Raycast 등 (`brew install --cask ...`)
- Windows VM: Boot Camp(Intel) 또는 VMware Fusion / VirtualBox (정품)

## 개발 도구

- IDE: VS Code, Xcode, DBeaver, MySQL Workbench
- SSH/SFTP: Termius, FileZilla

## 기타

- SIP 상태: `csrutil status` (변경은 복구 모드에서만)
- Ventura+ 구형 SSH: macOS Ventura SSH ssh-rsa 호스트키 오류
- 텍스트편집기 빈 문서:

```bash
defaults write -g NSShowAppCentricOpenPanelInsteadOfUntitledFile -bool false
```
