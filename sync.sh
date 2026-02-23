#!/bin/bash
# Tokenization Demo — 간편 동기화 스크립트
# git에 익숙하지 않은 협업자를 위한 원클릭 도구
#
# 사용법:
#   ./sync.sh pull    — 최신 변경사항 받기
#   ./sync.sh save    — 내 변경사항 저장하기
#   ./sync.sh push    — 저장한 내용 공유하기
#   ./sync.sh all     — 받기 + 저장 + 공유 한번에
#   ./sync.sh status  — 현재 상태 보기

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_step() { echo -e "${BLUE}▶${NC} $1"; }
print_ok()   { echo -e "${GREEN}✓${NC} $1"; }
print_warn() { echo -e "${YELLOW}⚠${NC} $1"; }
print_err()  { echo -e "${RED}✗${NC} $1"; }

case "${1}" in
  pull)
    print_step "최신 변경사항을 받아옵니다..."
    git pull origin main --no-rebase 2>/dev/null || {
      print_warn "충돌이 발생했습니다. Cursor에서 도움을 요청하세요."
      print_warn "Cursor에 '충돌 해결해줘'라고 말해보세요."
      exit 1
    }
    print_ok "최신 상태로 업데이트 완료!"
    ;;

  save)
    print_step "변경사항을 저장합니다..."
    CHANGED=$(git status --porcelain | wc -l | tr -d ' ')
    if [ "$CHANGED" -eq "0" ]; then
      print_ok "변경된 파일이 없습니다."
      exit 0
    fi
    echo ""
    echo "변경된 파일 목록:"
    git status --short
    echo ""
    read -p "저장 메모 (Enter로 건너뛰기): " MSG
    if [ -z "$MSG" ]; then
      MSG="[design] 와이어프레임 작업 $(date '+%m/%d %H:%M')"
    fi
    git add -A
    git commit -m "$MSG"
    print_ok "저장 완료! 메모: $MSG"
    ;;

  push)
    print_step "저장한 내용을 팀에 공유합니다..."
    BRANCH=$(git branch --show-current)
    git push origin "$BRANCH" 2>/dev/null || {
      print_warn "공유에 실패했습니다. 먼저 './sync.sh pull'을 실행해보세요."
      exit 1
    }
    print_ok "공유 완료! (브랜치: $BRANCH)"
    ;;

  all)
    print_step "전체 동기화를 시작합니다 (받기 → 저장 → 공유)"
    echo ""
    "$0" pull  && echo ""
    "$0" save  && echo ""
    "$0" push
    echo ""
    print_ok "전체 동기화 완료!"
    ;;

  status)
    echo ""
    echo -e "${BLUE}=== 현재 상태 ===${NC}"
    echo ""
    BRANCH=$(git branch --show-current)
    echo "현재 브랜치: $BRANCH"
    echo ""
    CHANGED=$(git status --porcelain | wc -l | tr -d ' ')
    if [ "$CHANGED" -eq "0" ]; then
      print_ok "변경된 파일 없음"
    else
      print_warn "${CHANGED}개 파일이 변경됨:"
      git status --short
    fi
    echo ""
    AHEAD=$(git rev-list --count origin/"$BRANCH"..HEAD 2>/dev/null || echo "?")
    BEHIND=$(git rev-list --count HEAD..origin/"$BRANCH" 2>/dev/null || echo "?")
    [ "$AHEAD" != "0" ] && [ "$AHEAD" != "?" ] && print_warn "공유 안 된 저장 ${AHEAD}건 (./sync.sh push)"
    [ "$BEHIND" != "0" ] && [ "$BEHIND" != "?" ] && print_warn "받지 않은 변경 ${BEHIND}건 (./sync.sh pull)"
    [ "$AHEAD" = "0" ] && [ "$BEHIND" = "0" ] && print_ok "팀과 동기화 상태"
    echo ""
    ;;

  *)
    echo ""
    echo -e "${BLUE}Tokenization Demo 동기화 도구${NC}"
    echo ""
    echo "사용법:"
    echo "  ./sync.sh pull    — 최신 변경사항 받기"
    echo "  ./sync.sh save    — 내 변경사항 저장하기"
    echo "  ./sync.sh push    — 저장한 내용 공유하기"
    echo "  ./sync.sh all     — 받기 + 저장 + 공유 한번에"
    echo "  ./sync.sh status  — 현재 상태 보기"
    echo ""
    ;;
esac
