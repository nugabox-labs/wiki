+++
title = "input FileList 동적 변경 (DataTransfer)"
date = 2023-01-26T19:24:00Z
updated = 2026-07-21T06:47:00Z
categories = ["FRONT-END", "TECH"]
tags = ["JS", "HTML", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "f37500a2-0b5e-4fff-a7b2-447daa345db2"
notion_url = "https://app.notion.com/p/input-FileList-DataTransfer-f37500a20b5e4fffa7b2447daa345db2"
external_url = "https://coco-log.tistory.com/161"
+++

## input\[type=file\] FileList 동적 변경

`HTMLInputElement.files`는 읽기 전용처럼 직접 대입 불가.

→ **`DataTransfer`**로 새 FileList 구성 후 할당.

```javascript
const input = document.querySelector('#file-input');
const dt = new DataTransfer();

Array.from(input.files)
  .filter(file => String(file.lastModified) !== removeTargetId)
  .forEach(file => dt.items.add(file));

input.files = dt.files;  // dt.files 사용 (items 아님)
```

```html
<input type="file" id="file-input" multiple />
```

미리보기에서 개별 삭제 시: DOM 제거 + 위 필터로 input.files 동기화.
