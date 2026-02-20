# Spreadsheet Export Specification

## 1) Purpose

Define a reproducible spreadsheet structure for handoff and tracking:

- IA sheet (page/section/function/priority mapping)
- User Flow sheet (flow/step/screen mapping)

## 2) Workbook structure

Workbook name: `Tokenization_Demo_IA_and_Flows`

Required sheets:

1. `IA_Map`
2. `User_Flow_Map`
3. `Screen_Mapping` (recommended)
4. `Glossary` (recommended)

## 3) Sheet: IA_Map

### Columns

| Column | Type | Required | Description |
|---|---|---|---|
| page_id | string | Yes | Stable page identifier (e.g. IA-001) |
| page_name | string | Yes | Page name |
| section_name | string | Yes | Section/module name inside page |
| feature_name | string | Yes | Feature/function description |
| priority | enum(P0,P1,P2) | Yes | Implementation priority |
| owner | string | No | Responsible team/person |
| status | enum(planned,in-progress,done) | Yes | Delivery status |
| source_doc | string | Yes | Link to docs file/source |

### Minimum coverage rule

- 10+ rows with distinct page/section combinations
- Must include: Dashboard, Tokens, Smart Contracts, Wallets, Governance, Settings

### Example rows

| page_id | page_name | section_name | feature_name | priority | status | source_doc |
|---|---|---|---|---|---|---|
| IA-001 | Dashboard | KPI Row | Token count and pending approvals | P1 | planned | docs/IA.md |
| IA-002 | Token List | Table | Search/filter/sort token inventory | P0 | planned | docs/IA.md |
| IA-003 | Token Detail | Action Panel | Mint/Burn/Transfer entry | P0 | planned | docs/IA.md |
| IA-004 | Add Token | Form | Create token metadata/network | P0 | planned | docs/IA.md |
| IA-005 | Link Token | Form | Link existing contract | P0 | planned | docs/IA.md |
| IA-006 | Smart Contracts | Contract Table | Contract status and owner | P1 | planned | docs/IA.md |
| IA-007 | Manage Contract | Config Panel | Basic contract management | P1 | planned | docs/IA.md |
| IA-008 | Wallets | Wallet Table | Source/destination mapping | P1 | planned | docs/IA.md |
| IA-009 | Governance | Approval Queue | Pending action approvals | P1 | planned | docs/IA.md |
| IA-010 | Settings | Config | Network/environment config | P2 | planned | docs/IA.md |

## 4) Sheet: User_Flow_Map

### Columns

| Column | Type | Required | Description |
|---|---|---|---|
| flow_id | string | Yes | Stable flow identifier (e.g. FL-001) |
| flow_name | string | Yes | Flow title |
| step_no | integer | Yes | Step order |
| step_name | string | Yes | Step description |
| actor | string | Yes | User/system actor |
| source_screen | string | Yes | Start/current screen |
| target_screen | string | Yes | Next screen |
| decision_point | string | No | Branch condition |
| notes | string | No | Additional note |
| source_doc | string | Yes | Link to docs file/source |

### Minimum coverage rule

- 3+ distinct flows
- Every flow includes step-by-step screen mapping

### Example rows

| flow_id | flow_name | step_no | step_name | actor | source_screen | target_screen | source_doc |
|---|---|---:|---|---|---|---|---|
| FL-001 | Issue New Token | 1 | Open Add Token | Operator | Token List | Add Token | docs/UserFlow.md |
| FL-001 | Issue New Token | 2 | Enter token data | Operator | Add Token | Add Token | docs/UserFlow.md |
| FL-001 | Issue New Token | 3 | Submit and redirect | System | Add Token | Token Detail | docs/UserFlow.md |
| FL-002 | Lifecycle Action | 1 | Open action modal | Operator | Token Detail | Mint/Burn/Transfer Modal | docs/UserFlow.md |
| FL-002 | Lifecycle Action | 2 | Confirm operation | Operator | Modal | Token Detail | docs/UserFlow.md |
| FL-003 | End-to-End Journey | 1 | Review dashboard | Operator | Dashboard | Token List | docs/UserFlow.md |
| FL-003 | End-to-End Journey | 2 | Execute token actions | Operator | Token Detail | Token Detail | docs/UserFlow.md |
| FL-003 | End-to-End Journey | 3 | Verify governance state | Operator | Governance | Dashboard | docs/UserFlow.md |

## 5) Optional sheet: Screen_Mapping

| Column | Description |
|---|---|
| screen_id | Screen identifier (SCR-001 style) |
| screen_name | Name from `docs/design/screen-inventory.md` |
| ia_page | Linked IA page |
| flow_ids | Comma-separated flow IDs |
| figma_link | Figma URL when available |
| status | planned/in-design/done |

## 6) Data quality checks

- No duplicate `(flow_id, step_no)` combinations
- Every `source_doc` points to an existing markdown file
- P0 items must have at least one linked flow step
- Every screen in inventory maps to at least one IA page
