+++
title = "JS 한글 받침 구별"
date = 2024-01-09T01:56:00Z
updated = 2026-07-21T06:47:00Z
categories = ["FRONT-END", "TECH"]
tags = ["JS", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "f7c4d4a4-4c02-47ce-8997-96086dc138ea"
notion_url = "https://app.notion.com/p/JS-f7c4d4a44c0247ce899796086dc138ea"
external_url = "https://m.blog.naver.com/PostView.nhn?isHttpsRedirect=true&blogId=azure0777&logNo=221414175631"
+++

## 한글 받침 여부

유니코드 한글 음절(가~힣) 순서로 받침 판별.

```javascript
function checkBatchimEnding(word) {
  if (typeof word !== 'string') return null;
  var lastLetter = word[word.length - 1];
  var uni = lastLetter.charCodeAt(0);
  if (uni < 44032 || uni > 55203) return null; // 가~힣
  return (uni - 44032) % 28 !== 0; // true=받침 있음
}
```

- 마지막 글자가 한글 음절 + 받침 → `true`
- 받침 없음 → `false`
- string 아님 / 한글 음절 아님 → `null`

조사 선택 예: `이/가`, `을/를`
