# ws-cloud

WebSocket server + channel join/ack demo for cloud environments.

## 1) Start WebSocket server on 0.0.0.0:3055

```bash
cd /workspace/docs/ws-cloud
npm install
npm run start
```

Expected startup logs:

- `[ws] listening on ws://0.0.0.0:3055`
- `[ws] required channel is "tr35xtyx"`

## 2) Open tunnel

Choose one:

### ngrok

```bash
cd /workspace/docs/ws-cloud
export NGROK_AUTHTOKEN=xxxx
npm run tunnel:ngrok
```

`NGROK_AUTHTOKEN` is required by ngrok.

### cloudflared

```bash
cd /workspace/docs/ws-cloud
npm run tunnel:cloudflared
```

Both scripts download a local binary into `./.bin` if missing.

## 3) Connect from browser/front-end

Use the issued HTTPS tunnel URL with `wss://`.

Example:

```text
wss://<issued-domain>/
```

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

## Local quick check

With server running, verify channel ack locally:

```bash
cd /workspace/docs/ws-cloud
npm run check
```

## Notes from this cloud environment

- Server listen on `0.0.0.0:3055` and local join/ack check is verified.
- `cloudflared` quick tunnel creation is verified and emits an HTTPS URL.
- In this container, DNS resolution for newly issued `*.trycloudflare.com` can be delayed or unavailable; test from your browser/host machine if that happens.
