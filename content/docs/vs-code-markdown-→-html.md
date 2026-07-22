+++
title = "VS Code Markdown → HTML"
date = 2021-05-12T10:02:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END", "FRONT-END", "TECH"]
tags = ["HTML", "Node.js", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "253a80ea-8199-49ca-965c-87800ea6ed20"
notion_url = "https://app.notion.com/p/VS-Code-Markdown-HTML-253a80ea819949ca965c87800ea6ed20"
external_url = "https://medium.com/@wdjty326/visual-studio-code%EB%A5%BC-%EC%82%AC%EC%9A%A9%ED%95%98%EC%97%AC-markdown-%EC%9D%84-html%EB%A1%9C-%EB%B3%80%ED%99%98%ED%95%98%EA%B8%B0-1bdf6508eaad"
+++

```bash
npm i -g markdown-it
```

### tasks.json (`.vscode/tasks.json`)

Terminal → Configure Task → Create from template → Other

```json
{
  "version": "2.0.0",
  "tasks": [{
    "label": "markdown-to-html",
    "type": "shell",
    "command": "markdown-it ${file} -o ${fileDirname}/${fileBasenameNoExtension}.html",
    "group": { "kind": "build", "isDefault": true }
  }]
}
```

실행: `Ctrl+Shift+B`

### gulp 자동화

```bash
npm i -g gulp
npm i gulp gulp-markdown-it
```

루트 `gulpfile.js` + tasks.json에서 gulp task 호출. `Ctrl+Shift+B`로 일괄 변환.
