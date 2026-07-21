+++
title = "FormData·multer 업로드"
date = 2022-07-09T10:53:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "BACK-END", "FRONT-END"]
tags = ["Node.js", "JS", "WEB"]
toc = true

[extra]
source = "notion"
notion_id = "acedb897-fb52-45d0-9178-154c1ebca288"
notion_url = "https://app.notion.com/p/FormData-multer-acedb897fb5245d09178154c1ebca288"
external_url = "https://melius.tistory.com/51"
+++

## urlencoded / JSON

```html
<form id="form1" method="POST" action="/upload1">
  <input type="text" name="text1" value="text01">
  <input type="text" name="text2" value="text02">
  <button id="btn1">submit</button>
</form>
```

```javascript
// jQuery serialize
var formData = $("#form1").serialize();
$.ajax({ url: "/upload1", type: 'POST', data: formData });

// XHR JSON
let data = { text1: 'text01', text2: 'text02' };
let xhr = new XMLHttpRequest();
xhr.open("POST", "/upload1", false);
xhr.setRequestHeader("Content-type", "application/json");
xhr.send(JSON.stringify(data));
```

```javascript
app.use(express.urlencoded({ extended: false }));
app.use(express.json());
app.post('/upload1', (req, res) => {
  console.log(req.body.text1, req.body.text2);
  res.send("ok");
});
```

## multipart (FormData + multer)

```html
<form id="form2" method="POST" action="/upload2" enctype="multipart/form-data">
  <input type="text" name="text1" value="text01">
  <input type="file" id="files" name="file2" />
  <button id="btn2">submit</button>
</form>
```

```javascript
var formData = new FormData($("#form2")[0]);
$.ajax({
  url: "/upload2", processData: false, contentType: false,
  type: 'POST', data: formData
});

// 수동 append
let formdata = new FormData();
formdata.append("text3", "text03");
formdata.append("file3", file3.files[0]);
$.ajax({
  url: '/upload2', type: 'POST',
  contentType: false, processData: false, data: formdata
});
```

```bash
npm i multer
```

```javascript
let storage = multer.diskStorage({
  destination: (req, file, cb) => cb(null, 'uploads'),
  filename: (req, file, cb) => cb(null, getFile(file))
});
let upload = multer({ storage });
app.post(['/upload2', '/upload3'], upload.any(), (req, res) => {
  console.log(req.body, req.files);
  res.send("ok");
});
```
