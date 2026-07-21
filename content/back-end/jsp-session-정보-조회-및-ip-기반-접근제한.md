+++
title = "JSP Session 정보 조회 및 IP 기반 접근제한"
date = 2020-04-02T09:59:00Z
updated = 2026-07-21T02:37:00Z
categories = ["BACK-END"]
tags = ["JAVA"]
toc = true

[extra]
source = "notion"
notion_id = "549e0d25-df7f-41ee-b4ef-58ea743daca2"
notion_url = "https://app.notion.com/p/JSP-Session-IP-549e0d25df7f41eeb4ef58ea743daca2"
+++

## JSP Session 정보 조회/출력 예제

```javascript
<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.util.*, java.text.*, java.net.*" %>
<%
request.setCharacterEncoding("utf-8");
HttpSession sess = request.getSession();
boolean isNew = sess.isNew();
String sessionId = sess.getId();
String serverName = request.getServerName();
long creationTime = sess.getCreationTime();
long lastAccessedTime = sess.getLastAccessedTime();
int maxInactiveInterval = sess.getMaxInactiveInterval();

InetAddress local = InetAddress.getLocalHost();
String ip = local.getHostAddress();
Enumeration e = session.getAttributeNames();
%>
```

- 위 변수들(서버 IP, URL, 세션ID, isNew, 생성/최근접근시각, 세션만료시간)을 표에 출력
- 세션에 저장된 모든 속성 나열:

```javascript
<%
String name = null;
while (e.hasMoreElements()) {
    name = (String) e.nextElement();
%>
<%=name%> : <%=session.getAttribute(name)%>
<% } %>
```

## 서버 IP로 접근 제한 (IP 기반 분기)

```javascript
<c:set var="ip" value="<%=ip%>" />
<c:if test="${ip eq '허용할서버IP'}">
  ...
</c:if>
```
