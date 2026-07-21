+++
title = "Tomcat 리소스 캐시 공간 부족"
date = 2021-07-06T00:09:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "BACK-END", "TECH"]
tags = ["WAS", "JAVA", "ISSUE", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "0084acc9-6b52-415e-85bc-6c6cc360bd8b"
notion_url = "https://app.notion.com/p/Tomcat-0084acc96b52415e85bc6c6cc360bd8b"
external_url = "https://m.blog.naver.com/PostView.naver?blogId=forioso&logNo=221377985738&targetKeyword=&targetRecommendationCode=1"
+++

## 증상

```
The background cache eviction process was unable to free [10] percent of the cache
for Context [] - consider increasing the maximum size of the cache.
```

## 조치 (`context.xml` / Context)

```xml
<Resources
  cachingAllowed="true"
  cacheMaxSize="102400"
  cacheObjectMaxSize="512"
/>
```

| 속성 | 의미 |
| --- | --- |
| `cacheMaxSize` | 캐시 총 한도 (KB, 기본 10240) |
| `cacheObjectMaxSize` | 단일 객체 상한 (KB). **cacheMaxSize/20 초과 불가** |

```bash
rm -rf $CATALINA_HOME/work/*
$CATALINA_HOME/bin/shutdown.sh && $CATALINA_HOME/bin/startup.sh
```
