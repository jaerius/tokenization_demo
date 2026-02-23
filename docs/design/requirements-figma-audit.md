# 요구사항 vs 피그마 정합성 감사 보고서

> 감사 기준: 제품 요구사항 (Token Issuance & Management MVP)
> 감사 대상: Figma SCR-01 ~ SCR-23 전체 화면
> 감사일: 2026-02-23

---

## 종합 판정

| 항목 | 반영 | 부분반영 | 미반영 |
|---|---|---|---|
| 전체 30개 요구항목 | **18** | **5** | **7** |
| 반영률 | 60% | 17% | **23% GAP** |

---

## 1. 필수 사항 (MVP 필수) 대조

### 1.1 ERC-20 기반 Token Template → Deploy → Operate 전체 흐름

| 단계 | 요구사항 | 피그마 | 상태 |
|---|---|---|---|
| Template 선택 | Token Type 선택 (ERC-20F) | SCR-04 Step 1b: 카드 선택 + 함수 프리뷰 | ✅ 반영 |
| Deploy | 파라미터 입력 → 승인 → 배포 | SCR-04 Step 1~5 위저드 → Review & Submit | ✅ 반영 |
| Deploy 결과 | Token Address, Tx Hash, Program ID | **없음** | ❌ **GAP** |
| Operate | Mint/Burn/Transfer | SCR-03 Token Detail + SCR-06~08 모달 | ✅ 반영 |
| Operate | Pause/Unpause | **Token Detail에 버튼 없음** | ❌ **GAP** |
| Operate | Lock/Unlock | **전체 UI 없음** | ❌ **GAP** |

### 1.2 API-First 구조

| 요구사항 | 피그마 | 상태 |
|---|---|---|
| 모든 기능은 API 기준 설계 | UI 화면은 있으나 API Console/Key 관리 화면 없음 | ⚠️ 부분반영 |
| API로 나오면 안 되는 사항 확인 | 별도 화면 없음 | ❌ **GAP** |

### 1.3 승인(Approval) + Audit Log

| 요구사항 | 피그마 | 상태 |
|---|---|---|
| 승인 큐 | SCR-12 Approval Queue v2 (8컬럼 + Bulk 액션) | ✅ 반영 |
| Governance 상태 표시 | Mint 모달에 "Auto-approved" 표시, Manage Contract에 "Needs Approval" 칩 | ✅ 반영 |
| Audit Log | Token Detail Activity Table (Type/Amount/Actor/Timestamp/Status/Tx_hash) | ✅ 반영 |
| 전용 Audit Log 화면 | **없음** (Activity Table에 혼합) | ⚠️ 부분반영 |

### 1.4 External Token / Utility Import

| 요구사항 | 피그마 | 상태 |
|---|---|---|
| External Token Import | SCR-05 Link Token (Blockchain + Contract Address + Verify + Link) | ⚠️ 부분반영 |
| → ERC-20 인터페이스 검증 결과 | Verify 버튼만 있고 **결과 표시 UI 없음** | ❌ **GAP** |
| → mint/burn/pause 가능 여부 확인 | **"관리 가능/불가" 판정 UI 없음** | ❌ **GAP** |
| External Utility Import | **전체 UI 없음** | ❌ **GAP** |

### 1.5 Mint/Burn/Pause 위험 Action 통제

| 요구사항 | 피그마 | 상태 |
|---|---|---|
| Mint | SCR-06 Mint Modal (Amount + Destination + Confirm) | ✅ 반영 |
| Burn | SCR-07 Burn Modal (Amount + Source + Confirm) | ✅ 반영 |
| Transfer | SCR-08 Transfer Modal (Amount + Source + Dest + Confirm) | ✅ 반영 |
| Pause/Unpause | **Token Detail에 버튼 없음** | ❌ **GAP** |
| Risk 경고 | 모달에 Governance state indicator 있음 | ✅ 반영 |

---

## 2. 컨트랙트 구조 (섹션 3) 대조

### 2.1 Token Template (ERC-20 Base)

| 요구사항 | 피그마 | 상태 |
|---|---|---|
| name / symbol / decimals | SCR-04 Step 3 입력 필드 + Function Preview | ✅ 반영 |
| mint / burn | SCR-04 Function Preview + SCR-06/07 모달 | ✅ 반영 |
| pause / unpause | Function Preview에 `pause()` 표시됨 + Manage Contract에 `pause()` | ⚠️ 부분반영 (프리뷰만 있고 실행 UI 없음) |
| Role 기반 권한 (MINTER, BURNER, PAUSER, ADMIN) | SCR-04 Step 4 + Function Preview "Roles" 섹션 | ✅ 반영 |
| Upgradeable 여부 선택 | **선택 옵션 없음** | ❌ **GAP** |

### 2.2 Utility Contract (모듈형)

| 요구사항 | 피그마 | 상태 |
|---|---|---|
| Lock / Unlock | **전체 UI 없음** | ❌ **GAP** |
| Transfer Restriction Hook | **전체 UI 없음** | ❌ **GAP** |
| Token ↔ Utility 연결/분리 | **전체 UI 없음** | ❌ **GAP** |

---

## 3. Issuance Flow (섹션 4) 대조

### 3.1 Token Deploy API

| 요구사항 | 피그마 | 상태 |
|---|---|---|
| Template ID 선택 | SCR-04 Step 1b 토큰 타입 카드 | ✅ 반영 |
| 파라미터 입력 | SCR-04 Step 1~4 | ✅ 반영 |
| 승인 단계 | SCR-04 Step 5 → Approval Queue | ✅ 반영 |
| 결과: Token Address + Tx Hash + Program ID | **배포 결과 확인 화면 없음** | ❌ **GAP** |

### 3.2 Utility Deploy & Attach

| 요구사항 | 피그마 | 상태 |
|---|---|---|
| Utility 컨트랙트 배포 | **전체 UI 없음** | ❌ **GAP** |
| Token ↔ Utility 권한 연결 | **전체 UI 없음** | ❌ **GAP** |
| 연결 이력 기록 | **전체 UI 없음** | ❌ **GAP** |

---

## 4. Operation API (섹션 6) 대조

| Action | 피그마 | Request→Approve→Execute→Record | 상태 |
|---|---|---|---|
| Mint | SCR-06 모달 | 모달→Queue→Activity Log | ✅ |
| Burn | SCR-07 모달 | 모달→Queue→Activity Log | ✅ |
| Pause / Unpause | **버튼/모달 없음** | N/A | ❌ **GAP** |
| Lock / Unlock | **전체 없음** | N/A | ❌ **GAP** |
| Policy Change | **전체 없음** | N/A | ❌ **GAP** |
| Emergency Action | **전체 없음** | N/A | ❌ **GAP** |
| Transfer | SCR-08 모달 | 모달→Queue→Activity Log | ✅ |

---

## 5. 잘 반영된 부분 (Strengths)

1. **Add Token v2 위저드**: Network→Token Type(함수 프리뷰)→Backing Asset(19개 자산 칩)→파라미터→Role→Review 5단계 완성
2. **Lifecycle Rail**: Defined→Deployed→Issued→Distributed→Redeemed 상태 전이 시각화 + timestamp/actor/tx_hash
3. **Approval Queue v2**: 8컬럼 테이블 + Bulk Approve/Reject/Reassign/Escalate 4개 액션
4. **Manage Contract**: Read/Write 함수 목록 + 파라미터 입력 + 실행 + 결과 표시 + Gas 추정 + Approval 칩 ← **Etherscan 수준**
5. **Activity Table**: 6컬럼(Type/Amount/Actor/Timestamp/Status/Tx_hash) Audit Log 기본 구조
6. **모달 Risk 통제**: Governance state indicator ("Auto-approved" / "Needs Approval")
7. **Dashboard Pending Approvals**: 위젯으로 승인 대기 3건 + Priority 표시 + Open Queue CTA

---

## 6. GAP 목록 (우선순위별)

### P0 — MVP 필수 누락

| # | GAP | 요구사항 근거 | 제안 |
|---|---|---|---|
| G1 | **Pause/Unpause 버튼** | §1 위험 Action 통제, §6 Operation API | Token Detail에 Pause/Unpause 버튼 + 확인 모달 추가 |
| G2 | **Deploy 결과 확인 화면** | §4.1 Token Deploy API 출력 | Add Token 완료 후 Token Address + Tx Hash + Program ID 표시하는 Success 화면 |
| G3 | **Link Token 검증 결과** | §5.1 External Token Import | Verify 후 ERC-20 인터페이스 검증 결과 + mint/burn/pause 가능 여부 + "관리 가능/불가" 판정 UI |

### P1 — 운영 안전성

| # | GAP | 요구사항 근거 | 제안 |
|---|---|---|---|
| G4 | **Lock/Unlock 기능** | §3.2 Utility Contract, §6 Operation API | Token Detail에 Lock/Unlock 액션 버튼 + 모달 (주소/물량 단위) |
| G5 | **Utility Contract 배포/연결** | §3.2, §4.2 | 별도 "Attach Utility" 화면 또는 Token Detail 내 Utility 탭 |
| G6 | **Emergency Action** | §6 Operation API | Token Detail에 Emergency 버튼 (빨간색 danger) + 2단계 확인 모달 |
| G7 | **Upgradeable 선택** | §3.1 제약사항 | Add Token Step 1에 "Upgradeable Proxy" 토글 추가 |

### P2 — API/감사 심화

| # | GAP | 요구사항 근거 | 제안 |
|---|---|---|---|
| G8 | **API 관리 화면** | §2.2 API-First | Settings 내 API Keys + API Console 섹션 |
| G9 | **전용 Audit Log** | §1 Audit Log | 별도 Audit Log 화면 (필터/검색/내보내기) |
| G10 | **Policy Change UI** | §6 Operation API | Governance 내 Policy Editor 화면 |
| G11 | **External Utility Import** | §5.2 | Link Token 확장 또는 별도 화면 |

---

## 7. 즉시 실행 권장 항목 (Quick Wins)

위 GAP 중 **기존 화면에 요소 추가만으로 해결 가능한 것**:

1. **G1** — Token Detail에 Pause/Unpause 버튼 2개 추가 (Mint/Burn/Transfer 옆)
2. **G2** — Add Token v2 Submit 후 결과 화면 1개 추가 (Token Address + Tx Hash)
3. **G3** — Link Token의 Verify 버튼 아래에 검증 결과 패널 추가
4. **G7** — Add Token Step 1에 Upgradeable 토글 1개 추가

---

## 8. 화면별 대조 요약

| 화면 | 커버하는 요구사항 | 누락 |
|---|---|---|
| SCR-01 Dashboard | KPI + Activity + Pending Approvals | - |
| SCR-02 Token List | 토큰 목록 + 상태 | - |
| SCR-03 Token Detail | Lifecycle + Activity + Mint/Burn/Transfer | **Pause, Lock, Emergency 버튼** |
| SCR-04 Add Token v2 | Template + Network + Type + Asset + Params + Roles | **Upgradeable 선택, Deploy 결과** |
| SCR-05 Link Token | External Token Import | **검증 결과 UI, 권한 판정** |
| SCR-06~08 Modals | Mint/Burn/Transfer | - |
| SCR-10 Manage Contract | Read/Write 함수 실행 | - (잘 반영됨) |
| SCR-12 Governance | Approval Queue + Batch Actions | **Policy Change UI** |
| SCR-13 Contract Detail | 컨트랙트 정보 | **Utility 연결 정보** |
| (없음) | Utility Contract 배포/연결 | **화면 자체 없음** |
| (없음) | API Key/Console | **화면 자체 없음** |
| (없음) | Audit Log (전용) | **화면 자체 없음** |
