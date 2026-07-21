+++
title = "Java 인터페이스 개념과 활용"
date = 2019-09-26T08:56:00Z
updated = 2026-07-21T02:37:00Z
categories = ["BACK-END"]
tags = ["JAVA"]
toc = true

[extra]
source = "notion"
notion_id = "7709dc9c-154f-4bd1-b806-c27069301bc9"
notion_url = "https://app.notion.com/p/Java-7709dc9c154f4bd1b806c27069301bc9"
external_url = "https://opentutorials.org/module/2495/14142"
+++

## 인터페이스(interface) 개념

- 구현하는 클래스가 특정 메소드를 반드시 구현하도록 강제하는 규약. 구현 안 하면 컴파일 자체가 안 됨
- 상속(`extends`)은 상위 클래스 기능을 물려받는 것, 인터페이스(`implements`)는 하위 클래스에 특정 메소드 존재를 강제하는 것 — 목적이 다름

```java
interface Inter {
    public void z();
}
class A implements Inter {
    public void z() {}   // 구현 안 하면 컴파일 에러
}
```

## 실무 활용: 협업 시 인터페이스로 약속 정의

개발자 A가 실제 로직(Calculator)을, 개발자 B가 그 로직을 쓰는 코드를 각자 작업할 때, 인터페이스로 메소드 시그니처를 먼저 약속해두면 서로 구현 세부사항이 달라져도 문제없이 통합 가능:

```java
public interface Calculatable {
    public void setOprands(int first, int second, int third);
    public int sum();
    public int avg();
}
// 개발자 B는 이 인터페이스를 구현한 더미 클래스로 먼저 개발 진행
class CalculatorDummy implements Calculatable { ... }
// 개발자 A가 완성한 실제 클래스로 나중에 교체
class Calculator implements Calculatable { ... }
```

## 인터페이스 규칙

1. **다중 구현 가능**: `class A implements I1, I2 { ... }` — 모든 인터페이스의 메소드 구현 필수
1. **인터페이스도 상속 가능**: `interface I4 extends I3 { ... }`
1. **멤버는 항상 public**: `private` 등 명시 불가, 생략해도 자동으로 public (default 아님)

## abstract 클래스 vs interface

- 인터페이스: 다중 구현 가능, 구체적 로직/상태를 가질 수 없음
- 추상 클래스: 일반 클래스라 다중 상속 불가, 구체적 로직/상태를 가질 수 있음

원문: [https://opentutorials.org/module/2495/14142](https://opentutorials.org/module/2495/14142)
