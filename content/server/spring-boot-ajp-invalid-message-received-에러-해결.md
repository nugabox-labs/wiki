+++
title = "Spring Boot AJP Invalid message received 에러 해결"
date = 2020-06-08T16:10:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["WAS"]
toc = true

[extra]
source = "notion"
notion_id = "cf7aa62b-6354-4b4c-a61b-ca28ce24eae0"
notion_url = "https://app.notion.com/p/Spring-Boot-AJP-Invalid-message-received-cf7aa62b63544b4ca61bca28ce24eae0"
external_url = "https://annajinee.tistory.com/38"
+++

## Spring Boot AJP "Invalid message received with signature" 에러 해결

- 원인: AJP 커넥터로 설정했는데 실제로는 HTTP 요청이 들어와 프로토콜 불일치 발생

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

원문: [https://annajinee.tistory.com/38](https://annajinee.tistory.com/38)
