+++
title = "jQuery 부모 노드 선택 (.parent())"
date = 2019-09-26T09:05:00Z
updated = 2026-07-21T06:47:00Z
categories = ["FRONT-END"]
tags = ["JS"]
toc = true

[extra]
source = "notion"
notion_id = "e5e32a76-bfc7-4fd6-974b-4be5f1e95ed5"
notion_url = "https://app.notion.com/p/jQuery-parent-e5e32a76bfc74fd6974b4be5f1e95ed5"
external_url = "https://www.codingfactory.net/10338"
+++

## jQuery .parent()

```javascript
$('p').parent().css('color', 'green');           // p의 부모 요소
$('p').parent('div').css('color', 'green');       // 부모가 div일 때만
$('p.ef').parent('div.cd').css('color', 'red');   // class 조합 예시
```

- selector 생략 시 부모 요소 그대로 선택, selector 지정 시 해당 selector와 일치할 때만 선택
