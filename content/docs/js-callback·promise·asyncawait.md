+++
title = "JS Callback·Promise·async/await"
date = 2025-02-18T07:21:00Z
updated = 2026-07-21T06:47:00Z
categories = ["FRONT-END", "TECH"]
tags = ["JS", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "b5c92501-a482-4d16-86f9-6e58b48fac47"
notion_url = "https://app.notion.com/p/JS-Callback-Promise-async-await-b5c92501a4824d1686f96e58b48fac47"
external_url = "https://velog.io/@donghyuk65/%EB%B9%84%EB%8F%99%EA%B8%B0-%EC%B2%98%EB%A6%AC-%EC%9D%B4%EB%A0%87%EA%B2%8C-%ED%95%98%EB%A9%B4-%EC%89%BD%EB%8B%A4-Callback-vs-Promise-vs-asyncawait-zjwevuyt"
+++

|  | Callback | Promise | async/await |
| --- | --- | --- | --- |
| 형태 | 함수 인자 | then/catch 체인 | 동기 스타일 |
| 에러 | err-first 콜백 | `.catch()` | `try/catch` |
| 단점 | 콜백 지옥 | 체인 길어지면 복잡 | — |

## Callback

```javascript
function getData(cb) {
  setTimeout(() => cb(null, "data"), 1000);
}
getData((err, data) => console.log(data));
```

## Promise

```javascript
function getData() {
  return new Promise((resolve, reject) => {
    setTimeout(() => resolve("data"), 1000);
  });
}
getData().then(console.log).catch(console.error);
```

## async/await

```javascript
async function run() {
  try {
    const data = await getData();
    console.log(data);
  } catch (e) {
    console.error(e);
  }
}
```

## 병렬

```javascript
const [a, b] = await Promise.all([getA(), getB()]);
```
