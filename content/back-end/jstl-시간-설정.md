+++
title = "JSTL 시간 설정"
date = 2019-09-26T08:54:00Z
updated = 2026-07-21T02:37:00Z
categories = ["BACK-END"]
tags = ["JAVA"]
toc = true

[extra]
source = "notion"
notion_id = "f7ddafc9-f831-4749-8a1c-458e775c32d7"
notion_url = "https://app.notion.com/p/JSTL-f7ddafc9f83147498a1c458e775c32d7"
+++

## JSTL 현재 시간 가져와서 포맷팅

```javascript
<jsp:useBean id="currTime" class="java.util.Date" />
<fmt:formatDate value="${currTime}" pattern="yyyyMMddHHmmss" var="currTime" />
<input type="hidden" value="${currTime}" />
```

## 시간 범위 비교 (문자열 형태로 비교)

```javascript
<c:when test="${currTime >= 20190901090000 && currTime < 20190915180000}">
```
