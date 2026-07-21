+++
title = "Tomcat 8.5.x Chrome SameSite=None 쿠키 적용"
date = "2020-09-23T15:33:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["SERVER"]
tags = ["WAS"]
toc = true

[extra]
source = "notion"
notion_id = "81534f3e-e6f6-45d7-ac6c-1bdeb7b01a3e"
notion_url = "https://app.notion.com/p/Tomcat-8-5-x-Chrome-SameSite-None-81534f3ee6f645d7ac6c1bdeb7b01a3e"
external_url = "https://ttallaemideul.github.io/20200223/tomcat-001"
+++

## Tomcat 8.5.x에서 Chrome SameSite=None 쿠키 적용

Chrome 80+부터 `SameSite=None`만 있고 `Secure`가 없는 쿠키는 크로스사이트 요청에서 전달 안 됨.

**server.xml에 CookieProcessor 설정**

```xml
<Context>
    <CookieProcessor sameSiteCookies="none" />
</Context>
```

- 구버전 `LegacyCookieProcessor` 사용 시:

```xml
<CookieProcessor className="org.apache.tomcat.util.http.LegacyCookieProcessor" sameSiteCookies="none" />
```

⚠️ `sameSiteCookies` 옵션은 **Tomcat 8.5.42 이상**부터 지원 — 이하 버전이면 업그레이드 필요

**web.xml에 HttpOnly/Secure 설정**

```xml
<session-config>
    <session-timeout>30</session-timeout>
    <cookie-config>
        <http-only>true</http-only>
        <secure>true</secure>
    </cookie-config>
</session-config>
```

**확인**: 크롬 개발자도구 > Application > Cookies에서 HttpOnly/Secure/SameSite 속성 적용 확인

원문: [https://ttallaemideul.github.io/20200223/tomcat-001](https://ttallaemideul.github.io/20200223/tomcat-001)
