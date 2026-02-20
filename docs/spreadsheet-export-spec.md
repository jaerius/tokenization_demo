# Spreadsheet Export Specification (Claude.md v2)

## 1) Goal

Provide an export-ready structure for Google Spreadsheet or CSV with two required sheets:

1. IA sheet (section 3 aligned)
2. User Flow sheet (section 4 aligned)

## 2) Workbook definition

- Workbook name: `Tokenization_Demo_IA_and_UserFlow`
- Required sheets:
  - `IA_Sheet`
  - `UserFlow_Sheet`

## 3) IA_Sheet specification

### 3.1 Required columns (exactly 6)

| Column | Description |
|---|---|
| page | Dashboard/Tokens/Smart Contracts/Wallets/Governance/Settings |
| section | Section name in that page |
| included_elements | UI elements to include |
| data_fields | Backing fields |
| notes | Constraints or implementation note |
| priority | P0/P1/P2 |

### 3.2 Minimum row requirement

- Minimum 18 rows (6 pages x average 3 sections)

### 3.3 Sample rows (2+ required)

| page | section | included_elements | data_fields | notes | priority |
|---|---|---|---|---|---|
| Dashboard | Token Overview | KPI cards, distribution chart | total_token_count, total_supply_usd, chain_distribution | top summary zone | P0 |
| Tokens | Token List | search, filter, 8-column table | name, symbol, blockchain_logo, contract_address, total_supply, holding, holders, actions | sortable and pageable | P0 |
| Governance | Policies | policy list and status chips | policy_name, scope_actions, required_approvals, status | read-heavy in MVP | P1 |

## 4) UserFlow_Sheet specification

### 4.1 Required columns (exactly 6)

| Column | Description |
|---|---|
| flow_name | Issue/Link/Mint/Burn/Transfer/Manage Contract/Add Wallet |
| step | Numeric step order |
| screen | Screen name |
| user_action | User behavior in this step |
| system_response | System behavior in this step |
| exception_branch | Error or branch condition |

### 4.2 Minimum row requirement

- Minimum 28 rows (7 flows x average 4 steps)

### 4.3 Sample rows (2+ required)

| flow_name | step | screen | user_action | system_response | exception_branch |
|---|---:|---|---|---|---|
| Issue New Token | 1 | Token List | Click Add Token | Open Add Token Step 1 | - |
| Issue New Token | 5 | Add Token Step 3 | Click Deploy/Issue | Submit transaction and show loading | failure shows retry |
| Transfer | 2 | Transfer Modal | Input source, destination, amount | Validate destination whitelist | block if non-whitelisted |

## 5) CSV export templates

### 5.1 IA_Sheet CSV header

```csv
page,section,included_elements,data_fields,notes,priority
```

### 5.2 UserFlow_Sheet CSV header

```csv
flow_name,step,screen,user_action,system_response,exception_branch
```

## 6) Data quality rules

- IA_Sheet row count must be >= 18.
- UserFlow_Sheet row count must be >= 28.
- `priority` must be one of `P0`, `P1`, `P2`.
- `step` must be positive integers with no duplicates per flow.
- Every flow in UserFlow_Sheet must exist in `docs/UserFlow.md`.
