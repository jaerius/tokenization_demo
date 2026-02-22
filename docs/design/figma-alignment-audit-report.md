# Figma Alignment Audit Report — SCR-01 through SCR-05

**Audit Date:** 2025-02-20  
**Method:** `get_node_info` with `depth=2` via user-figma MCP  
**Frames Audited:** SCR-01 Dashboard, SCR-02 Token List, SCR-03 Token Detail, SCR-04 Add Token v2, SCR-05 Link Token

---

## Frame Absolute Positions (Reference)

| Screen | Frame ID | Absolute (x, y) | Width × Height |
|--------|----------|------------------|-----------------|
| SCR-01 Dashboard | 10:2 | (0, 0) | 1440 × 900 |
| SCR-02 Token List | 10:3 | (0, 1100) | 1440 × 900 |
| SCR-03 Token Detail | 10:4 | (3200, 2200) | 1440 × 900 |
| SCR-04 Add Token v2 | 10:5 | (0, 2200) | 1440 × 1020 |
| SCR-05 Link Token | 10:6 | (1600, 2200) | 1440 × 900 |

Content area left edge (post-sidebar): **x = 272** (SCR-01, 02, 03, 04) or **x = 1872** (SCR-05, frame x + 272)

---

## MISALIGNMENTS FOUND

### SCR-01 Dashboard (10:2)

| # | Element(s) | Node ID(s) | Current Position (absolute) | Issue | Should Align With | Suggested Correction |
|---|------------|------------|----------------------------|-------|-------------------|----------------------|
| 1 | Table Header "Recent Activity" | 10:27 | x=288, y=192 | 16px offset from content edge | Content area (x=272) | x: 272 |
| 2 | Quick Actions Label | 10:29 | x=272, y=520 | 2px offset from KPI bottom | KPI Cards bottom (y=148) | y: 548 (or adjust spacing) |
| 3 | Status Chip Active / Completed | 10:201, 10:203 | y=192 | Chips at y=192 vs Table Header text at y=193 | Same row | y: 193 (or 196 for Chip Text) |
| 4 | CTA View Tokens | 10:197 | x=272, y=608 | 16px gap from Quick Action buttons (y=552+36=588) | Consistent 20px spacing | y: 608 is OK; verify 20px gap |
| 5 | Pending Approvals badge "3" | 13:6634 | x=1358, y=194 | 1px vertical offset from "Pending Approvals" (y=193) | 13:6632 Pending Approvals text | y: 193 |

---

### SCR-02 Token List (10:3)

| # | Element(s) | Node ID(s) | Current Position (absolute) | Issue | Should Align With | Suggested Correction |
|---|------------|------------|----------------------------|-------|-------------------|----------------------|
| 1 | **Add Token v2** link | 12:6215 | x=1940, y=1176 | **OUTSIDE FRAME** — frame width 1440, element at x=1940 | Content area, same row as Add Token | x: 352 (after Link Token at 361), y: 1176 |
| 2 | **Empty State** text | 13:7601 | x=1940, y=1420 | **OUTSIDE FRAME** — same as above | Inside Token Table area | x: 288, y: ~1400 (centered in table) |
| 3 | Table header "Amount" duplicate | 12:5723, 12:5725 | x=568, x=655 | Two "Amount" column headers — likely "Holders" vs "Amount" | Rename 12:5725 or 12:5723 | Fix label: one should be "Holders" per IA |
| 4 | Page Title | 10:39 | x=272, y=1148 | 2px high vs Add/Link buttons (y=1176) | Same baseline as Add Token | y: 1176 (or add 8px gap) |
| 5 | Search Box | 10:40 | x=272, y=1208 | Aligned ✓ | — | — |
| 6 | CTA Open Detail | 10:199 | x=272, y=1840 | Correctly below table | — | — |

---

### SCR-03 Token Detail (10:4)

| # | Element(s) | Node ID(s) | Current Position (absolute) | Issue | Should Align With | Suggested Correction |
|---|------------|------------|----------------------------|-------|-------------------|----------------------|
| 1 | **Activity Table header** | 12:5649 | x=6472, y=2524 | **WRONG FRAME** — in different frame (x=6472 vs frame x=3200) | Inside Token Detail frame (x=3472) | x: 3472, y: 2610 (match Activity Table 10:57) |
| 2 | **Activity Table row** | 12:5653 | x=6473, y=2577 | **WRONG FRAME** — 1px x offset from 12:5649, same wrong frame | Activity Table (10:57) at x=3472 | x: 3473, y: 2577 (or 3472) |
| 3 | Tab Holders | 10:55 | x=4217, y=2482 | Same row as Btn Mint/Burn/Transfer (y=2482) ✓ | Tab Activity (10:54) | Tab Activity at x=3482, y=2582 — **Tabs and Buttons on different rows** |
| 4 | Tab Contract | 10:56 | x=4285, y=2482 | Same as above | — | — |
| 5 | Tab Activity | 10:54 | x=3482, y=2582 | **100px below** Btn Mint (y=2482) — Tabs should be same row or adjacent | Btn row (y=2482) or just below | y: 2530 (48px below buttons) for consistency |
| 6 | Activity Table | 10:57 | x=3472, y=2610 | Correct | — | — |
| 7 | Lifecycle Rail | 13:6297 | x=3472, y=2372 | Aligned with Summary Card ✓ | — | — |
| 8 | Btn Mint, Burn, Transfer | 10:51–53 | y=2482 | All same row ✓ | — | — |

**Critical:** Rectangles 12:5649 and 12:5653 have absolute x ≈ 6472, which is **outside** the Token Detail frame (3200–4640). They appear to be orphaned or duplicated from another frame.

---

### SCR-04 Add Token v2 (10:5)

| # | Element(s) | Node ID(s) | Current Position (absolute) | Issue | Should Align With | Suggested Correction |
|---|------------|------------|----------------------------|-------|-------------------|----------------------|
| 1 | Back CTA | 13:7599 | x=272, y=2218 | Aligned with Form Title row ✓ | — | — |
| 2 | Form Title | 10:62 | x=272, y=2248 | 30px below Back CTA ✓ | — | — |
| 3 | Step 1 | 10:63 | x=272, y=2285 | Aligned ✓ | — | — |
| 4 | Option EVM/Stellar/Ripple | 10:64–66 | y=2317 | Same row ✓ | — | — |
| 5 | Step 1b Token Type cards | 13:6537–39 | y=2414 | Same row ✓ | — | — |
| 6 | Step 2 Backing Asset | 10:67 | x=272, y=2724 | Large jump from Step 1b (2414→2724) | Step 1b cards | Verify intended spacing |
| 7 | Input Name | 10:68 | x=272, y=3014 | — | — | — |
| 8 | Input Symbol, Decimals | 10:69, 10:70 | y=3058 | Same row ✓ | — | — |
| 9 | Btn Deploy | 10:72 | x=272, y=3166 | Aligned ✓ | — | — |
| 10 | Sidebar nav | 10:4560–65 | x=24 | All at x=24 ✓ | — | — |
| 11 | **Stellar Label** | 10:74 | "Polygon" | Wrong label — should be "Stellar" | Option Stellar | Change text to "Stellar" |
| 12 | **Ripple Label** | 10:75 | "Solana" | Wrong label — should be "Ripple" | Option Ripple | Change text to "Ripple" |

---

### SCR-05 Link Token (10:6)

| # | Element(s) | Node ID(s) | Current Position (absolute) | Issue | Should Align With | Suggested Correction |
|---|------------|------------|----------------------------|-------|-------------------|----------------------|
| 1 | Back CTA | 13:7600 | x=1872, y=2218 | Aligned with content (x=1872) ✓ | — | — |
| 2 | Form Title | 10:77 | x=1872, y=2248 | 30px below Back CTA ✓ | — | — |
| 3 | Input Blockchain | 10:78 | x=1872, y=2320 | Left-aligned ✓ | — | — |
| 4 | Input Contract | 10:79 | x=1872, y=2380 | Left-aligned ✓ | — | — |
| 5 | Btn Verify | 10:80 | x=1872, y=2440 | Left-aligned ✓ | — | — |
| 6 | Btn Link | 10:81 | x=1988, y=2440 | Same row as Btn Verify ✓ | — | — |
| 7 | Placeholder "ex) Ethereum" | 10:4471 | x=1878, y=2328 | 6px inset in input ✓ | — | — |
| 8 | Placeholder "ex) 0x7a3f..." | 10:4472 | x=1878, y=2388 | 6px inset ✓ | — | — |
| 9 | Sidebar nav | 10:4566–71 | x=1624 | 24px from sidebar edge ✓ | — | — |

**SCR-05 has no significant misalignments.** All elements are properly left-aligned at x=1872 (content area).

---

## Summary of Critical Issues

| Priority | Screen | Issue | Action |
|----------|--------|-------|--------|
| **P0** | SCR-02 | Add Token v2 link (12:6215) and Empty State (13:7601) at x=1940 — **outside frame** | Move to x ≤ 1440 |
| **P0** | SCR-03 | Activity Table header/row (12:5649, 12:5653) at x=6472 — **wrong frame** | Move to x=3472 |
| **P1** | SCR-03 | Tab Activity at y=2582 vs Buttons at y=2482 — 100px gap | Align tabs with or just below buttons |
| **P1** | SCR-04 | Stellar/Ripple labels show "Polygon"/"Solana" | Fix label text |
| **P2** | SCR-01 | Table Header 16px offset, Status chip 1px offset | Minor alignment tweaks |
| **P2** | SCR-02 | Duplicate "Amount" column header | Rename to "Holders" |

---

## Horizontal Alignment Checks (Same Row)

| Screen | Elements | Expected y | Actual y | Status |
|--------|----------|------------|----------|--------|
| SCR-01 | KPI Cards 1–3 | 48 | 48 | ✓ |
| SCR-01 | Quick Action buttons | 552 | 552 | ✓ |
| SCR-01 | Btn Add Token Text, Mint Text, Transfer Text | 562 | 562 | ✓ |
| SCR-02 | Add Token, Link Token | 1176 | 1176 | ✓ |
| SCR-02 | Table header cells | 1279–1282 | 1279–1282 | ✓ (1–3px variance) |
| SCR-03 | Btn Mint, Burn, Transfer | 2482 | 2482 | ✓ |
| SCR-03 | Tab Holders, Tab Contract | 2482 | 2482 | ✓ |
| SCR-04 | Option EVM, Stellar, Ripple | 2317 | 2317 | ✓ |
| SCR-04 | Input Symbol, Decimals | 3058 | 3058 | ✓ |
| SCR-05 | Btn Verify, Btn Link | 2440 | 2440 | ✓ |

---

## Vertical Alignment Checks (Same Column)

| Screen | Elements | Expected x | Actual x | Status |
|--------|----------|------------|----------|--------|
| SCR-01 | KPI Cards, Recent Activity, Quick Actions | 272 | 272 | ✓ |
| SCR-01 | Sidebar nav items | 24 | 24 | ✓ |
| SCR-02 | Page Title, Search, Table, CTA | 272 | 272 | ✓ |
| SCR-02 | Add Token v2, Empty State | 272 | **1940** | ✗ OUTSIDE FRAME |
| SCR-03 | Summary Card, Buttons, Tabs, Activity Table | 3472 | 3472 | ✓ |
| SCR-03 | Orphan rectangles 12:5649, 12:5653 | 3472 | **6472** | ✗ WRONG FRAME |
| SCR-04 | All form elements | 272 | 272 | ✓ |
| SCR-05 | All form elements | 1872 | 1872 | ✓ |

---

## Recommended Fix Order

1. **SCR-02:** Move 12:6215 (Add Token v2) and 13:7601 (Empty State) to x=272–1200 range.
2. **SCR-03:** Move 12:5649 and 12:5653 to x=3472 (or delete if duplicates).
3. **SCR-03:** Adjust Tab Activity y to align with tab row (y=2482 or y=2530).
4. **SCR-04:** Fix Stellar/Ripple labels to "Stellar" and "Ripple".
5. **SCR-02:** Rename duplicate "Amount" column to "Holders".
6. **SCR-01:** Minor 1–16px alignment tweaks (optional).
