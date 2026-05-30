# FinKit — Free Financial Tools

A zero-cost, multi-currency financial toolkit for freelancers, borrowers, and investors. No signup, no ads (yet), no tracking. Works in any browser, including phones.

**Live:** *(deploy to Vercel — see CHECKLIST.md)*

## Tools included

| Tool | What it does |
|---|---|
| 📄 **Invoice Generator** | Multi-currency PDF invoice with line items, tax/discount, custom branding |
| 🏠 **Loan / Mortgage Calculator** | EMI / monthly payment with prepayment savings |
| 📈 **Investment Calculator** | Monthly contributions with annual step-up, compound growth |
| 🇮🇳 **Rent Receipt Generator** | Multi-month signed PDF receipts for HRA tax claims (India) |
| 🇮🇳 **Tax Regime Comparator** | Old vs New regime, FY 2024-25 (India) |

## Stack

- Pure HTML + Tailwind (CDN) + vanilla JS
- jsPDF for client-side PDF generation
- No backend, no build step, no dependencies installed
- Hosts on Vercel / Netlify / GitHub Pages free tier forever

## Local dev

```bash
python3 -m http.server 8000
# open http://localhost:8000
```

That's it. There's nothing to install.

## Deploy

See [`CHECKLIST.md`](./CHECKLIST.md) for step-by-step deployment + monetization setup.

## Monetization

See [`DEPLOY_AND_EARN.md`](./DEPLOY_AND_EARN.md) for the full playbook: affiliate setup, Gumroad products, traffic strategy, and realistic earnings timeline.

## License

MIT — do whatever you want with the code. Built with [Claude](https://claude.ai).
