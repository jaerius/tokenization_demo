# Market Comparison for Tokenization Demo

## 1) Compared products

- Securitize
- Polymath
- Pedex
- Coinbase Asset Hub

## 2) Comparison table (Claude.md required columns)

| Product | Core features | Key flow style | Target customer | Cost model (public signal) | Notes for demo |
|---|---|---|---|---|---|
| Securitize | Issuance, compliance, investor lifecycle | Structured onboarding -> issuance -> lifecycle | Regulated issuers and asset managers | Enterprise contract pricing (quote-based) | Borrow lifecycle framing and compliance checkpoints |
| Polymath | Security token standardization, governance control | Policy-first lifecycle with role constraints | Regulated token projects | Platform/service pricing (quote-based) | Reflect policy visibility in Governance area |
| Pedex | Token issuance and exchange-linked operations | Asset onboarding with operations dashboard | Token issuers and trading-linked operators | B2B pricing model (non-public detailed tiers) | Use operational table patterns and status chips |
| Coinbase Asset Hub | Asset listing and operational onboarding | Guided listing flow with verification checkpoints | Exchange and institutional operators | Enterprise tiered/commercial agreement | Use checklist style for Add/Link Token |

## 3) Feature coverage matrix

| Capability | Securitize | Polymath | Pedex | Coinbase Asset Hub |
|---|---|---|---|---|
| New token issuance | High | High | Medium | Medium |
| Existing token linking | Medium | Medium | Medium | High |
| Mint/Burn/Transfer operations | Medium | High | Medium | Low/Medium |
| Governance and approvals | High | High | Medium | Medium |
| Activity visibility | Medium | Medium | High | High |

## 4) Design pattern extraction

1. Onboarding steps should be explicit and recoverable.
2. Operational actions need modal confirmation and result tracking.
3. Dense data tables are expected by enterprise operators.
4. Policy and approval signals should be visible before commit.

## 5) Recommendation for DSRV-style prototype

- Use Fireblocks-like dark operation console as baseline.
- Add Securitize/Polymath style policy context in Governance page.
- Add Coinbase-like verification checklist for Add/Link Token.
- Keep Pedex-like operational visibility with status-first tables.
