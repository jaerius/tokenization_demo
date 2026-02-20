# Tokenization Demo Screen Inventory

## 1) Design execution context

- Agent: Design Agent (Agent 3) orchestrated by Agent 5
- Input: `docs/IA.md`, `docs/UserFlow.md`
- Figma MCP status: Not connected in current Cloud runtime

Because Figma MCP is unavailable, this file defines a concrete handoff-ready screen spec that mirrors the intended Figma structure and can be implemented immediately when Figma is connected.

## 2) DSRV-like design direction (requested)

Target style for this demo:

- Dark enterprise console theme
- Left navigation + dense operational tables
- High-contrast status chips and action buttons
- Structured modal workflows for irreversible actions

Proposed base tokens:

- Background: `#0B1220`
- Surface: `#121A2B`
- Border: `#26324A`
- Primary action: `#3B82F6`
- Success: `#22C55E`
- Warning: `#F59E0B`
- Danger: `#EF4444`
- Text primary: `#E5E7EB`
- Text secondary: `#94A3B8`

## 3) Screen inventory

| ID | Screen | IA mapping | Flow mapping | Priority | Status |
|---|---|---|---|---|---|
| SCR-01 | Dashboard | Dashboard | Flow C (start/end) | P1 | Spec completed |
| SCR-02 | Token List | Tokens > Token List | Flow A/C | P0 | Spec completed |
| SCR-03 | Token Detail | Tokens > Token Detail | Flow B/C | P0 | Spec completed |
| SCR-04 | Add Token | Tokens > Add Token | Flow A | P0 | Spec completed |
| SCR-05 | Link Token | Tokens > Link Token | Flow C | P0 | Spec completed |
| SCR-06 | Mint Modal | Token Detail action | Flow B | P0 | Spec completed |
| SCR-07 | Burn Modal | Token Detail action | Flow B | P0 | Spec completed |
| SCR-08 | Transfer Modal | Token Detail action | Flow B | P0 | Spec completed |
| SCR-09 | Smart Contract List | Smart Contracts | Flow C | P1 | Spec completed |
| SCR-10 | Manage Contract | Smart Contracts > Manage | Flow C | P1 | Spec completed |

## 4) Key layout specs per core screen

### SCR-01 Dashboard

- KPI row: total tokens, pending approvals, 24h action count
- Recent activity table: type, token, amount, operator, status, timestamp
- Quick actions: Add Token, Mint, Transfer

### SCR-02 Token List

- Header controls: search, network filter, status filter
- Table columns: token, network, standard, total supply, holders, status, updated_at
- Row action: Open Token Detail

### SCR-03 Token Detail

- Summary card: symbol/name/network/status/current supply
- Action group: Mint, Burn, Transfer
- Tabs: Activity, Holders (optional), Contract info

## 5) Modal interaction specs

| Modal | Required fields | Validation |
|---|---|---|
| Mint | Amount, destination wallet, memo(optional) | amount > 0, wallet required |
| Burn | Amount, source wallet, reason(optional) | amount <= wallet balance |
| Transfer | Amount, source wallet, destination wallet | source != destination |

All modals include:

- Risk acknowledgement line
- Governance state indicator (auto-approve/pending-approval)
- Primary and secondary actions

## 6) Component system checklist

- [x] Button variants: primary/secondary/danger/ghost
- [x] Input variants: default/error/disabled
- [x] Status chips: active/pending/failed/completed
- [x] Data table with pagination and empty state
- [x] Modal shell with shared footer actions

## 7) Figma handoff plan (when MCP is connected)

1. Create pages: `01_Layout`, `02_Screens`, `03_Components`, `04_Flows`
2. Build component set from section 6
3. Assemble screens in section 3 order
4. Link prototype hotspots for Flow A/B/C
5. Export screen links to `docs/INDEX.md`
6. Import fallback table package from `docs/design/figma-table-data.md` and `docs/design/figma-table-data/*.csv`
