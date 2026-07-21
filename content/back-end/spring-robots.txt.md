+++
title = "Spring robots.txt"
date = "2021-09-07T05:46:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["BACK-END"]
tags = ["JAVA"]
toc = true

[extra]
source = "notion"
notion_id = "d3b7ed18-dcc5-4e85-b5af-9f271184589a"
notion_url = "https://app.notion.com/p/Spring-robots-txt-d3b7ed18dcc54e85b5af9f271184589a"
+++

## Spring MVC에서 robots.txt 정적 파일로 서빙하기

`web.xml`에 추가 (DispatcherServlet이 가로채지 않고 default servlet이 처리하도록):

```xml
<servlet-mapping>
    <servlet-name>default</servlet-name>
    <url-pattern>/robots.txt</url-pattern>
</servlet-mapping>
```
