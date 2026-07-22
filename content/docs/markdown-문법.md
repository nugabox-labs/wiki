+++
title = "Markdown 문법"
date = 2021-05-07T00:35:00Z
updated = 2026-07-21T06:47:00Z
categories = ["TECH"]
tags = ["TIP"]
toc = true

[extra]
source = "notion"
notion_id = "0ae541d9-0c7d-4c2b-b9cb-8d5878601ed9"
notion_url = "https://app.notion.com/p/Markdown-0ae541d90c7d4c2bb9cb8d5878601ed9"
external_url = "http://www.slideshare.net/ihoneymon/ss-40575068"
+++

텍스트 기반 마크업. HTML 변환·GitHub README 등에 널리 사용.

## 장단점

- 장점: 간결, 도구 불필요, 다양한 변환, 용량 작음, VCS 친화
- 단점: 표준 없음(도구별 차이), HTML 전부 대체 불가

## 문법 요약

### 헤더

```
# H1
## H2
### H3
```

### 인용

```
> 인용문
> > 중첩 인용
```

### 목록

```
1. 순서 목록
2. 항목

- 비순서
  - 중첩
* / + / - 혼용 가능
```

### 코드

- 들여쓰기(공백 4칸/탭) 또는 펜스(\`)
- 펜스 시작에 언어명 지정 시 문법 강조(GitHub 등)

예: ` `java ` … ` ` `

### 수평선

`***` / `---` / `- - -`

### 링크·이미지

```
[제목](https://example.com)
[참조][id]
[id]: https://example.com "title"

![alt](/path/img.jpg)
```

크기 조절은 HTML `<img width height>`.

### 강조

`*italic*` `**bold**` `~~취소~~` — 문장 중간은 공백 주의.

### 줄바꿈

문장 끝 공백 2~3칸 이상, 또는 `
`.

## 참고

- [John Gruber 마크다운 번역](http://nolboo.github.io/blog/2013/09/07/john-gruber-markdown/)
- [GitHub Flavored Markdown 번역](http://nolboo.github.io/blog/2014/03/25/github-flavored-markdown/)
- [허니몬 마크다운 작성법](http://www.slideshare.net/ihoneymon/ss-40575068)
