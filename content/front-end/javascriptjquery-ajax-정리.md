+++
title = "JavaScript/jQuery Ajax 정리"
date = 2019-10-28T11:33:00Z
updated = 2026-07-21T02:37:00Z
categories = ["FRONT-END"]
tags = ["JS"]
toc = true

[extra]
source = "notion"
notion_id = "36afe302-a1dd-404e-89c0-4af254a4f5e8"
notion_url = "https://app.notion.com/p/JavaScript-jQuery-Ajax-36afe302a1dd404e89c04af254a4f5e8"
external_url = "http://www.nextree.co.kr/p9521/"
+++

## Ajax 개요

- Asynchronous JavaScript And XML — 화면 갱신 없이 서버와 데이터 주고받는 구현 방식
- 동기: 응답 올 때까지 대기 / 비동기(Ajax): 응답 기다리는 동안 다른 작업 가능

## 데이터 형식

- CSV: 콤마 구분, 용량 작음, 가독성 낮음
- XML: 태그 구조, 가독성 좋음, 용량 큼
- JSON: JS 객체 형태, 현재 가장 많이 사용

## HTTP 메소드

- GET: 조회(URL에 데이터 노출, 보안 취약) / POST: 생성·수정·삭제(로그인 등 민감정보에 사용) / PUT / DELETE / HEAD

## 순수 JavaScript XHR

```javascript
var xmlhttp;
if (window.XMLHttpRequest) {
  xmlhttp = new XMLHttpRequest();
} else {
  xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");  // IE7 이하
}
xmlhttp.onreadystatechange = function() {
  if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
    // 통신 성공
  }
};
xmlhttp.open("GET", "exam.xml", true);
xmlhttp.send();

JSON.parse(xmlhttp.responseText);              // JSON 파싱
eval("(" + xmlhttp.responseText + ")");        // IE 구버전용
```

- `readyState`: 0 미초기화 / 1 open됨 / 2 송신완료 / 3 수신중 / 4 수신완료
- `status`: 0 로컬 / 200 성공 / 403 거부 / 404 없음 / 500 서버오류

## jQuery Ajax 함수들

**load** — 지정 요소에 페이지/일부를 동적으로 채움

```javascript
$(selector).load(URL, DATA, CALLBACK);
$('#dictionary').load("load.html");
$(selector).load('exam.html img');   // 특정 태그만 가져오기
```

**ajax** — 옵션 기반 범용 함수

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
```

옵션: `url`(필수), `data`, `type`, `dataType`, `success(data)`, `error`, `complete`, `beforeSend`, `async`

**get / post** — ajax 약식

```javascript
$.get(URL, DATA, CALLBACK);
$.post(URL, DATA, CALLBACK);
```

**getJSON** — JSON 전용 GET 약식

```javascript
$.getJSON(URL, DATA, CALLBACK);
$.getJSON('json.json', function(data) {
  $.each(data, function(index, entry) {
    $('#dictionary').append('<div>' + entry.term + '</div>');
  });
});
```

**getScript** — 외부 JS 파일 로드

```javascript
$.getScript(URL);
```

## 참고

- 윤인성, 『모던 웹을 위한 JavaScript jQuery 입문』, 한빛미디어
- [http://www.nextree.co.kr/p9521/](http://www.nextree.co.kr/p9521/), [http://www.nextree.co.kr/p4771/](http://www.nextree.co.kr/p4771/)
