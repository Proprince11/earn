# Go Live — Complete Tutorial (Do It Yourself, No Terminal)

This gets your site `earn` online for free. Everything is done in a web browser by clicking buttons. **No terminal. No `sudo`. No installing anything. No commands.**

You have two options. **Option 1 (GitHub Pages) is the easiest — start there.** Option 2 (Vercel) is optional, for later, if you want a custom domain.

---

# OPTION 1: GitHub Pages (recommended — easiest)

Your code is already in your GitHub repo. GitHub will host it for free. You stay inside your own repo the whole time, so there's nothing to connect or authorize.

## Steps

1. Open your browser and go to:
   **https://github.com/Proprince11/earn**

2. Make sure you're **logged in** to GitHub as `Proprince11` (top-right corner shows your avatar). If not, log in first.

3. Click the **Settings** tab.
   - It's at the top of the repo page, on the far right, with a gear icon.
   - (If you don't see "Settings", make sure you're logged in and that you own this repo.)

4. In the **left sidebar**, scroll down and click **Pages**.
   - It's under the "Code and automation" section.

5. You'll see a section called **"Build and deployment"**.
   - Under **Source**, click the dropdown and choose **"Deploy from a branch"**.

6. A **Branch** section appears just below.
   - Open the first dropdown (currently says "None") -> select **`main`**.
   - Leave the second dropdown as **`/ (root)`**.
   - Click the **Save** button.

7. Wait **1 to 2 minutes**. (GitHub is building your site in the background.)

8. **Refresh the page** (press F5 or pull down on mobile).
   - A green box appears at the top saying:
     **"Your site is live at https://proprince11.github.io/earn/"**
   - There's a **Visit site** button next to it.

9. **Your live URL is:**
   ```
   https://proprince11.github.io/earn/
   ```
   Open it in a new tab to confirm the site loads.

## Done!
That's your live website. Anyone in the world can visit it. It's free forever, and every time new code is pushed to the repo, the site updates automatically within a minute or two.

## Test checklist (open the URL on your phone)
- [ ] Invoice Generator tab -> fill it -> "Download Invoice PDF" works
- [ ] Loan Calculator -> change currency + values -> results update
- [ ] Investment Calculator -> set 5% step-up -> see the boost
- [ ] Rent Receipt (India) -> fill all -> PDF downloads
- [ ] Tax Regime (India) -> enter salary -> Old vs New shown

If anything is broken, note which tab and tell me later.

---

# OPTION 2: Vercel (optional — only if you want a custom domain later)

Skip this for now if Option 1 worked. Come back to it later if you want a nicer URL or a custom domain like `finkit.com`.

**This is ALL in the browser. You never need a terminal or `sudo`. If any guide tells you to run `npm install` or `sudo` anything — ignore it, that's the wrong method.**

## Steps

1. Go to **https://vercel.com** and click **Sign Up** (or **Log In** if you already have an account).

2. Choose **Continue with GitHub**.
   - A GitHub popup appears asking to authorize Vercel -> click the green **Authorize Vercel** button.
   - If it asks which repos: choose **"All repositories"** OR select just **`earn`**, then click **Install / Save**.
   - **This authorization is the step that can fail.** If it does:
     - Make sure pop-ups aren't blocked in your browser.
     - Try again in an incognito/private window.
     - Or just use Option 1 (GitHub Pages) instead — it doesn't need this step.

3. On the Vercel dashboard, click **Add New...** (top right) -> **Project**.

4. You'll see a list of your GitHub repositories. Find **`earn`** -> click **Import**.
   - If `earn` isn't listed: click **"Adjust GitHub App Permissions"**, grant access to the `earn` repo, then return.

5. A configuration screen appears. **Do not change anything.** Click the **Deploy** button.

6. Wait **30–60 seconds** while it builds.

7. You'll see a **Congratulations** screen with a preview image of your site.
   - Below it is your URL, like `earn-xxxx.vercel.app`.
   - Click **Continue to Dashboard**.

8. On the project page, the live URL is shown at the top under **Domains**, with a **Visit** button. That's your live site.

## Optional: make the URL prettier
- In the project -> **Settings** -> **Domains**
- Edit the `.vercel.app` part to something cleaner like `finkit.vercel.app` (must be globally unique; if taken, try another name)
- Save.

---

# IMPORTANT: about that "sudo authentication failed" error

- `sudo` is a command for **terminal/command-line software installation**.
- **You never need it for this project.** Both options above are 100% browser clicks.
- If you saw that error, you were following a CLI-based guide (or the Vercel CLI). Close that terminal and ignore it. Use the browser steps above instead.
- Nothing in this entire project requires installing software, running commands, or typing a password into a terminal.

---

# After you're live — send me your URL

Once you have your live link (either `https://proprince11.github.io/earn/` or your `.vercel.app` URL), paste it to me and I will automatically:

- Replace every `YOUR-URL` placeholder in `LAUNCH_KIT.md` with your real link
- Fix `sitemap.xml` so search engines index the correct domain
- Update the `canonical` and `og:url` tags in `index.html` and all 3 blog posts
- Fix the sitemap line in `robots.txt`

Then I commit + push, and your site updates automatically within a minute.

---

# Quick reference

| Thing | Link |
|---|---|
| Your GitHub repo | https://github.com/Proprince11/earn |
| GitHub Pages settings | https://github.com/Proprince11/earn/settings/pages |
| Your live URL (after Option 1) | https://proprince11.github.io/earn/ |
| Vercel (optional) | https://vercel.com |

**Recommended: do Option 1. It's 8 clicks and you're live.**
