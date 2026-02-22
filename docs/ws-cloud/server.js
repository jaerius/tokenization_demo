const http = require("http");
const { WebSocketServer } = require("ws");

const HOST = process.env.HOST || "0.0.0.0";
const PORT = Number.parseInt(process.env.PORT || "3055", 10);
const REQUIRED_CHANNEL = process.env.CHANNEL || "tr35xtyx";

const server = http.createServer((req, res) => {
  if (req.url === "/healthz") {
    const body = JSON.stringify({ ok: true, service: "ws-cloud", port: PORT });
    res.writeHead(200, { "Content-Type": "application/json" });
    res.end(body);
    return;
  }

  res.writeHead(200, { "Content-Type": "application/json" });
  res.end(
    JSON.stringify({
      ok: true,
      message: "WebSocket endpoint is available on this same port.",
      connectWith: `ws://127.0.0.1:${PORT}`,
    })
  );
});

const wss = new WebSocketServer({ server });

function sendJson(ws, payload) {
  ws.send(JSON.stringify(payload));
}

wss.on("connection", (ws, req) => {
  const remote = req.socket.remoteAddress || "unknown";
  console.log(`[ws] client connected: ${remote}`);

  sendJson(ws, {
    type: "connected",
    message: "connected to ws server",
    requiredChannel: REQUIRED_CHANNEL,
  });

  ws.on("message", (raw) => {
    let data;
    try {
      data = JSON.parse(raw.toString());
    } catch (_err) {
      sendJson(ws, {
        type: "error",
        code: "INVALID_JSON",
        message: "message must be valid JSON",
      });
      return;
    }

    const action = data.action || data.type;
    if (action === "ping") {
      sendJson(ws, { type: "pong", at: new Date().toISOString() });
      return;
    }

    if (action === "join") {
      const channel = typeof data.channel === "string" ? data.channel : "";
      if (!channel) {
        sendJson(ws, {
          type: "error",
          code: "CHANNEL_REQUIRED",
          message: "join requires a non-empty channel",
        });
        return;
      }

      ws.channel = channel;
      const ok = channel === REQUIRED_CHANNEL;
      console.log(`[ws] join request channel=${channel} ok=${ok}`);
      sendJson(ws, {
        type: "join_ack",
        ok,
        channel,
        expectedChannel: REQUIRED_CHANNEL,
        message: `Connected to server in channel: ${channel}`,
      });
      return;
    }

    sendJson(ws, {
      type: "error",
      code: "UNKNOWN_ACTION",
      message: "supported actions: join, ping",
    });
  });

  ws.on("close", () => {
    console.log("[ws] client disconnected");
  });
});

server.listen(PORT, HOST, () => {
  console.log(`[ws] listening on ws://${HOST}:${PORT}`);
  console.log(`[ws] required channel is "${REQUIRED_CHANNEL}"`);
});
