# Figma Update Specification (2026-02)

> 경쟁사 딥리서치 및 담보 기반 민팅 스펙 반영에 따른 Figma 변경 정의

## 1) 변경 배경

- **경쟁사 분석 반영**: Fireblocks(멀티체인/trustline), Bridge(xUSD/1:1백킹/rail), Securitize(자산군/KYC/리딤) 기준
- **갭 보강**: "화면 연결 부족" + "무엇을 어떤 담보로 민팅하는지 부족" 해소
- **신규 화면**: Token Program Selector, Mint Request Builder, Redemption Queue, Collateral Profiles

## 2) 신규 화면 (SCR-15 ~ SCR-18)


| ID     | Screen               | IA mapping                   | 핵심 요소                                    | Figma Frame ID |
| ------ | -------------------- | ---------------------------- | ---------------------------------------- | -------------- |
| SCR-15 | Program Selector     | Tokens > Program Selector    | 프로그램 목록, 자산군/토큰타입, 선택 CTA                | 12:4587        |
| SCR-16 | Mint Request Builder | Tokens > Mint Builder        | 프로그램 선택, 담보 선택, 금액, 증빙URL                | 12:4588        |
| SCR-17 | Redemption Queue     | Tokens > Redemption Queue    | 리딤 대기 목록, 상태, 처리 액션                      | 12:4589        |
| SCR-18 | Collateral Profiles  | Tokens > Collateral Profiles | 담보 목록, 담보비율, 증빙URL, Reserve Transparency | 12:4590        |


### SCR-15 Program Selector

- **레이아웃**: 기존 사이드바(240px) + content area
- **섹션**: 
  - 제목: "Select Issuance Program"
  - 테이블: Program Name | Asset Class | Token Type | Collateral Ratio | Status | Actions
  - 예시 행: USDC Staking | Treasury | Stablecoin | 100% | Active | Select
  - 필터: 자산군/토큰타입 드롭다운
- **CTA**: "Select Program" → Mint Builder

### SCR-16 Mint Request Builder

- **레이아웃**: 기존 사이드바 + content area
- **섹션**:
  - Step 1: Program 선택 (선택된 프로그램 표시)
  - Step 2: Collateral 선택 (담보 프로필 목록)
  - Step 3: Amount, 증빙 URL 입력
  - Step 4: Review & Submit
- **입력 필드**: Amount, Proof URL (ex) https://...), Memo (optional)
- **CTA**: "Submit Mint Request"

### SCR-17 Redemption Queue

- **레이아웃**: 기존 사이드바 + content area
- **섹션**:
  - 제목: "Redemption Queue"
  - 테이블: Request ID | Token | Amount | Requester | Status | Actions
  - 예시 행: REQ-001 | USDC | 5,000 | 0x1234... | Pending | Process
  - 필터: Status (Pending/Processing/Completed)

### SCR-18 Collateral Profiles

- **레이아웃**: 기존 사이드바 + content area
- **섹션**:
  - 제목: "Collateral Profiles"
  - 테이블: Profile Name | Asset Class | Collateral Ratio | Proof URL | Last Updated | Status
  - 예시 행: US Treasury Reserve | Treasury | 100% | https://... | 2025-02-20 | Verified
  - Reserve Transparency: 담보비율 시각화, 증빙 링크

## 3) 기존 화면 수정

### Mint Modal (SCR-06)

- **추가 필드**: Program (선택된 프로그램 표시), Collateral (담보 프로필 표시)
- **플로우 연결**: Token Detail → Mint Modal (기존) 또는 Token Detail → Program Selector → Mint Builder (확장)
- **옵션**: 간단 모드(기존 Amount+Destination) vs 확장 모드(Program+Collateral+Amount)

### Token Detail (SCR-03)

- **추가**: "Mint with Program" 또는 "Program Mint" CTA → Program Selector
- **추가**: "View Collateral" 링크 → Collateral Profiles

### Token List (SCR-02)

- **추가 컬럼(선택)**: Program, Collateral Ratio
- **또는**: 기존 유지, Program/Collateral는 상세에서만

## 4) 화면 전이 매트릭스


| From \ To           | Token List | Token Detail | Add Token | Link Token | Program Selector | Mint Builder | Redemption Queue | Collateral Profiles |
| ------------------- | ---------- | ------------ | --------- | ---------- | ---------------- | ------------ | ---------------- | ------------------- |
| Dashboard           | ✓          | ✓            | ✓         | -          | -                | -            | ✓                | -                   |
| Token List          | -          | ✓            | ✓         | ✓          | ✓                | -            | ✓                | ✓                   |
| Token Detail        | ✓          | -            | -         | -          | ✓                | ✓            | ✓                | ✓                   |
| Program Selector    | -          | -            | -         | -          | -                | ✓            | -                | ✓                   |
| Mint Builder        | ✓          | ✓            | -         | -          | ✓                | -            | ✓                | ✓                   |
| Redemption Queue    | ✓          | ✓            | -         | -          | -                | -            | -                | ✓                   |
| Collateral Profiles | ✓          | ✓            | -         | -          | ✓                | ✓            | -                | -                   |


## 5) 데이터 필드 (스프레드시트/디자인 참고)


| 객체           | 추가 필드                                                     |
| ------------ | --------------------------------------------------------- |
| Token        | program_id, asset_class, token_type, collateral_ratio     |
| Program      | name, asset_class, token_type, collateral_ratio, status   |
| Collateral   | profile_name, asset_class, ratio, proof_url, last_updated |
| Mint Request | program_id, collateral_id, amount, proof_url, status      |


## 6) Figma 구현 체크리스트

- SCR-15 Program Selector 프레임 생성 (12:4587)
- SCR-16 Mint Request Builder 프레임 생성 (12:4588)
- SCR-17 Redemption Queue 프레임 생성 (12:4589)
- SCR-18 Collateral Profiles 프레임 생성 (12:4590)
- 4개 화면에 사이드바 + 6개 메뉴 적용
- 예시 데이터(ex) 플레이스홀더 적용
- screen-inventory.md 업데이트
- 전이 매트릭스 Mermaid 다이어그램 추가

