+++
title = "JavaScript·jQuery Ajax"
date = 2019-10-28T11:33:00Z
updated = 2026-07-21T06:47:00Z
categories = ["FRONT-END"]
tags = ["JS"]
toc = true

[extra]
source = "notion"
notion_id = "36afe302-a1dd-404e-89c0-4af254a4f5e8"
notion_url = "https://app.notion.com/p/JavaScript-jQuery-Ajax-36afe302a1dd404e89c04af254a4f5e8"
external_url = "http://www.nextree.co.kr/p9521/"
+++

## 개요

비동기 HTTP로 화면 전체 갱신 없이 서버와 데이터 교환.

## 데이터 형식

- CSV: 용량 작음, 가독성 낮음
- XML: 태그 구조, 용량 큼
- JSON: JS 객체 형태(현재 주류)

## HTTP 메소드

GET(조회) / POST(생성·수정) / PUT / DELETE / HEAD

## XHR

```javascript
var xhr = window.XMLHttpRequest
  ? new XMLHttpRequest()
  : new ActiveXObject("Microsoft.XMLHTTP"); // IE7 이하

xhr.onreadystatechange = function() {
  if (xhr.readyState == 4 && xhr.status == 200) {
    // 성공
  }
};
xhr.open("GET", "exam.xml", true);
xhr.send();

JSON.parse(xhr.responseText);
```

- `readyState`: 0~4 (4=완료)
- `status`: 200 성공 / 403 / 404 / 500

## jQuery

```javascript
$(selector).load(URL, DATA, CALLBACK);
$('#dictionary').load("load.html");
$(selector).load('exam.html img'); // 특정 태그만
```

```javascript
$.ajax({
  url: 'ajax.xml', type: 'GET', dataType: 'xml',
  success: function(data) {
    $('#dictionary').empty();
    $.each($(data).find('entry'), function() {
      var $entry = $(this);
      $('#dictionary').append('<div>' + $entry.attr('term') + '</div>');
    });
  }
});
// 옵션: url, data, type, dataType, success, error, complete, beforeSend, async
```

```javascript
$.get(URL, DATA, CALLBACK);
$.post(URL, DATA, CALLBACK);
$.getJSON(URL, DATA, CALLBACK);
$.getScript(URL);
```
