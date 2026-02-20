# Orchestrator Checklist (Agent 5)

## Dependency order compliance

- [x] Research completed before IA/UX
- [x] IA/UX completed before Design
- [x] Design completed before Documentation
- [x] Phase-based validation applied after each handoff

## Phase 1 gate: Research -> IA/UX -> Validation

### Agent 1 output check

- [x] `docs/research/requirements-summary.md` created
- [x] Fireblocks research documented
- [x] Market comparison (3+ products) documented
- [ ] Notion 3+ pages collected via MCP
- [ ] Slack 10+ messages collected via MCP

### Agent 2 output check

- [x] `docs/IA.md` created
- [x] `docs/UserFlow.md` created
- [x] Required IA sections included (Dashboard, Tokens, Smart Contracts, Wallets, Governance, Settings)
- [x] User flows >= 3 and Mermaid-renderable
- [x] MVP scope explicitly stated

### Phase 1 validation result

- Status: **PASS WITH GAPS**
- Reason: IA/UX artifacts are complete and consistent with available research, but MCP-dependent Notion/Slack evidence remains pending.

## Phase 2 gate: Design -> Validation

- [x] `docs/design/screen-inventory.md` created
- [ ] Figma MCP sync evidence attached
- [x] IA <-> screen inventory mapping validated

### Phase 2 validation result

- Status: **PASS WITH GAPS**
- Reason: Screen inventory fully maps IA and user flows, but live Figma artifact validation is pending until MCP connection is available.

## Phase 3 gate: Documentation -> Final QA

- [x] `docs/INDEX.md` created
- [x] `docs/spreadsheet-export-spec.md` created
- [x] `docs/orchestrator/quality-report.md` created
- [x] `docs/orchestrator/gaps.md` created

### Phase 3 validation result

- Status: **PASS**
- Reason: Documentation package is complete and linked, with final QA and gaps list published.
