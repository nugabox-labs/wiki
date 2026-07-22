+++
title = "Express EJS 템플릿"
date = 2022-04-10T17:33:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END", "FRONT-END"]
tags = ["Node.js", "JS", "HTML"]
toc = true

[extra]
source = "notion"
notion_id = "96338b43-cf7d-49e0-8d35-9ed36cc4e74a"
notion_url = "https://app.notion.com/p/Express-EJS-96338b43cf7d49e08d359ed36cc4e74a"
external_url = "https://velopert.com/379"
+++

## package.json

```bash
npm install
```

```json
{
  "name": "express-tutorial",
  "version": "1.0.0",
  "dependencies": {
    "express": "~4.13.1",
    "ejs": "~2.4.1",
    "body-parser": "~1.14.2",
    "express-session": "~1.13.0"
  }
}
```

## server.js

```javascript
var express = require('express');
var app = express();
var bodyParser = require('body-parser');
var session = require('express-session');
var fs = require("fs");

app.set('views', __dirname + '/views');
app.set('view engine', 'ejs');
app.engine('html', require('ejs').renderFile);

app.listen(3000);

app.use(express.static('public'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded());
app.use(session({
  secret: 'CHANGE_ME',
  resave: false,
  saveUninitialized: true
}));

require('./router/main')(app, fs);
```

## router / view

```javascript
// router/main.js
module.exports = function(app, fs) {
  app.get('/', function(req, res){
    res.render('index', { title: "MY HOMEPAGE", length: 5 });
  });
};
```

```javascript
<%-- views/index.ejs --%>
<html>
  <head><% include ./header.ejs %></head>
  <body><% include ./body.ejs %></body>
</html>
```

```
<%-- views/body.ejs --%>
<h1>Loop it!</h1>
<ul>
  <% for(var i=0; i<length; i++){ %>
    <li><%= "LOOP" + i %></li>
  <% } %>
</ul>
```

```bash
node server.js
```
