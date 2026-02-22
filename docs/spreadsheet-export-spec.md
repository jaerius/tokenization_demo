# 스프레드시트/CSV 내보내기 명세

## 1) 목적

인수인계와 추적을 위해 재현 가능한 스프레드시트/CSV 구조를 정의합니다.

- IA 시트: **뎁스 기반 구조(Depth/Path/Parent/Node)**
- User Flow 시트: 흐름/단계/화면 매핑
- 화면 매핑 시트: IA/Flow/Figma 연결

## 2) 워크북 구조

- 워크북 이름: `Tokenization_Demo_IA_and_Flows`
- 필수 시트:
  1. `IA_Map`
  2. `User_Flow_Map`
- 권장 시트:
  3. `Screen_Mapping`
  4. `Glossary`

---

## 3) 시트: IA_Map (뎁스 기반)

현재 CSV 기준 파일: `docs/ia-page-inventory.csv`

### 컬럼 정의

| 컬럼 | 타입 | 필수 | 설명 |
|---|---|---|---|
| Depth | integer | Yes | IA 깊이(0: 루트, 1: 섹션, 2: 페이지, 3: 액션/컴포넌트) |
| Path | string | Yes | 전체 경로(`/Tokenization Demo/Tokens/Token Detail` 형식) |
| Parent | string | Yes | 상위 노드명 |
| Node | string | Yes | 현재 노드명 |
| Priority | enum(P0,P1,P2) | Yes | 우선순위 |
| Type | enum(Root,Section,Page,Action,Component) | Yes | 노드 유형 |

### 최소 커버리지 규칙

- `Depth` 0~3을 모두 포함
- 1뎁스에 아래 6개 영역 포함
  - Dashboard
  - Tokens
  - Smart Contracts
  - Wallets
  - Governance
  - Settings
- Token Detail 하위 액션(`Mint/Burn/Transfer`)을 3뎁스로 포함

### 예시 행

| Depth | Path | Parent | Node | Priority | Type |
|---|---|---|---|---|---|
| 0 | /Tokenization Demo |  | Tokenization Demo | P0 | Root |
| 1 | /Tokenization Demo/Tokens | Tokenization Demo | Tokens | P0 | Section |
| 2 | /Tokenization Demo/Tokens/Token Detail | Tokens | Token Detail | P0 | Page |
| 3 | /Tokenization Demo/Tokens/Token Detail/Mint Action | Token Detail | Mint Action | P0 | Action |
| 3 | /Tokenization Demo/Tokens/Token Detail/Activity Log | Token Detail | Activity Log | P1 | Component |

---

## 4) 시트: User_Flow_Map

### 컬럼 정의

| 컬럼 | 타입 | 필수 | 설명 |
|---|---|---|---|
| flow_id | string | Yes | 고정 플로우 ID (예: FL-001) |
| flow_name | string | Yes | 플로우명 |
| step_no | integer | Yes | 단계 순서 |
| step_name | string | Yes | 단계 설명 |
| actor | string | Yes | 수행 주체(사용자/시스템) |
| source_screen | string | Yes | 시작/현재 화면 |
| target_screen | string | Yes | 다음 화면 |
| decision_point | string | No | 분기 조건 |
| notes | string | No | 비고 |
| source_doc | string | Yes | 원본 문서 경로 |

### 최소 커버리지 규칙

- 3개 이상 플로우 포함
- 각 플로우는 단계별 화면 매핑을 가져야 함

### 예시 행

| flow_id | flow_name | step_no | step_name | actor | source_screen | target_screen | source_doc |
|---|---|---|---|---|---|---|---|
| FL-001 | Issue New Token | 1 | Open Add Token | Operator | Token List | Add Token | docs/UserFlow.md |
| FL-001 | Issue New Token | 2 | Enter token data | Operator | Add Token | Add Token | docs/UserFlow.md |
| FL-002 | Lifecycle Action | 1 | Open action modal | Operator | Token Detail | Mint/Burn/Transfer Modal | docs/UserFlow.md |

---

## 5) 권장 시트: Screen_Mapping

| 컬럼 | 설명 |
|---|---|
| screen_id | 화면 ID (예: SCR-001) |
| screen_name | `docs/design/screen-inventory.md` 기준 이름 |
| ia_node | 연결된 IA 노드 |
| flow_ids | 연결된 flow_id 목록(콤마 구분) |
| figma_link | Figma URL/노드 링크 |
| status | planned / in-design / done |

---

## 6) 데이터 품질 점검 규칙

- `(flow_id, step_no)` 중복 금지
- `source_doc`는 실제 존재하는 문서 경로여야 함
- `P0` 항목은 최소 1개 이상의 플로우 단계와 연결되어야 함
- `Screen_Mapping`의 모든 화면은 IA 노드와 매핑되어야 함

<<<<<<< Updated upstream
- No duplicate `(flow_id, step_no)` combinations
- Every `source_doc` points to an existing markdown file
- P0 items must have at least one linked flow step
- Every screen in inventory maps to at least one IA page

## 7) CSV fallback package for Figma table import

When a live spreadsheet integration is unavailable, use the generated CSV package:

- `docs/design/figma-table-data/IA_Map.csv`
- `docs/design/figma-table-data/User_Flow_Map.csv`
- `docs/design/figma-table-data/Screen_Mapping.csv`

These files preserve the same schema and can be imported into Figma table plugins.
=======
>>>>>>> Stashed changes
