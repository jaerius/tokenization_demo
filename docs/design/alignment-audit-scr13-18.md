# Figma Alignment Audit: SCR-13 through SCR-18

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
