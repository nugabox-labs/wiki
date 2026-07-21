+++
title = "Spring Boot AJP Invalid message"
date = 2020-06-08T16:10:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["WAS"]
toc = true

[extra]
source = "notion"
notion_id = "cf7aa62b-6354-4b4c-a61b-ca28ce24eae0"
notion_url = "https://app.notion.com/p/Spring-Boot-AJP-Invalid-message-cf7aa62b63544b4ca61bca28ce24eae0"
external_url = "https://annajinee.tistory.com/38"
+++

AJP 커넥터로 설정했는데 HTTP 요청이 들어와 `Invalid message received with signature` 발생.

```java
@Configuration
public class TomcatConfig {
    @Value("${server.http.port}")
    private int httpPort;

    @Bean
    public ServletWebServerFactory servletContainer() {
        TomcatServletWebServerFactory tomcat = new TomcatServletWebServerFactory();
        tomcat.addAdditionalTomcatConnectors(createAjpConnector());
        return tomcat;
    }

    private Connector createAjpConnector() {
        Connector connector = new Connector("HTTP/1.1");   // "AJP/1.3" → "HTTP/1.1"로 변경
        connector.setPort(httpPort);
        connector.setSecure(false);
        connector.setAllowTrace(false);
        connector.setScheme("http");
        return connector;
    }
}
```
