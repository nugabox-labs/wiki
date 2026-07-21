+++
title = "jQuery 선택자·이벤트"
date = 2019-09-26T07:18:00Z
updated = 2026-07-21T06:47:00Z
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
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
```

## 시작

```javascript
$(document).ready(function() { });
```

- `$(document).ready`: DOM 로드 후
- `$(window).load`: 이미지 등 전체 리소스 로드 후

## 선택자

```javascript
$("p")                  // 태그
$("#jq")                // id
$(".jqr")               // class
$("img[alt='flower']")  // 속성
```

## 체이닝

```javascript
$("button").on("click", function() {
  $("#list").find("li").eq(1).html("두 번째")
    .end()
    .eq(2).html("세 번째");
});
```

## 요소 추가

```javascript
.append() / .prepend()           // 선택 요소 안쪽 끝/처음
.appendTo() / .prependTo()       // 소스·타겟 반대
.before() / .after()
.insertBefore() / .insertAfter()
```

## css()

```javascript
$("p").css("fontSize", "25px");   // 카멜케이스
$("p").css("font-size", "25px");  // 하이픈(jQuery)
```

## 이벤트

```javascript
$("button").on("mouseenter mouseleave", function() { });

$("button").on({
  mouseenter: function() { $("#text").append("진입"); },
  click: function() { $("#text").append("클릭"); },
  mouseleave: function() { $("#text").append("이탈"); }
});

$("button").one("click", function() {  // 1회만
  $("#text").append("첫 클릭");
});
```
