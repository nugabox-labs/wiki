+++
title = "Servlet getParameterValues() 사용법"
date = "2019-12-24T02:43:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["BACK-END"]
tags = ["JAVA"]
toc = true

[extra]
source = "notion"
notion_id = "1d9e504c-4173-4c78-bdfd-ca6d2aad0c0d"
notion_url = "https://app.notion.com/p/Servlet-getParameterValues-1d9e504c41734c78bdfdca6d2aad0c0d"
+++

## Servlet request.getParameterValues()

```java
request.getParameterValues("name값")
```

체크박스처럼 하나의 name으로 여러 값이 전달될 때 사용. 배열(String\[\])로 반환
