#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="${ROOT_DIR}/.bin"
CLOUDFLARED_BIN="${BIN_DIR}/cloudflared"

mkdir -p "${BIN_DIR}"

if [[ ! -x "${CLOUDFLARED_BIN}" ]]; then
  echo "[cloudflared] local binary not found. downloading..."
  curl -fsSL \
    "https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64" \
    -o "${CLOUDFLARED_BIN}"
  chmod +x "${CLOUDFLARED_BIN}"
fi

if [[ -z "${CLOUDFLARE_TUNNEL_TOKEN:-}" ]]; then
  echo "[cloudflared] CLOUDFLARE_TUNNEL_TOKEN is required."
  echo "[cloudflared] Create a named tunnel and export token first."
  echo "[cloudflared] export CLOUDFLARE_TUNNEL_TOKEN=<your-token>"
  exit 1
fi

echo "[cloudflared] starting named tunnel with token"
echo "[cloudflared] use your fixed domain as: wss://<your-domain>/"
"${CLOUDFLARED_BIN}" tunnel run --token "${CLOUDFLARE_TUNNEL_TOKEN}" --no-autoupdate
