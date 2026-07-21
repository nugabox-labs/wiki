+++
title = "Form-Ajax 전송 처리"
date = 2019-09-26T09:13:00Z
updated = 2026-07-21T02:37:00Z
categories = ["FRONT-END"]
tags = ["JS"]
toc = true

[extra]
source = "notion"
notion_id = "851c71fb-ee8b-4eb9-8f7b-2c6f94557e34"
notion_url = "https://app.notion.com/p/Form-Ajax-851c71fbee8b4eb98f7b2c6f94557e34"
+++

## Form → PHP (동기)

```html
<form method="post" action="result.php" onsubmit="return gameStart(this)">
```

- `onsubmit`에서 true/false 반환 → true면 action 진행, false면 중단
- `result.php`에서 `$_POST['input의 name']`으로 값 받음

## 버튼 클릭 → JS 함수

```html
<button value="값" onclick="insertBtn(this.value)">
```

## jQuery Ajax (비동기)

```javascript
var data = {"gseq": gseq, "status": 'c', "pinstatus": pinstatus};

$.ajax({
  url: "result.php",
  type: 'POST',
  data: data,
  dataType: "json",       // text/xml/json/jsonp
  timeout: 5000,
  cache: false,
  success: function(data) {
    document.location.reload(true);   // 캐시 해제 후 리로드
  },
  error: function(jqXHR, textStatus, errorThrown) {
    // jqXHR.status: HTTP 상태코드(500,404 등)
    // jqXHR.responseText: 응답 full text (디버깅에 유용)
    alert("에러: " + textStatus + " : " + errorThrown);
  }
});
```

## 동기 vs 비동기

- 동기: 요청 처리 중 사용자는 다른 동작 불가 (예: 로그인 화면)
- 비동기(Ajax): 서버 처리와 별개로 클라이언트는 계속 동작 가능
