# Orchestrator Checklist (Agent 5, Claude.md v2)

## 1) Phase gate dependency rules

- [x] Rule A: Phase 1 must complete before Phase 2 starts.
- [x] Rule B: Phase 2 must complete before Phase 3 starts.
- [x] Rule C: Validation report required at each phase boundary.

### 1.1 Hard gate for Phase 1 completion

Phase 2 can start only if all are true:

- [x] `docs/research/requirements-summary.md` exists.
- [x] `docs/IA.md` exists.
- [x] `docs/UserFlow.md` exists.

## 2) Phase 1 checklist (Research -> IA/UX)

### 2.1 Agent 1 (Research) checks

- [x] R-01 Research folder exists under `docs/research/`.
- [x] R-02 Fireblocks notes document exists.
- [x] R-03 Market comparison document exists.
- [x] R-04 Requirements summary document exists.
- [x] R-05 Market comparison includes Securitize.
- [x] R-06 Market comparison includes Bridge.
- [x] R-07 Market comparison includes Fireblocks.
- [x] R-08 Market comparison includes columns: scope, asset, collateral/reserve, lifecycle.
- [ ] R-09 Notion root + 2 subpages fetched with MCP evidence.
- [ ] R-10 Slack 10+ messages collected with channel/date/summary/category.
- [x] R-11 Competitor deep research document exists.
- [x] R-12 Competitive gap analysis document exists.

### 2.2 Agent 2 (IA/UX) checks

- [x] U-01 IA includes 6 mandatory domains.
- [x] U-02 IA section mapping follows Claude section 3 structure.
- [x] U-03 IA includes data fields at section level.
- [x] U-04 UserFlow includes 7 mandatory flows + competitive extension flow.
- [x] U-05 Each flow has 5-column step table.
- [x] U-06 Mermaid diagrams count is 7 or more.
- [x] U-07 Flow-to-IA screen mapping exists.
- [x] U-08 Error scenario matrix exists.
- [x] U-09 MVP scope has P0 vs P1 split.
- [x] U-10 Combined line count target for IA + UserFlow is met (verified separately).

### 2.3 Phase 1 verdict

- Status: **PASS WITH GAPS**
- Gaps: R-09, R-10 (MCP collection pending)

## 3) Phase 2 checklist (Design)

### 3.1 Agent 3 (Design) checks

- [x] D-01 `docs/design/screen-inventory.md` exists.
- [x] D-02 Dashboard section includes Token Overview definition.
- [x] D-03 Dashboard includes Recent Activity table with 10+ sample rows.
- [x] D-04 Dashboard includes 5 Quick Action buttons.
- [x] D-05 Token List includes required 8 columns.
- [x] D-06 Token Detail includes 7 info fields.
- [x] D-07 Token Detail includes 4-column Holders table.
- [x] D-08 Token Detail includes 6 action buttons.
- [x] D-09 Add Token 3-step form is defined.
- [x] D-10 EVM/Stellar/Ripple branching behavior is defined.
- [x] D-11 Link Token verify/link behavior is defined.
- [x] D-12 Mint/Burn/Transfer modal fields are defined.
- [x] D-13 Manage Contract read/write UI is defined.
- [x] D-14 IA section to screen mapping table exists.
- [x] D-15 Design system includes primary/secondary colors.
- [x] D-16 Design system includes 2+ typography levels.
- [x] D-17 Design system includes 8px spacing rule.
- [x] D-18 Screen-to-screen transition map exists.
- [x] D-19 Program selector and collateral-aware mint screens are defined.
- [x] D-20 Redemption queue and reserve transparency screen definitions exist.
- [ ] D-21 Live Figma frame URLs attached.

### 3.2 Phase 2 verdict

- Status: **PASS WITH GAPS**
- Gaps: D-21 live frame URLs attached (Figma MCP server discovery pending)

## 4) Phase 3 checklist (Documentation + Orchestrator QA)

### 4.1 Agent 4 (Documentation) checks

- [x] M-01 `docs/INDEX.md` exists.
- [x] M-02 INDEX includes research/IA/UserFlow/design/orchestrator/spreadsheet links.
- [x] M-03 `docs/spreadsheet-export-spec.md` exists.
- [x] M-04 IA sheet columns defined (6 columns).
- [x] M-05 User Flow sheet columns defined (6 columns).
- [x] M-06 Sample rows are included (2+ rows each).
- [x] M-07 Minimum row requirements (18 IA, 28 UserFlow) are documented.
- [x] M-08 CSV export header format is provided.

### 4.2 Agent 5 (Orchestrator QA) checks

- [x] O-01 `docs/orchestrator/checklist.md` exists.
- [x] O-02 Checklist contains 20+ validation items.
- [x] O-03 `docs/orchestrator/quality-report.md` exists.
- [x] O-04 Quality report contains IA-to-design mapping table.
- [x] O-05 Quality report contains flow-to-design mapping table.
- [x] O-06 `docs/orchestrator/gaps.md` exists.
- [x] O-07 Gap list uses priority labels P0/P1/P2.
- [x] O-08 Gap count is 5 or fewer.

### 4.3 Phase 3 verdict

- Status: **PASS**
- Notes: Documentation and QA package complete; unresolved MCP-dependent evidence tracked in gaps.

## 5) Final orchestration verdict

- Overall: **CONDITIONALLY READY**
- Condition for full sign-off:
  - Resolve Notion/Slack MCP evidence collection
  - Resolve Figma MCP server discovery and attach live frame links
