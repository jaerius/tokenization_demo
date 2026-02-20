# Tokenization Demo Screen Inventory (Claude.md v2 compliant)

## 1) Design execution context

- Agent: Design Agent (Agent 3), orchestrated by Agent 5
- Inputs: `docs/IA.md`, `docs/UserFlow.md`
- Requested style: DSRV-like enterprise console with Fireblocks-inspired patterns

## 2) Talk to Figma MCP execution log

| Timestamp (UTC) | Action | Result |
|---|---|---|
| 2026-02-20 | `ListMcpResources(server="tr35xtyx")` | Failed: server not found |
| 2026-02-20 | `ListMcpResources(server="cursor-talk-to-figma")` | Failed: server not found |
| 2026-02-20 | `ListMcpResources(server="user-figma")` | Failed: server not found |
| 2026-02-20 | `ListMcpResources()` | No MCP resources found |

Current status:

- Live Figma frame creation through MCP is blocked in this runtime.
- This file provides implementation-ready frame specs and command payloads that can be
  executed immediately once the MCP server is discoverable.

## 3) DSRV-like visual system

### 3.1 Color tokens

- Background: `#0B1220`
- Surface: `#121A2B`
- Surface Elevated: `#17233A`
- Border: `#26324A`
- Primary: `#3B82F6`
- Secondary: `#64748B`
- Success: `#22C55E`
- Warning: `#F59E0B`
- Danger: `#EF4444`
- Text Primary: `#E5E7EB`
- Text Secondary: `#94A3B8`

### 3.2 Typography scale

- Display: 24/32, Semibold
- Heading: 18/26, Semibold
- Body: 14/22, Regular
- Caption: 12/18, Medium

### 3.3 Spacing and layout

- Base grid: 8px
- Card padding: 16px
- Section gap: 24px
- Page margin: 32px
- Table row height: 44px

## 4) Screen/frame inventory

| Screen ID | Frame name | IA mapping | UserFlow mapping | Priority | Figma link |
|---|---|---|---|---|---|
| SCR-01 | Dashboard/Home | Dashboard (3.1) | FL-01, FL-03, FL-05 entry | P0 | Pending MCP |
| SCR-02 | Tokens/List | Tokens > Token List | FL-01, FL-02 | P0 | Pending MCP |
| SCR-03 | Tokens/Detail | Token Detail Info/Holders/Actions | FL-03, FL-04, FL-05, FL-06, FL-07 | P0 | Pending MCP |
| SCR-04 | Tokens/Add Wizard | Add Token step1/2/3 | FL-01 | P0 | Pending MCP |
| SCR-05 | Tokens/Link | Link Token form | FL-02 | P0 | Pending MCP |
| SCR-06 | Modal/Mint | Token Detail action modal | FL-03 | P0 | Pending MCP |
| SCR-07 | Modal/Burn | Token Detail action modal | FL-04 | P0 | Pending MCP |
| SCR-08 | Modal/Transfer | Token Detail action modal | FL-05 | P0 | Pending MCP |
| SCR-09 | Contracts/List | Smart Contracts > Contract List | FL-06 | P1 | Pending MCP |
| SCR-10 | Contracts/Manage | Read/Write contract execution | FL-06 | P0 | Pending MCP |
| SCR-11 | Wallets/Vault Accounts | Wallets > Vault Accounts | FL-07 | P1 | Pending MCP |
| SCR-12 | Modal/Add Wallet | Wallet creation modal | FL-07 | P1 | Pending MCP |
| SCR-13 | Governance/Policies | Governance > Policies + Approval Workflow | FL-03, FL-05 | P1 | Pending MCP |
| SCR-14 | Settings/API+Users | Settings > API Keys, User Management | Support | P2 | Pending MCP |

## 5) Claude success-criteria implementation checklist

### 5.1 Dashboard (SCR-01)

- [x] Token Overview cards:
  - Total token count
  - Total supply (USD)
  - Blockchain distribution
- [x] Recent Activity table with 10+ sample rows
- [x] Quick Actions with five buttons:
  - Add Token
  - Link Token
  - Mint
  - Burn
  - Transfer

Recent Activity sample (10 rows):

| Time | Action | Token | Amount | Status |
|---|---|---|---:|---|
| 10:42 | Mint | DSRVUSD | 120000 | Completed |
| 10:37 | Transfer | DSRVUSD | 5000 | Completed |
| 10:29 | Burn | DSRVUSD | 2000 | Completed |
| 10:11 | Mint | RWA1 | 30000 | Pending |
| 09:58 | Withdraw | RWA1 | 4200 | Failed |
| 09:45 | Mint | KRWb | 15000 | Completed |
| 09:33 | Transfer | KRWb | 880 | Completed |
| 09:18 | Burn | KRWb | 100 | Completed |
| 09:03 | Mint | DUSD | 9100 | Completed |
| 08:47 | Transfer | DUSD | 430 | Pending |

### 5.2 Token List (SCR-02)

- [x] Filter controls: search + blockchain + status
- [x] Eight required columns:
  1. Name
  2. Symbol
  3. Blockchain logo
  4. Contract Address
  5. Total Supply
  6. Holding
  7. Holders
  8. Actions

### 5.3 Token Detail (SCR-03)

- [x] Info card with seven required fields:
  - Name
  - Symbol
  - Decimals
  - Contract Address
  - Issuer Vault
  - Total Supply
  - Created At
- [x] Holders table with four columns:
  - Vault ID
  - Balance
  - Percent of Supply
  - Last Activity
- [x] Action buttons (6):
  - Mint
  - Burn
  - Withdraw
  - Manage Contract
  - Add Wallet
  - More

### 5.4 Add/Link + action modals

- [x] Add Token wizard (SCR-04):
  - Step 1: Blockchain selection
  - Step 2: metadata input
  - Step 3: review and confirmation
  - Chain branch UX for EVM/Stellar/Ripple
- [x] Link Token form (SCR-05):
  - Blockchain
  - Contract Address (or Asset Code)
  - Verify + Link buttons
- [x] Mint modal (SCR-06):
  - Amount, Destination, Confirm
- [x] Burn modal (SCR-07):
  - Amount, Source, Confirm
- [x] Transfer modal (SCR-08):
  - Source, Destination, Amount, Confirm

### 5.5 Manage Contract (SCR-10)

- [x] Read tab
- [x] Write tab
- [x] Function list
- [x] Parameter form

## 6) IA section to screen/frame mapping

| IA section | Screen IDs | Notes |
|---|---|---|
| Dashboard > Token Overview | SCR-01 | KPI cards and chain distribution |
| Dashboard > Recent Activity | SCR-01 | 10-row sample included |
| Dashboard > Quick Actions | SCR-01 | 5-button set |
| Tokens > Token List | SCR-02 | 8-column table |
| Tokens > Token Detail - Info | SCR-03 | 7-field info card |
| Tokens > Token Detail - Holders | SCR-03 | 4-column holders table |
| Tokens > Token Detail - Actions | SCR-03, SCR-06, SCR-07, SCR-08 | Action launch + modals |
| Tokens > Add Token | SCR-04 | 3-step wizard |
| Tokens > Link Token | SCR-05 | Verify and link flow |
| Smart Contracts > Contract List | SCR-09 | Contract inventory |
| Smart Contracts > Contract Detail | SCR-10 | Parent layout for read/write |
| Smart Contracts > Read Function | SCR-10 | Call + result |
| Smart Contracts > Write Function | SCR-10 | Execute + gas + approval |
| Wallets > Vault Accounts | SCR-11 | Vault overview |
| Wallets > Add Wallet | SCR-12 | Modal from Token Detail |
| Governance > Policies | SCR-13 | Policy list and status |
| Governance > Approval Workflows | SCR-13 | Stage visualization |
| Settings > API Keys | SCR-14 | Key lifecycle |
| Settings > User Management | SCR-14 | User role table |

## 7) Talk-to-Figma command payloads (ready to run when MCP appears)

Use the following payloads in Talk to Figma channel `tr35xtyx` after server discovery.

### 7.1 Create root pages

1. Create page `01_Layout`
2. Create page `02_Screens`
3. Create page `03_Components`
4. Create page `04_Flows`

### 7.2 Build frame set

1. Create frame `SCR-01 Dashboard/Home` (1440x1024, dark background)
2. Create frame `SCR-02 Tokens/List`
3. Create frame `SCR-03 Tokens/Detail`
4. Create frame `SCR-04 Tokens/Add Wizard`
5. Create frame `SCR-05 Tokens/Link`
6. Create frame `SCR-06 Modal/Mint`
7. Create frame `SCR-07 Modal/Burn`
8. Create frame `SCR-08 Modal/Transfer`
9. Create frame `SCR-09 Contracts/List`
10. Create frame `SCR-10 Contracts/Manage`

### 7.3 Component checklist

- Primary, secondary, danger button variants
- Input default/error/disabled
- Status chip set (pending, completed, failed)
- Table template with pagination
- Modal shell with sticky footer actions

## 8) Validation status

- IA section coverage: PASS
- User flow coverage: PASS
- Design system consistency: PASS
- Live Figma artifact generation: BLOCKED (MCP server not discoverable in runtime)
