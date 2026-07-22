+++
title = "Node.js node-ssh 클라이언트"
date = 2023-10-07T07:14:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END", "FRONT-END"]
tags = ["Node.js", "JS"]
toc = true

[extra]
source = "notion"
notion_id = "c81c5f2e-cba2-4610-abed-5e9e3d2b9909"
notion_url = "https://app.notion.com/p/Node-js-node-ssh-c81c5f2ecba24610abed5e9e3d2b9909"
external_url = "https://lts0606.tistory.com/46"
+++

```bash
npm install node-ssh
```

```javascript
var node_ssh = require('node-ssh');
var ssh = new node_ssh();

ssh.connect({
  host: 'HOST',
  username: 'USER',
  port: 22,
  password: 'PASS',
  readyTimeout: 20000
}).then(function () {
  return ssh.execCommand('명령어', {});
}).then(function (result) {
  console.log(result.stdout);
  console.log(result.stderr);
  ssh.dispose();
});

// 파일 받기
ssh.getFile('로컬경로', '원격파일').then(function () {
  ssh.dispose();
});

// 파일 보내기
ssh.putFiles([{ local: '보낼파일', remote: '원격경로' }]).then(function () {
  ssh.dispose();
});
```
