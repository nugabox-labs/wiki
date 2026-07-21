+++
title = "SpringMVC Model·ModelAndView"
date = 2019-10-01T11:52:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END"]
tags = ["JAVA"]
toc = true

[extra]
source = "notion"
notion_id = "39b0b578-b01d-4424-a342-94b115410fe3"
notion_url = "https://app.notion.com/p/SpringMVC-Model-ModelAndView-39b0b578b01d4424a34294b115410fe3"
+++

> 원본이 스크린샷 이미지뿐(텍스트 추출 불가)

## SpringMVC Controller / Model / ModelAndView 기본 사용법 (일반 참고)

```java
@Controller
public class SampleController {

    // Model 사용 - 뷰 이름을 String으로 리턴
    @RequestMapping("/hello")
    public String hello(Model model) {
        model.addAttribute("message", "Hello");
        return "helloView";   // /WEB-INF/views/helloView.jsp
    }

    // ModelAndView 사용 - 뷰 이름 + 데이터를 함께 객체로 리턴
    @RequestMapping("/hello2")
    public ModelAndView hello2() {
        ModelAndView mav = new ModelAndView("helloView");
        mav.addObject("message", "Hello");
        return mav;
    }
}
```

- `Model`: 데이터만 담당, 뷰 이름은 메서드 리턴값(String)으로 별도 지정
- `ModelAndView`: 뷰 이름과 데이터를 한 객체에 담아 리턴 (뷰+데이터를 함께 관리하고 싶을 때)
