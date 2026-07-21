+++
title = "URL 입력 시 네트워크·렌더링 과정"
date = 2022-05-25T08:42:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "TECH"]
tags = ["WEB", "NETWORK", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "0f09870a-8079-4f30-aef7-01f7e20c9e17"
notion_url = "https://app.notion.com/p/URL-0f09870a80794f30aef701f7e20c9e17"
external_url = "https://velog.io/@tnehd1998/%EC%A3%BC%EC%86%8C%EC%B0%BD%EC%97%90-www.google.com%EC%9D%84-%EC%9E%85%EB%A0%A5%ED%96%88%EC%9D%84-%EB%95%8C-%EC%9D%BC%EC%96%B4%EB%82%98%EB%8A%94-%EA%B3%BC%EC%A0%95"
+++

## URL 입력 → 화면 출력 흐름

### 1. 네트워크 (데이터 수신)

1. **DNS 캐시** 확인 → 없으면 Local DNS에 Recursive Query (`.` → `com` → `google.com`)
1. 얻은 IP로 **TCP 3-way handshake** (SYN → SYN+ACK → ACK)
1. **HTTP(S) 요청** → Web Server(정적) / WAS(동적) / DB
1. 응답 + Status (1xx~5xx) 수신 → 필요 시 **4-way** 종료 (FIN/ACK, TIME\_WAIT)

```bash
# DNS / 연결 점검 예
nslookup www.google.com
dig www.google.com
curl -vI https://www.google.com
```

### 2. Critical Rendering Path

| 단계 | 내용 |
| --- | --- |
| DOM | HTML 바이트→문자→토큰→노드→트리 |
| CSSOM | CSS 동일 파싱 |
| Render Tree | DOM+CSSOM (표시 노드만) |
| Layout | 위치·크기 |
| Paint | 픽셀 그리기 |
| Composite | transform/opacity 등 레이어 합성 |

- **Reflow**: 레이아웃 재계산 → 보통 Repaint 동반
- **Repaint만**: `background-color`, `visibility` 등
- 최적화: Reflow/Repaint 최소화
