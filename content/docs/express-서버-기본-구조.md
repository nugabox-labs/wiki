+++
title = "Express 서버 기본 구조"
date = 2022-04-10T17:32:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END", "FRONT-END", "TECH"]
tags = ["Node.js", "JS", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "51d55126-9190-4bcc-8545-418152f5f748"
notion_url = "https://app.notion.com/p/Express-51d5512691904bcc8545418152f5f748"
external_url = "https://junspapa-itdev.tistory.com/7"
+++

## 설치·디렉터리

```bash
npm install express --save
mkdir -p public routes views conf
```

## 서버 진입 (`web.js`)

```javascript
var express = require('express');
var http = require('http');
var app = express();

app.set('port', process.env.PORT || 8001);
http.createServer(app).listen(app.get('port'), function(){
  console.log('Express server listening on port ' + app.get('port'));
});

var indexRouter = require('./routes/index');
app.use('/', indexRouter);

var clubRouter = require('./routes/club/club');
app.use('/club', clubRouter);
```

## 라우터

```javascript
// routes/index.js
var express = require('express');
var router = express.Router();
router.get('/', function(req, res) {
  res.send('index page');
});
module.exports = router;
```

```javascript
// routes/club/club.js
var express = require('express');
var router = express.Router();
var clubList = require('./clubList');
var clubDetail = require('./clubDetail');

router.get('/list', function(req, res) { clubList.list(req, res); });
router.get('/detail/:clubSn', function(req, res) { clubDetail.detail(req, res); });
module.exports = router;
```

```javascript
// routes/club/clubList.js
module.exports = {
  list: function(req, res){ res.send('club list'); }
};
```

```javascript
// routes/club/clubDetail.js
module.exports = {
  detail: function(req, res){ res.send('club detail'); }
};
```
