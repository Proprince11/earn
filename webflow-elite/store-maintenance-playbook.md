# Master Store Customization & Maintenance Playbook

> A comprehensive operational guide for configuring, maintaining, and scaling high-value Webflow E-Commerce storefronts. This playbook covers payment infrastructure for premium transactions and automated user access management for gated client experiences.

---

## 1. Payment Gateway & Webhook Integration

### 1.1 Configuring Stripe for High-Value Transactions

#### Setting Up Payment Intents for Large Amounts

When processing transactions in the $10K-$500K range, standard Stripe Checkout requires additional configuration to handle elevated risk scoring and authentication requirements.

**Step 1: Stripe Account Configuration**

1. Navigate to Stripe Dashboard > Settings > Business Settings
2. Ensure your account is fully verified with:
   - Business registration documents
   - Beneficial ownership declarations
   - Bank account verification for high-value payouts
   - Statement descriptor configured for professional appearance
3. Request high-value transaction limit increase:
   - Contact Stripe support to raise single-transaction limits above $10,000
   - Provide documentation of business model and expected transaction sizes
   - Typical approval timeline: 3-5 business days

**Step 2: Payment Intent Configuration**

For high-value transactions, use Payment Intents with manual confirmation to allow for additional verification steps:

```javascript
// Server-side: Create Payment Intent for high-value transaction
const paymentIntent = await stripe.paymentIntents.create({
  amount: 5000000, // $50,000 in cents
  currency: "usd",
  payment_method_types: ["card", "us_bank_account"],
  capture_method: "manual", // Hold funds before capturing
  metadata: {
    store_engine: "EQUITY_ENGINE",
    client_id: "client_12345",
    engagement_type: "full_representation",
    milestone: "retainer_payment"
  },
  statement_descriptor: "EQUITYENGINE ADV",
  description: "M&A Advisory Retainer - Phase 1"
});
```

**Step 3: Payment Method Priorities for High-Value Transactions**

Configure payment method availability based on transaction amount thresholds:

| Transaction Amount | Recommended Methods | Reason |
|---|---|---|
| $1K - $10K | Credit Card, ACH | Standard processing, instant confirmation |
| $10K - $25K | ACH, Wire Transfer | Lower processing fees, reduced chargeback risk |
| $25K - $50K | ACH (preferred), Wire Transfer | ACH caps vary by bank; wire for certainty |
| $50K+ | Wire Transfer (primary), ACH | Guaranteed settlement, no reversibility |

**Step 4: Implementing Payment Holds and Delayed Capture**

For milestone-based engagements, use delayed capture to authorize funds without immediate charge:

```javascript
// Authorize without capturing (hold for up to 7 days)
const intent = await stripe.paymentIntents.create({
  amount: 15000000, // $150,000
  currency: "usd",
  capture_method: "manual",
  payment_method_types: ["us_bank_account"],
  confirm: false
});

// Later, when milestone is verified, capture the funds
const captured = await stripe.paymentIntents.capture(intent.id, {
  amount_to_capture: 15000000 // Can partially capture
});
```

#### Handling 3D Secure for Large Amounts

High-value card transactions almost always trigger 3D Secure (Strong Customer Authentication) challenges. Configure your flow to handle this gracefully:

1. **Client-Side 3DS Handling:**
   - Use Stripe.js `confirmCardPayment()` which automatically handles 3DS challenges
   - Display a clear "Authentication Required" message before the bank redirect
   - Implement a loading state with estimated wait time ("Your bank is verifying this transaction")
   - Provide fallback instructions if 3DS fails (phone verification with bank, alternative payment method)

2. **Exemption Requests for Returning Clients:**
   - For established client relationships with prior successful payments, request SCA exemptions
   - Use `payment_intent.payment_method_options.card.request_three_d_secure = "any"` to let Stripe optimize
   - Maintain transaction history metadata to support low-risk exemption claims

3. **Authentication Failure Recovery:**
   - If 3DS fails, automatically offer ACH or wire transfer as alternatives
   - Send automated email with wire transfer instructions and unique reference code
   - Track incomplete payment intents and trigger follow-up sequences after 24 hours

### 1.2 PayPal Advanced Integration for Enterprise Clients

#### Configuring PayPal Commerce Platform

For B2B high-value transactions, PayPal Commerce Platform (formerly PayPal for Marketplaces) provides enterprise-grade capabilities:

**Setup Steps:**

1. Apply for PayPal Commerce Platform access (requires business review)
2. Configure API credentials in sandbox and production:
   - Generate REST API credentials (Client ID + Secret)
   - Set up webhook listener endpoint
   - Configure partner attribution ID for referral tracking
3. Enable advanced features:
   - Pay Later options for qualifying amounts (PayPal Credit)
   - Multi-currency acceptance
   - Seller protection for services (requires documentation of delivery)

**Invoice Integration for Enterprise:**

```javascript
// Create PayPal Invoice for high-value engagement
const invoice = await paypal.invoices.create({
  detail: {
    invoice_number: "ENG-2024-0042",
    invoice_date: "2024-03-01",
    currency_code: "USD",
    payment_term: { term_type: "NET_30" }
  },
  invoicer: {
    business_name: "Equity Engine Advisory",
    email_address: "billing@equityengine.com"
  },
  primary_recipients: [{
    billing_info: {
      email_address: "cfo@clientcorp.com",
      business_name: "Client Corporation"
    }
  }],
  items: [{
    name: "M&A Advisory Retainer - Q1 2024",
    quantity: "1",
    unit_amount: { currency_code: "USD", value: "75000.00" }
  }]
});
```

**PayPal Vault for Recurring High-Value Charges:**

- Store payment methods using PayPal Vault tokens for recurring retainer billing
- Implement approval workflows that send payment link to authorized signatory
- Configure automatic retry with fallback to invoice for failed recurring charges

### 1.3 Split Payment Architecture

#### Configuring Multi-Party Payouts

For store engines involving multiple service providers (e.g., APEX RETAINERS with executive + platform fees, STUDIO COMMAND with multiple creative specialists):

**Stripe Connect Split Payments:**

1. **Platform Account Setup:**
   - Register as a Stripe Connect platform
   - Choose between Standard, Express, or Custom Connect accounts for service providers
   - For high-value splits: Custom Connect recommended for full control over payout timing

2. **Split Configuration:**

```javascript
// Create payment with automatic split
const paymentIntent = await stripe.paymentIntents.create({
  amount: 4000000, // $40,000 total
  currency: "usd",
  transfer_group: "engagement_ENG-2024-0042",
  metadata: { store: "STUDIO_COMMAND" }
});

// Platform fee retained
const transfer1 = await stripe.transfers.create({
  amount: 3200000, // $32,000 to creative team
  currency: "usd",
  destination: "acct_creative_team_001",
  transfer_group: "engagement_ENG-2024-0042"
});

// Remaining $8,000 stays on platform as service fee
```

3. **Multi-Party Payout Rules:**
   - Define split percentages per store engine type
   - Configure minimum platform fee thresholds
   - Set payout schedules (immediate, daily, weekly, manual)
   - Handle currency conversion for international service providers

**Payout Schedule Configuration:**

| Provider Type | Payout Frequency | Hold Period | Minimum Balance |
|---|---|---|---|
| Executive Placements | Bi-weekly | 7 days | $5,000 |
| Creative Contractors | Weekly | 3 days | $1,000 |
| Advisory Partners | Monthly | 14 days | $10,000 |
| Platform Revenue | Daily | 2 days | $500 |

### 1.4 Multi-Step Milestone Billing Setup

#### Creating Invoice Sequences

For store engines with milestone-based payments (EQUITY ENGINE, PIPELINE FORGE, DATA CITADEL):

**Milestone Definition Schema:**

```javascript
const milestoneSchedule = {
  engagement_id: "ENG-2024-0042",
  store_engine: "PIPELINE_FORGE",
  total_value: 15000000, // $150,000
  milestones: [
    {
      id: "MS-001",
      name: "Contract Execution & License Delivery",
      percentage: 40,
      amount: 6000000,
      trigger: "contract_signed",
      auto_invoice: true,
      payment_terms_days: 10
    },
    {
      id: "MS-002",
      name: "Deployment Environment Validated",
      percentage: 30,
      amount: 4500000,
      trigger: "deployment_validation_signed",
      auto_invoice: true,
      payment_terms_days: 15
    },
    {
      id: "MS-003",
      name: "Production Go-Live Confirmation",
      percentage: 30,
      amount: 4500000,
      trigger: "production_signoff",
      auto_invoice: true,
      payment_terms_days: 15
    }
  ]
};
```

**Auto-Charging on Schedule:**

1. Upon milestone trigger event, system automatically:
   - Generates invoice with milestone details and supporting documentation
   - Sends invoice via email with payment link (Stripe-hosted invoice page)
   - If saved payment method exists: charges after payment terms expire (with 72-hour advance notice)
   - Tracks payment status and triggers reminder sequence if unpaid

2. Reminder sequence for overdue milestones:
   - Day 1 past due: Automated reminder email
   - Day 5 past due: Personal email from account manager
   - Day 10 past due: Phone call from finance team
   - Day 15 past due: Service pause notification with cure period

3. Partial payment handling:
   - Accept partial payments with clear balance tracking
   - Generate updated invoice showing remaining balance
   - Prevent next milestone delivery until current milestone payment completes

### 1.5 Webhook Configuration for Real-Time Payment Status Updates

#### Setting Up Webhook Endpoints

Configure robust webhook handling for all payment events across store engines:

**Required Webhook Events:**

```
payment_intent.succeeded
payment_intent.payment_failed
payment_intent.canceled
payment_intent.requires_action
invoice.paid
invoice.payment_failed
invoice.overdue
customer.subscription.created
customer.subscription.updated
customer.subscription.deleted
charge.dispute.created
charge.refunded
transfer.paid (for Connect payouts)
```

**Webhook Endpoint Configuration:**

1. Set up dedicated webhook endpoint URL (e.g., `https://yourdomain.com/webhooks/stripe`)
2. Configure webhook signing secret for payload verification
3. Implement idempotency handling (store processed event IDs to prevent duplicates)
4. Set up retry logic acknowledgment (respond with 200 within 20 seconds)

**Webhook Processing Pipeline:**

```javascript
// Webhook handler structure
app.post("/webhooks/stripe", async (req, res) => {
  const sig = req.headers["stripe-signature"];
  let event;
  
  try {
    event = stripe.webhooks.constructEvent(req.body, sig, webhookSecret);
  } catch (err) {
    return res.status(400).send("Webhook signature verification failed");
  }

  switch (event.type) {
    case "payment_intent.succeeded":
      await handleSuccessfulPayment(event.data.object);
      // Triggers: portal access, onboarding sequence, milestone advancement
      break;
    case "payment_intent.payment_failed":
      await handleFailedPayment(event.data.object);
      // Triggers: retry notification, alternative payment method offer
      break;
    case "invoice.overdue":
      await handleOverdueInvoice(event.data.object);
      // Triggers: reminder sequence, service pause warning
      break;
    case "charge.dispute.created":
      await handleDispute(event.data.object);
      // Triggers: evidence collection, service review, team notification
      break;
  }
  
  res.json({ received: true });
});
```

**Real-Time Status Propagation:**

- Payment success triggers Webflow CMS item status update (via Webflow API)
- Client portal dashboard reflects payment status within 60 seconds
- Internal team notifications via Slack/email for high-value events
- Audit log entry created for every payment state change

### 1.6 Security Best Practices for High-Value Transactions

#### Fraud Detection Configuration

1. **Stripe Radar Rules for High-Value Stores:**
   - Block transactions from high-risk countries (unless client geography confirmed)
   - Require additional verification for first-time transactions over $10K
   - Flag velocity anomalies (multiple high-value attempts in short timeframe)
   - Custom rule: `amount > 2500000 AND risk_level = "elevated"` triggers manual review

2. **Custom Fraud Scoring:**
   - Cross-reference billing email domain against company domain
   - Verify IP geolocation matches stated business location
   - Check card BIN country against billing address country
   - Implement device fingerprinting for portal access monitoring

3. **Manual Review Workflow for Flagged Transactions:**
   - Transactions exceeding $25K with elevated risk score enter manual queue
   - Finance team has 4-hour SLA to approve/decline flagged transactions
   - Client receives "Payment Under Review" notification with estimated timeline
   - Approved transactions auto-capture; declined transactions receive personal outreach

#### Chargeback Prevention

1. **Pre-Transaction Measures:**
   - Clear descriptor that clients will recognize on statements
   - Detailed receipt emails with service description immediately on charge
   - Digital contract/engagement letter on file before any charge
   - Communication log maintained (emails, calls, approvals)

2. **Evidence Collection Automation:**
   - Store all signed contracts, SOWs, and engagement letters linked to payment metadata
   - Maintain delivery confirmation logs (portal access logs, file download timestamps)
   - Record all client communications acknowledging service delivery
   - Screenshot client portal activity showing service consumption

3. **Dispute Response Process:**
   - Automated evidence package compilation within 24 hours of dispute notification
   - Response template per store engine type (pre-populated with engagement-specific data)
   - Escalation to legal team for disputes exceeding $50K
   - Client relationship management during dispute (separate from dispute response)

### 1.7 Testing Payment Flows in Sandbox Environments

#### Comprehensive Test Scenarios

1. **Stripe Test Mode Configuration:**
   - Use test API keys for all development and staging environments
   - Configure test webhook endpoints separate from production
   - Use Stripe test card numbers for various scenarios:
     - `4242424242424242` - Successful payment
     - `4000000000003220` - 3D Secure required
     - `4000000000000002` - Declined
     - `4000000000009995` - Insufficient funds

2. **High-Value Specific Tests:**
   - Test milestone payment sequences end-to-end (create engagement, trigger milestones, process payments)
   - Verify split payment calculations across multiple connected accounts
   - Test payment failure recovery flows (retry, alternative method, manual intervention)
   - Validate webhook processing for all event types under load
   - Test invoice generation and delivery for NET-30/NET-45 terms

3. **Edge Case Testing:**
   - Partial refund processing for milestone-based engagements
   - Currency conversion accuracy for international clients
   - Subscription upgrade/downgrade mid-cycle proration
   - Payment method expiration handling and update flows
   - Dispute simulation and evidence submission workflow

### 1.8 Handling Failed Payments and Retry Logic

#### Automated Retry Configuration

**Smart Retry Schedule:**

```javascript
const retryConfig = {
  max_attempts: 4,
  schedule: [
    { attempt: 1, delay_hours: 0, method: "automatic" },
    { attempt: 2, delay_hours: 24, method: "automatic", notify_client: true },
    { attempt: 3, delay_hours: 72, method: "automatic", notify_client: true, offer_alternative: true },
    { attempt: 4, delay_hours: 168, method: "manual", escalate_to_account_manager: true }
  ],
  dunning_email_sequence: [
    { trigger: "first_failure", template: "payment_update_needed" },
    { trigger: "second_failure", template: "action_required_billing" },
    { trigger: "third_failure", template: "service_interruption_warning" },
    { trigger: "final_notice", template: "account_suspension_notice" }
  ]
};
```

**Failure Type Handling:**

| Failure Code | Action | Client Communication |
|---|---|---|
| `card_declined` | Retry in 24h, then request update | "Please update your payment method" |
| `insufficient_funds` | Retry in 48h (payday cycle) | "We will retry shortly" |
| `expired_card` | Request new card immediately | "Your card has expired - update required" |
| `processing_error` | Immediate retry (different processor route) | No notification (transparent) |
| `authentication_required` | Send 3DS link to client | "Action needed: verify your payment" |

**Grace Period Policy:**
- Retainer services: 7-day grace period after payment failure before service pause
- One-time licenses: Delivery held until payment resolves (no grace period)
- Milestone payments: 15-day cure period with escalating notifications
- Service restoration: Automatic within 4 hours of successful payment

### 1.9 Currency Conversion and International Billing

#### Multi-Currency Configuration

1. **Presentment Currency:**
   - Display prices in client local currency on checkout (USD, EUR, GBP, CAD, AUD, CHF)
   - Use Stripe automatic currency conversion at current exchange rates
   - Lock exchange rate for 24 hours from quote generation

2. **Settlement Currency:**
   - Primary settlement in USD (platform operating currency)
   - Configure multi-currency payouts for international service providers
   - Set up separate bank accounts per settlement currency if volume justifies

3. **International Billing Considerations:**
   - Display VAT/GST separately for applicable jurisdictions
   - Include local payment methods (SEPA Direct Debit for EU, BACS for UK)
   - Wire transfer instructions in local currency with intermediary bank details
   - Invoice language localization for non-English markets

4. **Exchange Rate Risk Management:**
   - For engagements exceeding 3 months, include currency adjustment clause in contracts
   - Offer fixed-rate contracts at 3% premium over spot rate
   - Quarterly rate reviews for long-term retainers billed in non-USD currencies

### 1.10 Tax Calculation and Compliance

#### Stripe Tax Integration

1. **Automatic Tax Calculation:**
   - Enable Stripe Tax for automatic sales tax, VAT, and GST calculation
   - Configure tax behavior: inclusive vs. exclusive pricing per store engine
   - Set product tax codes appropriate for each service type:
     - Advisory services: `txcd_10000000` (General Services)
     - Software licensing: `txcd_10201000` (Software as a Service)
     - Digital downloads: `txcd_10502000` (Digital Goods)

2. **Tax Registration Management:**
   - Monitor Stripe Tax threshold alerts for new jurisdiction registration requirements
   - Maintain state/country tax registration numbers in Stripe dashboard
   - Configure tax-exempt status for qualifying clients (B2B reverse charge, non-profit)

3. **Manual Tax Rules (When Stripe Tax Is Insufficient):**
   - Professional services in certain jurisdictions exempt from sales tax
   - B2B services with valid tax ID: apply reverse charge mechanism
   - Mixed supplies (license + services): apportion tax based on component values
   - Digital services to EU consumers: apply destination-country VAT rate

4. **Tax Documentation:**
   - Auto-generate tax invoices compliant with local requirements
   - W-9/W-8BEN collection from US/international service providers
   - Annual 1099 generation for US-based contractors receiving payouts
   - VAT invoice requirements: sequential numbering, full address, tax breakdown

---

## 2. Automated User Access Provisioning

### 2.1 Setting Up Custom Webflow Membership Roles

#### Defining Access Tiers

Webflow Memberships supports role-based access control through Access Groups. For ultra-high-ticket stores, configure tiered access that maps directly to purchase level:

**Access Group Architecture:**

| Access Group Name | Store Engine(s) | Access Level | Duration | Content Scope |
|---|---|---|---|---|
| `client-foundation` | All stores | Basic portal access | Active engagement | Billing, basic docs |
| `client-premium` | APEX, STUDIO, EQUITY | Enhanced portal | Active + 90-day grace | Full docs, recordings, community |
| `client-enterprise` | DATA CITADEL, PIPELINE | Full platform access | Active subscription | Source code, APIs, priority support |
| `client-advisory` | CLIMATE, NEUROTECH | Research access | Active + alumni | Research papers, data, collaboration |
| `client-alumni` | All stores | Limited ongoing access | Perpetual (basic tier) | Market insights, community |

**Configuration Steps in Webflow:**

1. Navigate to Memberships > Access Groups in Webflow Designer
2. Create each access group with descriptive naming convention: `[level]-[store-abbreviation]`
3. Configure access group settings:
   - Enable/disable free signup (always disabled for high-ticket stores)
   - Set access group visibility (hidden from public registration)
   - Configure session duration (recommended: 30 days for retainer clients, 7 days for one-time purchasers)
4. Assign content pages and CMS collections to appropriate access groups:
   - Client portal pages: Assign to `client-foundation` and above
   - Document libraries: Assign to `client-premium` and above
   - Source repositories: Assign to `client-enterprise` only
   - Research collaboration: Assign to `client-advisory` only

**Role Hierarchy Implementation:**

```
Access Level Hierarchy (higher includes all lower permissions):

Level 5: client-enterprise (full platform access)
  |-- Level 4: client-advisory (research + collaboration)
  |     |-- Level 3: client-premium (enhanced portal + community)
  |     |     |-- Level 2: client-foundation (basic portal)
  |     |     |     |-- Level 1: client-alumni (limited ongoing)
```

When assigning users, always assign the highest applicable tier. Use Webflow's membership API to programmatically manage assignments based on purchase events.

### 2.2 Creating Gated Client Portal Spaces Within Webflow

#### Portal Architecture

Design client portals as a separate folder structure within your Webflow site, entirely gated behind membership access:

**Portal Page Structure:**

```
/client-portal/
  |-- /dashboard          (Access: client-foundation+)
  |-- /documents          (Access: client-premium+)
  |-- /billing            (Access: client-foundation+)
  |-- /project-status     (Access: client-foundation+)
  |-- /team               (Access: client-premium+)
  |-- /resources          (Access: client-premium+)
  |-- /source-access      (Access: client-enterprise)
  |-- /research-hub       (Access: client-advisory)
  |-- /community          (Access: client-premium+)
  |-- /settings           (Access: client-foundation+)
```

**Implementation Details:**

1. **Dashboard Page:**
   - Dynamic content pulling from CMS collections filtered by logged-in user email
   - Embed custom widgets via Webflow HTML embeds (Stripe billing portal, calendar scheduler)
   - Conditional visibility blocks showing different content per access group
   - Quick-action cards: "View Documents," "Check Project Status," "Schedule Meeting," "Update Payment"

2. **Document Library:**
   - CMS-driven document collection with file hosting via external CDN (Cloudflare R2 or AWS S3)
   - Filter by engagement type, date, category
   - Download tracking via analytics events
   - Version history display for updated documents

3. **Project Status:**
   - CMS collection "Client Projects" with status fields (stage, percentage, next milestone, assigned team)
   - Visual progress bars using custom CSS within Webflow
   - Timeline view with milestone markers
   - Comment/note section (embed external tool like Notion or Canny)

4. **Billing Portal:**
   - Embedded Stripe Customer Portal for payment method management
   - Invoice history pulled via Stripe API and displayed in CMS-styled cards
   - Upcoming charges preview
   - Subscription management (upgrade/downgrade/cancel) for retainer clients

#### Conditional Visibility Configuration

Use Webflow's conditional visibility feature to show/hide portal elements based on access group:

```
Element: "Enterprise Source Code Section"
  Visibility Condition: User is in Access Group "client-enterprise"
  
Element: "Upgrade to Premium Banner"
  Visibility Condition: User is in Access Group "client-foundation" AND NOT in "client-premium"
  
Element: "Renewal Reminder"
  Visibility Condition: Custom attribute "renewal_date" is within 30 days
```

### 2.3 External Webhook Integrations via Zapier/Make

#### Trigger: Successful Purchase Event

Configure webhook listeners to respond to payment events and automatically provision access:

**Zapier Configuration (Primary Automation):**

**Zap 1: New High-Value Purchase to Full Provisioning**

```
TRIGGER: Stripe > New Successful Payment Intent
  Filter: amount >= 1000000 (>= $10,000)
  Filter: metadata.store_engine is not empty

ACTION 1: Webflow > Create/Update Membership
  Email: {{stripe_customer_email}}
  Access Groups: Map from metadata.store_engine to access group ID
  
ACTION 2: Delay > Wait 2 minutes (allow Webflow propagation)

ACTION 3: Gmail/SendGrid > Send Welcome Email
  Template: Map from metadata.store_engine
  Include: Portal login link, onboarding checklist, team introduction

ACTION 4: Slack > Send Channel Message
  Channel: #new-clients
  Message: "New {{store_engine}} client: {{company_name}} - ${{amount}}"

ACTION 5: Google Sheets > Create Row
  Sheet: Client Onboarding Tracker
  Data: Client name, email, store engine, amount, date, status
```

**Zap 2: Milestone Payment to Access Upgrade**

```
TRIGGER: Stripe > Invoice Paid
  Filter: metadata.milestone_id is not empty

ACTION 1: Filter > Only continue if milestone unlocks new access
  Condition: metadata.access_upgrade = "true"

ACTION 2: Webflow > Update Membership Access Groups
  Email: {{stripe_customer_email}}
  Add Access Group: {{metadata.new_access_group}}

ACTION 3: Email > Send Access Upgrade Notification
  Template: "New Resources Unlocked"
  Include: Description of newly available content and portal sections
```

**Make (Integromat) Configuration (Complex Scenarios):**

For multi-step provisioning with conditional logic beyond Zapier's capabilities:

```
Scenario: Enterprise Client Full Provisioning

Module 1: Webhook > Custom Webhook
  Receives: Stripe payment_intent.succeeded event

Module 2: Router
  Route A: If store_engine in ["DATA_CITADEL", "PIPELINE_FORGE", "NEUROTECH_LAB"]
    -> Enterprise provisioning path
  Route B: If store_engine in ["APEX_RETAINERS", "STUDIO_COMMAND"]
    -> Retainer provisioning path
  Route C: All others
    -> Standard provisioning path

Route A - Enterprise:
  Module 3: Webflow API > Create Membership (access: client-enterprise)
  Module 4: GitHub API > Add to private repository team
  Module 5: Slack API > Create private channel, invite client
  Module 6: Notion API > Create client workspace from template
  Module 7: SendGrid > Send enterprise welcome sequence (5-email series)
  Module 8: Calendar API > Schedule kickoff meeting

Route B - Retainer:
  Module 3: Webflow API > Create Membership (access: client-premium)
  Module 4: Slack API > Invite to shared channel
  Module 5: Notion API > Create project board from template
  Module 6: SendGrid > Send retainer welcome email
  Module 7: Calendar API > Schedule onboarding call
```

#### Conditional Logic for Different Purchase Tiers

Implement tier-based provisioning decisions:

**Tier Mapping Table:**

| Store Engine | Purchase Tier | Access Group | Additional Provisioning |
|---|---|---|---|
| APEX RETAINERS | Strategic Advisor ($15K-$25K) | client-premium | Slack channel, Notion board |
| APEX RETAINERS | Full Fractional ($40K-$50K) | client-enterprise | + Private repo, dedicated PM |
| PIPELINE FORGE | Single Pipeline ($25K-$50K) | client-premium | Docs portal, community |
| PIPELINE FORGE | Enterprise ($100K-$150K) | client-enterprise | + Source code, dedicated Slack |
| DATA CITADEL | Foundation ($30K-$60K) | client-premium | IaC docs, standard support |
| DATA CITADEL | Enterprise ($120K-$200K) | client-enterprise | + Full source, dedicated SA |
| NEUROTECH LAB | Research ($40K-$100K) | client-advisory | Research portal, datasets |
| NEUROTECH LAB | Commercial ($200K-$300K) | client-enterprise | + Full source, joint dev access |

**Conditional Logic Implementation:**

```javascript
// Webhook processor - determine provisioning path
function determineProvisioning(paymentEvent) {
  const storeEngine = paymentEvent.metadata.store_engine;
  const amount = paymentEvent.amount;
  const tier = paymentEvent.metadata.tier;
  
  const provisioningConfig = {
    accessGroup: mapTierToAccessGroup(storeEngine, tier),
    slackChannel: shouldCreateSlack(storeEngine, amount),
    notionWorkspace: shouldCreateNotion(storeEngine, tier),
    githubAccess: shouldGrantGithub(storeEngine, tier),
    emailSequence: getEmailSequence(storeEngine, tier),
    calendarBooking: getOnboardingCallType(storeEngine, tier)
  };
  
  return provisioningConfig;
}

function mapTierToAccessGroup(store, tier) {
  const mapping = {
    "APEX_RETAINERS": {
      "strategic_advisor": "client-premium",
      "operating_partner": "client-premium",
      "full_fractional": "client-enterprise"
    },
    "PIPELINE_FORGE": {
      "single_pipeline": "client-premium",
      "multi_pipeline": "client-premium",
      "enterprise_platform": "client-enterprise"
    },
    // ... additional store mappings
  };
  
  return mapping[store]?.[tier] || "client-foundation";
}
```

### 2.4 Automated Onboarding Email Sequences

#### Sequence Architecture

Configure multi-step email onboarding triggered by purchase completion:

**Universal Onboarding Sequence (All Stores):**

| Day | Email | Subject Line | Content |
|---|---|---|---|
| 0 (immediate) | Welcome | "Welcome to [Store Name] - Your Access is Ready" | Portal credentials, quick-start guide, team intro |
| 1 | Getting Started | "Your First Steps with [Store Name]" | Step-by-step onboarding checklist, video walkthrough |
| 3 | Resource Highlight | "Resources Available in Your Portal" | Tour of document library, key resources to review first |
| 5 | Check-In | "How's Your Experience So Far?" | Feedback request, support channel reminder, FAQ link |
| 7 | Team Introduction | "Meet Your Dedicated Team" | Team member profiles, contact preferences, office hours |
| 14 | Value Delivery | "Your First [Milestone/Deliverable] is Ready" | Progress update, first tangible output, next steps |
| 30 | Review | "30-Day Engagement Review" | Progress summary, upcoming milestones, feedback survey |

**Store-Specific Sequence Variations:**

- EQUITY ENGINE: Add Day 2 "NDA and Deal Room Access" and Day 4 "Market Landscape Preview"
- NEUROTECH LAB: Add Day 2 "Repository Access Guide" and Day 10 "Integration Support Scheduling"
- CLIMATE CAPITAL: Add Day 3 "ESG Baseline Data Request" and Day 7 "Regulatory Calendar Setup"

**Email Platform Integration:**

- Primary: SendGrid or Customer.io for transactional and sequence emails
- Trigger source: Zapier/Make webhook from Stripe payment event
- Personalization: Dynamic fields from CRM/payment metadata (client name, company, store engine, tier, team members assigned)
- Behavior tracking: Open rates, click rates, portal login correlation

### 2.5 Role-Based Content Visibility in Webflow

#### Conditional Visibility Rules

Implement granular content visibility using Webflow's native conditional visibility combined with custom attributes:

**Native Webflow Conditional Visibility:**

1. Select any element in Webflow Designer
2. Open Element Settings > Conditional Visibility
3. Set condition: "When user is logged in AND is member of [Access Group]"
4. Apply to sections, cards, buttons, navigation items, and CTAs

**Advanced Visibility Patterns:**

```
Pattern 1: Tiered Content Reveal
  - Show "Basic Overview" to: client-foundation
  - Show "Detailed Analysis" to: client-premium
  - Show "Full Source + Analysis" to: client-enterprise
  Result: Same page, different depth based on membership tier

Pattern 2: Upgrade Prompts
  - Show "Unlock Advanced Features" CTA to: client-foundation, client-premium
  - Hide "Unlock Advanced Features" CTA from: client-enterprise
  Result: Natural upgrade path visibility

Pattern 3: Navigation Filtering
  - Show "Source Code" nav item to: client-enterprise only
  - Show "Research Hub" nav item to: client-advisory only
  - Show "Community" nav item to: client-premium and above
  Result: Clean navigation appropriate to access level

Pattern 4: Dynamic Pricing Display
  - Show "Current Plan" badge on active tier
  - Show "Upgrade" button on higher tiers
  - Show "Included in Your Plan" on lower tiers
  Result: Clear plan comparison with actionable upgrade path
```

**Custom Code Enhancement for Complex Visibility:**

```javascript
// For visibility logic beyond Webflow's native capabilities
// Add to site-wide custom code (before </body>)
<script>
document.addEventListener('DOMContentLoaded', function() {
  // Get user membership data from Webflow
  const memberData = window._memberstack || window.MemberStack;
  
  if (memberData && memberData.getMemberJSON) {
    const member = memberData.getMemberJSON();
    const accessGroups = member.accessGroups || [];
    
    // Show/hide elements based on custom data attributes
    document.querySelectorAll('[data-access-required]').forEach(el => {
      const required = el.dataset.accessRequired;
      if (!accessGroups.includes(required)) {
        el.style.display = 'none';
      }
    });
    
    // Show upgrade prompts for lower tiers
    document.querySelectorAll('[data-upgrade-from]').forEach(el => {
      const fromTier = el.dataset.upgradeFrom;
      if (accessGroups.includes(fromTier) && !accessGroups.includes(el.dataset.upgradeTo)) {
        el.style.display = 'block';
      }
    });
  }
});
</script>
```

### 2.6 Revoking Access on Subscription Cancellation or Project Completion

#### Automated Access Revocation Workflows

**Trigger Events for Revocation:**

1. **Subscription Cancellation:**
   - Stripe event: `customer.subscription.deleted` or `customer.subscription.updated` (status = canceled)
   - Grace period: 7 days from cancellation before access removal
   - Notification sequence: Immediate cancellation acknowledgment, Day 3 "access ending soon" reminder, Day 7 "access revoked" confirmation

2. **Payment Failure (Final):**
   - Stripe event: `invoice.payment_failed` after all retry attempts exhausted
   - Grace period: 15 days from final failure
   - Escalation: Day 1 failure notice, Day 5 urgent update request, Day 10 service pause warning, Day 15 access revocation

3. **Project Completion:**
   - Manual trigger or automated based on project status CMS field change to "Completed"
   - Transition: Full access to alumni access (downgrade, not full revocation)
   - Timeline: 30-day transition period with full access, then alumni tier

**Revocation Automation (Zapier/Make):**

```
Scenario: Subscription Cancellation Revocation

TRIGGER: Stripe > Customer Subscription Deleted

ACTION 1: Delay > Wait 7 days (grace period)

ACTION 2: Check > Is subscription still canceled?
  (Prevents revocation if client resubscribes during grace period)
  YES -> Continue
  NO -> Stop (subscription reactivated)

ACTION 3: Webflow API > Update Membership
  Remove Access Groups: [current tier groups]
  Add Access Group: client-alumni (if eligible)

ACTION 4: Email > Send "Access Revoked" notification
  Include: Data export instructions, reactivation information, alumni benefits description

ACTION 5: Slack > Notify team
  Channel: #client-changes
  Message: "Access revoked: [client] - reason: subscription cancellation"

ACTION 6: Google Sheets > Update Client Tracker
  Status: "Churned"
  Churn Date: [today]
  Reactivation Eligible: Yes
```

**Data Preservation on Revocation:**
- Client data retained in CMS for 90 days post-revocation (regulatory compliance)
- Document download access removed but records preserved
- Billing history permanently accessible via Stripe portal link
- Offer data export package before access removal (automated email with export link)

### 2.7 Audit Logging for Access Changes

#### Comprehensive Access Audit Trail

Maintain a complete log of all access provisioning and revocation events:

**Audit Log Schema:**

```javascript
const auditEntry = {
  timestamp: "2024-03-15T14:30:00Z",
  event_type: "access_granted", // access_granted, access_revoked, access_upgraded, access_downgraded
  user_email: "client@company.com",
  user_id: "mem_abc123",
  access_group_before: ["client-foundation"],
  access_group_after: ["client-foundation", "client-premium"],
  trigger: "payment_successful", // payment_successful, milestone_reached, manual_admin, subscription_canceled, project_completed
  trigger_reference: "pi_xyz789", // Stripe payment intent ID or admin user ID
  store_engine: "PIPELINE_FORGE",
  initiated_by: "system", // system, admin_[name], webhook
  ip_address: "203.0.113.42",
  notes: "Upgraded from Foundation to Platform tier after milestone 2 payment"
};
```

**Logging Implementation:**

1. **Storage:** Dedicated Google Sheet, Airtable base, or database table for audit entries
2. **Capture Points:**
   - Every Zapier/Make action that modifies membership triggers audit log append
   - Manual admin changes logged via separate admin interface
   - System-triggered changes (auto-revocation, expiration) logged automatically
3. **Retention:** Minimum 7 years for financial services clients, 3 years standard
4. **Access:** Restricted to operations team and compliance officer

**Audit Report Generation:**

- Weekly automated summary: New provisions, revocations, upgrades, anomalies
- Monthly compliance report: Full access change log with reconciliation against payment records
- On-demand query: Filter by user, date range, event type, or store engine
- Anomaly alerting: Flag unusual patterns (multiple access changes in short period, access without matching payment)

### 2.8 Integration with External Tools for Client Workspace Provisioning

#### Notion Integration

**Automated Workspace Creation:**

```
Trigger: New client provisioned (post-Webflow membership creation)

Actions via Notion API (through Make/Zapier):
1. Duplicate client workspace template
   - Template includes: Project overview page, meeting notes database, document library, task tracker, communication log
2. Set workspace permissions
   - Invite client email as "Editor" on their workspace
   - Add assigned team members as "Full Access"
3. Pre-populate with engagement data
   - Client name, engagement type, start date, milestone schedule
   - Team member assignments with contact information
   - Document links from secure storage
4. Configure database views
   - Filter task tracker to show only relevant milestones
   - Set timeline view to engagement duration
   - Create "Client View" with limited field visibility
```

#### Slack Integration

**Channel Provisioning:**

```
Trigger: Enterprise or Premium client provisioned

Actions via Slack API:
1. Create private channel: #client-[company-name]-[engagement-id]
2. Set channel purpose: "[Store Engine] engagement - [client company]"
3. Invite team members:
   - Account manager (always)
   - Primary specialist (based on store engine)
   - Operations coordinator (for enterprise tier)
4. Invite client contacts (from intake form data)
5. Post welcome message with:
   - Engagement overview
   - Team introductions
   - Key links (portal, docs, calendar)
   - Channel guidelines and response time SLA
6. Set channel reminders:
   - Weekly status update prompt
   - Milestone approaching notifications
```

#### Google Workspace Integration

**Client Folder and Access Provisioning:**

```
Trigger: Client provisioned at premium tier or above

Actions via Google Drive API:
1. Create shared folder structure:
   /Clients/[Company Name]/
     /Contracts & Legal
     /Deliverables
     /Meeting Notes
     /Reference Materials
     /Client Uploads

2. Set permissions:
   - Client email: "Viewer" on /Deliverables, "Editor" on /Client Uploads
   - Team: "Editor" on all folders
   - Operations: "Manager" on root folder

3. Create shared Google Calendar:
   - Calendar name: "[Company] - [Store Engine] Engagement"
   - Pre-populate with: Kickoff meeting, milestone dates, review sessions
   - Share with client and team members

4. Configure Google Meet links:
   - Generate recurring meeting link for standing calls
   - Add to client portal as embedded calendar widget
```

### 2.9 Backup and Disaster Recovery for Access Management

#### Access Data Protection

1. **Regular Backups:**
   - Daily export of Webflow membership data (all users, access groups, custom fields)
   - Weekly full backup of automation workflows (Zapier/Make scenario exports)
   - Monthly snapshot of all integrated tool configurations (Notion templates, Slack channels, Google Workspace structure)

2. **Backup Storage:**
   - Primary: Encrypted cloud storage (AWS S3 with versioning enabled)
   - Secondary: Separate cloud provider (Google Cloud Storage) for geographic redundancy
   - Retention: 90-day rolling backup with monthly archives retained for 2 years

3. **Recovery Procedures:**

   **Scenario A: Webflow Membership Data Loss**
   - Restore from daily backup CSV (import via Webflow Membership API)
   - Verify access groups re-assigned correctly
   - Send password reset emails to affected users
   - Estimated recovery time: 2-4 hours

   **Scenario B: Automation Workflow Failure**
   - Revert to last working Zapier/Make scenario version
   - Process queued events manually from Stripe event log
   - Verify no users missed provisioning by cross-referencing payment log vs. membership list
   - Estimated recovery time: 1-2 hours

   **Scenario C: Complete Platform Migration**
   - Export all membership data, CMS content, and automation configurations
   - Provision users on new platform using API bulk import
   - Update webhook endpoints in Stripe and other trigger sources
   - Parallel-run both platforms for 7 days to verify parity
   - Estimated migration time: 2-4 weeks

4. **Testing:**
   - Quarterly disaster recovery drill (simulate data loss, execute recovery)
   - Monthly backup verification (restore random sample, verify data integrity)
   - Annual full platform recovery test (complete restore to staging environment)

5. **Access Continuity Plan:**
   - If Webflow is unavailable: Static maintenance page with client support contact info
   - If payment processor is down: Manual payment confirmation and provisional access
   - If automation platform fails: Manual provisioning checklist with step-by-step procedures
   - Emergency contact tree: Operations lead > Engineering > Executive sponsor

---

*End of Master Store Customization & Maintenance Playbook*
