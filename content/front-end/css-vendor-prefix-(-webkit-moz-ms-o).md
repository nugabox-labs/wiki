+++
title = "CSS vendor prefix (-webkit/-moz/-ms/-o)"
date = 2020-04-07T13:33:00Z
updated = 2026-07-21T06:47:00Z
categories = ["FRONT-END"]
tags = ["CSS"]
toc = true

[extra]
source = "notion"
notion_id = "b44dfc04-2ea5-44e1-be38-04d956c74ef0"
notion_url = "https://app.notion.com/p/CSS-vendor-prefix-webkit-moz-ms-o-b44dfc042ea544e1be3804d956c74ef0"
external_url = "https://mainia.tistory.com/3671"
+++

## Vendor prefix

| Prefix | 엔진/브라우저 |
| --- | --- |
| `-webkit-` | Chrome, Safari |
| `-moz-` | Firefox |
| `-ms-` | IE/구 Edge |
| `-o-` | Opera (구) |

```css
#grad1 {
  background: -webkit-linear-gradient(left, red, blue);
  background: -moz-linear-gradient(right, red, blue);
  background: -o-linear-gradient(right, red, blue);
  background: linear-gradient(to right, red, blue); /* standard */
}
```
