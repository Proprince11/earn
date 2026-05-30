# Your Action Checklist

Everything I built is in this repo. Here's exactly what YOU need to do, in order. Each step has an estimated time and a "done when" check.

---

## ✅ PHASE 1 — Get the site live (today, ~30 min)

### [ ] 1. Verify what's in the repo
Look at `/projects/sandbox/earn/` in this Kiro environment. You should see:
- `index.html` — the main tools page (5 calculators)
- `blog/` — 3 SEO blog posts + blog index
- `gumroad-products/100-claude-prompts-for-freelancers.md` — your first product
- `CHECKLIST.md` — this file
- `README.md`
- `DEPLOY_AND_EARN.md` — the playbook
- `robots.txt`, `sitemap.xml` — SEO files

**I will commit + push these to GitHub for you in the next step.**

---

### [ ] 2. Sign up for Vercel (5 min)
1. Go to **https://vercel.com**
2. Click **Sign Up** → **Continue with GitHub**
3. Authorize Vercel to read your GitHub repos

**Done when:** you're inside the Vercel dashboard.

---

### [ ] 3. Deploy the `earn` repo to Vercel (3 min)
1. Vercel dashboard → **Add New** → **Project**
2. Find `Proprince11/earn` in the list → click **Import**
3. Leave all settings as default (it's a static site, Vercel auto-detects)
4. Click **Deploy**
5. Wait ~30 seconds

**Done when:** Vercel shows you a green checkmark and a URL like `earn-xxxx.vercel.app`. Click the URL — your site loads.

---

### [ ] 4. Test the live site on your phone (5 min)
On your smartphone, open the Vercel URL. Test every tab:
- ✅ Invoice Generator — fill, click "Download Invoice PDF", PDF opens
- ✅ Loan Calculator — change currency, change values, results update
- ✅ Investment Calculator — try 5% step-up, compare with 0%
- ✅ Rent Receipt — fill all fields, generate, PDF opens (India)
- ✅ Tax Regime — change salary, see Old vs New (India)

**If anything breaks → screenshot it, tell me, I fix it.**

---

### [ ] 5. (Optional but recommended) Rename the Vercel domain
- Vercel dashboard → your project → **Settings** → **Domains**
- Change `earn-xxxx.vercel.app` → something cleaner like `finkit.vercel.app` or `paydash.vercel.app` (must be unique)
- Free, instant, no setup

**Done when:** the new URL works.

---

## ✅ PHASE 2 — Set up monetization (this week, ~1.5 hours of mostly waiting)

### [ ] 6. Create Gumroad account (5 min)
1. https://gumroad.com → **Start Selling** → sign up with email
2. Skip the "verify business" — you can start as an individual creator
3. Add **PayPal email** (or **Stripe** if you have a bank account in a supported country) for payouts

**Done when:** Gumroad creator dashboard is open.

---

### [ ] 7. Convert the prompt pack into a Gumroad listing (30 min)

The file `gumroad-products/100-claude-prompts-for-freelancers.md` is your first product.

**Easy path (free, fastest):**
1. Open the markdown file. Copy all of it.
2. Go to **https://md2pdf.netlify.app** (free converter) → paste markdown → click **Convert** → download as PDF
3. On Gumroad: **+ New Product** → **Digital Product**
4. Name: `100 Claude Prompts for Freelancers — The Pack That Pays for Itself in One Project`
5. Price: **$9** (sweet spot — high enough to feel valuable, low enough to be impulse-bought)
6. Upload the PDF
7. For the cover image: go to **Canva (free)** → search "ebook cover template" → make a 1280×720 image with the title and "100 prompts" — takes 5 minutes
8. Description: copy the intro paragraph from the markdown file
9. Click **Publish**

**Done when:** Gumroad gives you a public URL like `gumroad.com/l/xxxxx`. Test buying it from another browser (Gumroad has test mode).

---

### [ ] 8. Add Gumroad link to your site (you message me, I do it)
Once you have the Gumroad URL, **paste it into chat and tell me "add gumroad link"**. I'll add a "Get the Prompt Pack" CTA section to the homepage and push the change. Vercel auto-deploys in 30 seconds.

---

### [ ] 9. Apply to affiliate programs (15 min, then wait 1–7 days)

Sign up to all of these — they're free and approval is automatic or fast. Even one approval turns into income.

**Tier 1 — easy approval:**
- [ ] **Impact.com** → https://impact.com → sign up as Partner. Search & apply to: Canva, FreshBooks, Bonsai, Wave Apps, ClickUp.
- [ ] **PartnerStack** → https://partnerstack.com → sign up. Apply to: Notion, ClickUp, Webflow.
- [ ] **EarnKaro** (India) → https://earnkaro.com → instant approval, gives access to most Indian banks/brokers.

**Tier 2 — medium effort:**
- [ ] **CJ Affiliate** → https://cj.com → sign up as publisher. Apply to: Wix, GoDaddy, GoToWebinar.
- [ ] **ShareASale** → https://shareasale.com → similar to CJ.

**Tier 3 — high payout but stricter:**
- [ ] **Credible** (US loans) → https://credible.com/affiliate → high payout per lead.
- [ ] **LendingTree** → https://www.lendingtree.com/affiliate

**Done when:** at least 3 applications submitted. Approvals will trickle in. Once approved, **send me the affiliate link** and I'll plug it into the right slot in the site.

---

### [ ] 10. Set up Google Search Console (5 min)
1. Go to **https://search.google.com/search-console**
2. Click **Add Property** → **URL prefix** → paste your Vercel URL
3. Verification: choose **HTML tag** method → copy the meta tag → tell me the tag → I add it to the site → you click verify
4. Once verified, click **Sitemaps** → submit `sitemap.xml`

**Done when:** Search Console shows "Success" for the sitemap.

---

## ✅ PHASE 3 — Drive your first traffic (next 7 days)

### [ ] 11. Reddit seeding (30 min, spread over 3 days)
Find 5 Reddit threads where someone is asking the exact problem your tool solves. Use Google:
- `site:reddit.com freelance invoice template`
- `site:reddit.com loan prepayment calculator`
- `site:reddit.com sip step up calculator`

Write a **genuinely helpful** comment (4–6 sentences). End naturally with: *"I built a free generator for this — [your URL] if useful."*

**Rules:**
- ❌ Don't post on r/freelance multiple times in a day (anti-spam filter)
- ❌ Don't drop the same comment in different subs
- ✅ Each comment must answer the actual question first; the link is a footnote

**Subs that work:**
- r/freelance, r/sidehustle, r/EntrepreneurRideAlong, r/digitalnomad, r/personalfinance, r/IndiaInvestments

**Done when:** 5 helpful comments posted across at least 4 subs.

---

### [ ] 12. Pinterest seeding (1 hour — highest ROI traffic source nobody uses)
1. Sign up at **https://pinterest.com/business** → free business account
2. Open **Canva (free)** → search "Pinterest pin template" → pick one
3. Make 10 pins (1000×1500 px), each titled like:
   - "Free Invoice Template for Freelancers"
   - "Mortgage Prepayment Calculator (See How Much You Save)"
   - "How a 5% Annual Step-Up Doubles Your Investment"
   - "Old vs New Tax Regime Calculator (India 2024)"
   - "Free Rent Receipt Generator for HRA Claim"
4. Each pin links to the relevant tool/blog page on your site
5. Schedule 1–2 pins per day for 2 weeks

**Why Pinterest:** finance and freelance pins keep sending traffic for **months** per pin. Tech people ignore it. Massive untapped channel.

**Done when:** 10 pins live, scheduled or published.

---

### [ ] 13. Twitter/X build-in-public thread (15 min)
Post one thread:
> "I'm a college student with $0 budget. I just shipped a free finance toolkit to help freelancers and investors do the math right. Day 1: [URL]. I'll post real numbers as it grows. Follow along. 🧵"

Tag: `#buildinpublic #indiehackers #freelance`

Then post 1 short update every 2–3 days for the next 30 days.

---

### [ ] 14. Submit to Indie Hackers (10 min)
- Go to **https://indiehackers.com** → free signup
- Create a "milestone" post: "Shipped: free tools for freelancers + investors"
- Mention what it does, what's free, what you're trying to learn

**Done when:** post is live. Reply to any comments within 12 hours.

---

### [ ] 15. Submit to Product Hunt (15 min — pick a Tuesday or Wednesday)
- Go to **https://producthunt.com** → sign up
- Click **Submit Product**
- Title, tagline (under 60 chars), gallery (4–6 screenshots from your site)
- Schedule for a Tuesday or Wednesday (highest traffic days)

**Done when:** PH listing is live and scheduled.

---

## ✅ PHASE 4 — Iterate weekly (ongoing)

### [ ] 16. Daily check (5 min)
Every morning:
- **Vercel Analytics** (free, built-in): how many visitors yesterday?
- **Search Console**: any new keyword impressions?
- **Gumroad**: any sales?
- **Affiliate dashboards**: any clicks/conversions?

---

### [ ] 17. Weekly retro post (Sunday, 10 min)
Every 7 days, post on Twitter/IH:
> "Week N: [X] visitors, $[Y] earned, top channel: [Z], lesson learned: [...]"

Compounds your audience faster than anything else.

---

### [ ] 18. Tell me what's working
Once a week, message me with:
- Top traffic channel
- Top page on the site
- Any clicks on affiliate links / Gumroad sales
- What broke or what you wish was different

I'll build the next tool **based on data**, not guesses. If invoice tool wins → I add Resume Builder. If India tools win → I add GST Invoice Generator. If prompt pack sells → I write the next pack.

---

## 🚫 What NOT to do

- ❌ Don't buy ads (you have $0 budget, save it)
- ❌ Don't buy a domain yet (Vercel free URL is fine for first 30 days)
- ❌ Don't spam Reddit/forums (one ban kills the channel forever)
- ❌ Don't add 50 calculators before the first 5 get traffic
- ❌ Don't refresh Search Console hourly (rankings take weeks, not hours)
- ❌ Don't quit at week 2 when you've earned $0–$30 (this is normal — see DEPLOY_AND_EARN.md for honest timeline)

---

## When you're stuck

Message me with:
- "Step X done, what's next?"
- "Step X broken: [error / screenshot]"
- "Got my [Vercel URL / affiliate link / Gumroad URL] — please add to site"
- "Build the next tool" (when current tools start getting traffic)

I'm building this with you. The code is yours. The tools are yours. I just keep shipping while you keep distributing.
