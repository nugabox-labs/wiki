+++
title = "MVC MVP MVVM 비교"
date = 2021-08-26T07:38:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "TECH"]
tags = ["WEB", "ETC"]
toc = true

[extra]
source = "notion"
notion_id = "aab77e87-b484-4a1a-abce-5ddd590070cc"
notion_url = "https://app.notion.com/p/MVC-MVP-MVVM-aab77e87b4844a1aabce5ddd590070cc"
external_url = "https://beomy.tistory.com/43"
+++

## MVC / MVP / MVVM

|  | MVC | MVP | MVVM |
| --- | --- | --- | --- |
| 중개 | Controller | Presenter | ViewModel |
| View↔Model | 의존성 있음 | Presenter 경유 | Data Binding |
| View 관계 | Controller 1:N View | Presenter 1:1 View | ViewModel 1:N View |
| 장점 | 단순·보편 | Model-View 분리 | Command+Binding으로 의존 최소화 |
| 단점 | View-Model 결합 | View-Presenter 결합 | ViewModel 설계 난이도 |

### MVC

Action → Controller → Model 갱신 → View 선택 → View가 Model로 렌더

### MVP

Action → View → Presenter → Model → Presenter → View

### MVVM

Action → View → Command → ViewModel → Model → ViewModel 가공 → Data Binding → View
