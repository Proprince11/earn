# PgAdmin Database Setup Guide - SyncSpace Creator Hub

A chronological, step-by-step guide for configuring PgAdmin and initializing the **creator_hub_db** database.

---

## Prerequisites

- PostgreSQL 14+ installed and running
- PgAdmin 4 (v6.0+) installed
- Access credentials for your PostgreSQL server (username/password)
- The `database_schema.sql` file from this repository

---

## Step 1: Launch PgAdmin and Create a New Server Connection

1. Open PgAdmin 4 from your applications menu or browser (typically `http://localhost:5050`).
2. In the left-hand **Browser** panel, right-click on **Servers**.
3. Select **Register** > **Server...**
4. In the **General** tab:
   - **Name**: `SyncSpace Local` (or any descriptive name)
5. In the **Connection** tab:
   - **Host name/address**: `localhost`
   - **Port**: `5432`
   - **Maintenance database**: `postgres`
   - **Username**: `postgres` (or your configured superuser)
   - **Password**: Enter your PostgreSQL password
   - Check **Save password** for convenience during development
6. Click **Save**.

You should now see the server listed under **Servers** in the Browser panel with a green status indicator.

---

## Step 2: Create the `creator_hub_db` Database

1. Expand your newly created server connection in the Browser panel.
2. Right-click on **Databases**.
3. Select **Create** > **Database...**
4. In the dialog:
   - **Database**: `creator_hub_db`
   - **Owner**: `postgres` (or your preferred role)
   - **Encoding**: `UTF8`
   - **Template**: `template0`
5. Click **Save**.

Alternatively, execute via SQL:

```sql
CREATE DATABASE creator_hub_db
    WITH OWNER = postgres
         ENCODING = 'UTF8'
         LC_COLLATE = 'en_US.UTF-8'
         LC_CTYPE = 'en_US.UTF-8'
         TEMPLATE = template0;
```

---

## Step 3: Execute the SQL Schema Script via Query Tool

1. In the Browser panel, expand **Databases** and click on `creator_hub_db` to select it.
2. Right-click on `creator_hub_db` and select **Query Tool** (or press `Alt+Shift+Q`).
3. In the Query Tool editor:
   - Click the **Open File** icon (folder icon in the toolbar).
   - Navigate to and select `database_schema.sql` from the `syncspace/` directory.
   - Alternatively, copy and paste the entire contents of `database_schema.sql` into the editor.
4. Click the **Execute/Run** button (play icon) or press `F5`.
5. Verify the output in the **Messages** tab shows:

```
CREATE TYPE
CREATE TYPE
CREATE TABLE
CREATE TABLE
CREATE TABLE
INSERT 0 3
INSERT 0 8
INSERT 0 6
```

If you see any errors, check that:
- You are connected to `creator_hub_db` (not `postgres`)
- No tables or types already exist (run `DROP SCHEMA public CASCADE; CREATE SCHEMA public;` to reset if needed)

---

## Step 4: Verify Table Creation in Object Explorer

1. In the Browser panel, navigate to:
   ```
   Servers > SyncSpace Local > Databases > creator_hub_db > Schemas > public > Tables
   ```
2. Click the refresh icon if tables are not visible.
3. Confirm the following tables exist:
   - `creators`
   - `scraped_videos`
   - `content_planner`
4. Expand each table to inspect:
   - **Columns**: Verify column names, data types, and constraints
   - **Constraints**: Confirm primary keys and foreign keys are present
   - **Indexes**: Check that primary key indexes were auto-created

Additionally, verify ENUM types at:
```
Schemas > public > Types
```
You should see:
- `platform_type` (values: YouTube, Instagram)
- `content_status` (values: Scraped, Draft, Scheduled, Published)

---

## Step 5: Run Verification Queries to Confirm Seed Data

Open the Query Tool on `creator_hub_db` and run the following queries:

### 5.1 - Verify Creators

```sql
SELECT * FROM creators;
```

Expected: 3 rows with creator names, platforms, channel URLs, and subscriber counts.

### 5.2 - Verify Scraped Videos

```sql
SELECT
    sv.video_title,
    sv.view_count,
    c.name AS creator_name
FROM scraped_videos sv
JOIN creators c ON sv.creator_id = c.id
ORDER BY sv.view_count DESC;
```

Expected: 8 rows showing video titles with formatted view counts, joined with creator names.

### 5.3 - Verify Content Planner Entries

```sql
SELECT
    cp.caption_hook,
    cp.platform,
    cp.status,
    cp.scheduled_date,
    c.name AS creator_name
FROM content_planner cp
JOIN creators c ON cp.creator_id = c.id
ORDER BY cp.scheduled_date ASC;
```

Expected: 6 rows showing planned content across YouTube and Instagram with various statuses.

### 5.4 - Full Relationship Integrity Check

```sql
SELECT
    c.name,
    COUNT(DISTINCT sv.id) AS total_videos_scraped,
    COUNT(DISTINCT cp.id) AS total_planned_posts
FROM creators c
LEFT JOIN scraped_videos sv ON sv.creator_id = c.id
LEFT JOIN content_planner cp ON cp.creator_id = c.id
GROUP BY c.name;
```

Expected: Summary showing each creator with their associated video and planner counts.

---

## Troubleshooting

| Issue | Solution |
|-------|----------|
| "permission denied for database" | Ensure your user has `CREATE` privileges or use the `postgres` superuser |
| "type already exists" error | Run `DROP TYPE IF EXISTS platform_type CASCADE; DROP TYPE IF EXISTS content_status CASCADE;` before re-running the schema |
| Tables not appearing in Browser | Click the refresh icon on the Tables node or press F5 in the Browser panel |
| Connection refused | Verify PostgreSQL service is running: `sudo systemctl status postgresql` |

---

## Next Steps

- Explore the data using PgAdmin's built-in charting (right-click query results > Chart)
- Set up pgAgent for scheduled data imports
- Connect the dashboard prototype (`index.html`) to a live API backed by this database
