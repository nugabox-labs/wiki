+++
title = "HTML 디버깅 정보 오버레이"
date = 2025-07-14T04:43:00Z
updated = 2026-07-21T06:47:00Z
categories = ["FRONT-END"]
tags = ["HTML", "JS"]
toc = true

[extra]
source = "notion"
notion_id = "230aac4e-32a5-803f-a325-e4cd38f1f8de"
notion_url = "https://app.notion.com/p/HTML-230aac4e32a5803fa325e4cd38f1f8de"
+++

화면 우상단 고정 디버그 오버레이 표시.

```html
<div id="debug-info" style="position: fixed; top: 10px; right: 10px; background: rgba(0,0,0,0.7); color: white; padding: 10px; z-index: 9999; display: none;">
  <h4>디버깅 정보</h4>
  <p>pswdChgYn: <c:out value="${pswdChgYn}" /></p>
  <p>pswdResetYn: <c:out value="${pswdResetYn}" /></p>
  <p>loginVO.pswdChgDt: <c:out value="${bemsLogin.pswdChgDt}" /></p>
</div>
<script>
document.getElementById('debug-info').style.display = 'block';
</script>
```
