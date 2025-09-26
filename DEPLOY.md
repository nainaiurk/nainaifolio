Vercel deploy instructions

This repository ships a prebuilt Flutter web site in `build/web`.

Quick PowerShell deploy (uses scripts/deploy.ps1):

1. Ensure you have a Vercel token. You can set it as an environment variable in PowerShell:

   $env:VERCEL_TOKEN = 'your-token-here'

2. Run the deploy script from the repository root (PowerShell):

   .\scripts\deploy.ps1

The script will:
- look for $env:VERCEL_TOKEN or a .verceltoken file in your profile or repo root
- run `flutter build web --release` if `build/web` is missing
- call `npx vercel --prod --yes --token <token> --local-config vercel.json build/web`

Alternative using the Vercel CLI (node required):

1. Install Vercel CLI if needed: `npm i -g vercel` or use `npx vercel`.
2. From the repo root (after `flutter build web`), run:

   npx vercel --prod --yes --local-config vercel.json build/web

Notes:
- `vercel.json` is configured to serve static files from `build/web` and apply SPA fallback to `index.html`.
- If you prefer to deploy using the Vercel prebuilt output format, you'd need to adapt the build to output `.vercel/output` layout or use the Vercel Git integration.
