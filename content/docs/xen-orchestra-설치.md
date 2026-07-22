+++
title = "Xen Orchestra 설치"
date = 2025-01-11T09:39:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "178aac4e-32a5-809d-a1d6-ea7dd9249a95"
notion_url = "https://app.notion.com/p/Xen-Orchestra-178aac4e32a5809da1d6ea7dd9249a95"
external_url = "https://docs.xen-orchestra.com/"
+++

XCP-ng/XenServer 웹 관리. Community Edition 일부 기능 제한.

문서: [https://docs.xen-orchestra.com/](https://docs.xen-orchestra.com/) · 자동 배포: [https://vates.tech/deploy/](https://vates.tech/deploy/)

## 자동 설치 (권장)

1. [vates.tech/deploy](https://vates.tech/deploy/)에서 호스트 IP·계정 입력
1. 저장소·네트워크·관리자/SSH 계정 설정 후 Deploy
1. 설치 후 **xcp-ng reboot 테스트 필수**

## 수동 설치 (호스트 스크립트)

```bash
curl https://raw.githubusercontent.com/Jarli01/xenorchestra_installer/master/xo_install.sh | sudo bash
```

1. 출력 IP로 접속 → Quick Deploy
1. Host Username=`root` / Host Password=호스트 root 비번
1. 스토리지·네트워크(DHCP면 비움) → 로컬 계정(기본 `admin@admin.net`/`admin`)·SSH 계정
1. Deploy 후 HTTPS로 로그인 (자체서명 경고 가능)

## ISO Storage

- **Local**: New → Storage → pool 선택 → Import → Disk에서 ISO 업로드/URL
- **SMB ISO**: storage type=`SMB ISO`, 서버 경로·계정 입력

## VM

New → VM → vCPU/RAM/Topology(보통 1 socket N cores) → ISO Storage의 ISO 선택 → Console로 설치
