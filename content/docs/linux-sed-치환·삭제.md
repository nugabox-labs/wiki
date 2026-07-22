+++
title = "Linux sed 치환·삭제"
date = 2021-09-16T00:01:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "DEV-OPS", "TECH"]
tags = ["LINUX", "BASH", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "8c25ba6a-4a27-447b-bceb-ee0ccaf84efe"
notion_url = "https://app.notion.com/p/Linux-sed-8c25ba6a4a27447bbcebee0ccaf84efe"
external_url = "https://jinwoonote.tistory.com/entry/SED-%EB%AA%85%EB%A0%B9%EC%96%B4-%EC%82%AC%EC%9A%A9%EB%B2%95"
+++

## 치환·삭제

```bash
sed 's/hello/goodbye/' in.file
echo '1234hello5678' | sed 's/hello/goodbye/'
sed '/hello/d' in.file               # hello 포함 라인 삭제
sed 's/hello//' in.file              # 문자열만 삭제
sed '3,7s/hello//' in.file           # 라인 범위
sed '/hello/,/goodbye/s/bad/good/g' in.file
sed -f command.file in.file          # 명령 파일
```

## 자주 쓰는 패턴

```bash
sed '3d' file                        # 3번째 라인 삭제
sed -n '/kingdom/p' file             # 매칭만 출력
sed '/^$/d' file                     # 빈 줄 제거
sed '/^ *$/d' file                   # 공백만 있는 줄 (^와 * 사이 공백)
sed '/^#/d' file                     # # 시작 라인 제거
sed 's/\(Pat\)\([^a-z]\)/\1ricia\2/g' file
```

## 편집 명령 요약

`a\` 뒤에추가 · `i\` 앞에삽입 · `c\` 라인교체 · `d` 삭제 · `g` 전역치환 · `p` 출력 · `q` 종료 · `s/old/new/` 치환
