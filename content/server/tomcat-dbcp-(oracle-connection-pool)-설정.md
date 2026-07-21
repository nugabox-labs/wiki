+++
title = "Tomcat DBCP (Oracle Connection Pool) 설정"
date = "2020-11-04T09:07:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["SERVER"]
tags = ["WAS"]
toc = true

[extra]
source = "notion"
notion_id = "32fb311a-b8f1-4399-94eb-324af253f762"
notion_url = "https://app.notion.com/p/Tomcat-DBCP-Oracle-Connection-Pool-32fb311ab8f1439994eb324af253f762"
external_url = "https://sewsky.tistory.com/1"
+++

## Tomcat DBCP (Oracle Connection Pool) 설정

**1) ****`context.xml`****에 DataSource 등록**

```xml
<Resource name="jdbc/dbcp" auth="Container" type="javax.sql.DataSource"
    driverClassName="oracle.jdbc.driver.OracleDriver"
    url="jdbc:oracle:thin:@DB_URL:DB_PORT:DB_SID"
    username="NAME" password="PASS"
    maxActive="20" maxIdle="10" maxWait="-1"/>
```

**2) 프로젝트 ****`web.xml`****에 리소스 참조 등록**

```xml
<resource-ref>
    <description>Oracle11g</description>
    <res-ref-name>jdbc/dbcp</res-ref-name>
    <res-type>javax.sql.DataSource</res-type>
    <res-auth>Container</res-auth>
</resource-ref>
```

**3) 자바 코드에서 조회**

```java
public class DbcpConnection {
    public Connection getConnection() {
        Connection con = null;
        try {
            Context ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/dbcp"); // 고정 prefix + context.xml의 name
            con = ds.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
```

원문: [https://sewsky.tistory.com/1](https://sewsky.tistory.com/1)
