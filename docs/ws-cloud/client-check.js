const WebSocket = require("ws");

const WS_URL = process.env.WS_URL || "ws://127.0.0.1:3055";
const CHANNEL = process.env.CHANNEL || "tr35xtyx";
const TIMEOUT_MS = Number.parseInt(process.env.TIMEOUT_MS || "10000", 10);

const ws = new WebSocket(WS_URL);
let finished = false;

function finish(code, message) {
  if (finished) {
    return;
  }
  finished = true;
  console.log(message);
  try {
    ws.close();
  } catch (_err) {
    // no-op
  }
  process.exit(code);
}

const timeoutId = setTimeout(() => {
  finish(1, `[check] timeout after ${TIMEOUT_MS}ms`);
}, TIMEOUT_MS);

ws.on("open", () => {
  console.log(`[check] connected to ${WS_URL}`);
  ws.send(
    JSON.stringify({
      action: "join",
      channel: CHANNEL,
    })
  );
});

ws.on("message", (raw) => {
  let data;
  try {
    data = JSON.parse(raw.toString());
  } catch (_err) {
    return;
  }

  console.log("[check] recv:", data);
  if (data.type !== "join_ack") {
    return;
  }

  if (data.ok === true && data.channel === CHANNEL) {
    clearTimeout(timeoutId);
    finish(0, `[check] join ack ok for channel ${CHANNEL}`);
    return;
  }

  clearTimeout(timeoutId);
  finish(
    1,
    `[check] join ack failed (channel=${data.channel} expected=${CHANNEL})`
  );
});

ws.on("error", (err) => {
  clearTimeout(timeoutId);
  finish(1, `[check] websocket error: ${err.message}`);
});
