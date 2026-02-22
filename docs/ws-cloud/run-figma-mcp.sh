#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "${ROOT_DIR}"

if [[ -z "${CLOUDFLARE_TUNNEL_TOKEN:-}" ]]; then
  echo "[setup] CLOUDFLARE_TUNNEL_TOKEN is required."
  echo "[setup] export CLOUDFLARE_TUNNEL_TOKEN=<your-token>"
  exit 1
fi

echo "[setup] installing dependencies..."
npm install

echo "[setup] starting ws server + named tunnel with pm2..."
npx pm2 start ecosystem.config.cjs --update-env
npx pm2 status

echo "[setup] done. use fixed domain as wss://<your-domain>/"
echo "[setup] join payload: {\"action\":\"join\",\"channel\":\"tr35xtyx\"}"
