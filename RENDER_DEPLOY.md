# Deploy to Render

1. Upload this folder to a **private GitHub repository**. Do not upload `.env`; it was intentionally removed.
2. In Render, choose **New + → Blueprint** and connect the repository. Render will read `render.yaml`.
3. Set the secret environment variables in the Render dashboard: `TELEGRAM_BOT_TOKEN`, `TELEGRAM_CHAT_ID`. Optional stats-bot variables: `TRANSFERMARKT_BOT_TOKEN`, `TRANSFERMARKT_CHAT_ID`.
4. Confirm the service uses a paid always-on instance if you need continuous operation; free web services may spin down.
5. Deploy. Check **Logs** for a successful startup and repeated scan messages. Open the generated `onrender.com` URL for the dashboard.
6. Verify `/api/state` on that same URL returns JSON and the `updatedAt` value changes after scans. Send `/start` to your Telegram bot first.

The project checks the AR BET page; external site changes, bot token errors, browser blocks/CAPTCHAs, or outages can still interrupt it. Do not commit secrets.
