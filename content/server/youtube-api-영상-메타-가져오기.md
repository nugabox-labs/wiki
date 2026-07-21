+++
title = "YouTube API 영상 메타 가져오기"
date = 2022-07-11T16:47:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "FRONT-END"]
tags = ["JS", "WEB", "HTML"]
toc = true

[extra]
source = "notion"
notion_id = "2e8ae7cf-151f-4bd9-8fed-444774bd5e73"
notion_url = "https://app.notion.com/p/YouTube-API-2e8ae7cf151f4bd98fed444774bd5e73"
external_url = "https://hoyashu.tistory.com/104"
+++

## YouTube Data API v3 — 영상 snippet

```html
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
var videoId = 'VIDEO_ID'; // watch?v=
$.get('https://www.googleapis.com/youtube/v3/videos', {
  part: 'snippet',
  maxResults: 50,
  id: videoId,
  key: 'YOUR_API_KEY'
}, function (data) {
  $.each(data.items, function (i, item) {
    var t = item.snippet.title;
    var d = item.snippet.description;
    var thumb = item.snippet.thumbnails.standard
      ? item.snippet.thumbnails.standard.url
      : item.snippet.thumbnails.default.url;
    $('#results').append(
      '<li>' + t + '<br>' + d + '<br><img src="' + thumb + '"></li>'
    );
  });
});
</script>
<ul id="results"></ul>
```

`maxResults` ≤ 50. API 키는 Google Cloud Console에서 발급.
