# Figma 화면 보강 실행 프롬프트 (2-AI-Agent)

이 문서는 Tokenization Demo의 P0 보강 항목을 Figma에 반영하기 위한 실행 프롬프트 모음입니다.

기준 문서:

- `docs/IA.md`
- `docs/UserFlow.md`
- `docs/design/screen-inventory.md`
- `docs/research/fireblocks-gap-matrix.md`

채널:

- Talk to Figma channel: `d5x5n0on`

---

## 1) 전체 작업 요약 프롬프트 (단일 실행용)

아래 프롬프트를 그대로 복사해 단일 에이전트로 실행할 수 있습니다.

```text
Connected to server in channel: d5x5n0on

다음 문서를 기준으로 Figma를 업데이트해줘:
- docs/IA.md
- docs/UserFlow.md
- docs/design/screen-inventory.md
- docs/research/fireblocks-gap-matrix.md

목표:
1) Add Token v2 화면 보강
2) Token Detail의 Lifecycle Rail 추가
3) Governance Approval Queue v2 운영 기능 추가

필수 반영:
- Add Token v2:
  - Step 1: Network + Token Type (ERC20F / ERC721F / ERC1155F)
  - Step 2: Backing Asset (Fiat / Commodity / Bond / Other)
  - Step 3: Name/Symbol/Decimals/Initial Supply
  - Step 4: Issuance Roles (Admin/Minter/Pauser) preview
  - Step 5: Review & Submit
- Token Detail:
  - Lifecycle rail 상태: Defined -> Deployed/Linked -> Issued/Minted -> Distributed/Transferred -> Burned/Redeemed
  - 각 상태에 timestamp, actor, tx_hash 영역 표시
- Governance Queue v2:
  - 컬럼: Request ID, Type, Token, Amount, Assignee, SLA, Escalation, Status
  - 액션: Bulk Approve, Bulk Reject, Reassign, Escalate

디자인 제약:
- 기존 Group 25/26/27 스타일 유지
- 기존 다크 테마 토큰과 테이블 스타일 일관 유지
- 기존 SCR ID 체계 유지, 신규는 SCR-19 이상 사용

산출:
- 수정된/신규 프레임 ID 목록
- 변경 요약(화면별 3줄 이내)
```

---

## 2) 2개 AI Agent 분할 전략

### Agent A (정보구조/화면구성 담당)

역할:

- Add Token v2, Lifecycle Rail, Approval Queue v2의 정보구조와 컴포넌트 배치 확정
- 텍스트/필드/테이블 컬럼 완성
- 기존 화면과 네이밍/ID 일관성 유지

프롬프트:

```text
Connected to server in channel: d5x5n0on

너는 IA/UI 구조 담당 Agent A야.
docs/IA.md, docs/UserFlow.md, docs/design/screen-inventory.md를 기준으로 아래만 수행해:

1) SCR-04 Add Token v2 레이아웃 업데이트
2) SCR-03 Token Detail에 Lifecycle Rail 섹션 추가
3) SCR-12 Governance를 Approval Queue v2 구조로 확장

작업 규칙:
- 기존 색상/타이포/간격 시스템 유지
- 테이블 컬럼명은 문서와 동일한 용어 사용
- 신규/수정 프레임 이름 명확히 유지 (예: SCR-04 Add Token v2)

완료 후 보고:
- 수정 프레임 ID
- 추가한 섹션/필드 목록
- 누락/불확실 항목
```

### Agent B (플로우/인터랙션 담당)

역할:

- 화면 간 연결(CTA, 흐름)과 상태 전이 표기 강화
- UserFlow 문서의 P0 Enhancement flow를 Figma 다이어그램/화면 CTA에 반영

프롬프트:

```text
Connected to server in channel: d5x5n0on

너는 흐름/인터랙션 담당 Agent B야.
docs/UserFlow.md와 docs/design/screen-inventory.md 기준으로 아래를 수행해:

1) Add Token v2 플로우 CTA 연결
   - Token List -> Add Token v2 -> Token Detail
2) Token Detail Lifecycle Rail 상태 전이 표기
3) Governance Queue v2의 Batch/Reassign/Escalate 액션 흐름 반영
4) Screen-to-screen 다이어그램(필요시) 최신화

작업 규칙:
- 분기점은 다이아몬드, 비분기는 사각형
- 분기 화살표는 Y/N 라벨 사용
- 기존 다이어그램 스타일(Group 25 계열) 유지

완료 후 보고:
- 연결 추가/수정 목록
- 다이어그램 변경 프레임 ID
- 사용자 확인이 필요한 지점 3개 이내
```

---

## 3) 권장 실행 순서

1. Agent A 먼저 실행 (구조 확정)
2. Agent B 실행 (연결/분기/다이어그램 반영)
3. 최종 검수:
   - `docs/design/screen-inventory.md`의 매핑 표와 일치 여부 확인
   - P0 3항목(Add Token v2 / Lifecycle Rail / Approval Queue v2) 체크

---

## 4) 완료 체크리스트

- [ ] Add Token v2가 5단계 입력 흐름을 갖는다
- [ ] Token Detail에 lifecycle rail + 상태 메타데이터 영역이 있다
- [ ] Governance Queue v2에 SLA/Assignee/Escalation/Batch 액션이 있다
- [ ] 화면/다이어그램 변경사항이 screen-inventory와 충돌하지 않는다
