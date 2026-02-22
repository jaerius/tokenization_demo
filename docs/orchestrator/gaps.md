# Orchestrator Gap Log

## Open gaps

| Gap ID | Category | Severity | Description | Impact | Owner | Next action |
|---|---|---|---|---|---|---|
| GAP-001 | Research evidence | High | Notion MCP not connected, so required 3+ Notion pages are not fetched | Research traceability incomplete | Agent 1 | Re-run MCP collection and replace placeholders |
| GAP-002 | Research evidence | High | Slack MCP not connected, so required 10+ messages are not collected | Team signal validation incomplete | Agent 1 | Re-run Slack search and classify messages |
| GAP-004 | Validation depth | Medium | IA <-> Figma live node mapping unavailable | End-to-end design traceability partial | Agent 5 | Validate mapping after Figma sync |
| GAP-005 | Token issuance depth | High | Add Token flow lacks explicit token type selector (ERC20F/721F/1155F branch) and issuance-role setup step | Token setup ambiguity at issuance | Agent 2/3 | Add IA step and screen controls for token type + roles |
| GAP-006 | Asset modeling | High | Backing asset selection (fiat/commodity/bond/other) is not explicit in issuance flow | Product positioning and lifecycle semantics are under-specified | Agent 2/3 | Add backing asset selector in Add Token + Program flows |
| GAP-007 | Wallet operations | High | Wallet policy details are missing (creation rules, address policy, external whitelist management) | Enterprise wallet ops realism is insufficient | Agent 2/3 | Add Wallet Policy and Whitelist surfaces |
| GAP-008 | Risk controls | High | No UI for limits/time-window/anomaly controls | Transaction governance remains superficial | Agent 2/3 | Add Risk Control configuration screen/module |
| GAP-009 | Queue operations | High | Approval queue lacks batch action, SLA, escalation, reassignment controls | Operational queue handling is weak | Agent 2/3 | Extend Governance queue table/actions |
| GAP-010 | Monitoring and alerts | Medium | Dashboard lacks failure taxonomy, alert routing, on-call response summary | Incident response visibility is partial | Agent 2/3 | Add Ops Monitoring/Alerts panel |

## Closed gaps

| Gap ID | Resolution |
|---|---|
| GAP-003 | Figma MCP connected (Talk to Figma channel d5x5n0on). 14 screens: SCR-01~10 + SCR-15~18 (Program Selector, Mint Builder, Redemption Queue, Collateral Profiles). Frame IDs in docs/design/screen-inventory.md |

## Priority order

1. GAP-001
2. GAP-002
3. GAP-005
4. GAP-006
5. GAP-009
6. GAP-007
7. GAP-008
8. GAP-010
9. GAP-004

## Exit criteria

- GAP-001 and GAP-002 resolved with real evidence excerpts and links.
- GAP-003 resolved: Figma screens created, frame IDs in screen-inventory.md.
- GAP-004 resolved with IA page IDs mapped to Figma frame IDs.
- GAP-005 and GAP-006 resolved: Add Token/Program flows include token type + backing asset + issuance roles.
- GAP-007 resolved: wallet policy/whitelist screens and IA nodes are added.
- GAP-008 resolved: risk control settings are represented in IA and design inventory.
- GAP-009 resolved: approval queue supports batch/SLA/escalation/reassignment fields.
- GAP-010 resolved: monitoring/alerts information architecture is added.
