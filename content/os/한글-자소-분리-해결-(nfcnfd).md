+++
title = "한글 자소 분리 해결 (NFC/NFD)"
date = 2022-01-05T00:55:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "FRONT-END", "TECH"]
tags = ["JS", "TIP", "MACOS", "WINDOWS"]
toc = true

[extra]
source = "notion"
notion_id = "50f180e0-1f15-4a4a-ab1f-5aa898f5944c"
notion_url = "https://app.notion.com/p/NFC-NFD-50f180e01f154a4aab1f5aa898f5944c"
external_url = "https://egg-programmer.tistory.com/293"
+++

## 한글 자소 분리 (ㅎㅏㄴㄱㅡㄹ → 한글)

원인: OS별 유니코드 정규화 차이

- **macOS**: NFD (자모 분해 저장)
- **Windows / 일반 HTML**: NFC (완성형 결합)

|  | NFD | NFC |
| --- | --- | --- |
| 저장 | `한` → `ㅎ+ㅏ+ㄴ` | `한` → `한` |
| 용량 | 큼 | 작음 |

### 해결 (JS)

```javascript
fileName.normalize('NFC');   // 다운로드/표시 파일명
// 또는
str.normalize('NFD');        // 분해가 필요할 때
```

```bash
# Python
unicodedata.normalize('NFC', s)
```

Mac에서 만든 파일명을 Windows로 넘길 때 NFC 정규화하면 자소 분리 방지.
