+++
title = "PhpStorm FTP/SFTP Deployment"
date = 2019-04-08T05:33:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END"]
tags = ["PHP"]
toc = true

[extra]
source = "notion"
notion_id = "a2377e27-5ef0-4859-83fc-c50126b367b5"
notion_url = "https://app.notion.com/p/PhpStorm-FTP-SFTP-Deployment-a2377e275ef0485983fcc50126b367b5"
external_url = "https://gomcine.tistory.com/entry/phpStorm-원격-서버-연결-및-배포-Deployment"
+++

## PhpStorm Deployment (FTP/SFTP)

1. Tools → Deployment → Configuration → `+` → FTP/SFTP 정보 입력 → Test Connection
1. Mappings: Local path ↔ Deployment path
1. Remote Host에서 Download from here
1. Tools → Deployment → Options
   - Upload: `On explicit save action` (Ctrl+S 시 업로드)
   - timestamp 오류 시 `Preserve files timestamps` 해제
1. Remote Host 안 보이면 Deployment → Browse Remote Host
