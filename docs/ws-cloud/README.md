# ws-cloud

WebSocket server + channel join/ack demo for cloud environments.

This project supports two tunnel modes:

- **Recommended for Figma MCP**: Cloudflare **named tunnel** (fixed domain)
- Quick test mode: Cloudflare quick tunnel or ngrok

---

## 1) Start WebSocket server on 0.0.0.0:3055

```bash
cd /workspace/docs/ws-cloud
npm install
npm run start
```

Expected startup logs:

- `[ws] listening on ws://0.0.0.0:3055`
- `[ws] required channel is "tr35xtyx"`

---

## 2) Recommended: fixed endpoint for Figma MCP (named tunnel)

Figma MCP-like integrations are more stable with a **fixed** `wss://` endpoint.

### 2-1. Create a named tunnel (one-time, in Cloudflare dashboard/CLI)

1. Create named tunnel
2. Attach DNS route to a fixed subdomain (example: `ws.example.com`)
3. Get tunnel token

Export token in runtime:

```bash
export CLOUDFLARE_TUNNEL_TOKEN=<your-token>
```

### 2-2. Start named tunnel directly

```bash
cd /workspace/docs/ws-cloud
npm run tunnel:cloudflared:named
```

### 2-3. Or keep both WS + tunnel running via PM2 (recommended)

```bash
cd /workspace/docs/ws-cloud
export CLOUDFLARE_TUNNEL_TOKEN=<your-token>
npm run figma-mcp:up
npm run pm2:status
```

Useful PM2 commands:

```bash
npm run pm2:logs
npm run pm2:restart
npm run pm2:stop
```

After this, use your fixed domain:

```text
wss://ws.example.com/
```

---

## 3) Quick tunnel alternatives

### cloudflared quick tunnel (random domain)

```bash
cd /workspace/docs/ws-cloud
npm run tunnel:cloudflared
```

### ngrok (requires token)

```bash
cd /workspace/docs/ws-cloud
export NGROK_AUTHTOKEN=xxxx
npm run tunnel:ngrok
```

Both scripts download local binaries into `./.bin` if missing.

---

## 4) Send join message and verify ack

Send:

```json
{ "action": "join", "channel": "tr35xtyx" }
```

Expected ack:

```json
{
  "type": "join_ack",
  "ok": true,
  "channel": "tr35xtyx",
  "expectedChannel": "tr35xtyx",
  "message": "Connected to server in channel: tr35xtyx"
}
```

---

## 5) Local quick check

With server running, verify channel ack locally:

```bash
cd /workspace/docs/ws-cloud
npm run check
```

---

## Notes from this cloud environment

- Server listen on `0.0.0.0:3055` and local join/ack check is verified.
- `cloudflared` quick tunnel creation is verified and emits an HTTPS URL.
- In this container, DNS resolution for newly issued `*.trycloudflare.com` can be delayed or unavailable; test from your browser/host machine if that happens.
