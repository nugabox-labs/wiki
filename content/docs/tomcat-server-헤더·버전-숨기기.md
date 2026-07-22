+++
title = "Tomcat Server 헤더·버전 숨기기"
date = 2019-05-17T00:43:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER", "BACK-END"]
tags = ["LINUX", "WAS", "JAVA"]
toc = true

[extra]
source = "notion"
notion_id = "f0fca41e-b04c-4697-8878-640b1ab4969a"
notion_url = "https://app.notion.com/p/Tomcat-Server-f0fca41eb04c46978878640b1ab4969a"
external_url = "https://sarc.io/index.php/tomcat/240-tomcat-response-header-server"
+++

## 확인

```bash
curl -i http://192.168.1.100:8080
# Server: Apache-Coyote/1.1 노출 여부 확인
```

## Connector server 속성 (`server.xml`)

```xml
<Connector port="8080" protocol="HTTP/1.1"
           connectionTimeout="20000" redirectPort="8443"
           server=" " />
<Connector port="8009" protocol="AJP/1.3"
           redirectPort="8443" server=" " />
```

- `server=" "`(공백) → 헤더를 비움
- `server=""` → 기본값(Apache-Coyote/…)이 다시 노출됨
- 임의 문자열 지정 가능 (예: `server="HKCHO"`)

## ErrorReportValve (에러 페이지 서버정보)

```xml
<Valve className="org.apache.catalina.valves.ErrorReportValve"
       showReport="false" showServerInfo="false"/>
```

## 404 에러 화면 버전 숨기기

경로: `$CATALINA_HOME/lib` → `catalina.jar`

```bash
cd $CATALINA_HOME/lib
cp catalina.jar catalina.jar_org
jar xf catalina.jar org/apache/catalina/util/ServerInfo.properties
vi org/apache/catalina/util/ServerInfo.properties
```

```javascript
server.info=Apache Tomcat
server.number=
server.built=
```

변경 후 jar에 다시 넣고 재기동.
