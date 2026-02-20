# Tokenization Demo User Flow

## 1) Flow overview

This document defines three required UX flows:

1. Token issuance flow
2. Lifecycle management flow (mint/burn/transfer)
3. End-to-end operator journey

## 2) Flow A: Issue New Token

```mermaid
flowchart LR
    A[Open Token List] --> B[Click Add Token]
    B --> C[Select Network and Token Standard]
    C --> D[Input Name Symbol Initial Supply]
    D --> E[Review Governance Warning]
    E --> F[Submit Create]
    F --> G{Validation Passed?}
    G -- Yes --> H[Token Created]
    G -- No --> I[Show Error and Required Fix]
    H --> J[Redirect to Token Detail]
```

## 3) Flow B: Token Lifecycle Action (Mint/Burn/Transfer)

```mermaid
flowchart TD
    A[Open Token Detail] --> B[Choose Action]
    B --> C{Action Type}
    C -->|Mint| D[Open Mint Modal]
    C -->|Burn| E[Open Burn Modal]
    C -->|Transfer| F[Open Transfer Modal]
    D --> G[Input Amount Destination]
    E --> H[Input Amount Source]
    F --> I[Input Amount Source Destination]
    G --> J[Review and Confirm]
    H --> J
    I --> J
    J --> K[Create Operation Request]
    K --> L{Approval Needed?}
    L -->|Yes| M[Pending Approval Queue]
    L -->|No| N[Execute Operation]
    M --> N
    N --> O[Update Activity Log and Supply]
```

## 4) Flow C: End-to-End Demo Journey

```mermaid
flowchart LR
    A[Dashboard] --> B[Token List]
    B --> C[Add or Link Token]
    C --> D[Token Detail]
    D --> E[Mint Operation]
    E --> F[Transfer Operation]
    F --> G[Burn Operation]
    G --> H[Smart Contract Overview]
    H --> I[Governance Queue]
    I --> J[Back to Dashboard KPI Refresh]
```

## 5) UX rules

- All high-impact actions must use confirmation modals.
- Operation result states must be visible in Token Detail activity log.
- Error states should preserve user input where possible.
- Governance state should be shown before final submit.

## 6) Screen mapping

| Flow step group | Screen(s) |
|---|---|
| Discovery and monitoring | Dashboard, Token List |
| Token onboarding | Add Token, Link Token |
| Token operations | Token Detail + Mint/Burn/Transfer modals |
| Contract and policy check | Smart Contracts, Governance |

## 7) MVP confirmation

- Issue flow: included
- Lifecycle flow: included
- End-to-end journey: included
