+++
title = "GitHub Actions Step 실패 제어"
date = 2024-02-22T01:13:00Z
updated = 2026-07-21T06:47:00Z
categories = ["TECH"]
tags = ["GIT"]
toc = true

[extra]
source = "notion"
notion_id = "0d5ffa99-b4a2-472f-9ddf-b5d122c5ef52"
notion_url = "https://app.notion.com/p/GitHub-Actions-Step-0d5ffa99b4a2472f9ddfb5d122c5ef52"
external_url = "https://kotlinworld.com/403"
+++

## Step 실패 후에도 후속 Step 실행

### `continue-on-error` (실패를 성공으로 취급 → 이후 전부 진행)

```yaml
- name: Test with Gradle
  continue-on-error: true
  run: ./gradlew :app:testDebug
```

### `if: failure()` (실패 시에만 실행 — 리포트 업로드 등)

```yaml
- name: Upload Test
  if: failure()
  uses: actions/upload-artifact@v3
  with:
    name: test-report
    path: app/build/reports/tests/testDebugUnitTest/index.html
```

- 기본 동작: 이전 Step 실패 시 이후는 skip (`if: success()` 암시)
- 문서: [https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions#jobsjob\_idstepscontinue-on-error](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions#jobsjob_idstepscontinue-on-error)
