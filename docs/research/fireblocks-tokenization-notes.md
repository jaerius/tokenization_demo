# Fireblocks Tokenization Notes

## 1) Why Fireblocks is relevant for this demo

Fireblocks provides enterprise-grade wallet and asset operation primitives that align with tokenization demo needs:

- Token issuance workflows
- Asset lifecycle operations
- Policy and approval controls
- Operational visibility

## 1.1) Scope note for this project

- This document uses **public Fireblocks developer docs** as baseline references:
  - Tokenization overview: `https://developers.fireblocks.com/docs/tokenization`
  - Tokenize Assets guide: `https://developers.fireblocks.com/docs/issue-new-tokens`
  - Issue ERC20F: `https://developers.fireblocks.com/reference/issue-new-erc-20f-tokens`
  - Issue ERC721F/ERC1155F: `https://developers.fireblocks.com/reference/issue-new-erc721ferc1155f-tokens`
- **Out of scope** for current phase: deep policy-engine rule design (moved to an upper module).
- **In scope**: token lifecycle UX, token type/backing/issuance params, wallet ops detail, risk-control surface, approval queue operations, monitoring/alerts.

## 2) Capability mapping for demo flows


| Capability area  | Demo implication                        | MVP usage               |
| ---------------- | --------------------------------------- | ----------------------- |
| Issue new tokens | Create token contract or register token | Required                |
| Mint             | Increase circulating supply             | Required                |
| Burn             | Decrease circulating supply             | Required                |
| Transfer         | Move assets across wallets/accounts     | Required                |
| Policy controls  | Approval and risk constraints           | Read-only or simplified |
| Audit trail      | Track lifecycle events and operators    | Required                |

## 2.1) Fireblocks baseline capabilities (public docs)

| Capability area | Fireblocks evidence | What it implies for UI |
|---|---|---|
| Token lifecycle core | Tokenization + Tokenize Assets docs mention issue/link, mint, burn, transfer, lifecycle management | Lifecycle stages should be explicit on screens, not only hidden behind actions |
| Token type selection | ERC20F and ERC721F/ERC1155F issuance references | Add Token needs token standard/type selector and conditional form branches |
| Contract/template/roles | ERC20F guide shows template IDs, deploy params, admin/minter/pauser role setup | Issuance flow needs advanced setup step (template, roles, deploy authority) |
| Backing asset semantics | Tokenize Assets guide describes tokenizing fiat/securities/illiquid assets | Program or Add Token should expose backing asset class selection |
| Supply semantics | ERC20F + collections references include mint/burn and supply management | Initial supply and ongoing supply controls should be clearly separated |
| Wallet + vault primitives | Tokenization docs reference creating vaults/wallets and whitelisting external wallets | Wallet pages need creation policy, whitelist policy, and operational constraints |
| Operations + approvals | Tokenization docs emphasize managed daily operations and approval controls | Approval Queue should support operator-grade workflows (batching, assignment, SLA) |
| Monitoring/audit visibility | Tokenization docs emphasize operational dashboards and auditability | Dashboard should include failure taxonomy and alert routing, not just activity list |

## 2.2) Token lifecycle model for this demo

Recommended lifecycle stages to visualize in UI:

1. **Define asset model** (token type + backing asset + issuance policy)
2. **Deploy or link token contract/collection**
3. **Configure roles and operational boundaries**
4. **Issue/mint supply**
5. **Distribute/transfer**
6. **Burn/redeem/reconcile**
7. **Monitor and respond** (failed ops, alerts, incident ownership)

Current docs include parts of 2/4/5/6, but stage 1/3/7 remain partial.

## 3) IA implications

The IA should expose operation-first navigation:

1. Dashboard (status and KPIs)
2. Tokens (list/detail/actions)
3. Smart Contracts (templates, linked contracts)
4. Wallets (destination/source mapping)
5. Governance (policy and approval states)
6. Settings (network/team/system configs)

### 3.1) Additional IA implications from Fireblocks baseline

- **Tokens/Add Token** should include:
  - token standard/type selector (e.g., ERC20F vs ERC721F/ERC1155F branch)
  - backing asset class selector (fiat/commodity/bond/other)
  - initial supply and decimal strategy
- **Wallets** should include:
  - wallet creation guardrails (naming/ownership/network policy)
  - address policy and external whitelist management
- **Governance/Approval Queue** should include:
  - bulk approve/reject
  - assignee and queue ownership
  - SLA and escalation metadata
- **Dashboard/Monitoring** should include:
  - failed operation categories
  - alert routing status
  - incident on-call owner snapshot

## 4) UX implications

- Action modals should share a common structure:
  - Token selector
  - Amount and decimal validation
  - Source and destination wallet fields
  - Confirmation and approval state
- Detail pages should include:
  - Current supply
  - Network/token standard
  - Recent activity table

### 4.1) UX checklist to add (in-scope)

- Issuance form branch by token type (fungible vs non-fungible/semi-fungible)
- Backing asset selector + validation hints
- Initial supply entry + issuance preview before submit
- Wallet policy warnings (whitelist, destination validity, risk limits)
- Queue operations at list level (batch actions, assignee, SLA timer)
- Monitoring panel for failure classes + alert destination + on-call

## 5) Risks and constraints

1. Chain and token-standard choices can reshape form fields and validations.
2. Governance complexity can significantly impact flow depth.
3. Live on-chain transaction states may require async handling beyond MVP.

### 5.1) Explicit exclusion

- Detailed policy engine expression builder and multi-stage rule composer are excluded from this phase and handled by an upper module.

## 6) Recommendations for MVP

- Keep one primary network path and one secondary network placeholder.
- Focus on deterministic demo data for mint/burn/transfer.
- Separate "action intent" from "execution status" in UI for clarity.

### 6.1) Priority recommendations for immediate document/design sync

- **P0**
  - Add token type + backing asset + initial supply in Add Token flow
  - Visualize lifecycle state on Token Detail and queue screens
  - Expand Approval Queue fields (assignee, SLA, escalation flag)
- **P1**
  - Add wallet policy/whitelist management surface
  - Add risk control settings (limits/time windows/anomaly flags)
- **P2**
  - Add monitoring + alert routing + on-call summary panel

