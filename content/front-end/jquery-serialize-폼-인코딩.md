+++
title = "jQuery serialize 폼 인코딩"
date = 2021-12-15T15:05:00Z
updated = 2026-07-21T06:47:00Z
categories = ["FRONT-END"]
tags = ["JS"]
toc = true

[extra]
source = "notion"
notion_id = "265443fb-c8de-47a0-81ee-7106ff26ec02"
notion_url = "https://app.notion.com/p/jQuery-serialize-265443fbc8de47a081ee7106ff26ec02"
external_url = "https://velog.io/@wjdgusans1/serialize-%ED%8F%BC-%EC%9A%94%EC%86%8C-%EC%A7%91%ED%95%A9%EC%9D%84-%EC%9D%B8%EC%BD%94%EB%94%A9"
+++

```javascript
let formStr = $("form[name=mypage_form]").serialize();
// => name=홍길동&phone=...&id=...

let formArr = $("form[name=mypage_form]").serializeArray();
let formData = new FormData();
formArr.forEach(function (data) {
  formData.append(data.name, data.value);
});
if ($('input[name=file]')[0].files[0]) {
  formData.append('file', $('input[name=file]')[0].files[0]);
}
formData.append("flag", "member_modify");
```

- `type=file`은 serialize에 미포함 → FormData로 별도 append
