+++
title = "jQuery Select Option 선택값 가져오기"
date = "2019-10-24T19:34:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["FRONT-END"]
tags = ["JS"]
toc = true

[extra]
source = "notion"
notion_id = "f287c884-7770-4d70-8320-9ef5edb7889b"
notion_url = "https://app.notion.com/p/jQuery-Select-Option-f287c88477704d7083209ef5edb7889b"
external_url = "https://oingbong.tistory.com/175"
+++

## select box (jQuery)

```javascript
$("#셀렉트박스ID option:selected").val();          // ID로 선택값 읽기
$("select[name=셀렉트박스name]").val();            // name으로 선택값 읽기
$("span[name=셀렉트박스name]").text();             // 다른 태그도 동일 방식

var index = $("#셀렉트박스ID option").index($("#셀렉트박스ID option:selected"));  // 선택된 index

$("#셀렉트박스ID").append("<option value='1'>1번</option>");   // option 추가(끝)
$("#셀렉트박스ID").prepend("<option value='0'>0번</option>");  // option 추가(앞)
$("#셀렉트박스ID").html("<option value='1'>1차</option><option value='2'>2차</option>"); // 전체 교체

$("#셀렉트박스ID option:eq(1)").replaceWith("<option value='1'>1차</option>"); // index로 개별 교체
$("#셀렉트ID option:eq(1)").attr("selected", "selected");  // index로 선택 지정
$("#셀렉트ID").val("1번").attr("selected", "selected");    // text 값으로 선택 지정
```

원문: [https://oingbong.tistory.com/175](https://oingbong.tistory.com/175)
