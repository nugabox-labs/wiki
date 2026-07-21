+++
title = "axios FormData POST 전송"
date = 2022-07-09T10:53:00Z
updated = 2026-07-21T06:47:00Z
categories = ["FRONT-END", "TECH"]
tags = ["JS", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "5fa826e2-8017-44ed-ba98-7f467b5ae0b5"
notion_url = "https://app.notion.com/p/axios-FormData-POST-5fa826e2801744edba987f467b5ae0b5"
external_url = "https://forteleaf.tistory.com/entry/axiospost-%EC%97%90-form-%EB%8D%B0%EC%9D%B4%ED%84%B0%EB%A5%BC-%EB%84%A3%EA%B8%B0"
+++

## FormData

```javascript
const form = new FormData()
form.append('id', userID)
form.append('pwd', userPass)

axios.post('/api/auth', form)
  .then(res => console.log(res))
  .catch(err => console.error(err))
```

## querystring

```javascript
import qs from 'querystring' // 또는 qs 패키지

axios.post('/user/login', qs.stringify({ id, pw }))
  .then(data => { /* ... */ })
```

> `axios.post(url, { headers, id, pwd })`처럼 body에 headers를 넣으면 FormData가 아님.
