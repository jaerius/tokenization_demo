# Figma Table Data Package (Spreadsheet Fallback)

## 1) Purpose

This package provides spreadsheet-equivalent data in CSV format so the same structure can be recreated in Figma tables when direct Spreadsheet/MCP workflows are unavailable.

## 2) Runtime connectivity snapshot

- WebSocket port: `3055` (listener confirmed)
- Channel check: `tr35xtyx` join ack confirmed
- MCP resource discovery in this runtime: unavailable (`No MCP resources found`)

Because MCP resource binding is still unavailable from this runtime, the data below is prepared as import-ready files.

## 3) Delivered table files

| File | Intended table |
|---|---|
| `docs/design/figma-table-data/IA_Map.csv` | IA mapping table |
| `docs/design/figma-table-data/User_Flow_Map.csv` | User flow step table |
| `docs/design/figma-table-data/Screen_Mapping.csv` | Screen-to-IA/Flow traceability table |

## 4) How to use in Figma

1. Open Figma file and create a destination frame (for example, `04_Flows` page).
2. Use your preferred table plugin or CSV importer.
3. Import each CSV file as a table.
4. Keep headers fixed and apply status color chips for `planned/in-progress/done`.
5. After import, add generated frame links back into `figma_link` column in `Screen_Mapping`.

## 5) Suggested placement in Figma pages

- `IA_Map.csv` -> `01_Layout` or `04_Flows`
- `User_Flow_Map.csv` -> `04_Flows`
- `Screen_Mapping.csv` -> `02_Screens` overview frame
