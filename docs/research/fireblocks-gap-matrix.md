# Fireblocks vs Current IA/Figma Gap Matrix

## Scope

- Baseline source: Fireblocks public developer docs
  - `https://developers.fireblocks.com/docs/tokenization`
  - `https://developers.fireblocks.com/docs/issue-new-tokens`
  - `https://developers.fireblocks.com/reference/issue-new-erc-20f-tokens`
  - `https://developers.fireblocks.com/reference/issue-new-erc721ferc1155f-tokens`
- Exclusion: deep policy-engine rule design (upper module)

## Matrix


| Capability                                                | Fireblocks evidence                                                | Current coverage (IA/Figma)                                                                        | Gap level | Proposed screen/module                         | Priority |
| --------------------------------------------------------- | ------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------- | --------- | ---------------------------------------------- | -------- |
| Token standard/type selection (ERC20F/721F/1155F)         | ERC20F + ERC721F/ERC1155F issuance guides                          | `Add Token` exists, but no explicit standard branch in screen inventory                            | High      | Add Token Step 1/2 advanced branch             | P0       |
| Backing asset selection (fiat/commodity/bond/other)       | Tokenize Assets (broad asset classes)                              | `Program Selector` has asset class signal but Add Token issue flow lacks explicit backing selector | High      | Add Token + Program Selector alignment         | P0       |
| Initial supply and issuance param clarity                 | Issue guides (deploy/init params + mint semantics)                 | Token metadata and modal amounts exist, but initial supply/issuance strategy is not explicit       | High      | Add Token issuance review panel                | P0       |
| Lifecycle state visualization                             | Tokenize Assets lifecycle language (issue/link/mint/burn/transfer) | Action flows exist; lifecycle status model is not explicit                                         | Medium    | Token Detail lifecycle timeline + status chips | P0       |
| Vault/wallet policy management                            | Creating vaults/wallets + external whitelist docs                  | Wallet list exists; policy/rules/whitelist management missing                                      | High      | Wallet Policy screen + Whitelist Manager       | P1       |
| Transaction risk controls (limits/time window/anomaly)    | Policy/ops controls implied by token ops governance model          | Governance summary only; no risk-control config UI                                                 | High      | Risk Control settings panel                    | P1       |
| Approval queue operations (batch/SLA/escalation/reassign) | Daily operations + approval controls emphasis                      | Approval queue concept exists; operator tooling depth missing                                      | High      | Approval Queue v2 (table ops)                  | P0       |
| Monitoring/alerts/on-call                                 | Operational visibility + auditability emphasis                     | Dashboard/activity exists; failure taxonomy and alert routing absent                               | Medium    | Ops Monitoring & Alerts screen                 | P2       |
| Role setup during token deployment                        | ERC20F guide includes admin/minter/pauser setup                    | No explicit role setup step in Add Token flow                                                      | Medium    | Add Token advanced step: role assignment       | P1       |
| NFT metadata workflow for collections                     | ERC721F/ERC1155F collection + metadata APIs                        | No explicit NFT metadata flow in IA/Figma                                                          | Medium    | Collection Metadata modal/wizard               | P2       |


## Coverage legend

- **Covered**: clear IA node + Figma frame support
- **Partial**: concept exists but operational depth is insufficient
- **Missing**: no direct IA/Figma surface

## Suggested next action order

1. P0: token type/backing/supply + lifecycle + approval queue v2
2. P1: wallet policy/whitelist + risk controls + role assignment
3. P2: monitoring/alerts + NFT metadata helper flow

