+++
title = "yt-dlp 설치·다운로드"
date = 2021-04-14T08:03:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "TECH"]
tags = ["MACOS", "LINUX", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "3d97e840-9ea3-48b2-8726-5910973bedbb"
notion_url = "https://app.notion.com/p/yt-dlp-3d97e8409ea348b287265910973bedbb"
external_url = "https://github.com/yt-dlp/yt-dlp"
+++

# yt-dlp

## 설치

```bash
pip install -U yt-dlp
brew install yt-dlp   # macOS
```

## 동영상 인코딩 포맷 확인

```bash
yt-dlp -F https://youtu.be/영상ID
```

## 개별 동영상 다운로드

```bash
# 비디오+오디오 병합(mp4)
yt-dlp -f 247+140 --merge-output-format mp4 https://youtu.be/영상ID

# 자동 최고화질(mp4)
yt-dlp -f "bv*+ba" --merge-output-format mp4 https://youtu.be/영상ID
```

## 재생목록 전체 다운로드

```bash
yt-dlp -f "bv*+ba" --merge-output-format mp4 https://www.youtube.com/playlist?list=플레이리스트ID
```

## 실시간(라이브) 저장

```bash
yt-dlp -v https://www.youtube.com/watch?v=영상ID
yt-dlp --hls-prefer-native https://youtube.com/live/...   # 라이브 스트림용 플래그
```

## 화질 지정 + 전체 예시

```bash
yt-dlp -f "bv*+ba/b" -S "res:720,ext:mp4:m4a" --merge-output-format mp4 \
"https://www.youtube.com/playlist?list=플레이리스트ID"
```

---

### (구) youtube-dl 참고용

```bash
youtube-dl -F https://youtu.be/영상ID              # 포맷 확인
youtube-dl -f 247+140 --recode-video mp4 주소       # 저장
youtube-dl -v https://youtu.be/영상ID               # 실시간 저장
```
