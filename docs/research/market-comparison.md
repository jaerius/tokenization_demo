# Market Comparison for Tokenization Demo

## 1) Compared products

- Securitize
- Polymath
- Coinbase Asset Hub
- Fireblocks-oriented enterprise console model

## 2) Comparative table


| Product                  | Positioning                                     | Strength                                          | Limitation                                              | UI/UX insight for this demo                                   |
| ------------------------ | ----------------------------------------------- | ------------------------------------------------- | ------------------------------------------------------- | ------------------------------------------------------------- |
| Securitize               | End-to-end tokenization and compliance platform | Strong issuance and investor lifecycle framing    | Heavier compliance flow may be complex for MVP          | Keep issuance flow clear, show compliance hooks as expandable |
| Polymath                 | Security-token focused infrastructure           | Structured token lifecycle and policy controls    | Niche framing for regulated securities can narrow scope | Expose policy modules without overloading initial flow        |
| Coinbase Asset Hub       | Exchange-grade asset onboarding experience      | Strong listing/onboarding workflow language       | Less focused on custom governance screens for token ops | Use onboarding checklist pattern for Add/Link Token           |
| Fireblocks-style console | Operations-centric digital asset management     | Practical action-driven flow (mint/burn/transfer) | Needs product-specific domain layer on top              | Use dark, table-first, operation modal pattern                |


## 3) Common patterns observed

1. Step-based onboarding for new assets
2. Strong activity logs and status indicators
3. Role and policy checkpoints around high-impact actions
4. Dense table layouts with filtering and drill-down

## 4) Recommended synthesis for Tokenization Demo

- Primary model: Fireblocks-style operation console
- Supporting ideas:
  - Securitize-like lifecycle framing
  - Coinbase-like onboarding checklist for Add/Link Token
  - Polymath-like policy visibility in Governance section

## 5) Required differentiators for DSRV context

- Multi-network readiness signaled in token list and detail
- Wallet mapping clarity for enterprise operators
- Minimal but explicit governance state shown before action execution

