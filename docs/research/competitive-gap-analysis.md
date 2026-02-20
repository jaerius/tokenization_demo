# Competitive Gap Analysis (Current Docs vs Fireblocks/Bridge/Securitize)

## 1) Summary

Current documentation already covers core token lifecycle actions, but compared to competitor documentation,
the biggest missing areas are:

1. Token program definition depth (what asset is being minted).
2. Collateral/reserve modeling and transparency.
3. Redemption and post-mint lifecycle pathways.
4. Compliance-driven onboarding and eligibility gates.
5. Screen-to-screen connectivity narrative for end-to-end operation.

## 2) Gap table

| Gap ID | Gap area | Why competitor baseline matters | Current state | Required support |
|---|---|---|---|---|
| CG-01 | Asset universe / token program catalog | Securitize exposes multiple investment categories and productized offerings | Token list exists, but asset class and issuance program metadata is weak | Add token program model: asset class, issuance vehicle, eligibility, investment minimum |
| CG-02 | Collateral and reserve strategy | Bridge custom stablecoin docs expose reserve mix and inventory transparency | Mint modal has amount/destination only | Add collateral basket selection, reserve ratio fields, reserve proof link/status |
| CG-03 | Redemption and liquidity lifecycle | Bridge and Securitize both emphasize swap/redemption windows and liquidity paths | Burn exists, but redemption context is absent | Add redeem flow, redemption queue, settlement window and payout rail selection |
| CG-04 | Compliance and onboarding gating | Securitize flow includes identity/accreditation/subscription docs | Governance exists but investor/compliance gates not explicit | Add compliance checkpoints before issuance and transfer/redemption |
| CG-05 | Connected journey and transition map | Competitors provide clearer end-to-end productized journeys | Existing docs list screens but transitions are under-specified | Add screen graph and transition matrix with trigger/action/result |

## 3) Priority recommendations

### P0 (add now)

1. Token program and collateral model UI/IA.
2. Screen transition map.
3. Mint request expansion: asset class + collateral + policy gate.

### P1 (next)

1. Redemption lifecycle and payout rail.
2. Reserve/inventory transparency panel.
3. Compliance evidence checkpoints.

### P2 (later)

1. Investor subscription document workflow.
2. Advanced route optimizer and rebalancing.

## 4) New support scope proposal

### 4.1 Token Program schema

- program_id
- asset_class (treasury/private_credit/private_equity/real_estate/stablecoin/other)
- token_type (fund_share/debt_token/equity_token/stablecoin/utility)
- base_currency
- min_investment
- eligibility_rule

### 4.2 Collateral schema

- collateral_id
- collateral_type (cash/treasury/money_market_fund/stablecoin/other)
- collateral_ratio_target
- reserve_provider
- valuation_source
- proof_of_reserve_url
- last_attested_at

### 4.3 Redemption schema

- redemption_window
- payout_rail (fiat/on-chain)
- settlement_sla
- queue_status

## 5) Acceptance criteria for closing key gaps

- [ ] IA includes token program + collateral sections with field-level definitions.
- [ ] UserFlow includes mint-with-collateral and redemption-aware flow branch.
- [ ] Design inventory includes screen transitions and new program/collateral screens.
- [ ] Orchestrator report includes competitor-driven gap closure status.
