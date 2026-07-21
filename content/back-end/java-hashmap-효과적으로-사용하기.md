+++
title = "Java HashMap 효과적으로 사용하기"
date = "2019-10-31T10:04:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["BACK-END"]
tags = ["JAVA"]
toc = true

[extra]
source = "notion"
notion_id = "aa7d9eb0-6516-4a99-86b7-c34d9a35a6de"
notion_url = "https://app.notion.com/p/Java-HashMap-aa7d9eb065164a9986b7c34d9a35a6de"
external_url = "https://dzone.com/articles/how-to-use-java-hashmap-effectively"
+++

## HashMap 기본

- key-value 저장, get/put 모두 평균 O(1)

```java
Map<String, Double> productPrice = new HashMap<>();
productPrice.put("Rice", 6.9);
Double egg = productPrice.get("Egg");
```

## 순회

```java
productPrice.keySet().forEach(key -> System.out.println(key));           // key만
productPrice.values().forEach(value -> System.out.println(value));       // value만
productPrice.forEach((key, value) -> System.out.println(key + ":" + value)); // key+value
```

## 존재하지 않는 key 처리 관련 메소드

```java
map.getOrDefault("Fish", 29.4);   // key 없으면 기본값 반환(map은 변경 안 됨)

map.putIfAbsent("Fish", 4.5);     // key 없으면 값 추가(값은 무조건 먼저 평가됨 — 비용 큰 계산엔 주의)

map.computeIfAbsent(key, k -> 비싼계산(k));  // key 없을 때만 함수 호출해서 계산+저장(putIfAbsent보다 효율적)

map.computeIfPresent(key, (k, v) -> v + 1);  // key 있을 때만 값 재계산

map.compute(key, (k, v) -> ...);             // key 존재 여부 상관없이 재계산
```

## 활용 예: 메모이제이션(피보나치)

```java
private Map<Integer, BigInteger> memo = new HashMap<>();
private BigInteger fibonacci(int n) {
    return memo.computeIfAbsent(n, k -> fibonacci(n - 1).add(fibonacci(n - 2)));
}
```

## 활용 예: 단어 빈도수 세기

```java
map.computeIfPresent(word, (k, v) -> ++v);
```

원문: [https://dzone.com/articles/how-to-use-java-hashmap-effectively](https://dzone.com/articles/how-to-use-java-hashmap-effectively)
