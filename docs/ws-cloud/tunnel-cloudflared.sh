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

echo "[cloudflared] starting tunnel to http://localhost:3055"
echo "[cloudflared] after startup, connect with wss://<trycloudflare-domain>/"
"${CLOUDFLARED_BIN}" tunnel --url "http://localhost:3055" --no-autoupdate
