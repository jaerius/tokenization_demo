# Cloud Agent 실행용 오케스트레이터 프롬프트

> **사용법**: 아래 프롬프트를 복사하여 Composer 또는 cursor.com/agents에서 **Cloud**를 선택한 뒤 붙여넣고 실행하세요.

---

## 📋 복사할 프롬프트

```
Claude.md를 참고해서 Tokenization Demo 프로젝트의 5-Agent 오케스트레이션을 수행해줘.

Orchestrator Agent(Agent 5) 역할로:
1. Phase 1: Research Agent(Agent 1) 작업 → IA/UX Agent(Agent 2) 작업 → Phase 1 검증
2. Phase 2: Design Agent(Agent 3) 작업 → Phase 2 검증
3. Phase 3: Documentation Agent(Agent 4) 작업 → 최종 품질 리포트

각 단계 산출물은 docs/ 폴더에 저장하고, 의존성 순서를 지켜서 진행해줘.
Notion, Slack, Figma MCP가 연결되어 있으면 해당 에이전트 역할에서 활용해줘.
```

---

## 실행 흐름

| Phase | 에이전트 | 산출물 |
|-------|----------|--------|
| 1 | Research → IA/UX → Orchestrator | docs/research/, docs/IA.md, docs/UserFlow.md, docs/orchestrator/checklist.md |
| 2 | Design → Orchestrator | Figma, docs/design/screen-inventory.md |
| 3 | Documentation → Orchestrator | docs/INDEX.md, docs/spreadsheet-export-spec.md, docs/orchestrator/quality-report.md, gaps.md |

---

## 사전 확인

- [ ] Cloud Agent Setup 완료 (environment.json 푸시됨)
- [ ] GitHub 연결됨
- [ ] MCP 연결 (Notion, Slack, Figma - 선택)
