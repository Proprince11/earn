# PgAdmin Database Deployment Guide

> Complete step-by-step instructions for deploying the Webflow Elite Suite database schema using PgAdmin 4.

---

## 1. Initialize Server Connection & Create Database

### 1.1 Register a New Server Connection

1. Open PgAdmin 4 in your web browser (default: `http://localhost:5050` or your configured URL).
2. In the left-hand **Object Explorer** panel, right-click on **Servers**.
3. Select **Register** > **Server...** from the context menu.
4. In the **Register - Server** dialog, fill in the following:

**General Tab:**
| Field | Value |
|-------|-------|
| Name | `Webflow Elite Local` (or your preferred display name) |

**Connection Tab:**
| Field | Value |
|-------|-------|
| Host name/address | `localhost` (or your PostgreSQL server IP) |
| Port | `5432` (default PostgreSQL port) |
| Maintenance database | `postgres` |
| Username | `postgres` (or your configured superuser) |
| Password | Your PostgreSQL password |
| Save password? | Toggle ON for convenience |

5. Click **Save**. The server will appear in the Object Explorer tree under **Servers**.

### 1.2 Create the Database

1. In the Object Explorer, expand your newly registered server connection.
2. Right-click on **Databases**.
3. Select **Create** > **Database...** from the context menu.
4. In the **Create - Database** dialog, configure:

**General Tab:**
| Field | Value |
|-------|-------|
| Database | `webflow_elite_db` |
| Owner | `postgres` (or your application user) |
| Comment | `Webflow Elite Suite - Template marketplace and project management database` |

**Definition Tab:**
| Field | Value |
|-------|-------|
| Encoding | `UTF8` |
| Template | `template0` |
| Tablespace | `pg_default` |
| Collation | `en_US.UTF-8` (or your locale) |
| Character type | `en_US.UTF-8` (or your locale) |
| Connection limit | `-1` (unlimited) |

5. Click **Save**. The database `webflow_elite_db` will appear under the Databases node.

### 1.3 Verify the Empty Database

1. Expand `webflow_elite_db` in the Object Explorer.
2. Navigate to **Schemas** > **public** > **Tables**. It should be empty (no tables yet).
3. Confirm the database is ready to receive the schema script.

---

## 2. Execute the Schema Script

### 2.1 Open the Query Tool

1. In the Object Explorer, click on `webflow_elite_db` to select it (it should be highlighted).
2. Open the Query Tool using one of these methods:
   - Click **Tools** in the top menu bar > **Query Tool**
   - Right-click on `webflow_elite_db` > **Query Tool**
   - Use the keyboard shortcut: `Alt + Shift + Q`
3. A new Query Tool tab will open, connected to `webflow_elite_db`.
4. Verify the connection indicator in the bottom status bar shows `webflow_elite_db` as the active database.

### 2.2 Load and Execute the Script

1. Open the file `database_schema.sql` in a text editor on your local machine.
2. Select all content (`Ctrl + A`) and copy it (`Ctrl + C`).
3. Click inside the Query Tool editor pane in PgAdmin.
4. Paste the entire script (`Ctrl + V`).
5. Execute the script by clicking the **Execute/Run** button (lightning bolt icon) or pressing `F5`.

### 2.3 Expected Output Messages

After execution, the **Messages** tab at the bottom of the Query Tool should display output similar to:

```
DROP TABLE
DROP TABLE
DROP TABLE
DROP TABLE
DROP TABLE
DROP TYPE
DROP TYPE
DROP TYPE
DROP TYPE
CREATE TYPE
CREATE TYPE
CREATE TYPE
CREATE TYPE
CREATE TABLE
CREATE TABLE
CREATE TABLE
CREATE TABLE
CREATE TABLE
CREATE INDEX
CREATE INDEX
CREATE INDEX
CREATE INDEX
CREATE INDEX
CREATE INDEX
CREATE INDEX
CREATE INDEX
CREATE INDEX
CREATE INDEX
CREATE INDEX
CREATE INDEX
INSERT 0 5
INSERT 0 15
INSERT 0 10
INSERT 0 12
INSERT 0 15

Query returned successfully in XXX msec.
```

If you see any `ERROR` messages, check for:
- Missing semicolons at the end of statements
- Incomplete copy/paste (ensure the entire script was pasted)
- Pre-existing type conflicts (the DROP statements should handle this, but verify)

### 2.4 Verify Table Creation in Object Explorer

1. In the Object Explorer, navigate to: `webflow_elite_db` > **Schemas** > **public** > **Tables**.
2. If the tables do not appear, right-click on **Tables** and select **Refresh** (or press `F5` on the tree node).
3. You should see the following 5 tables listed alphabetically:
   - `accounts`
   - `milestone_invoices`
   - `purchases`
   - `store_projects`
   - `webflow_templates`
4. Expand any table to inspect its **Columns**, **Constraints**, and **Indexes** sub-nodes.
5. Additionally check **Types** under `webflow_elite_db` > **Schemas** > **public** > **Types** to confirm:
   - `project_status`
   - `template_category`
   - `transaction_status`
   - `user_role`

---

## 3. Verification Queries

Open a new Query Tool session (or use the existing one) connected to `webflow_elite_db`. Run each query below to confirm data integrity.

### 3.1 Count All Accounts

```sql
SELECT COUNT(*) AS total_accounts FROM accounts;
```

**Expected Output:**
| total_accounts |
|----------------|
| 5 |

This confirms all 5 user accounts (1 Admin, 2 Buyers, 2 Agency Partners) were inserted successfully.

---

### 3.2 Count All Templates

```sql
SELECT COUNT(*) AS total_templates FROM webflow_templates;
```

**Expected Output:**
| total_templates |
|-----------------|
| 15 |

This confirms all 15 premium templates matching the Webflow Elite product line were inserted.

---

### 3.3 Count All Store Projects

```sql
SELECT COUNT(*) AS total_projects FROM store_projects;
```

**Expected Output:**
| total_projects |
|----------------|
| 10 |

This confirms all 10 store engine projects were inserted with their specifications.

---

### 3.4 Count All Purchases

```sql
SELECT COUNT(*) AS total_purchases FROM purchases;
```

**Expected Output:**
| total_purchases |
|-----------------|
| 12 |

This confirms all 12 purchase records spanning template sales and project commissions.

---

### 3.5 Count All Milestone Invoices

```sql
SELECT COUNT(*) AS total_milestones FROM milestone_invoices;
```

**Expected Output:**
| total_milestones |
|------------------|
| 15 |

This confirms all 15 milestone invoice records across active project purchases.

---

### 3.6 Purchases with Account and Template/Project Names

```sql
SELECT
    p.id AS purchase_id,
    a.full_name AS buyer_name,
    a.company,
    COALESCE(wt.production_name, sp.store_name) AS item_name,
    CASE
        WHEN p.template_id IS NOT NULL THEN 'Template'
        ELSE 'Project'
    END AS purchase_type,
    (p.total_amount_cents / 100.0)::NUMERIC(10,2) AS total_amount_usd,
    p.transaction_status,
    p.purchased_at
FROM purchases p
JOIN accounts a ON p.account_id = a.id
LEFT JOIN webflow_templates wt ON p.template_id = wt.id
LEFT JOIN store_projects sp ON p.project_id = sp.id
ORDER BY p.purchased_at DESC;
```

**Expected Output:** A table with 12 rows showing each purchase linked to its buyer and the purchased item (either a template name like "OBSIDIAN" or a project name like "APEX RETAINERS"). The `purchase_type` column distinguishes between Template and Project purchases. Amounts display in USD format (e.g., $12,000.00 for a 1200000 cents value). Transaction statuses range across Completed, Pending, Milestone payments, Refunded, and Disputed.

---

### 3.7 Milestone Invoices Grouped by Purchase with Totals

```sql
SELECT
    sp.store_name AS project_name,
    a.full_name AS client_name,
    COUNT(mi.id) AS milestone_count,
    (SUM(mi.amount_cents) / 100.0)::NUMERIC(10,2) AS total_invoiced_usd,
    (SUM(CASE WHEN mi.paid_at IS NOT NULL THEN mi.amount_cents ELSE 0 END) / 100.0)::NUMERIC(10,2) AS total_paid_usd,
    (SUM(CASE WHEN mi.paid_at IS NULL THEN mi.amount_cents ELSE 0 END) / 100.0)::NUMERIC(10,2) AS total_outstanding_usd
FROM milestone_invoices mi
JOIN purchases p ON mi.purchase_id = p.id
JOIN accounts a ON p.account_id = a.id
LEFT JOIN store_projects sp ON p.project_id = sp.id
GROUP BY sp.store_name, a.full_name
ORDER BY total_invoiced_usd DESC;
```

**Expected Output:** A summary table with one row per project showing the project name, client name, number of milestones (3 each), total invoiced amount, amount already paid, and outstanding balance. For example, "LEGAL FORTRESS" for Jonathan Ashford would show 3 milestones totaling $58,000.00 with $58,000.00 paid and $0.00 outstanding (all milestones paid). "APEX RETAINERS" for Sofia Ramirez would show $45,000.00 total with $29,250.00 paid and $15,750.00 outstanding.

---

### 3.8 Referential Integrity Check (No Orphaned Foreign Keys)

```sql
-- Check for purchases referencing non-existent accounts
SELECT 'Orphaned purchase->account' AS issue, COUNT(*) AS count
FROM purchases p
LEFT JOIN accounts a ON p.account_id = a.id
WHERE a.id IS NULL

UNION ALL

-- Check for purchases referencing non-existent templates
SELECT 'Orphaned purchase->template' AS issue, COUNT(*) AS count
FROM purchases p
LEFT JOIN webflow_templates wt ON p.template_id = wt.id
WHERE p.template_id IS NOT NULL AND wt.id IS NULL

UNION ALL

-- Check for purchases referencing non-existent projects
SELECT 'Orphaned purchase->project' AS issue, COUNT(*) AS count
FROM purchases p
LEFT JOIN store_projects sp ON p.project_id = sp.id
WHERE p.project_id IS NOT NULL AND sp.id IS NULL

UNION ALL

-- Check for milestone invoices referencing non-existent purchases
SELECT 'Orphaned milestone->purchase' AS issue, COUNT(*) AS count
FROM milestone_invoices mi
LEFT JOIN purchases p ON mi.purchase_id = p.id
WHERE p.id IS NULL

UNION ALL

-- Check for store projects referencing non-existent accounts
SELECT 'Orphaned project->account' AS issue, COUNT(*) AS count
FROM store_projects sp
LEFT JOIN accounts a ON sp.assigned_account_id = a.id
WHERE sp.assigned_account_id IS NOT NULL AND a.id IS NULL;
```

**Expected Output:**
| issue | count |
|-------|-------|
| Orphaned purchase->account | 0 |
| Orphaned purchase->template | 0 |
| Orphaned purchase->project | 0 |
| Orphaned milestone->purchase | 0 |
| Orphaned project->account | 0 |

All counts should be `0`, confirming complete referential integrity across the database. No records point to non-existent parent rows.

---

### 3.9 Transaction Status Distribution

```sql
SELECT
    transaction_status,
    COUNT(*) AS purchase_count,
    (SUM(total_amount_cents) / 100.0)::NUMERIC(10,2) AS total_revenue_usd
FROM purchases
GROUP BY transaction_status
ORDER BY purchase_count DESC;
```

**Expected Output:**
| transaction_status | purchase_count | total_revenue_usd |
|--------------------|----------------|-------------------|
| Completed | 4 | 7,050.00 |
| Milestone_1_Paid | 2 | 10,300.00 |
| Pending | 1 | 14,500.00 |
| Milestone_2_Paid | 1 | 45,000.00 |
| Milestone_3_Paid | 1 | 58,000.00 |
| Refunded | 1 | 8,000.00 |
| Disputed | 1 | 6,500.00 |

This distribution confirms a healthy mix of transaction states representing the full lifecycle of purchases from initial payment through milestone progression, completion, and exception handling (refunds and disputes).

---

## Troubleshooting

| Symptom | Solution |
|---------|----------|
| `ERROR: type "user_role" already exists` | The DROP statements at the top should prevent this. Ensure you pasted the complete script from the very beginning. |
| `ERROR: relation "accounts" already exists` | Same as above - the DROP TABLE IF EXISTS CASCADE statements handle this. |
| Tables not visible after execution | Right-click on the Tables node in Object Explorer and select **Refresh**. |
| `ERROR: permission denied for schema public` | Ensure your database user has CREATE privileges. Run: `GRANT ALL ON SCHEMA public TO your_user;` |
| `ERROR: function gen_random_uuid() does not exist` | You are running PostgreSQL < 13. Run `CREATE EXTENSION IF NOT EXISTS pgcrypto;` before the schema script. |
| Connection refused on port 5432 | Verify PostgreSQL service is running: `sudo systemctl status postgresql` (Linux) or check Services panel (Windows). |
