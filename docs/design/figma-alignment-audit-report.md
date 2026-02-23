# Figma Alignment Audit Report (통합본)

**Audit Date:** 2025-02-20 ~ 2026-02-23  
**Method:** `get_node_info` with `depth=2` via user-figma MCP  
**Scope:** SCR-01 ~ SCR-18 + Manage Contract sub-screens

> 이전 분할 파일들(alignment-audit-scr06-12.md, alignment-audit-scr13-18.md, manage-contract-alignment-audit.md)을 이 문서로 통합함.

---

# Part 1: SCR-01 through SCR-05

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

---

# Part 2: SCR-06 through SCR-12


**Audit date:** 2026-02-20  
**Method:** `get_node_info` with depth=2 via user-figma MCP  
**Screens audited:** 7 (Mint Modal, Burn Modal, Transfer Modal, Smart Contract List, Manage Contract, Wallets, Governance)

---

## Executive Summary

| Screen | Misalignments Found | Severity |
|--------|---------------------|----------|
| SCR-06 Mint Modal | 5 | Medium |
| SCR-07 Burn Modal | 5 | Medium |
| SCR-08 Transfer Modal | 5 | Medium |
| SCR-09 Smart Contract List | 4 | Low–Medium |
| SCR-10 Manage Contract | 2 | Low |
| SCR-11 Wallets | 3 | Medium |
| SCR-12 Governance | 4 | Medium |

**Total misalignments: 28**

---

## 1. SCR-06 Mint Modal (Frame 10:7)

**Frame position:** x=0, y=3400, width=480, height=400

### Misalignment 1: Btn Cancel vs Btn Confirm — vertical offset
| Element | Node ID | Current (x, y) | Issue |
|---------|---------|----------------|-------|
| Btn Confirm | 10:88 | (24, 3740) | Primary action |
| Btn Cancel | 10:89 | (16, 3760) | 20px lower than Confirm |

**Should align with:** Btn Confirm (same row)  
**Suggested correction:** Move Btn Cancel to y=3740 (and optionally x=132 to sit left of Confirm with 8px gap)

---

### Misalignment 2: Gov Indicator vs content left edge
| Element | Node ID | Current (x, y) | Issue |
|---------|---------|----------------|-------|
| Gov Indicator | 13:7586 | (16, 3730) | 8px left of content |
| Content edge | — | x=24 | Modal Title, labels, inputs, Btn Confirm |

**Should align with:** Content left edge (x=24)  
**Suggested correction:** Move Gov Indicator to x=24

---

### Misalignment 3: Btn Cancel vs content left edge
| Element | Node ID | Current (x, y) | Issue |
|---------|---------|----------------|-------|
| Btn Cancel | 10:89 | (16, 3760) | 8px left of content |
| Btn Confirm | 10:88 | (24, 3740) | Content-aligned |

**Should align with:** Content left edge (x=24) or Btn Confirm row  
**Suggested correction:** Move Btn Cancel to x=24 (or x=132 if keeping left of Confirm)

---

### Misalignment 4: Confirm Text vs Cancel Text — vertical offset
| Element | Node ID | Current (x, y) | Issue |
|---------|---------|----------------|-------|
| Confirm Text | 10:90 | (44, 3750) | Centered in Btn Confirm |
| Cancel Text | 10:91 | (32, 3768) | 18px lower |

**Should align with:** Same vertical center as button row  
**Suggested correction:** Move Cancel Text to y=3750 (centered in Btn Cancel)

---

### Misalignment 5: Close Button vs Modal Title — vertical offset
| Element | Node ID | Current (x, y) | Issue |
|---------|---------|----------------|-------|
| Close Button | 13:7585 | (452, 3412) | 12px above title |
| Modal Title | 10:83 | (24, 3424) | Header baseline |

**Should align with:** Modal Title (same header row, y≈3424)  
**Suggested correction:** Move Close Button to y=3424 (or y=3420 for optical alignment with 16px font)

---

## 2. SCR-07 Burn Modal (Frame 10:8)

**Frame position:** x=540, y=3400, width=480, height=400

### Misalignment 1: Btn Cancel vs Btn Confirm — vertical offset
| Element | Node ID | Current (x, y) | Issue |
|---------|---------|----------------|-------|
| Btn Confirm | 10:98 | (564, 3740) | Primary action |
| Btn Cancel | 10:99 | (556, 3760) | 20px lower |

**Suggested correction:** Move Btn Cancel to y=3740, x=564 (or x=672 for 8px gap left of Confirm)

---

### Misalignment 2: Gov Indicator vs content left edge
| Element | Node ID | Current (x, y) | Issue |
|---------|---------|----------------|-------|
| Gov Indicator | 13:7588 | (556, 3730) | 8px left of content (564) |

**Suggested correction:** Move Gov Indicator to x=564

---

### Misalignment 3: Btn Cancel vs content left edge
| Element | Node ID | Current (x, y) | Issue |
|---------|---------|----------------|-------|
| Btn Cancel | 10:99 | (556, 3760) | 8px left of content |

**Suggested correction:** Move Btn Cancel to x=564

---

### Misalignment 4: Confirm Text vs Cancel Text — vertical offset
| Element | Node ID | Current (x, y) | Issue |
|---------|---------|----------------|-------|
| Confirm Text | 10:4544 | (584, 3750) | — |
| Cancel Text | 10:4545 | (572, 3768) | 18px lower |

**Suggested correction:** Move Cancel Text to y=3750

---

### Misalignment 5: Close Button vs Modal Title
| Element | Node ID | Current (x, y) | Issue |
|---------|---------|----------------|-------|
| Close Button | 13:7587 | (992, 3412) | 12px above title (3424) |

**Suggested correction:** Move Close Button to y=3424

---

## 3. SCR-08 Transfer Modal (Frame 10:9)

**Frame position:** x=1080, y=3400, width=480, height=400

### Misalignment 1: Btn Cancel vs Btn Confirm — vertical offset
| Element | Node ID | Current (x, y) | Issue |
|---------|---------|----------------|-------|
| Btn Confirm | 10:108 | (1104, 3740) | — |
| Btn Cancel | 10:109 | (1096, 3760) | 20px lower, 8px left |

**Suggested correction:** Move Btn Cancel to y=3740, x=1104 (or x=1212 for gap)

---

### Misalignment 2: Gov Indicator vs content left edge
| Element | Node ID | Current (x, y) | Issue |
|---------|---------|----------------|-------|
| Gov Indicator | 13:7590 | (1096, 3730) | 8px left of content (1104) |

**Suggested correction:** Move Gov Indicator to x=1104

---

### Misalignment 3: Btn Cancel vs content left edge
| Element | Node ID | Current (x, y) | Issue |
|---------|---------|----------------|-------|
| Btn Cancel | 10:109 | (1096, 3760) | 8px left |

**Suggested correction:** Move Btn Cancel to x=1104

---

### Misalignment 4: Confirm Text vs Cancel Text — vertical offset
| Element | Node ID | Current (x, y) | Issue |
|---------|---------|----------------|-------|
| Confirm Text | 10:4546 | (1124, 3750) | — |
| Cancel Text | 10:4547 | (1112, 3768) | 18px lower |

**Suggested correction:** Move Cancel Text to y=3750

---

### Misalignment 5: Close Button vs Modal Title
| Element | Node ID | Current (x, y) | Issue |
|---------|---------|----------------|-------|
| Close Button | 13:7589 | (1532, 3412) | 12px above title (3424) |

**Suggested correction:** Move Close Button to y=3424

---

## 4. SCR-09 Smart Contract List (Frame 10:36)

**Frame position:** x=1600, y=1100, width=1440, height=900  
**Note:** User spec said x=0, y=1100; actual frame is at x=1600, y=1100.

### Misalignment 1: Row 3 — Governance cell vertical offset
| Element | Node ID | Current (x, y) | Issue |
|---------|---------|----------------|-------|
| 12:6085 (Governance) | — | (1904, 1403) | y=1403 |
| 12:6086 (Address) | — | (2018, 1405) | y=1405 |
| 12:6087 (Token Linked) | — | (2163, 1405) | y=1405 |
| 12:6088 (Last Used) | — | (2323, 1403) | y=1403 |

**Should align with:** Same row (y=1403 or y=1405)  
**Suggested correction:** Align all row 3 cells to y=1403 (or 1405) for consistent baseline

---

### Misalignment 2: Row 3 — 1px horizontal offset
| Element | Node ID | Current (x, y) | Issue |
|---------|---------|----------------|-------|
| 12:6085 (Governance) | — | (1904, 1403) | 1px left of column 1 (1905) |
| 12:6084 (Last Used) | — | (2324, 1346) | 1px right of 12:6088 (2323) |

**Suggested correction:** Move 12:6085 to x=1905; verify 12:6084 vs 12:6088 column alignment

---

### Misalignment 3: Empty State vs table content
| Element | Node ID | Current (x, y) | Issue |
|---------|---------|----------------|-------|
| Empty State | 13:7602 | (1940, 2520) | 68px right of table left edge (1872) |
| Contract Table | 10:112 | (1872, 1221) | Content area |

**Should align with:** Table content left (1872) or center within table  
**Suggested correction:** If centered in table: x=1872+(888/2)-(457/2)≈2127. If left-aligned: x=1872

---

### Misalignment 4: Duplicate table elements outside frame bounds
| Elements | Node IDs | Issue |
|----------|----------|-------|
| Rectangles | 12:4724, 12:4725, 12:4726, 12:5648, 12:5689, 12:5690, 12:6014 | y=3120–3287; frame ends at y=2000 |

**Note:** These elements have y coordinates outside the frame (1100+900=2000). May be overflow, duplicate content, or layout error.  
**Suggested correction:** Verify if these belong to another frame or remove/relocate.

---

## 5. SCR-10 Manage Contract (Frame 10:37)

**Frame position:** x=6400, y=2200, width=1440, height=900

### Misalignment 1: Back CTA vs Page Title — vertical spacing
| Element | Node ID | Current (x, y) | Issue |
|---------|---------|----------------|-------|
| Back CTA | 13:7595 | (6672, 2218) | 30px above Page Title |
| Page Title | 10:115 | (6672, 2248) | — |

**Note:** 30px gap may be intentional. If 24px is desired: move Back CTA to y=2224.

---

### Misalignment 2: State Label group vs Execution Panel
| Element | Node ID | Current (x, y) | Issue |
|---------|---------|----------------|-------|
| State Label | 13:7607 | (7200, 2556) | — |
| Btn Call | 13:6674 | (7016, 2536) | Execution Panel left=7016 |

**Note:** State labels at x=7200 are 184px right of Execution Panel (7016). May be intentional (right column). No change suggested unless design spec requires alignment.

---

## 6. SCR-11 Wallets (Frame 12:4727)

**Frame position:** x=3200, y=1100, width=1440, height=900

### Misalignment 1: Page Title vs table — vertical gap
| Element | Node ID | Current (x, y) | Issue |
|---------|---------|----------------|-------|
| Page Title | 12:4731 | (3512, 1148) | — |
| Table header rect | 12:5735 | (3512, 1220) | 72px gap (includes 1220–1260 header) |
| Table container | 12:4732 | (3512, 1260) | — |

**Note:** 48px between title bottom (1148+24=1172) and table top (1220) = 48px. May be intentional.

---

### Misalignment 2: Sidebar nav — missing Dashboard
| Element | Node ID | Current (x, y) | Issue |
|---------|---------|----------------|-------|
| Dashboard | 12:4744 | (3224, 1167) | First nav item |
| Tokens | 12:4745 | (3224, 1207) | 40px spacing |
| Smart Contracts | 12:4746 | (3224, 1247) | — |
| Wallets | 12:4747 | (3224, 1287) | Active |
| Governance | 12:4748 | (3224, 1327) | — |
| Settings | 12:4749 | (3224, 1367) | — |

**Note:** Nav items are evenly spaced (40px). No misalignment; Dashboard is present.

---

### Misalignment 3: Empty State position
| Element | Node ID | Current (x, y) | Issue |
|---------|---------|----------------|-------|
| Empty State | 13:7603 | (6740, 2520) | x=6740 is outside frame (3200+1440=4640) |

**Should align with:** Content area (x=3512)  
**Suggested correction:** Move Empty State to x=3512 (or center: ~3676). Current x=6740 is outside frame bounds.

---

### Misalignment 4: Breadcrumb/DSRV Group
| Element | Node ID | Current (x, y) | Issue |
|---------|---------|----------------|-------|
| Group (breadcrumb) | 12:5428 | (3222, 1123) | 2px left of sidebar nav (3224) |

**Suggested correction:** Align Group to x=3224 for consistency with nav items

---

## 7. SCR-12 Governance (Frame 12:4728)

**Frame position:** x=4800, y=1100, width=1440, height=900

### Misalignment 1: Page Title vs Approval Queue v2
| Element | Node ID | Current (x, y) | Issue |
|---------|---------|----------------|-------|
| Page Title | 12:4751 | (5112, 1148) | — |
| Approval Queue v2 | 13:6283 | (5112, 1185) | 37px gap |
| Table header | 12:6187 | (5112, 1208) | 23px below Approval Queue v2 |

**Note:** Hierarchy appears intentional. No change unless spec differs.

---

### Misalignment 2: Checkbox vs Request ID column
| Element | Node ID | Current (x, y) | Issue |
|---------|---------|----------------|-------|
| Checkbox Header | 13:7591 | (5116, 1212) | 4px right of table left (5112) |
| Request ID header | 12:5785 | (5128, 1231) | 12px right of table |
| Checkbox Row 1 | 13:7592 | (5116, 1274) | — |
| Checkbox Row 2 | 13:7593 | (5116, 1298) | — |

**Should align with:** Table left edge (5112) or Request ID column (5128)  
**Suggested correction:** Align checkboxes to x=5112 (table edge) or x=5116 (current, 4px inset). Ensure Checkbox Header y=1212 aligns with header row (1208–1261); header center ≈1236. Checkbox at 1212 is 24px above header center.

---

### Misalignment 3: Sidebar — missing Dashboard
| Element | Node ID | Current (x, y) | Issue |
|---------|---------|----------------|-------|
| Tokens | 12:4767 | (4824, 1207) | First visible nav |
| Smart Contracts | 12:4768 | (4824, 1247) | — |
| Wallets | 12:4769 | (4824, 1287) | — |
| Governance | 12:4770 | (4824, 1327) | Active |
| Settings | 12:4771 | (4824, 1367) | — |

**Note:** Dashboard nav item is missing from sidebar. Other screens (SCR-09, SCR-10, SCR-11) include Dashboard.

**Suggested correction:** Add Dashboard nav item at (4824, 1167) to match other screens.

---

### Misalignment 4: Empty State position
| Element | Node ID | Current (x, y) | Issue |
|---------|---------|----------------|-------|
| Empty State | 13:7604 | (9940, 2520) | x=9940 is outside frame (4800+1440=6240) |

**Should align with:** Content area (x=5112)  
**Suggested correction:** Move Empty State to x=5112 (or center within table). Current position is far outside frame.

---

## Summary Table: All Misalignments

| # | Screen | Element(s) | Issue | Suggested Fix |
|---|--------|-----------|-------|---------------|
| 1 | SCR-06 | Btn Cancel (10:89) | 20px below Btn Confirm | y: 3760→3740 |
| 2 | SCR-06 | Gov Indicator (13:7586) | 8px left of content | x: 16→24 |
| 3 | SCR-06 | Btn Cancel (10:89) | 8px left of content | x: 16→24 |
| 4 | SCR-06 | Cancel Text (10:91) | 18px below Confirm Text | y: 3768→3750 |
| 5 | SCR-06 | Close Button (13:7585) | 12px above Modal Title | y: 3412→3424 |
| 6 | SCR-07 | Btn Cancel (10:99) | 20px below Btn Confirm | y: 3760→3740 |
| 7 | SCR-07 | Gov Indicator (13:7588) | 8px left of content | x: 556→564 |
| 8 | SCR-07 | Btn Cancel (10:99) | 8px left of content | x: 556→564 |
| 9 | SCR-07 | Cancel Text (10:4545) | 18px below Confirm Text | y: 3768→3750 |
| 10 | SCR-07 | Close Button (13:7587) | 12px above Modal Title | y: 3412→3424 |
| 11 | SCR-08 | Btn Cancel (10:109) | 20px below Btn Confirm | y: 3760→3740 |
| 12 | SCR-08 | Gov Indicator (13:7590) | 8px left of content | x: 1096→1104 |
| 13 | SCR-08 | Btn Cancel (10:109) | 8px left of content | x: 1096→1104 |
| 14 | SCR-08 | Cancel Text (10:4547) | 18px below Confirm Text | y: 3768→3750 |
| 15 | SCR-08 | Close Button (13:7589) | 12px above Modal Title | y: 3412→3424 |
| 16 | SCR-09 | Row 3 cells | 2px vertical mismatch (1403 vs 1405) | Align to y=1403 |
| 17 | SCR-09 | 12:6085 | 1px left of column | x: 1904→1905 |
| 18 | SCR-09 | Empty State (13:7602) | 68px right of table | x: 1940→1872 or center |
| 19 | SCR-09 | Table rects 12:4724–6014 | Outside frame (y>2000) | Verify/relocate |
| 20 | SCR-10 | Back CTA (13:7595) | 30px above title (optional) | y: 2218→2224 if 24px gap |
| 21 | SCR-11 | Empty State (13:7603) | Outside frame (x=6740) | x: 6740→3512 |
| 22 | SCR-11 | Breadcrumb Group (12:5428) | 2px left of nav | x: 3222→3224 |
| 23 | SCR-12 | Checkboxes (13:7591–93) | Verify header alignment | Align to header row |
| 24 | SCR-12 | Sidebar | Missing Dashboard | Add Dashboard nav |
| 25 | SCR-12 | Empty State (13:7604) | Outside frame (x=9940) | x: 9940→5112 |

---

## Recommendations

1. **Modals (SCR-06, 07, 08):** Use a shared modal component with:
   - Content left edge: 24px
   - Footer row: Gov Indicator, Btn Cancel, Btn Confirm at same y (e.g. 3740)
   - Header: Close Button aligned with Modal Title (y=3424)

2. **Empty States:** Place inside frame bounds. SCR-11 and SCR-12 Empty States are outside their frames.

3. **SCR-12:** Add Dashboard to sidebar and fix Empty State position.

4. **SCR-09:** Resolve duplicate/overflow table elements and row 3 vertical alignment.

---

# Part 3: SCR-13 through SCR-18


**Audit date:** 2026-02-20  
**Method:** `get_node_info` with depth=2 via user-figma MCP, `move_node` for fixes  
**Screens audited:** 6 (Contract Detail, Wallet Detail, Program Selector, Mint Builder, Redemption Queue, Collateral Profiles)

---

## Content Area Standard

- **Sidebar ends at:** ~272px from frame left
- **Content starts at:** frame_x + 272
- **Breadcrumb:** content_left, frame_y + 28
- **Back CTA:** content_left, frame_y + 14
- **CTA buttons:** align with content edges (right-aligned at content_right - button_width)
- **Empty State:** centered in content area
- **Frame bounds:** frame_x to frame_x+1440, frame_y to frame_y+900

---

## Fixes Applied

### SCR-13 Contract Detail (13:6376 at x=4800, y=2200)

| Element | Node ID | Before (abs x, y) | After (rel x, y) | Issue |
|---------|---------|-------------------|------------------|-------|
| Breadcrumb | 13:7556 | (5112, 2232) | (272, 28) | 40px right of content_left |
| Back CTA | 13:7553 | (5112, 2228) | (272, 14) | Wrong x, y (frame_y+14) |
| Page Title "Contract Detail" | 13:6385 | (5112, 2248) | (272, 48) | 40px right of content |
| CTA Manage Contract | 13:7550 | (5812, 2248) | (1300, 48) | Right-align to content edge |
| CTA Manage Text | 13:7552 | (5832, 2258) | (1320, 58) | Align with button |

---

### SCR-14 Wallet Detail (13:6355 at x=8000, y=2200)

| Element | Node ID | Before (x, y) | After (x, y) | Issue |
|---------|---------|---------------|--------------|-------|
| Breadcrumb | 13:7558 | (8312, 2232) | (8272, 2228) | 40px right of content_left |
| Back CTA | 13:7594 | (8312, 2218) | (8272, 2214) | Wrong x, y |
| Page Title "Wallet Detail" | 13:6364 | (8312, 2248) | (8272, 2248) | 40px right |
| Vault Summary card | 13:6365 | (8312, 2296) | (8272, 2296) | Content alignment |
| Balances card | 13:6366 | (8728, 2296) | (8672, 2296) | Content alignment |
| Balance & Assets table | 13:6367 | (8312, 2448) | (8272, 2448) | Content alignment |
| Table header rect | 13:6463 | (8312, 2486) | (8272, 2486) | Content alignment |
| Table rows | 13:6464–13:6466 | (8312, …) | (8272, …) | Content alignment |
| Table text cells | 13:6479–13:6482 | (8328, …) | (8288, …) | Content alignment |

---

### SCR-15 Program Selector (12:4587 at x=1600, y=3400)

| Element | Node ID | Before (x, y) | After (x, y) | Issue |
|---------|---------|---------------|--------------|-------|
| Breadcrumb | 13:7562 | (1872, 3432) | (1872, 3428) | y: frame_y+28 |
| Back CTA | 13:7596 | (1872, 3418) | (1872, 3414) | y: frame_y+14 |

---

### SCR-16 Mint Builder (12:4588 at x=3200, y=3400)

| Element | Node ID | Before (x, y) | After (x, y) | Issue |
|---------|---------|---------------|--------------|-------|
| Breadcrumb | 13:7563 | (3472, 3432) | (3472, 3428) | y: frame_y+28 |
| Back CTA | 13:7597 | (3472, 3418) | (3472, 3414) | y: frame_y+14 |

---

### SCR-17 Redemption Queue (12:4589 at x=4800, y=3400)

| Element | Node ID | Before (x, y) | After (x, y) | Issue |
|---------|---------|---------------|--------------|-------|
| Breadcrumb | 13:7564 | (5072, 3432) | (5072, 3428) | y: frame_y+28 |
| Back CTA | 13:7598 | (5072, 3418) | (5072, 3414) | y: frame_y+14 |
| **Empty State** | 13:7605 | **(9940, 7120)** | **(752, 425)** | **OUTSIDE FRAME** — moved to content center |

---

### SCR-18 Collateral Profiles (12:4590 at x=6400, y=3400)

| Element | Node ID | Before (x, y) | After (x, y) | Issue |
|---------|---------|---------------|--------------|-------|
| Breadcrumb | 13:7565 | (6712, 3432) | (6672, 3428) | 40px right, y: frame_y+28 |
| Back CTA | 13:7570 | (6712, 3428) | (6672, 3414) | 40px right, y: frame_y+14 |
| Page Title | 12:4643 | (6672, 3448) | (6672, 3448) | Already at content_left |
| CTA Mint Builder | 13:7568 | (7632, 3448) | (7720, 3448) | Right-align to content edge |
| CTA Mint Builder Text | 13:7569 | (7648, 3458) | (7736, 3458) | Align with button |
| **Empty State** | 13:7606 | **(13140, 7120)** | **(649, 425)** | **OUTSIDE FRAME** — moved to content center |
| Table header rect | 12:5652 | (6672, 4446) | (6672, 2546) | **OUTSIDE FRAME** (y>4300) |
| Table header text | 12:4644 | (6688, 4463) | (6688, 2563) | **OUTSIDE FRAME** |
| Reserve Transparency | 12:4651 | (6672, 3546) | (6672, 2346) | Content alignment |
| Row 1 background | 12:5716 | (6672, 5517) | (6672, 2517) | **OUTSIDE FRAME** |
| Row 1 cells | 12:4645–12:4650 | (6688–7167, 5470) | (6688–7167, 2527) | **OUTSIDE FRAME** |
| Row 2 cells | 12:5701–12:5706 | (6672–7167, 5519) | (6688–7167, 2584) | **OUTSIDE FRAME** |
| Select Row1 | 13:7571 | (7700, 3540) | (7360, 2529) | **OUTSIDE FRAME** |
| Select Row2 | 13:7572 | (7700, 3600) | (7360, 2586) | **OUTSIDE FRAME** |
| Select Text Row1/2 | 13:7573, 13:7574 | (7712, …) | (7372, …) | Align with buttons |

---

## Summary

| Screen | Fixes Applied | Critical Issues |
|--------|---------------|-----------------|
| SCR-13 | 5 | Breadcrumb, Back CTA, CTA alignment |
| SCR-14 | 12+ | Content area alignment (312→272) |
| SCR-15 | 2 | Breadcrumb, Back CTA y-position |
| SCR-16 | 2 | Breadcrumb, Back CTA y-position |
| SCR-17 | 3 | Breadcrumb, Back CTA, **Empty State outside frame** |
| SCR-18 | 15+ | Breadcrumb, Back CTA, **Empty State outside frame**, **Table rows outside frame** |

**Total fixes:** 39+ node moves

---

## Notes

- All coordinates in `move_node` are **parent-relative** (relative to frame).
- SCR-18 had the most severe layout issues: table elements were at y=4446–5519 (frame ends at y=4300).
- Empty States on SCR-17 and SCR-18 were at x=9940 and x=13140, far outside the frame bounds.

---

# Part 4: Manage Contract Sub-Screens


**Audit date:** 2025-02-20  
**Method:** Figma MCP (`user-figma` / `get_node_info`)  
**Scope:** RECTANGLE-based and FRAME-based MC function screens in x=8000+ y=2200+ area

---

## 1. MC Function Screens Identified

| Screen | Node ID | Type | Position (x, y) | Size |
|--------|---------|------|-----------------|------|
| SCR-10 Manage Contract | 13:7111 | FRAME | (8000, 4600) | 1440×900 |
| SCR-10a totalSupply | 13:6707 | RECTANGLE | (9600, 4600) | 1440×900 |
| SCR-10b allowance | 13:6708 | RECTANGLE | (11200, 4600) | 1440×900 |
| SCR-10e transfer | 13:7508 | RECTANGLE | (12793, 4600) | 1440×900 |
| SCR-10d burn | 13:6710 | RECTANGLE | (11200, 5700) | 1440×900 |
| SCR-10e transfer (row2) | 13:6711 | RECTANGLE | (12800, 5700) | 1440×900 |
| SCR-10i approve | 13:7183 | FRAME | (8000, 5700) | 1440×900 |
| SCR-10j pause | 13:7045 | FRAME | (9600, 5700) | 1440×900 |

**Orphaned / far-off-screen (not in main layout):**
- SCR-10c mint (13:6709) at (20000, 20000)
- SCR-10f name (13:6992) at (32800, 29600)
- SCR-10g symbol, SCR-10h decimals: see FRAME 13:7046, 13:7111

---

## 2. Misalignments Found

### 2.1 SCR-10 Manage Contract — Children Outside Frame

**Frame bounds:** (8000, 4600) – (9440, 5500)

The following elements are **children of SCR-10** but positioned **outside the frame** (at x=11380–11732, y=8896–9035):

| Node ID | Element Name | Current (x, y) | Expected (x, y) | Suggested Fix |
|---------|--------------|----------------|-----------------|---------------|
| 13:7138 | Selected Row | (11380, 8938) | (8288, 4948) | Move into Function List Panel; align with decimals() row |
| 13:7161 | Btn Call | (11716, 8896) | (8616, 4896) | Move into Execution Panel; align with Parameters row |
| 13:7163 | Result Divider | (11716, 8952) | (8616, 4952) | Move into Execution Panel; below Call button |
| 13:7164 | Text (Result) | (11716, 8968) | (8616, 4968) | Move into Execution Panel |
| 13:7165 | Result Box | (11716, 8992) | (8616, 4992) | Move into Execution Panel |
| 13:7166 | Text (18) | (11732, 9010) | (8632, 5010) | Move into Result Box |
| 13:7167 | Text (meta) | (11732, 9035) | (8632, 5035) | Move into Result Box |

**Root cause:** These nodes use absolute coordinates from another screen (e.g. allowance at x=11200) instead of frame-relative coordinates. They should be inside the Execution Panel (8592–9160) and Function List Panel (8272–8572).

---

### 2.2 Wrapper Frames 25px Above Background Rect

**Issue:** Wrapper frames (Frame 1739336651/2/4/5) are positioned 25px above their background rects, causing misalignment.

| Node ID | Element Name | Screen | Current (x, y) | Expected (x, y) | Suggested Fix |
|---------|--------------|--------|----------------|-----------------|---------------|
| 13:7538 | Frame 1739336651 | SCR-10a totalSupply | (9600, 4575) | (9600, 4600) | Move y from 4575 to 4600 |
| 13:7539 | Frame 1739336652 | SCR-10b allowance | (11200, 4575) | (11200, 4600) | Move y from 4575 to 4600 |
| 13:7542 | Frame 1739336655 | SCR-10d burn | (11200, 5675) | (11200, 5700) | Move y from 5675 to 5700 |
| 13:7541 | Frame 1739336654 | SCR-10e transfer | (12800, 5675) | (12800, 5700) | Move y from 5675 to 5700 |

---

### 2.3 Text/Label Elements Above Frame (SCR-10i, SCR-10j)

| Node ID | Element Name | Screen | Current (x, y) | Expected | Suggested Fix |
|---------|--------------|--------|----------------|----------|---------------|
| 13:7277 | Text | SCR-10i approve | (8000, 5675) | y ≥ 5700 | Move y from 5675 to 5700 |
| 13:7230 | Text | SCR-10j pause | (9600, 5675) | y ≥ 5700 | Move y from 5675 to 5700 |

---

### 2.4 Text/Label Outside Bounds (SCR-10a, SCR-10b)

| Node ID | Element Name | Screen | Current (x, y) | Expected | Suggested Fix |
|---------|--------------|--------|----------------|----------|---------------|
| 13:6949 | Text | SCR-10a totalSupply | (9600, 4575) | y ≥ 4600 | Move y from 4575 to 4600 |
| 13:6901 | Text | SCR-10b allowance | (11200, 4575) | y ≥ 4600 | Move y from 4575 to 4600 |
| 13:6885 | Text | SCR-10d burn | (11200, 5675) | y ≥ 5700 | Move y from 5675 to 5700 |
| 13:6984 | Text | SCR-10e transfer | (12800, 5675) | y ≥ 5700 | Move y from 5675 to 5700 |

---

## 3. State Indicators (Loading / Success / Error)

**Status:** OK

State indicators are correctly placed inside Execution Panel areas:

- **SCR-10a totalSupply:** 13:7611, 13:7612, 13:7613 at (10216, 5095/5111/5127) — within Execution Panel
- **SCR-10d burn:** 13:7614–13:7617 at (11816, 6195+) — within Execution Panel
- **SCR-10e transfer** (row2): 13:7618–13:7621 at (13416, 6195+) — within Execution Panel

Vertical spacing between Loading/Success/Error is ~16px.

---

## 4. Horizontal Alignment Summary

| Check | Status |
|-------|--------|
| Sidebar (240px) | Consistent across screens |
| Content start (bg_x + 272) | Consistent |
| Function List Panel (300px) | Consistent |
| Execution Panel (568px) | Consistent |
| Labels/inputs (exec_panel_x + 24) | Consistent where elements are inside bounds |
| State indicators | Within Execution Panel, aligned |

---

## 5. Summary of Misalignments

| Category | Count | Priority |
|----------|-------|----------|
| Children outside frame (SCR-10) | 7 | P0 |
| Wrapper frame y-offset | 4 | P1 |
| Text above frame bounds | 6 | P1 |
| **Total** | **17** | |

---

## 6. Recommended Fix Order

1. **P0:** Move SCR-10 children (13:7138, 13:7161, 13:7163–13:7167) into frame bounds (Execution Panel: x=8616, Function List: x=8288).
2. **P1:** Move wrapper frames and text elements 25px down to align with background rects.

---

## 7. MCP move_node Usage

`move_node` expects absolute or parent-relative coordinates depending on node type. For frame children, use parent-relative coordinates:

- **Frame 13:7111** origin: (8000, 4600)
- **Relative:** Selected Row x=288, y=348; Btn Call x=716, y=296; etc.
- **Absolute:** As listed in Section 2.1.
