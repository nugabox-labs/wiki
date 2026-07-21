+++
title = "Java ProcessBuilder·Runtime.exec"
date = 2019-11-20T11:53:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END"]
tags = ["JAVA"]
toc = true

[extra]
source = "notion"
notion_id = "f94c1e93-ff65-4a02-b2bd-6b7c1fb6454d"
notion_url = "https://app.notion.com/p/Java-ProcessBuilder-Runtime-exec-f94c1e93ff654a02b2bd6b7c1fb6454d"
+++

## ProcessBuilder (권장)

인자 배열로 넘겨 셸 인젝션 위험 감소.

```java
ProcessBuilder pb = new ProcessBuilder("ls", "-al");  // Linux/Mac
// Windows: new ProcessBuilder("cmd", "/c", "dir");
pb.redirectErrorStream(true);
Process process = pb.start();

try (BufferedReader reader = new BufferedReader(
        new InputStreamReader(process.getInputStream()))) {
    String line;
    while ((line = reader.readLine()) != null) {
        System.out.println(line);
    }
}
int code = process.waitFor();  // 0 = 정상
```

## Runtime.exec (구방식)

```java
Process process = Runtime.getRuntime().exec(new String[]{"cmd", "/c", "dir"});
```

## 주의

표준출력·에러를 읽지 않으면 버퍼가 차 프로세스가 멈출 수 있음 → `redirectErrorStream(true)` 후 함께 읽기.
