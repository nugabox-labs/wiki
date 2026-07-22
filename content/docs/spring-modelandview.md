+++
title = "Spring ModelAndView"
date = 2021-08-26T07:38:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "BACK-END"]
tags = ["JAVA", "WEB"]
toc = true

[extra]
source = "notion"
notion_id = "d5f0b483-8b2c-4af5-9e6d-df5c4c99f50d"
notion_url = "https://app.notion.com/p/Spring-ModelAndView-d5f0b4838b2c4af59e6ddf5c4c99f50d"
external_url = "https://jinsiri.tistory.com/444"
+++

Controller에서 뷰 이름과 모델 데이터를 함께 반환.

```java
@RequestMapping("/example")
public ModelAndView example() {
    ModelAndView mav = new ModelAndView("viewName");
    mav.addObject("key", value);
    return mav;
}
```

- `setViewName` / 생성자: 뷰 이름
- `addObject`: 모델 속성
- 대안: 반환 타입 `String` + `Model`
