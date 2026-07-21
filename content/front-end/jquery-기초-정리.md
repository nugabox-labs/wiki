+++
title = "jQuery 기초 정리"
date = 2019-09-26T07:18:00Z
updated = 2026-07-21T02:37:00Z
categories = ["FRONT-END"]
tags = ["JS"]
toc = true

[extra]
source = "notion"
notion_id = "21099b8d-f0b7-47d6-89ab-adfcf81ad344"
notion_url = "https://app.notion.com/p/jQuery-21099b8df0b747d689abadfcf81ad344"
external_url = "http://tcpschool.com/jquery/intro"
+++

## 로드

```html
<script src="/media/jquery-1.12.4.min.js"></script>
<!-- 또는 CDN -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery/1.12.4/jquery.min.js"></script>
```

## 시작

```javascript
$(document).ready(function() { });
```

- `$(document).ready` : DOM 로드 후 / `$(window).load` : 이미지 등 모든 리소스 로드 후(더 늦음)

## 선택자

```javascript
$("p")                    // 태그
$("#jq")                  // id
$(".jqr")                 // class
$("img[alt='flower']")    // 속성
```

## 메소드 체이닝

```javascript
$("button").on("click", function() {
  $("#list").find("li").eq(1).html("두 번째 아이템 선택")
    .end()                    // 이전 선택 집합(li 전체)으로 복귀
    .eq(2).html("세 번째 아이템 선택");
});
```

## 요소 추가 위치

```javascript
.append() / .prepend()       // 선택 요소의 끝/처음에 추가
.appendTo() / .prependTo()   // 선택 요소를 대상 끝/처음에 추가(소스·타겟 반대)
.before() / .after()         // 선택 요소 앞/뒤에 추가
.insertBefore() / .insertAfter()  // 선택 요소를 대상 앞/뒤에 추가(소스·타겟 반대)
```

## css()

```javascript
$("p").css("fontSize", "25px");        // 카멜케이스: jQuery/JS 모두 가능
$("p").css("font-size", "25px");       // 하이픈: jQuery 전용
$("#text").html($("p").css("fontSize"));
```

## 이벤트: on / one

```javascript
$("button").on("mouseenter mouseleave", function() { });   // 한 핸들러에 여러 이벤트

$("button").on({
  mouseenter: function() { $("#text").append("진입"); },
  click: function() { $("#text").append("클릭"); },
  mouseleave: function() { $("#text").append("이탈"); }
});

$("button").one("click", function() {   // 최초 1회만 실행
  $("#text").append("첫 클릭");
});
```

원문: [http://tcpschool.com/jquery/intro](http://tcpschool.com/jquery/intro)
