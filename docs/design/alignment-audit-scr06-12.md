# Figma Alignment Audit: SCR-06 through SCR-12

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
