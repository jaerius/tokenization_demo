# Competitor Deep Research (Fireblocks, Bridge, Securitize)

Date: 2026-02-20  
Scope: Public documentation and product pages referenced in this report.

## 1) Research method

- Reviewed Fireblocks developer docs (Tokenization, Issue New Tokens).
- Reviewed Bridge API docs (issuance, orchestration, supported rails/routes).
- Reviewed Securitize product and tokenization pages (institutional tokenization, intro, primary market examples).
- Extracted directly observable product behaviors and asset/collateral patterns.

## 2) Fireblocks findings

Primary sources:

- https://developers.fireblocks.com/docs/tokenization
- https://developers.fireblocks.com/docs/issue-new-tokens

Evidence highlights:

1. Fireblocks describes tokenization as representation of a real-world or digitally native asset on a distributed ledger.
2. Supported tokenization network model explicitly includes:
   - EVM-compatible blockchains
   - Stellar
   - Ripple
3. Lifecycle explicitly includes:
   - issue/link tokens
   - view token info
   - execute mint/distribute/burn operations
4. Network-specific lifecycle behavior:
   - EVM: smart contract calls for mint/burn and other functions
   - Stellar/Ripple: issue, mint, burn, transfer, plus trustline-oriented wallet setup

Design implication:

- A robust tokenization UX should not stop at mint/burn/transfer buttons; it should include chain-specific operation branches and wallet trustline handling.

## 3) Bridge findings

Primary sources:

- https://apidocs.bridge.xyz/get-started/introduction/overview
- https://apidocs.bridge.xyz/platform/issuance/overview
- https://apidocs.bridge.xyz/platform/issuance/custom
- https://apidocs.bridge.xyz/get-started/introduction/what-we-support/payment-routes

Evidence highlights:

1. Bridge positioning:
   - Move money with stablecoins and fiat rails.
   - Custodial wallets.
   - Issue own stablecoin.
2. Custom stablecoin (`xUSD`) model:
   - Backed 1:1 by equivalent USD value.
   - Configurable reserve strategy between cash and treasuries (money market funds).
   - Token inventory + refundable deposit model for fast swap without additional mint/burn delays.
3. Transparency and reserves:
   - Reserve and inventory transparency endpoints are documented in issuance pages.
4. Supported route model is broad:
   - Fiat rails: ACH/Wire/SEPA/SPEI/Faster Payments
   - Multi-chain and multi-asset route matrix (e.g., USDC/USDT/PYUSD/EURC/USDB etc.)

Design implication:

- Tokenization demo should include not only issuance UI but also:
  - reserve composition visibility,
  - inventory/liquidity checks,
  - redemption/swap route context (fiat and on-chain).

## 4) Securitize findings

Primary sources:

- https://securitize.io/institutional-tokenization
- https://securitize.io/insights/intro-to-tokenization
- https://securitize.io/primary-market/blackrock-fund
- https://securitize.io/primary-market/hl-scope
- https://securitize.io/alternative-assets/MALD1

Evidence highlights:

1. Asset categories presented by Securitize ecosystem:
   - Public stocks
   - Private/registered funds
   - Alternative assets
2. Intro page explicitly lists tokenization examples:
   - treasuries
   - private credit and equity funds
   - real estate
   - art
3. Institutional flow includes strong compliance and investor workflow:
   - identity verification
   - accreditation flow
   - subscription documentation
   - funding through wire/ACH
4. Redemption/liquidity model is explicitly surfaced in offering pages:
   - monthly redemption windows
   - liquidity pathways tied to tokenized fund structure

Design implication:

- Tokenization UX should include investor and compliance-aware lifecycle steps:
  onboarding/KYC-accreditation gates, subscription docs, redemption windows, and secondary liquidity context.

## 5) Cross-competitor asset and collateral taxonomy

| Provider | Asset focus observed | Collateral / reserve pattern observed | Operational pattern |
|---|---|---|---|
| Fireblocks | Generic tokenized assets (RWA + digital-native), EVM/Stellar/Ripple lifecycle | Not a single reserve model; focuses on token lifecycle and chain ops | Issue/link + mint/burn/transfer + contract ops |
| Bridge | Stablecoin issuance and money movement across rails/chains | Explicit reserve mix (cash + treasuries), inventory transparency | Mint/swap/redeem orchestration, liquidity routing |
| Securitize | Tokenized funds, treasuries, private credit/equity, real estate | Product-level fund structure and redemption terms | Compliance-heavy onboarding and lifecycle controls |

## 6) What this means for our Tokenization Demo

The demo should evolve from "action modal only" to "program + collateral + lifecycle":

1. Define **what** token is minted (asset class and product program).
2. Define **what backs it** (collateral basket/reserve strategy/proof source).
3. Define **how users move between states** (issue -> mint -> transfer -> redeem/burn).
4. Define **who can execute** (policy + compliance gate).

## 7) Recommended documentation changes (implemented in this iteration)

- Add token program and collateral model to IA.
- Add screen-connection map and transition table to design docs.
- Add mint-with-collateral and redemption-aware flow extensions to UserFlow.
- Add competitive gap list and required support scope.
