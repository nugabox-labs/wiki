+++
title = "JSTL forEach/forTokens 태그 사용법"
date = "2019-10-23T10:17:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["BACK-END"]
tags = ["JAVA"]
toc = true

[extra]
source = "notion"
notion_id = "7bbf3cf5-54cc-4f99-ae8a-a38800701bc2"
notion_url = "https://app.notion.com/p/JSTL-forEach-forTokens-7bbf3cf554cc4f99ae8aa38800701bc2"
external_url = "https://offbyone.tistory.com/368"
+++

## JSTL `<c:forEach>`

**리스트 출력**

```javascript
<c:forEach var="name" items="${nameList}" varStatus="status">
  <p>${status.count} : <c:out value="${name}" /></p>
</c:forEach>
```

- 객체 리스트: `${boardVO.title}` → `getTitle()` 호출
- Map 리스트: `${boardMap.title}` → `get("title")` 호출

**횟수 지정 반복**

```javascript
<c:forEach var="i" begin="0" end="3">        <!-- 0,1,2,3 -->
<c:forEach var="i" begin="0" end="3" step="2">  <!-- 0,2 (step은 음수 불가) -->
```

**리스트 역순 출력**

```javascript
<c:set var="size" value="${fn:length(nameList)}" />
<c:forEach var="i" begin="1" end="${size}">
  <c:out value="${nameList[size - i]}" />
</c:forEach>
```

**varStatus 속성**

```javascript
<c:forEach var="name" items="${nameList}" varStatus="status">
  ${status.count} : ${status.index} : ${status.current}
</c:forEach>
```

- `index`(0부터), `count`(1부터), `current`(현재 아이템), `first`/`last`(불린), `begin`/`end`/`step`

## JSTL `<c:forTokens>` — 구분자로 문자열 분리

```javascript
<c:forTokens var="name" items="홍길동,김철수,박영희" delims=",">
  <c:out value="${name}"/>
</c:forTokens>
```

원문: [https://offbyone.tistory.com/368](https://offbyone.tistory.com/368)
