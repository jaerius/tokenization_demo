------

## Tokenization 프로덕트 통합 분석 리포트 (추가본)

> 원본 리서치는 그대로 유지하고, 아래는 **시장 관점 + 프로덕트 관점 + 구현 관점**을 한 번에 연결한 확장 섹션입니다.

### 1) 조합 전략 플래닝 (왜 이렇게 붙이는지)

#### A. 시장 관점 (Go-to-Market)
- **증권형/RWA 발행**이 핵심이면: 규제형 전송 통제와 투자자 자격 검증이 제품 핵심
- **결제/정산(법정화폐 레일)**이 핵심이면: 송금 라우팅/정산 상태머신이 제품 핵심
- 한 제품으로 모든 레이어를 해결하기보다, 레이어 분리형 조합이 실무적으로 안정적

#### B. 프로덕트 관점 (Feature Fit)
- 발행/컨트랙트 운영: Fireblocks 또는 Tokeny 축
- 투자자 온보딩/검증: Securitize Connect 축
- 입출금/정산/레일: Bridge 축

#### C. 개발 관점 (Integration Fit)
- 외부 API 상태를 내부 도메인 상태로 정규화해야 운영이 안정됨
- Idempotency, 웹훅 서명검증, 재처리(runbook) 설계가 실제 난이도의 핵심

---

### 2) 핵심 결론 요약

1. 4개 벤더는 완전 대체 관계가 아니라 **도메인 레이어가 다름**
2. 발행엔진과 결제엔진을 분리하면 리스크가 크게 줄어듦
3. 계약 전에는 공개 API 가시 범위와 엔터프라이즈 전용 범위를 반드시 분리 검증해야 함

---

### 3) 새 데이터베이스 생성 가이드 (원본 DB 보존)

기존 데이터베이스는 유지하고, 아래 2개 DB를 **새로 생성** 권장:

1. `Tokenization Feature Matrix`
2. `Tokenization Contract Topology`

권장 속성:

- Feature Matrix
  - `Feature Group` (Select)
  - `Feature Name` (Title)
  - `Fireblocks` (Text)
  - `Tokeny` (Text)
  - `Securitize` (Text)
  - `Bridge` (Text)
  - `PM Implication` (Text)
  - `Dev Implication` (Text)
  - `Priority` (Select: P0/P1/P2)

- Contract Topology
  - `Vendor` (Select)
  - `Component` (Title)
  - `Type` (Select: Contract/Registry/API Service/Policy Engine/State Machine)
  - `Connected To` (Text)
  - `Description` (Text)
  - `Support Level` (Select: O/△/X)
  - `Notes` (Text)

---

### 4) 가져오기 파일

아래 CSV를 Notion DB에 Import:

- `docs/research/notion-db-tokenization-feature-matrix.csv`
- `docs/research/notion-db-contract-topology.csv`

---

### 5) 운영 원칙 (문서 유지)

- 기존 페이지 본문/DB는 수정하지 않음
- 본 추가본은 페이지 하단에 섹션으로만 append
- DB도 기존 것 수정이 아니라 신규 생성 후 연결
