#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="${ROOT_DIR}/.bin"
NGROK_BIN="${BIN_DIR}/ngrok"

mkdir -p "${BIN_DIR}"

if [[ ! -x "${NGROK_BIN}" ]]; then
  echo "[ngrok] local binary not found. downloading..."
  curl -fsSL "https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz" \
    -o "${BIN_DIR}/ngrok.tgz"
  tar -xzf "${BIN_DIR}/ngrok.tgz" -C "${BIN_DIR}"
  rm -f "${BIN_DIR}/ngrok.tgz"
  chmod +x "${NGROK_BIN}"
fi

if [[ -n "${NGROK_AUTHTOKEN:-}" ]]; then
  "${NGROK_BIN}" config add-authtoken "${NGROK_AUTHTOKEN}" >/dev/null
fi

echo "[ngrok] starting tunnel to http://localhost:3055"
echo "[ngrok] after startup, connect with wss://<ngrok-domain>/"
"${NGROK_BIN}" http 3055
