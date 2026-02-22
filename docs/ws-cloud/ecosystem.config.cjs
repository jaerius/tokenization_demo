module.exports = {
  apps: [
    {
      name: "ws-server-3055",
      script: "server.js",
      interpreter: "node",
      cwd: __dirname,
      env: {
        HOST: process.env.HOST || "0.0.0.0",
        PORT: process.env.PORT || "3055",
        CHANNEL: process.env.CHANNEL || "tr35xtyx",
      },
      autorestart: true,
      max_restarts: 20,
      restart_delay: 2000,
    },
    {
      name: "ws-cloudflared-named",
      script: "./tunnel-cloudflared-named.sh",
      interpreter: "bash",
      cwd: __dirname,
      env: {
        CLOUDFLARE_TUNNEL_TOKEN: process.env.CLOUDFLARE_TUNNEL_TOKEN || "",
      },
      autorestart: true,
      max_restarts: 20,
      restart_delay: 2000,
    },
  ],
};
