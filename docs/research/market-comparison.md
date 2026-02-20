# Market Comparison for Tokenization Demo (Deep Research Update)

## 1) Compared products

- Fireblocks (developer docs)
- Bridge (API docs)
- Securitize (institutional tokenization and investment pages)

## 2) Comparison table

| Product | Tokenization scope | Asset types observed in docs/pages | Collateral/reserve model | Key lifecycle emphasis |
|---|---|---|---|---|
| Fireblocks | Token issuance and lifecycle infra across multiple chains | Real-world physical assets and digitally native assets (platform-level description) | Not one fixed reserve model; focuses on lifecycle tooling and policy integration | Issue/link -> mint/distribute/burn/transfer + contract operations |
| Bridge | Stablecoin issuance + fiat/stablecoin orchestration | USDB/custom xUSD and route-level assets such as USDC, USDT, PYUSD, EURC (plus fiat rails) | Explicit reserve strategy (cash + treasuries/money market), inventory and transparency endpoints | Swap/issue/redeem orchestration with route and liquidity awareness |
| Securitize | Institutional tokenization and regulated investment lifecycle | Treasuries, private credit/equity funds, real estate, art, tokenized funds | Product-level fund and redemption mechanics, compliance-led structure | KYC/accreditation/subscription/funding + tokenized investment lifecycle |

## 3) Flow pattern comparison

| Capability | Fireblocks | Bridge | Securitize |
|---|---|---|---|
| Multi-chain lifecycle operations | High | Medium | Medium |
| Token program productization | Medium | High (stablecoin focused) | High (fund/asset focused) |
| Collateral/reserve visibility | Medium | High | Medium/High (product dependent) |
| Redemption and liquidity pathways | Medium | High | High |
| Compliance and eligibility gates | Medium | Medium | High |

## 4) What is missing in current docs (before this update)

1. Token program and asset-class selection at mint time.
2. Collateral basket and reserve transparency context.
3. Redemption/payout rail modeling.
4. End-to-end screen transition mapping.

## 5) Updated recommendation for this project

### Must include now

- Program-first mint flow (what tokenized asset is being minted).
- Collateral-first mint guardrails (what backs this issuance).
- Connected screen graph from issue to redemption.

### Should include next

- Reserve proof and inventory panel.
- Redemption queue with settlement rail options.
- Compliance gate checkpoints for issuance and transfer/redemption.

## 6) Source links

- Fireblocks: https://developers.fireblocks.com/docs/tokenization
- Fireblocks: https://developers.fireblocks.com/docs/issue-new-tokens
- Bridge: https://apidocs.bridge.xyz/platform/issuance/overview
- Bridge: https://apidocs.bridge.xyz/platform/issuance/custom
- Bridge: https://apidocs.bridge.xyz/get-started/introduction/what-we-support/payment-routes
- Securitize: https://securitize.io/institutional-tokenization
- Securitize: https://securitize.io/insights/intro-to-tokenization
