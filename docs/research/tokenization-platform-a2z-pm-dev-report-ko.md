# Tokenization 프로덕트 A to Z 통합 분석 리포트 (PM/개발자 관점, 한국어)

## 0) 문서 개요 (기존 산출물 통합)

이 문서는 아래 기존 문서를 통합/확장한 **단일 리포트**다.

- `docs/research/requirements-summary.md`
- `docs/research/market-comparison.md`
- `docs/research/fireblocks-tokenization-notes.md`
- `docs/research/tokenization-product-api-comparison-ko.md`

대상 프로덕트:

1. Fireblocks
2. Tokeny
3. Securitize
4. Bridge

핵심 목표:

- 컨트랙트/표준/체인/정책 관점의 지원 명세를 최대한 상세화
- 제품 관점(PM 20년차 시각)과 개발 관점(개발 20년차 시각)에서 실제 구축 의사결정에 바로 쓰일 수준으로 정리

---

## 1) TL;DR (의사결정 한 줄 요약)

- **발행 + 멀티체인 운영 + 승인정책 자동화** 중심이면: Fireblocks 우세
- **규제형 권한 토큰(ERC-3643) + 온체인 컴플라이언스 강제** 중심이면: Tokeny 우세
- **투자자 KYC/KYB/AML 온보딩 + 검증/지갑 화이트리스트 API** 중심이면: Securitize Connect 우세
- **법정화폐 레일 ↔ 스테이블코인 송금/정산/수취 오케스트레이션** 중심이면: Bridge 우세

중요:
- 이 4개는 완전 대체 관계가 아니라 **레이어가 다름**.
- 실제 구축에서는 `발행/컴플라이언스 레이어 + 결제/정산 레이어`로 조합하는 경우가 많다.

---

## 2) 조사 방법 및 신뢰도

## 2.1 조사 범위

- 공식 개발자 문서 / API 레퍼런스 / 공식 프로토콜 문서 우선
- 마케팅 카피보다 API 문서와 엔드포인트 가시성을 우선 평가

## 2.2 해석 원칙

- 공개 API 문서에 없는 기능은 “없다”가 아니라 **“공개 범위 미확인”**으로 분리
- 엔터프라이즈 계약/규제 심사/지역 제한에 의해 실제 가용성은 달라질 수 있음

---

## 3) 컨트랙트/체인/표준 지원 명세 (핵심)

## 3.1 Fireblocks

### 컨트랙트/표준 관점
- Tokenization API + Contract Template API 기반으로 컨트랙트 배포/연결/운영 흐름 제공
- EVM 계열은 민트/번/전송/임의 컨트랙트 함수 호출(`CONTRACT_CALL`) 지원
- Fireblocks 문서에 ERC721F/ERC1155F 레퍼런스 구현 및 관련 발행 API가 명시됨
- 템플릿 목록/템플릿별 지원 체인 조회/생성자 조회/ABI 조회 API가 존재

### 체인 관점
- 공개 문서 기준: EVM 계열 + Stellar + Ripple 토큰화 지원
- Stellar/Ripple은 trustline 관련 운영 흐름이 문서에 명시됨

### 중요한 제약
- Tokenization 기능은 프리미엄 기능으로 별도 활성화가 필요하다고 명시됨

---

## 3.2 Tokeny

### 컨트랙트/표준 관점 (강점)
- 핵심 표준: **ERC-3643 Permissioned Token**
- ERC-3643의 핵심 온체인 구성요소:
  - Identity Registry
  - Claim Topics Registry
  - Trusted Issuers Registry
  - Compliance(모듈형)
- 전송 시 `신원 + 클레임 + 발급자 신뢰성 + 컴플라이언스 룰`을 결합 검증하는 구조

### 컴플라이언스 모듈 관점
- 국가 Allow/Restrict
- 최대 보유량/공급량 제한
- 조건부 전송(Conditional Transfer)
- 화이트리스트 기반 전송 제한
- 시간 기반 전송/거래소 전송 제한

### API 관점
- 네트워크 조회, 토큰 드래프트/배포, 컴플라이언스 설정 흐름이 문서화됨
- JWT 인증 기반 운영

---

## 3.3 Securitize

### 공개 API에서 확인되는 축
- Securitize Connect API 중심:
  - OAuth2 인증
  - 투자자 검증 상태
  - 문서 관리
  - 지갑 등록/조회 (tokenId와 연계)

### 컨트랙트 관점 (주의)
- 최신 공개 Connect API 문서만 보면, 발행/민트/번을 직접 다루는 상세 API는 전면적으로 노출되지 않음
- 다만 공개 레퍼런스로 DS Protocol(과거 공개 인터페이스) 및 ERC20 호환형 디지털 증권 인터페이스 자료가 존재
- 따라서 실제 구축 시에는:
  - “Connect API로 가능한 범위(온보딩/검증/지갑)”와
  - “토큰 컨트랙트 운용(파트너/엔터프라이즈 범위)”를 분리 확인해야 함

---

## 3.4 Bridge

### 컨트랙트 관점 (핵심 구분)
- Bridge는 “신규 보안형 토큰 컨트랙트 발행 플랫폼”이라기보다
  - 스테이블코인 이동
  - 법정화폐 레일 연계
  - 정산 오케스트레이션
  레이어에 최적화

### 지원 자산/체인 관점
- Wallet/Orchestration 문서 기준으로 스테이블코인 및 체인 지원을 제공
- Virtual Accounts / Prefunded Accounts / Transfers 상태머신이 핵심

### 제품 해석
- 토큰화 프로젝트에서 Bridge는
  - “발행 레이어” 대체재라기보다
  - “입출금/송금/정산 레이어” 보완재로 보는 것이 정확

---

## 3.5 컨트랙트/표준 지원 비교표 (실무용)

| 항목 | Fireblocks | Tokeny | Securitize | Bridge |
|---|---|---|---|---|
| 신규 토큰 발행 API 공개 | 높음 | 높음 | 공개 범위 제한적(Connect API 중심) | 낮음(핵심 영역 아님) |
| 기존 컨트랙트 링크 | 지원(문서 명시) | 토큰/컴플라이언스 관리 중심 | 지갑-토큰 연계 중심 | 해당 없음(발행 플랫폼 아님) |
| 표준/컨트랙트 철학 | 템플릿+운영 중심 | ERC-3643 네이티브 | 온보딩/신원 중심 + DS 레거시 공개자료 | 결제/정산 오케스트레이션 |
| 전송 전 신원/컴플라이언스 온체인 강제 | 정책/승인 중심(오프체인 정책 비중) | 매우 강함(온체인 모듈) | 검증 API 강점(온체인 강제 구조 공개 제한) | 규제/레일 제약 중심 |
| 민트/번/전송 | 강함 | 강함(권한형 전송 제어) | 공개 API 기준 제한적 | 전송/환전/정산 강함 |
| 멀티체인/레일 확장성 | 강함 | EVM 중심 권한형 토큰 | 파트너 구조 확인 필요 | 법정화폐 레일 강함 |

---

## 4) 기능 명세 A to Z (PM/개발 공통 점검)

아래 A~Z는 “토큰화 프로덕트 빌딩 시 빠짐없이 확인해야 할 체크포인트”다.

| 글자 | 체크포인트 | 실무 해석 |
|---|---|---|
| A | Asset Universe | 어떤 자산(증권/RWA/스테이블코인/포인트)을 토큰화할지 |
| B | Blockchain Coverage | 체인별 지원 범위(EVM/비EVM/레일) |
| C | Contract Standard | ERC-20/721/1155/3643 등 표준 선택 |
| D | Deployment Model | 신규 배포 vs 기존 컨트랙트 링크 |
| E | Eligibility | 투자자/지갑 자격 검증 모델(KYC/KYB/AML/클레임) |
| F | Fiat Rails | ACH/SEPA/SPEI/Pix 등 법정화폐 레일 필요성 |
| G | Governance | 승인정책(TAP), 다단계 승인, 예외승인 플로우 |
| H | Holder/Wallet | 주소/지갑 등록, 화이트리스트, 상태관리 |
| I | Issuance | 발행 파라미터, 초기 공급량, 발행 권한 주체 |
| J | Jurisdiction | 국가/권역 규제 제한(allow/restrict) |
| K | Key/Custody | 키 관리/HSM/MPC/승인정책 연계 |
| L | Lifecycle | Mint/Burn/Transfer/Freeze 등 라이프사이클 |
| M | Monitoring | 상태머신/웹훅/리트라이/관측성 |
| N | Network Fees | 가스비/수수료/정산 수수료 구조 |
| O | Operational UX | 운영자 콘솔 UX(대시보드/테이블/모달) |
| P | Policy Engine | 룰엔진(정적/동적, 온체인/오프체인) |
| Q | Quality & Audit | 감사추적(누가/언제/무엇을) + 리포팅 |
| R | Reconciliation | 온체인/원장/정산 데이터 정합성 |
| S | Settlement | 결제완료/반송/에러/취소 상태 정의 |
| T | Transfer Controls | 조건부 전송/화이트리스트/한도 제한 |
| U | Upgradeability | 컨트랙트 업그레이드/버전 정책 |
| V | Vendor Risk | 벤더 락인/API 가시성/계약 의존성 |
| W | Workflow Automation | 발행-검증-정산 자동화 가능 범위 |
| X | eXception Handling | 실패/지연/체인혼잡/검증실패 처리 |
| Y | Yield/Treasury | 스테이블코인 운용/보상/재무 정책 |
| Z | Zero-downtime | 장애복구/다중리전/운영 SLO |

---

## 5) PM 20년차 관점 분석

## 5.1 “무엇을 파는 제품인가”부터 분리해야 한다

- Fireblocks/Tokeny/Securitize는 “토큰화/규제준수/운영통제” 축
- Bridge는 “결제/정산/레일 오케스트레이션” 축

즉, 제품 전략에서 4개를 한 줄에서 대체 비교하면 오판 가능성이 크다.

## 5.2 제품 전략 프레임 (권장)

1. **Core Tokenization Layer**: 발행/라이프사이클/컴플라이언스
2. **Identity & Onboarding Layer**: 투자자 KYC/KYB/지갑 검증
3. **Payments & Settlement Layer**: 법정화폐 레일/스테이블코인 오케스트레이션
4. **Ops & Governance Layer**: 승인정책/감사/모니터링

## 5.3 PM 관점 차별 포인트

### Fireblocks
- 장점: 운영 일관성, 승인정책, 멀티체인 실행
- 리스크: 토큰화 기능의 플랜/활성화 의존성

### Tokeny
- 장점: ERC-3643 중심 규제형 토큰 설계가 매우 명확
- 리스크: 규제 설계 난이도가 높아 초기 온보딩이 무거울 수 있음

### Securitize
- 장점: 투자자 온보딩/검증/지갑 연계 강함
- 리스크: 공개 API만으로 발행 전체 라이프사이클 판단이 어려움

### Bridge
- 장점: 입출금/정산/환전/레일 연동 강함
- 리스크: 발행/권한형 증권 토큰 엔진 대체재로 오해하면 아키텍처 불일치

---

## 6) 개발 20년차 관점 분석

## 6.1 통합 난이도(체감)

| 항목 | Fireblocks | Tokeny | Securitize | Bridge |
|---|---|---|---|---|
| 인증/권한 | 중 | 중 | 중(OAuth 플로우 중요) | 중 |
| 온체인 모델 복잡도 | 중~상 | 상 | 중(공개 범위 기준) | 하~중 |
| 컴플라이언스 구현 난이도 | 중 | 상(모듈 설계 필수) | 중(검증 연동) | 중(레일/규제) |
| 이벤트/상태 처리 | 중 | 중 | 중 | 상(상태머신/레일 예외 많음) |
| 샌드박스-프로덕션 갭 | 중 | 중 | 중 | 상(법무/레일 승인 영향) |

## 6.2 개발자가 반드시 확인할 체크리스트

1. Idempotency 키/재시도 정책(특히 결제/정산 API)
2. 웹훅 서명 검증 및 순서 보장 전략
3. 상태머신 역전 방지(예: pending -> processed 이후 rollback 금지)
4. 지갑 등록/검증/승인 이벤트의 eventual consistency 처리
5. 운영자 수동 개입 절차(runbook)와 감사로그 분리 저장
6. 체인/레일 장애 시 fallback 라우팅 전략

## 6.3 권장 참조 아키텍처

- `orchestrator-service`:
  - 발행 요청/검증/승인/정산 요청을 하나의 도메인 이벤트로 관리
- `policy-service`:
  - 온체인 규칙 + 오프체인 승인 규칙 통합
- `ledger-sync-service`:
  - 온체인 상태 + 내부 원장 + 외부 정산 상태 정합성 관리
- `ops-console`:
  - 수동 재처리, 보류 해제, 감사 추적 UI

---

## 7) 기존 요구사항(FR)과 제품 적합도 통합

기준: `requirements-summary.md`의 FR-01~FR-12.

| FR | 요구사항 | Fireblocks | Tokeny | Securitize | Bridge |
|---|---|---|---|---|---|
| FR-01 | 컨트랙트 생성/링크 | 강함 | 강함 | 공개범위 제한 | 약함 |
| FR-02 | 초기 발행 | 강함 | 강함 | 공개범위 제한 | 약함 |
| FR-03/04/05 | Mint/Burn/Transfer | 강함 | 강함(제어 강함) | 제한적 | 전송/정산 중심 |
| FR-06/07 | 토큰 리스트/상세 운영 | 강함 | 강함 | 중(도메인별 상이) | 중 |
| FR-08 | 대시보드 KPI | 구현 가능 | 구현 가능 | 구현 가능 | 구현 가능 |
| FR-09 | 지갑 매핑 | 강함 | 중~강 | 강함 | 강함 |
| FR-10 | 거버넌스 요약 | 강함(TAP) | 강함(컴플라이언스) | 중 | 중 |
| FR-11 | 컨트랙트 관리 | 강함 | 강함 | 파트너 확인 필요 | 약함 |
| FR-12 | 산출물 export | 제품 무관(내부 구현) | 제품 무관 | 제품 무관 | 제품 무관 |

---

## 8) 구축 시나리오별 추천 조합

## 시나리오 A: 규제형 증권 토큰 발행이 핵심
- 우선 후보: Tokeny + (필요 시) Securitize Connect + 내부 콘솔
- 이유: ERC-3643 기반 규제 통제 강제력이 높음

## 시나리오 B: 기관 운영 중심 토큰 라이프사이클
- 우선 후보: Fireblocks + 내부 정책/감사 레이어
- 이유: 발행/민트/번/전송 + 승인정책 + 멀티체인 운영 균형

## 시나리오 C: 스테이블코인 결제/정산이 핵심
- 우선 후보: Bridge + (필요 시) 발행 플랫폼 별도
- 이유: 법정화폐 레일/정산 오케스트레이션이 핵심 역량

---

## 9) 최종 결론 (A to Z 관점)

1. **컨트랙트 중심 토큰화 엔진**이 목적이면 Fireblocks/Tokeny를 1차 후보로 두는 것이 합리적
2. **투자자 신원/검증 파이프라인**은 Securitize Connect가 강력한 보완축
3. **법정화폐-스테이블코인 정산**은 Bridge가 별도 최적해
4. 실전에서는 단일 벤더 만능주의보다, 도메인별 강점을 조합한 레이어 아키텍처가 실패확률이 낮다

---

## 10) 참고 문서/링크 (공식 우선)

### Fireblocks
- Tokenization overview: https://developers.fireblocks.com/docs/tokenization
- Tokenize assets: https://developers.fireblocks.com/docs/issue-new-tokens
- Issue token API: https://developers.fireblocks.com/reference/issuenewtoken
- Link contract API: https://developers.fireblocks.com/reference/link
- Contract templates: https://developers.fireblocks.com/reference/getcontracttemplates
- Template supported chains: https://developers.fireblocks.com/reference/getsupportedblockchainsbytemplateid
- Template constructor: https://developers.fireblocks.com/reference/getconstructorbycontracttemplateid
- Fetch contract ABI: https://developers.fireblocks.com/reference/fetchcontractabi
- ERC721F/ERC1155F issuance: https://developers.fireblocks.com/reference/issue-new-erc721ferc1155f-tokens
- TAP docs: https://developers.fireblocks.com/docs/set-transaction-authorization-policy

### Tokeny / ERC-3643
- Tokeny docs hub: https://docs.tokeny.com/
- Assets APIs: https://docs.tokeny.com/docs/assets-apis-copy
- ERC-3643 standard: https://docs.tokeny.com/docs/the-erc-3643-token-standard
- Compliance modules: https://docs.tokeny.com/docs/compliance-modules
- Owner compliance config: https://docs.tokeny.com/docs/owner-configure-token-compliance
- Identities APIs: https://docs.tokeny.com/docs/identities-apis-copy
- ERC-3643 docs (registry/compliance): https://docs.erc3643.org/

### Securitize
- Securitize Connect API: https://sec-connect-api-docs.securitize.io/
- Authentication (OAuth): https://sec-connect-api-docs.securitize.io/authentication-1/authentication
- Wallets API: https://sec-connect-api-docs.securitize.io/wallets
- Verification details: https://sec-connect-api-docs.securitize.io/verification-details
- Investor documents: https://sec-connect-api-docs.securitize.io/investor-documents
- DS protocol interfaces reference: https://github.com/securitize-io/DSTokenInterfaces

### Bridge
- Orchestration overview: https://apidocs.bridge.xyz/platform/orchestration/overview
- Transfers: https://apidocs.bridge.xyz/platform/orchestration/transfers/transfer
- Transfer states: https://apidocs.bridge.xyz/platform/orchestration/transfers/transfer-states
- Virtual accounts: https://apidocs.bridge.xyz/platform/orchestration/virtual_accounts/virtual-account
- Prefunded accounts: https://apidocs.bridge.xyz/platform/orchestration/prefunded_accounts/prefunded_accounts
- Wallets overview: https://apidocs.bridge.xyz/platform/wallets/overview
- Supported rails/routes: https://apidocs.bridge.xyz/get-started/introduction/what-we-support/payment-routes
