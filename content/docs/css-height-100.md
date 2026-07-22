+++
title = "CSS height 100%"
date = 2021-04-14T17:54:00Z
updated = 2026-07-21T06:47:00Z
categories = ["FRONT-END"]
tags = ["CSS"]
toc = true

[extra]
source = "notion"
notion_id = "d3898470-384f-4bdd-bac5-cb55aec1f877"
notion_url = "https://app.notion.com/p/CSS-height-100-d3898470384f4bddbac5cb55aec1f877"
external_url = "https://offbyone.tistory.com/341"
+++

## 원인

`height: 100%`는 부모 높이에 상대적. `body` 기본 높이가 없으면 자식 `%` 높이 무효.

## 해결

```css
html, body {
  margin: 0;
  height: 100%;
  overflow: hidden;
}

.panel-container {
  height: 100%;
  display: flex;
  flex-direction: row;
  border: 1px solid silver;
  overflow: hidden;
}
```

## 참고

- 기본 `display: inline` 요소(`span` 등)는 width/height 무시 → `display: inline-block`
