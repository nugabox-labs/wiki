+++
title = "Java BufferedReader/BufferedWriter 사용법"
date = "2019-10-31T09:57:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["BACK-END"]
tags = ["JAVA"]
toc = true

[extra]
source = "notion"
notion_id = "4282a4fc-20ef-43e3-a15f-5035f287c326"
notion_url = "https://app.notion.com/p/Java-BufferedReader-BufferedWriter-4282a4fc20ef43e3a15f5035f287c326"
external_url = "https://jhnyang.tistory.com/92"
+++

## BufferedReader / BufferedWriter — 버퍼 기반 입출력

버퍼(메모리)에 데이터를 모았다가 한번에 전송해서 Scanner/System.out.print보다 빠름. 알고리즘 문제 풀이 등 대량 입출력 시 사용.

### BufferedReader

```java
BufferedReader br = new BufferedReader(new InputStreamReader(System.in));   // 콘솔 입력
BufferedReader br_f = new BufferedReader(new FileReader("파일명"));           // 파일 입력

int num = Integer.parseInt(br.readLine());   // readLine()은 String 리턴 → 형변환 필요
br.close();

String line;
while ((line = br_f.readLine()) != null) {
    System.out.println(line);
}
```

- Scanner와 달리 공백 단위 분리 없이 라인 단위(엔터 기준)로만 읽음 → 공백 분리 필요 시 `StringTokenizer` 또는 `String.split()` 사용
- 주요 메서드: `read()`(한 글자, int로 반환), `read(char[] cbuf, offset, length)`, `readLine()`, `ready()`, `mark()/reset()`, `skip(n)`, `close()`

### BufferedWriter

```java
BufferedWriter bw = new BufferedWriter(new FileWriter("bufferedWriter.txt"));
bw.write("hello\n");
bw.newLine();          // 개행
bw.write("I am writing\n");
bw.flush();            // 버퍼에 남은 데이터 출력
bw.close();
```

- 개행 함수 없음(`System.out.println`과 달리) → `"\n"` 또는 `newLine()` 사용
- 사용 후 `flush()` → `close()` 순서로 마무리
- 주요 메서드: `write(int c)`, `write(String s, offset, length)`, `newLine()`, `flush()`, `close()`

원문: [https://jhnyang.tistory.com/92](https://jhnyang.tistory.com/92)
