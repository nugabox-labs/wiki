+++
title = "CSS 스크롤바 숨기기"
date = 2021-04-14T17:53:00Z
updated = 2026-07-21T06:47:00Z
categories = ["FRONT-END"]
tags = ["HTML", "CSS"]
toc = true

[extra]
source = "notion"
notion_id = "5c96add0-d83d-40ba-9c25-a5f93a930589"
notion_url = "https://app.notion.com/p/CSS-5c96add0d83d40ba9c25a5f93a930589"
external_url = "https://gofnrk.tistory.com/48"
+++

스크롤은 동작하되 스크롤바만 숨김.

## HTML

```html
<div class="box" style="width: 200px; height: 100px; overflow-y: scroll;">
  ...
</div>
```

## CSS

```css
.box {
  -ms-overflow-style: none; /* IE, Edge */
  scrollbar-width: none; /* Firefox */
}
.box::-webkit-scrollbar {
  display: none; /* Chrome, Safari, Opera */
}
```
