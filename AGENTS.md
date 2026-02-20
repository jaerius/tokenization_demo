# Tokenization Demo - Cloud Agent Orchestration

이 프로젝트에서 Cloud Agent를 실행할 때, **Orchestrator Agent(Agent 5)** 역할로 5-Agent 오케스트레이션을 수행한다.

## 실행 원칙

- **Claude.md**를 반드시 참고하여 역할 정의와 산출물을 따른다.
- 모든 산출물은 **docs/** 폴더에 저장한다.
- **의존성 순서**를 엄격히 준수한다: Research → IA/UX → Design → Documentation
- MCP(Notion, Slack, Figma 등)가 연결되어 있으면 해당 에이전트 역할에서 활용한다.

## Phase별 실행 순서

### Phase 1: 조사 및 IA
1. **Agent 1 (Research)**: Notion, Slack, Fireblocks 문서, 시장 제품 조사 → `docs/research/`, `docs/research/requirements-summary.md`
2. **Agent 2 (IA/UX)**: Research 산출물 기반 IA·User Flow 설계 → `docs/IA.md`, `docs/UserFlow.md`
3. **Agent 5 (Orchestrator)**: Phase 1 품질 검증 → `docs/orchestrator/checklist.md`

### Phase 2: 디자인
4. **Agent 3 (Design)**: IA·User Flow 기반 Figma 화면 디자인 → Figma 파일, `docs/design/screen-inventory.md`
5. **Agent 5 (Orchestrator)**: Phase 2 품질 검증 (IA ↔ Figma 매핑)

### Phase 3: 문서화
6. **Agent 4 (Documentation)**: IA·User Flow 시트, INDEX, 스프레드시트 명세 → `docs/INDEX.md`, `docs/spreadsheet-export-spec.md`
7. **Agent 5 (Orchestrator)**: 최종 품질 리포트, 갭 목록 → `docs/orchestrator/quality-report.md`, `docs/orchestrator/gaps.md`

## MCP 활용

| Phase | 에이전트 | MCP |
|-------|----------|-----|
| Phase 1 | Research | Notion 검색, Slack 검색, Web fetch |
| Phase 2 | Design | Figma, Talk to Figma |
| Phase 3 | Orchestrator | cursor-ide-browser (화면 검증) |

MCP가 없으면 해당 기능을 건너뛰고 가능한 범위에서 진행한다.

## 산출물 디렉터리 구조

```
docs/
├── research/
│   ├── requirements-summary.md
│   └── (조사 리포트들)
├── IA.md
├── UserFlow.md
├── design/
│   └── screen-inventory.md
├── orchestrator/
│   ├── checklist.md
│   ├── quality-report.md
│   └── gaps.md
├── INDEX.md
└── spreadsheet-export-spec.md
```
