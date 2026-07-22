+++
title = "VS Code SVN (macOS)"
date = 2023-03-11T13:49:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "TECH"]
tags = ["SVN", "MACOS", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "e7ddef9c-e512-4612-9c00-3601e1ffc775"
notion_url = "https://app.notion.com/p/VS-Code-SVN-macOS-e7ddef9ce51246129c003601e1ffc775"
+++

```bash
brew install subversion
```

1. Extension: SVN (`johnstoncode.svn-scm`) 설치
1. `product.json`에 proposed API 허용
   경로: `/Applications/Visual Studio Code.app/Contents/Resources/app/product.json`

   `extensionAllowedProposedApi` 배열 끝에 `"johnstoncode.svn-scm"` 추가 → VS Code 재시작
1. F1 → `svn:checkout` → SVN URL → 로컬 폴더 → checkout 경로(`/` 가능) → 인증
1. Add Workspace → 좌하단 SVN 창 확인
