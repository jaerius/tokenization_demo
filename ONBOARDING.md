# 기획자 협업 온보딩 가이드

> Cursor + Talk to Figma MCP로 와이어프레임을 함께 만드는 방법

---

## 세팅 (최초 1회, 10분)

### 1. Cursor 설치
- [cursor.com](https://cursor.com) → 다운로드 → 설치 → GitHub 로그인

### 2. 프로젝트 가져오기
터미널(`` Ctrl+` ``)에서:
```bash
cd ~/Desktop
git clone https://github.com/jaerius/tokenization_demo.git
```
Cursor에서 **File > Open Folder** → `tokenization_demo` 선택

### 3. Figma 플러그인 설치
1. Figma Desktop App 실행
2. 프로젝트 파일 열기 (링크는 Slack에서 공유)
3. 플러그인 검색 → **"Cursor Talk to Figma"** 설치

---

## 매일 작업 시작할 때

```bash
./sync.sh pull
```
이 한 줄로 팀의 최신 문서를 받아옵니다.

---

## Figma 와이어프레임 작업 방법

### Zone 방식으로 작업합니다

같은 Figma 페이지 안에서 **좌표로 영역을 나눠서** 각자 작업합니다.

```
같은 Figma 페이지

y=0 ──────────────────────
  🟦 나의 Zone (y: 0 ~ 5000)
  여기서 작업
y=6000 ─────────────────── (빈 공간)
  🟧 동료 Zone (y: 8000 ~ 13000)
  동료가 여기서 작업
y=14000 ──────────────────  (빈 공간)
  🟩 Main Zone (y: 16000 ~)
  확정본이 여기로 옮겨짐
```

**규칙 3가지:**
1. **자기 Zone에서만 작업** — 동료 Zone에 들어가지 않기
2. **완성되면 Main Zone으로 이동** — Cursor에 "Main으로 옮겨줘" 라고 말하면 AI가 자동 복사
3. **screen-inventory.md 확인** — 누가 어떤 화면을 작업 중인지 상태가 적혀있음

### 작업 시작하기

1. Figma에서 프로젝트 파일 열기
2. **"Cursor Talk to Figma" 플러그인** 실행
3. 플러그인에 표시되는 **채널 ID** 복사 (예: `abc123`)
4. Cursor 채팅에서:

```
피그마 채널 abc123에 연결해줘
```

5. 이제 Cursor에 자연어로 요청하면 됩니다:

| 하고 싶은 일 | Cursor에 이렇게 말하세요 |
|-------------|------------------------|
| 새 화면 만들기 | "Token List 화면 만들어줘. 내 Zone(y=0~5000)에" |
| 기존 화면 수정 | "SCR-03에 Pause 버튼 추가해줘" |
| 확정하기 | "SCR-03 완성됐어. Main Zone(y=16000)으로 옮겨줘" |
| 현재 상태 보기 | "지금 Figma 파일 구조 보여줘" |

### 자기 Zone 좌표 확인

처음 시작할 때 팀과 Zone 배정을 확인하세요:

| 사람 | Zone 범위 | 비고 |
|------|-----------|------|
| (이름 1) | y: 0 ~ 5000 | |
| (이름 2) | y: 8000 ~ 13000 | |
| Main (확정본) | y: 16000 ~ | AI가 clone_node로 복사 |

---

## 작업 끝날 때

```bash
./sync.sh all
```
저장 메모를 입력하라고 나오면 간단히 적으면 됩니다 (예: "Dashboard 수정").

---

## 꼭 알아야 할 문서 3개

| 문서 | 뭐가 적혀있나 | 언제 보나 |
|------|-------------|----------|
| `docs/IA.md` | 각 화면에 뭐가 들어가야 하는지 | 새 화면 만들기 전에 |
| `docs/UserFlow.md` | 화면 간 이동 흐름 | 플로우 확인할 때 |
| `docs/design/screen-inventory.md` | 화면 목록 + Figma Frame ID | 작업 현황 볼 때 |

Cursor AI는 이 문서들을 자동으로 참고합니다. "Dashboard에 뭐 넣어야 해?"라고 물어보면 IA.md를 읽고 답해줍니다.

---

## sync.sh 명령어

| 명령어 | 하는 일 |
|--------|--------|
| `./sync.sh pull` | 최신 받기 |
| `./sync.sh save` | 내 작업 저장 |
| `./sync.sh push` | 팀에 공유 |
| `./sync.sh all` | 위 3개 한번에 |
| `./sync.sh status` | 현재 상태 확인 |

## 문제 발생 시

| 상황 | 해결 |
|------|------|
| sync.sh에서 에러 | Cursor 채팅에 "sync 에러 해결해줘" |
| Figma 연결 안 됨 | 플러그인 재실행 → 새 채널 ID로 다시 연결 |
| 뭘 수정했는지 모르겠음 | `./sync.sh status` |
| 동료랑 같은 화면 건드림 | screen-inventory.md에서 상태 확인, 겹치면 대화로 조율 |
