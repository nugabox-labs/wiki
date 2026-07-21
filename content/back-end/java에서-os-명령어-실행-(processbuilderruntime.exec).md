+++
title = "Java에서 OS 명령어 실행 (ProcessBuilder/Runtime.exec)"
date = 2019-11-20T11:53:00Z
updated = 2026-07-21T02:37:00Z
categories = ["BACK-END"]
tags = ["JAVA"]
toc = true

[extra]
source = "notion"
notion_id = "f94c1e93-ff65-4a02-b2bd-6b7c1fb6454d"
notion_url = "https://app.notion.com/p/Java-OS-ProcessBuilder-Runtime-exec-f94c1e93ff654a02b2bd6b7c1fb6454d"
+++

## Java에서 OS 명령어 실행 (ProcessBuilder / Runtime.exec)

```java
// ProcessBuilder (권장 — 인자 배열로 넘겨 셸 인젝션 위험 감소)
ProcessBuilder pb = new ProcessBuilder("ls", "-al");   // Linux/Mac
// Windows는: new ProcessBuilder("cmd", "/c", "dir");
pb.redirectErrorStream(true);
Process process = pb.start();

BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
String line;
while ((line = reader.readLine()) != null) {
    System.out.println(line);
}
process.waitFor();
```

```java
// Runtime.exec (구버전 방식)
Process process = Runtime.getRuntime().exec(new String[]{"cmd", "/c", "dir"});
```

- 반환 코드 확인: `process.exitValue()` (0이면 정상 종료)
- 표준출력/에러를 모두 읽지 않으면 버퍼가 가득 차 프로세스가 멈출 수 있음 → `redirectErrorStream(true)`로 합쳐서 함께 읽기 권장
