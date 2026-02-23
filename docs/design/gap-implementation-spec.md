# GAP 보완 피그마 구현 명세서

> 요구사항 감사 결과(requirements-figma-audit.md) 기반
> 연결 복구 후 순서대로 실행

---

## G1: Token Detail에 Pause/Unpause 버튼 추가 (P0)

**대상**: SCR-03 Token Detail (10:4)

**추가 요소**:
- Btn Pause: Mint/Burn/Transfer 옆 (x=571, y=282 frame-relative), 80×36, fill #EF8D21 (orange/warning), cornerRadius 8, text "Pause"
- Btn Unpause: 별도 상태 표시용 (Pause 상태일 때 Unpause로 전환)

**Pause Modal (SCR-25)**: 480×320 새 프레임
- Title: "Pause Token Contract"
- Warning text: "이 작업은 모든 transfer/mint/burn을 즉시 중단합니다"
- Risk acknowledgement checkbox
- Governance indicator (Needs Approval)
- Confirm (orange) + Cancel 버튼

---

## G2: Deploy Result 화면 (P0)

**대상**: 새 프레임 SCR-24 (1440×900)

**레이아웃**:
- Sidebar (240px) + Content
- Success icon/badge (green circle + checkmark)
- Title: "Token Deployed Successfully"
- 3개 정보 행:
  - Token Address: `0x7a3f2b1c...4f2e` (copy 버튼)
  - Deploy Tx Hash: `0x8b4a...1f` (copy 버튼 + Etherscan 링크)
  - Program ID: `PRG-001`
- Token summary card (name, symbol, network, standard)
- CTA: "Go to Token Detail →" (파란색) + "Deploy Another" (ghost)

---

## G3: Link Token 검증 결과 패널 (P0)

**대상**: SCR-05 Link Token (10:6)

**추가 요소** (Verify 버튼 아래, y=2500~):
- Verification Result Panel: 400×200, 흰색 카드, 파란 accent bar
- ERC-20 Interface: ✅ Detected / ❌ Not ERC-20
- Functions Detected:
  - ✅ mint (controllable)
  - ✅ burn (controllable)
  - ✅ pause (controllable)
  - ❌ 또는 ⚠️ (not available)
- 판정 결과:
  - 🟢 "관리 가능 (Full Control)" — mint/burn/pause 모두 가능
  - 🟡 "부분 관리 (Partial)" — 일부만 가능
  - 🔴 "관리 불가 (Read Only)" — 권한 없음

---

## G4: Lock/Unlock 버튼 + 모달 (P1)

**대상**: SCR-03 Token Detail (10:4)

**버튼**: "Lock" — Pause 옆, 80×36, fill #7C3AED (purple), text "Lock"

**Lock Modal (SCR-26)**: 480×400
- Title: "Lock Tokens"
- Mode selector: "By Address" / "By Amount" toggle
- Input: Target Address 또는 Amount
- Duration (optional): Until date or indefinite
- Governance indicator
- Confirm + Cancel

---

## G5: Utility Contracts 탭 (P1)

**대상**: SCR-03 Token Detail (10:4) — Tab 영역에 "Utility" 탭 추가

**탭 내용**:
- Utility Contracts 테이블: Address | Type | Status | Attached At
- "Attach Utility" CTA 버튼
- "Detach" 액션 per row
- Empty state: "No utility contracts attached"

---

## G6: Emergency Action 버튼 + 모달 (P1)

**대상**: SCR-03 Token Detail (10:4)

**버튼**: "Emergency" — 최우측, 100×36, fill #DC2626 (red/danger), text "Emergency"

**Emergency Modal (SCR-27)**: 480×400
- Title: "⚠ Emergency Action" (red)
- Warning: "이 작업은 컨트랙트를 즉시 동결합니다. 되돌리려면 별도 거버넌스 승인이 필요합니다."
- Step 1: 사유 입력 (필수)
- Step 2: "EMERGENCY" 텍스트 직접 입력하여 확인
- Confirm (red danger) + Cancel

---

## G7: Upgradeable Proxy 토글 (P1)

**대상**: SCR-04 Add Token v2 (10:5) — Step 1 영역

**추가 요소**:
- Step 1 하단 (Network/Type 사이): 토글 스위치 + label "Upgradeable Proxy (UUPS)"
- Info tooltip: "프록시 패턴 사용 시 향후 컨트랙트 로직 업그레이드 가능. 보안 감사 시 추가 검토 필요."

---

## G8: Settings에 API Keys 섹션 (P2)

**대상**: SCR-23 Settings (13:6377)

**추가 요소**:
- 새 섹션: "API Keys"
- 테이블: Key Name | Key (masked) | Permissions | Created | Last Used | Status
- "Generate New Key" CTA
- Revoke 액션 per row

---

## G9: Audit Log 화면 (P2)

**대상**: 새 프레임 SCR-28 (1440×900)

**레이아웃**:
- Sidebar + Content
- Title: "Audit Log"
- Filter bar: Date range, Action type, Actor, Token, Status
- Table: Timestamp | Action | Token | Amount | Actor | Status | Tx Hash | Approval ID
- Export CSV 버튼
- Pagination

---

## G10: Policy Editor (P2)

**대상**: 새 프레임 SCR-29 (1440×900) 또는 SCR-12 내 탭

**레이아웃**:
- Policy list (left panel): 기존 정책 목록
- Editor (right panel):
  - Policy Name
  - Trigger: Action type (Mint/Burn/Pause/Lock/Emergency) + Threshold
  - Approver Group: Role selector
  - Auto-approve conditions
  - Save / Activate / Deactivate

---

## G11: External Utility Import (P2)

**대상**: SCR-05 Link Token (10:6) 확장 또는 별도 탭

**추가 요소**:
- "Import Utility Contract" 섹션 (Link Token 하단)
- Utility Contract Address 입력
- 연결할 Token 선택 (dropdown)
- 위험 함수 스캔 결과 표시
- Link Utility 버튼

---

## 실행 순서

1. G1 (Pause 버튼 + 모달)
2. G2 (Deploy Result 화면)
3. G3 (Link Token 검증 패널)
4. G7 (Upgradeable 토글)
5. G4 (Lock/Unlock)
6. G6 (Emergency)
7. G5 (Utility 탭)
8. G8 (API Keys)
9. G9 (Audit Log)
10. G10 (Policy Editor)
11. G11 (Utility Import)
