# Manage Contract Function Sub-Screens — Alignment Audit Report

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
