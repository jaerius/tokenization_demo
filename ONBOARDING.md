# 동료 온보딩 가이드

> 이 프로젝트에 처음 참여하는 분을 위한 안내입니다.
> git에 익숙하지 않아도 괜찮습니다.

---

## 1단계: Cursor 설치

1. [cursor.com](https://cursor.com)에서 Cursor 다운로드 및 설치
2. 설치 후 실행, GitHub 계정으로 로그인

## 2단계: 프로젝트 가져오기 (최초 1회)

Cursor 터미널(`` Ctrl+` ``)을 열고 아래 명령어를 복사-붙여넣기:

```bash
cd ~/Desktop
git clone https://github.com/jaerius/tokenization_demo.git
```

그 다음 Cursor에서 **File > Open Folder** → `Desktop/tokenization_demo` 선택

## 3단계: 작업 시작 전 매번

터미널에서:
```bash
./sync.sh pull
```
이렇게 하면 팀의 최신 변경사항을 받아옵니다.

## 4단계: 작업하기

Cursor 채팅창에 자연어로 요청하면 됩니다:

| 하고 싶은 일 | Cursor에 이렇게 말하세요 |
|-------------|------------------------|
| IA 문서 수정 | "IA.md에서 Dashboard 섹션에 알림 위젯 추가해줘" |
| 와이어프레임 요청 | "Token Detail 화면에 Pause 버튼 추가하는 명세서 작성해줘" |
| 현재 상태 확인 | "지금 screen-inventory.md 보여줘" |
| 저장하고 공유 | "저장해줘" 또는 "올려줘" |

## 5단계: 작업 끝날 때

터미널에서:
```bash
./sync.sh all
```
이 한 줄이면 저장 + 공유가 됩니다.

---

## sync.sh 사용법

| 명령어 | 하는 일 |
|--------|--------|
| `./sync.sh pull` | 최신 변경사항 받기 |
| `./sync.sh save` | 내 작업 저장하기 |
| `./sync.sh push` | 저장한 내용 팀에 공유하기 |
| `./sync.sh all` | 위 3가지 한번에 |
| `./sync.sh status` | 현재 상태 보기 |

## Figma 작업을 하는 경우 (선택)

Figma 화면을 직접 수정하려면 추가 세팅이 필요합니다:

1. Figma Desktop App 설치 및 실행
2. Figma 파일 열기 (링크는 팀에서 공유)
3. Figma 플러그인 검색에서 **"Cursor Talk to Figma"** 설치 및 실행
4. 플러그인에 표시되는 **채널 ID**를 메모
5. Cursor 채팅에서: "피그마 채널 [채널ID]에 연결해줘"

## 문제가 생겼을 때

| 상황 | 해결 방법 |
|------|----------|
| `./sync.sh pull`에서 충돌 | Cursor 채팅에 "충돌 해결해줘" |
| 뭘 수정했는지 모르겠음 | `./sync.sh status` |
| 실수로 파일을 지움 | Cursor 채팅에 "방금 지운 파일 복구해줘" |
| 아무것도 모르겠음 | Cursor 채팅에 "도와줘" |

## 프로젝트 구조

```
tokenization_demo/
├── CLAUDE.md          ← AI 에이전트 역할 정의 (수정 X)
├── AGENTS.md          ← 오케스트레이션 규칙 (수정 X)
├── ONBOARDING.md      ← 이 문서
├── sync.sh            ← 동기화 도구
├── .cursor/rules/     ← Cursor AI 규칙 (자동 적용)
└── docs/
    ├── IA.md          ← 정보 구조 (Information Architecture)
    ├── UserFlow.md    ← 사용자 플로우
    ├── research/      ← 리서치 산출물
    ├── design/        ← 디자인 산출물 + Figma 매핑
    └── orchestrator/  ← 품질 검증 문서
```
