# Fireblocks · Tokeny · Securitize · Bridge 토큰화 프로덕트 비교 (API 중심)

## 1) 문서 목적과 범위

이 문서는 4개 프로덕트의 공개 문서/개발자 문서를 기준으로 다음을 정리한다.

- 어떤 기능을 지원하는지
- 어떤 API를 중심으로 통합하는지
- 4개 제품이 공통으로 지원하는 영역
- 제품별 차별 영역

대상 제품:

1. Fireblocks
2. Tokeny
3. Securitize
4. Bridge

> 기준: 공개된 공식 문서/공식 API 레퍼런스 기준.  
> 주의: 실제 사용 가능 범위는 계약 플랜, 심사, 엔터프라이즈 권한에 따라 달라질 수 있다.

---

## 2) 제품별 지원 기능 및 API 요약

## 2.1 Fireblocks

### 핵심 포지셔닝
- 기관 대상 디지털 자산 인프라 + 토큰 라이프사이클 운영(발행/링크/민트/번/전송) + 정책 승인 제어.

### 공개 문서에서 확인되는 주요 기능
- 토큰 발행(신규 토큰 이슈) [1][2]
- 기존 컨트랙트 링크 [3]
- 민트/번/전송 등 트랜잭션 오퍼레이션 [4][5]
- 정책(TAP) 초안/배포 및 승인요청 조회 API [6]
- EVM 계열 + Stellar + Ripple 기반 토큰화 지원 [2]

### API 관점 메모
- `POST /v1/tokenization/tokens` (신규 토큰 발행) [1]
- `POST /v1/tokenization/tokens/link` (기존 컨트랙트 링크) [3]
- 트랜잭션 API + `MINT/BURN/CONTRACT_CALL` 계열 오퍼레이션 활용 [4][5]
- 토큰화 기능은 별도 유료 기능(Premium)로 명시 [2]

---

## 2.2 Tokeny

### 핵심 포지셔닝
- ERC-3643(권한형 토큰) 기반의 발행/컴플라이언스/이전제어 특화 토큰화 플랫폼.

### 공개 문서에서 확인되는 주요 기능
- Assets API 기반 토큰 배포 및 설정 [7][8]
- 네트워크 조회/토큰 드래프트 생성 등 배포 워크플로우 [8]
- ONCHAINID 기반 신원/자격 연계 (Identities API) [9]
- 컴플라이언스 모듈(국가 제한, 잔고 제한, 조건부 전송, 화이트리스트 전송 등) [10][11]

### API 관점 메모
- `GET /v2/networks` (지원 네트워크 확인) [8]
- `POST /v2/assets/servicing/tokens` (토큰 드래프트/배포 흐름) [8]
- JWT 기반 인증(토큰 만료/재발급 관리 필요) [12]

---

## 2.3 Securitize

### 핵심 포지셔닝
- 규제형 디지털 증권 영역에서 투자자 온보딩/검증/지갑 연계 중심의 인프라 제공.

### 공개 문서에서 확인되는 주요 기능
- Securitize Connect API (Securitize iD) 기반 OAuth2 연동 [13][14]
- 투자자 정보/검증 상태 조회, 문서 관리, 지갑 등록/조회 [15][16][17]
- 스코프 기반 접근 통제(`info details verification`) [14]

### API 관점 메모
- 공개 문서에서 확인되는 API 중심축은 **투자자 신원/검증/지갑 온보딩**
- 토큰 발행/컨트랙트 라이프사이클의 상세 API는 공개 문서 기준으로 제한적이며, 파트너/엔터프라이즈 범위 확인 필요

---

## 2.4 Bridge

### 핵심 포지셔닝
- 스테이블코인 결제/정산 오케스트레이션(법정화폐 레일 ↔ 크립토 레일) 인프라.

### 공개 문서에서 확인되는 주요 기능
- Transfers API (fiat↔crypto, crypto↔crypto 라우팅) [18]
- Transfer 상태머신/상태 추적 [19]
- Virtual Accounts(입금 계좌), Prefunded Accounts(사전충전 계정) [20][21]
- Wallets API 기반 자산 이동/지갑 운영 [22]
- 다중 법정화폐 레일 및 체인 지원 정보 제공 [23]

### API 관점 메모
- 핵심은 “토큰 증권 발행”보다 “스테이블코인 이동/정산/입출금 오케스트레이션”
- 따라서 RWA/증권형 토큰 발행 플랫폼과는 문제영역이 다름

---

## 3) 공통적으로 지원하는 부분

## 3.1 4개 제품 공통(공개 문서 기준)

1. API 기반 통합 모델(문서화된 개발자 포털/레퍼런스 제공)
2. 인증/권한 체계(OAuth2 또는 API 키/JWT 등)
3. 자금/자산 이동 흐름의 상태 관리(요청-처리-완료/실패 추적)
4. 지갑/주소 단위의 엔터티 관리 기능(범위는 제품별 상이)

## 3.2 “토큰화” 관점의 공통점(특히 Fireblocks/Tokeny/Securitize)

1. 규제/컴플라이언스 신호를 업무 흐름에 반영
2. 투자자/참여자 자격 검증 또는 정책 기반 제어
3. 운영자용 워크플로우(온보딩, 승인/검증, 이력 추적) 제공

---

## 4) 차별적으로 지원하는 부분

| 구분 | Fireblocks | Tokeny | Securitize | Bridge |
|---|---|---|---|---|
| 주력 문제 | 기관 자산 운영 + 토큰 라이프사이클 | ERC-3643 규제형 토큰 발행/컴플라이언스 | 투자자 온보딩/검증/지갑 연계 | 스테이블코인 결제/정산 오케스트레이션 |
| 발행(issuance) API 공개성 | 높음 (토큰 발행/링크 API 명시) | 높음 (Assets API 중심) | 공개 범위는 온보딩 API 중심 | 발행보다는 자금 이동 중심 |
| 민트/번/전송 | 명확히 지원 | 표준/정책 기반 전송 제어 강점 | 공개 문서 기준 직접 운용 API 강조는 제한적 | 전송/환전/정산 강점 |
| 컴플라이언스 깊이 | 정책(TAP)로 승인 제어 | ERC-3643 + ONCHAINID + 모듈형 제한 정책 | KYC/KYB/AML 및 투자자 검증 강점 | 결제 레일/규제 권역 제약 중심 |
| 법정화폐 레일 연동 | 상대적으로 제한적(핵심 아님) | 핵심 아님 | 핵심 아님 | 매우 강함 (ACH/SEPA/SPEI/Pix 등) |
| 대표 차별점 | 다중체인 토큰 운용 + 정책엔진 | 전송제한/신원기반 규제형 토큰 표준화 | Securitize iD 기반 투자자 신원 플로우 | Virtual/Prefunded 계정 기반 실시간 오케스트레이션 |

---

## 5) 실무 관점 선택 가이드

### Fireblocks가 유리한 경우
- 이미 기관 커스터디/거래 운영 체계가 있고, 토큰 발행/민트/번/전송을 운영 콘솔과 승인정책으로 묶어 관리하려는 경우.

### Tokeny가 유리한 경우
- ERC-3643 중심의 “규제형 전송 제한”을 제품의 핵심으로 두고, 신원·컴플라이언스 로직을 온체인 정책으로 강하게 가져가려는 경우.

### Securitize가 유리한 경우
- 투자자 KYC/KYB/AML, 문서, 검증상태, 지갑 화이트리스트 등 **온보딩/검증 파이프라인**을 우선 통합해야 하는 경우.

### Bridge가 유리한 경우
- 발행보다도 “법정화폐↔스테이블코인” 송금, 정산, 수취 계좌(virtual account) 운영이 핵심인 경우.

---

## 6) 정리

- **공통점**: 모두 API 중심으로 통합되며, 자금/자산 흐름의 상태관리와 운영 워크플로우를 제공한다.
- **본질적 차이**:
  - Fireblocks/Tokeny/Securitize는 토큰화·컴플라이언스 영역에 더 가깝고
  - Bridge는 결제/정산(오케스트레이션) 영역에 더 가깝다.
- 따라서 “토큰 발행/규제 준수” 중심 MVP인지, “스테이블코인 결제/정산” 중심 MVP인지에 따라 제품 조합 전략이 달라져야 한다.

---

## 참고 링크 (공식 문서)

[1] Fireblocks - Issue a new token  
https://developers.fireblocks.com/reference/issuenewtoken

[2] Fireblocks - Tokenization / Tokenize Assets  
https://developers.fireblocks.com/docs/tokenization  
https://developers.fireblocks.com/docs/issue-new-tokens

[3] Fireblocks - Link a contract  
https://developers.fireblocks.com/reference/link

[4] Fireblocks - Creating a transaction  
https://developers.fireblocks.com/docs/creating-a-transaction

[5] Fireblocks - Burn tokens (reference example)  
https://developers.fireblocks.com/reference/burncollectiontoken

[6] Fireblocks - Transaction Authorization Policy docs/API  
https://developers.fireblocks.com/docs/set-transaction-authorization-policy  
https://developers.fireblocks.com/reference/updatedraft  
https://developers.fireblocks.com/reference/publishpolicyrules

[7] Tokeny Developer Hub  
https://docs.tokeny.com/

[8] Tokeny - Assets API / Deploy flow  
https://docs.tokeny.com/docs/assets-apis-copy  
https://docs.tokeny.com/reference/initiatedeploytoken

[9] Tokeny - Identities API (ONCHAINID)  
https://docs.tokeny.com/docs/identities-apis-copy

[10] Tokeny - ERC-3643 token standard  
https://docs.tokeny.com/docs/the-erc-3643-token-standard

[11] Tokeny - Compliance modules  
https://docs.tokeny.com/docs/compliance-modules

[12] Tokeny - Getting API access  
https://docs.tokeny.com/docs/getting-api-access-1

[13] Securitize Connect API  
https://sec-connect-api-docs.securitize.io/

[14] Securitize Connect API - Authentication / OAuth scope  
https://sec-connect-api-docs.securitize.io/authentication-1/authentication

[15] Securitize Connect API - Wallets  
https://sec-connect-api-docs.securitize.io/wallets

[16] Securitize Connect API - Verification details  
https://sec-connect-api-docs.securitize.io/verification-details

[17] Securitize Connect API - Investor Documents  
https://sec-connect-api-docs.securitize.io/investor-documents

[18] Bridge API - Transfers  
https://apidocs.bridge.xyz/platform/orchestration/transfers/transfer

[19] Bridge API - Transfer states  
https://apidocs.bridge.xyz/platform/orchestration/transfers/transfer-states

[20] Bridge API - Virtual accounts  
https://apidocs.bridge.xyz/platform/orchestration/virtual_accounts/virtual-account

[21] Bridge API - Prefunded accounts  
https://apidocs.bridge.xyz/platform/orchestration/prefunded_accounts/prefunded_accounts

[22] Bridge API - Wallets overview / move money  
https://apidocs.bridge.xyz/platform/wallets  
https://apidocs.bridge.xyz/platform/wallets/move-money

[23] Bridge - Supported payment routes / fiat rails  
https://apidocs.bridge.xyz/get-started/introduction/what-we-support/payment-routes  
https://apidocs.bridge.xyz/get-started/introduction/what-we-support/fiat
