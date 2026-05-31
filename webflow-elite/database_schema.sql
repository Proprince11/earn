-- ============================================================================
-- WEBFLOW ELITE SUITE - PostgreSQL Database Schema
-- ============================================================================
-- Purpose: Complete database schema for the Webflow Elite Suite platform,
--          managing premium template sales, store project commissions,
--          milestone-based invoicing, and user accounts.
--
-- Usage:   Paste this entire script into PgAdmin Query Tool and execute.
--          The script is idempotent - safe to re-run (drops existing objects).
--
-- Database: webflow_elite_db
-- Version:  1.0.0
-- ============================================================================

-- ============================================================================
-- SECTION 1: CLEANUP (Idempotent - Drop existing objects)
-- ============================================================================

DROP TABLE IF EXISTS milestone_invoices CASCADE;
DROP TABLE IF EXISTS purchases CASCADE;
DROP TABLE IF EXISTS store_projects CASCADE;
DROP TABLE IF EXISTS webflow_templates CASCADE;
DROP TABLE IF EXISTS accounts CASCADE;

DROP TYPE IF EXISTS project_status CASCADE;
DROP TYPE IF EXISTS transaction_status CASCADE;
DROP TYPE IF EXISTS template_category CASCADE;
DROP TYPE IF EXISTS user_role CASCADE;

-- ============================================================================
-- SECTION 2: CUSTOM ENUM TYPES
-- ============================================================================

CREATE TYPE user_role AS ENUM (
    'Admin',
    'Buyer',
    'Agency_Partner'
);

CREATE TYPE template_category AS ENUM (
    'Architecture',
    'Biotech',
    'Finance',
    'Fashion',
    'Defense',
    'Maritime',
    'Cybersecurity',
    'Hospitality',
    'DeepTech',
    'Banking',
    'Art',
    'Pharmaceutical',
    'Urban',
    'Automotive',
    'RealEstate'
);

CREATE TYPE transaction_status AS ENUM (
    'Pending',
    'Milestone_1_Paid',
    'Milestone_2_Paid',
    'Milestone_3_Paid',
    'Completed',
    'Refunded',
    'Disputed'
);

CREATE TYPE project_status AS ENUM (
    'Available',
    'Reserved',
    'In_Progress',
    'Delivered',
    'Archived'
);

-- ============================================================================
-- SECTION 3: TABLE DEFINITIONS
-- ============================================================================

-- --------------------------------------------------------------------------
-- Table: accounts
-- --------------------------------------------------------------------------
CREATE TABLE accounts (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email           VARCHAR(255) UNIQUE NOT NULL,
    full_name       VARCHAR(255) NOT NULL,
    role            user_role NOT NULL DEFAULT 'Buyer',
    company         VARCHAR(255),
    created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    last_login      TIMESTAMPTZ,
    is_active       BOOLEAN NOT NULL DEFAULT TRUE
);

-- --------------------------------------------------------------------------
-- Table: webflow_templates
-- --------------------------------------------------------------------------
CREATE TABLE webflow_templates (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    production_name VARCHAR(100) UNIQUE NOT NULL,
    category        template_category NOT NULL,
    description     TEXT,
    base_price_cents INTEGER NOT NULL CHECK (base_price_cents > 0),
    download_count  INTEGER NOT NULL DEFAULT 0,
    current_version VARCHAR(20) NOT NULL DEFAULT '1.0.0',
    is_published    BOOLEAN NOT NULL DEFAULT FALSE,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at      TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- --------------------------------------------------------------------------
-- Table: store_projects
-- --------------------------------------------------------------------------
CREATE TABLE store_projects (
    id                  UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    store_name          VARCHAR(100) NOT NULL,
    project_title       VARCHAR(255) NOT NULL,
    description         TEXT,
    base_quote_cents    INTEGER NOT NULL CHECK (base_quote_cents > 0),
    project_status      project_status NOT NULL DEFAULT 'Available',
    assigned_account_id UUID REFERENCES accounts(id) ON DELETE SET NULL,
    created_at          TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- --------------------------------------------------------------------------
-- Table: purchases
-- --------------------------------------------------------------------------
CREATE TABLE purchases (
    id                  UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    account_id          UUID NOT NULL REFERENCES accounts(id) ON DELETE CASCADE,
    template_id         UUID REFERENCES webflow_templates(id) ON DELETE SET NULL,
    project_id          UUID REFERENCES store_projects(id) ON DELETE SET NULL,
    total_amount_cents  INTEGER NOT NULL CHECK (total_amount_cents > 0),
    transaction_status  transaction_status NOT NULL DEFAULT 'Pending',
    purchased_at        TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    completed_at        TIMESTAMPTZ,
    CONSTRAINT chk_purchase_item CHECK (template_id IS NOT NULL OR project_id IS NOT NULL)
);

-- --------------------------------------------------------------------------
-- Table: milestone_invoices
-- --------------------------------------------------------------------------
CREATE TABLE milestone_invoices (
    id                UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    purchase_id       UUID NOT NULL REFERENCES purchases(id) ON DELETE CASCADE,
    milestone_number  INTEGER NOT NULL CHECK (milestone_number >= 1 AND milestone_number <= 10),
    amount_cents      INTEGER NOT NULL CHECK (amount_cents > 0),
    description       VARCHAR(500) NOT NULL,
    due_date          DATE NOT NULL,
    paid_at           TIMESTAMPTZ,
    status            transaction_status NOT NULL DEFAULT 'Pending',
    CONSTRAINT uq_purchase_milestone UNIQUE (purchase_id, milestone_number)
);

-- ============================================================================
-- SECTION 4: INDEXES
-- ============================================================================

CREATE INDEX idx_accounts_email ON accounts(email);
CREATE INDEX idx_accounts_role ON accounts(role);

CREATE INDEX idx_templates_category ON webflow_templates(category);
CREATE INDEX idx_templates_is_published ON webflow_templates(is_published);

CREATE INDEX idx_store_projects_status ON store_projects(project_status);
CREATE INDEX idx_store_projects_assigned ON store_projects(assigned_account_id);

CREATE INDEX idx_purchases_account ON purchases(account_id);
CREATE INDEX idx_purchases_status ON purchases(transaction_status);
CREATE INDEX idx_purchases_date ON purchases(purchased_at);

CREATE INDEX idx_milestones_purchase ON milestone_invoices(purchase_id);
CREATE INDEX idx_milestones_due_date ON milestone_invoices(due_date);
CREATE INDEX idx_milestones_status ON milestone_invoices(status);

-- ============================================================================
-- SECTION 5: SEED DATA
-- ============================================================================

-- --------------------------------------------------------------------------
-- 5.1 Accounts (5 users: 1 Admin, 2 Buyers, 2 Agency Partners)
-- --------------------------------------------------------------------------
INSERT INTO accounts (id, email, full_name, role, company, created_at, last_login, is_active) VALUES
    ('a1000000-0000-0000-0000-000000000001', 'dominic.marshall@webflowelite.io', 'Dominic Marshall', 'Admin', 'Webflow Elite HQ', '2024-01-15 09:00:00+00', '2024-12-01 14:30:00+00', TRUE),
    ('a1000000-0000-0000-0000-000000000002', 'claire.nguyen@archinova.com', 'Claire Nguyen', 'Buyer', 'ArchiNova Design Studio', '2024-03-22 11:15:00+00', '2024-11-28 10:45:00+00', TRUE),
    ('a1000000-0000-0000-0000-000000000003', 'marcus.blackwell@vanguardcap.com', 'Marcus Blackwell', 'Buyer', 'Vanguard Capital Partners', '2024-04-10 08:30:00+00', '2024-11-30 16:20:00+00', TRUE),
    ('a1000000-0000-0000-0000-000000000004', 'sofia.ramirez@pixelcraft.agency', 'Sofia Ramirez', 'Agency_Partner', 'PixelCraft Digital Agency', '2024-02-05 13:00:00+00', '2024-12-01 09:10:00+00', TRUE),
    ('a1000000-0000-0000-0000-000000000005', 'jonathan.ashford@titanforge.co', 'Jonathan Ashford', 'Agency_Partner', 'TitanForge Consulting', '2024-05-18 10:45:00+00', '2024-11-25 11:55:00+00', TRUE);

-- --------------------------------------------------------------------------
-- 5.2 Webflow Templates (15 templates matching Deliverable 1)
-- --------------------------------------------------------------------------
INSERT INTO webflow_templates (id, production_name, category, description, base_price_cents, download_count, current_version, is_published, created_at, updated_at) VALUES
    ('t1000000-0000-0000-0000-000000000001', 'OBSIDIAN', 'Architecture', 'A monolithic architectural portfolio template with brutalist grid layouts, parallax depth mapping, and high-contrast monochrome palettes designed for elite architecture firms showcasing large-scale structural projects.', 1200000, 47, '2.1.0', TRUE, '2024-01-20 10:00:00+00', '2024-10-15 08:30:00+00'),
    ('t1000000-0000-0000-0000-000000000002', 'HELIX', 'Biotech', 'A precision-engineered biotech template featuring DNA helix motion graphics, molecular data visualization panels, and clinical-grade typography for pharmaceutical research labs and genomics startups.', 950000, 31, '1.4.0', TRUE, '2024-02-14 12:00:00+00', '2024-09-20 14:15:00+00'),
    ('t1000000-0000-0000-0000-000000000003', 'VERTEX', 'Finance', 'An institutional-grade financial services template with real-time data ticker integration, interactive portfolio allocation charts, and secure client portal wireframes built for hedge funds and wealth management firms.', 1400000, 63, '3.0.1', TRUE, '2024-01-05 09:30:00+00', '2024-11-01 11:45:00+00'),
    ('t1000000-0000-0000-0000-000000000004', 'NOIR', 'Fashion', 'An editorial fashion template with full-bleed cinematic imagery, lookbook carousel systems, and typographic hierarchy designed for luxury fashion houses and haute couture brands.', 800000, 89, '2.0.0', TRUE, '2024-03-01 14:00:00+00', '2024-10-28 09:00:00+00'),
    ('t1000000-0000-0000-0000-000000000005', 'TITANIUM', 'Defense', 'A classified-aesthetic defense contractor template with encrypted-feel navigation, technical specification grids, and security clearance hierarchy layouts for aerospace and military technology firms.', 1500000, 12, '1.2.0', TRUE, '2024-04-10 08:00:00+00', '2024-11-10 16:30:00+00'),
    ('t1000000-0000-0000-0000-000000000006', 'MERIDIAN', 'Maritime', 'A maritime logistics template featuring nautical chart integrations, vessel fleet tracking dashboards, and tidal data visualization for shipping conglomerates and port authorities.', 1100000, 18, '1.3.0', TRUE, '2024-02-28 11:00:00+00', '2024-08-15 13:20:00+00'),
    ('t1000000-0000-0000-0000-000000000007', 'CIPHER', 'Cybersecurity', 'A zero-trust cybersecurity template with terminal-style interfaces, threat matrix dashboards, encryption key visualizations, and SOC monitoring layouts for enterprise security firms.', 1300000, 42, '2.2.0', TRUE, '2024-01-30 15:30:00+00', '2024-11-20 10:00:00+00'),
    ('t1000000-0000-0000-0000-000000000008', 'AURORA', 'Hospitality', 'A luxury hospitality template with immersive virtual tour integration, ambient lighting transitions, concierge booking flows, and guest experience timelines for five-star hotel groups.', 750000, 56, '1.5.0', TRUE, '2024-03-15 09:45:00+00', '2024-10-01 07:30:00+00'),
    ('t1000000-0000-0000-0000-000000000009', 'QUANTUM', 'DeepTech', 'A quantum computing and deep technology template with particle simulation backgrounds, research paper showcase grids, and computational complexity visualizations for advanced R&D laboratories.', 1350000, 8, '1.1.0', TRUE, '2024-05-01 10:00:00+00', '2024-11-05 12:00:00+00'),
    ('t1000000-0000-0000-0000-000000000010', 'SOVEREIGN', 'Banking', 'A sovereign banking template with vault-inspired navigation, multi-currency portfolio dashboards, regulatory compliance timelines, and private wealth management interfaces for central banks and private institutions.', 1450000, 27, '2.0.1', TRUE, '2024-02-10 08:15:00+00', '2024-10-22 15:45:00+00'),
    ('t1000000-0000-0000-0000-000000000011', 'PRISM', 'Art', 'A contemporary art gallery template with chromatic shift animations, exhibition curation layouts, artist biography storytelling flows, and auction integration wireframes for modern art institutions.', 650000, 73, '1.6.0', TRUE, '2024-04-05 13:30:00+00', '2024-09-18 11:00:00+00'),
    ('t1000000-0000-0000-0000-000000000012', 'CATALYST', 'Pharmaceutical', 'A pharmaceutical research template with clinical trial pipeline dashboards, molecular compound libraries, FDA approval tracking timelines, and peer-reviewed publication showcases for biopharma corporations.', 1250000, 22, '1.3.1', TRUE, '2024-03-20 10:30:00+00', '2024-11-12 09:15:00+00'),
    ('t1000000-0000-0000-0000-000000000013', 'NEXUS', 'Urban', 'An urban development template with interactive city planning maps, infrastructure timeline visualizations, sustainability metric dashboards, and stakeholder engagement portals for metropolitan planning authorities.', 1050000, 35, '2.0.0', TRUE, '2024-01-25 11:45:00+00', '2024-10-30 14:00:00+00'),
    ('t1000000-0000-0000-0000-000000000014', 'ECLIPSE', 'Automotive', 'A performance automotive template with vehicle configurator interfaces, aerodynamic data visualizations, track telemetry dashboards, and showroom virtual walkthrough integration for luxury automotive manufacturers.', 1150000, 41, '1.4.2', TRUE, '2024-02-18 14:15:00+00', '2024-11-08 08:45:00+00'),
    ('t1000000-0000-0000-0000-000000000015', 'PANTHEON', 'RealEstate', 'A luxury real estate template with property portfolio showcases, virtual staging integration, mortgage calculator tools, neighborhood analytics maps, and agent CRM dashboard wireframes for premium brokerages.', 1000000, 58, '2.1.1', TRUE, '2024-03-08 09:00:00+00', '2024-11-15 13:30:00+00');

-- --------------------------------------------------------------------------
-- 5.3 Store Projects (10 projects matching Deliverable 3)
-- --------------------------------------------------------------------------
INSERT INTO store_projects (id, store_name, project_title, description, base_quote_cents, project_status, assigned_account_id, created_at) VALUES
    ('sp100000-0000-0000-0000-000000000001', 'APEX RETAINERS', 'Enterprise Client Retention Portal', 'Full-stack client retention management system with automated engagement scoring, churn prediction dashboards, and personalized re-engagement campaign builders for enterprise SaaS platforms.', 4500000, 'In_Progress', 'a1000000-0000-0000-0000-000000000004', '2024-06-01 10:00:00+00'),
    ('sp100000-0000-0000-0000-000000000002', 'BLUEPRINT VAULT', 'Architecture Document Management System', 'Secure cloud-based architecture blueprint storage and collaboration platform with version control, annotation tools, and regulatory compliance tracking for construction firms.', 3800000, 'Reserved', 'a1000000-0000-0000-0000-000000000002', '2024-07-15 09:30:00+00'),
    ('sp100000-0000-0000-0000-000000000003', 'PIPELINE FORGE', 'Sales Pipeline Automation Engine', 'AI-driven sales pipeline management tool with lead scoring algorithms, automated follow-up sequences, conversion funnel analytics, and CRM integration middleware.', 5200000, 'Available', NULL, '2024-08-01 11:00:00+00'),
    ('sp100000-0000-0000-0000-000000000004', 'STUDIO COMMAND', 'Creative Agency Project Command Center', 'Centralized project management hub for creative agencies featuring resource allocation boards, client approval workflows, time tracking, and deliverable milestone automation.', 4100000, 'In_Progress', 'a1000000-0000-0000-0000-000000000005', '2024-06-20 14:00:00+00'),
    ('sp100000-0000-0000-0000-000000000005', 'EQUITY ENGINE', 'Investment Portfolio Analytics Platform', 'Institutional-grade portfolio analytics engine with real-time market data feeds, risk assessment modeling, asset allocation optimization, and regulatory reporting automation.', 7500000, 'Available', NULL, '2024-09-01 08:00:00+00'),
    ('sp100000-0000-0000-0000-000000000006', 'DATA CITADEL', 'Enterprise Data Governance Platform', 'Comprehensive data governance solution with data lineage tracking, quality scoring engines, access control matrices, and GDPR/CCPA compliance audit trail dashboards.', 6200000, 'Reserved', 'a1000000-0000-0000-0000-000000000003', '2024-07-01 10:30:00+00'),
    ('sp100000-0000-0000-0000-000000000007', 'GROWTH MATRIX', 'SaaS Growth Analytics Dashboard', 'Multi-dimensional growth analytics platform tracking MRR, CAC, LTV, churn cohorts, expansion revenue, and product-led growth metrics with predictive forecasting models.', 3500000, 'Delivered', 'a1000000-0000-0000-0000-000000000004', '2024-05-10 09:15:00+00'),
    ('sp100000-0000-0000-0000-000000000008', 'LEGAL FORTRESS', 'Legal Practice Management Suite', 'End-to-end legal practice management system with case tracking, document assembly automation, billing integration, court deadline calendaring, and conflict-of-interest checking.', 5800000, 'In_Progress', 'a1000000-0000-0000-0000-000000000005', '2024-08-15 13:45:00+00'),
    ('sp100000-0000-0000-0000-000000000009', 'CLIMATE CAPITAL', 'ESG Investment Tracking Platform', 'Environmental, Social, and Governance investment tracking platform with carbon offset calculators, sustainability scoring frameworks, and green bond portfolio management tools.', 4800000, 'Available', NULL, '2024-09-20 11:30:00+00'),
    ('sp100000-0000-0000-0000-000000000010', 'NEUROTECH LAB', 'Neuroscience Research Data Platform', 'Specialized research data management platform for neuroscience labs featuring EEG/fMRI data visualization, experimental protocol tracking, and peer collaboration workspaces.', 5500000, 'Reserved', 'a1000000-0000-0000-0000-000000000002', '2024-10-01 10:00:00+00');

-- --------------------------------------------------------------------------
-- 5.4 Purchases (12 purchases with varied statuses)
-- --------------------------------------------------------------------------
INSERT INTO purchases (id, account_id, template_id, project_id, total_amount_cents, transaction_status, purchased_at, completed_at) VALUES
    ('p1000000-0000-0000-0000-000000000001', 'a1000000-0000-0000-0000-000000000002', 't1000000-0000-0000-0000-000000000001', NULL, 1200000, 'Completed', '2024-04-15 10:30:00+00', '2024-04-15 10:31:00+00'),
    ('p1000000-0000-0000-0000-000000000002', 'a1000000-0000-0000-0000-000000000003', 't1000000-0000-0000-0000-000000000003', NULL, 1400000, 'Completed', '2024-05-02 14:00:00+00', '2024-05-02 14:01:00+00'),
    ('p1000000-0000-0000-0000-000000000003', 'a1000000-0000-0000-0000-000000000002', 't1000000-0000-0000-0000-000000000015', NULL, 1000000, 'Completed', '2024-06-10 09:15:00+00', '2024-06-10 09:16:00+00'),
    ('p1000000-0000-0000-0000-000000000004', 'a1000000-0000-0000-0000-000000000004', NULL, 'sp100000-0000-0000-0000-000000000001', 4500000, 'Milestone_2_Paid', '2024-06-05 11:00:00+00', NULL),
    ('p1000000-0000-0000-0000-000000000005', 'a1000000-0000-0000-0000-000000000005', NULL, 'sp100000-0000-0000-0000-000000000004', 4100000, 'Milestone_1_Paid', '2024-06-25 15:30:00+00', NULL),
    ('p1000000-0000-0000-0000-000000000006', 'a1000000-0000-0000-0000-000000000003', 't1000000-0000-0000-0000-000000000010', NULL, 1450000, 'Pending', '2024-11-28 16:45:00+00', NULL),
    ('p1000000-0000-0000-0000-000000000007', 'a1000000-0000-0000-0000-000000000002', 't1000000-0000-0000-0000-000000000007', NULL, 1300000, 'Completed', '2024-07-20 08:00:00+00', '2024-07-20 08:01:00+00'),
    ('p1000000-0000-0000-0000-000000000008', 'a1000000-0000-0000-0000-000000000004', NULL, 'sp100000-0000-0000-0000-000000000007', 3500000, 'Completed', '2024-05-15 09:30:00+00', '2024-09-30 17:00:00+00'),
    ('p1000000-0000-0000-0000-000000000009', 'a1000000-0000-0000-0000-000000000005', NULL, 'sp100000-0000-0000-0000-000000000008', 5800000, 'Milestone_3_Paid', '2024-08-20 14:00:00+00', NULL),
    ('p1000000-0000-0000-0000-000000000010', 'a1000000-0000-0000-0000-000000000003', 't1000000-0000-0000-0000-000000000004', NULL, 800000, 'Refunded', '2024-08-05 11:30:00+00', NULL),
    ('p1000000-0000-0000-0000-000000000011', 'a1000000-0000-0000-0000-000000000002', 't1000000-0000-0000-0000-000000000011', NULL, 650000, 'Disputed', '2024-09-12 10:00:00+00', NULL),
    ('p1000000-0000-0000-0000-000000000012', 'a1000000-0000-0000-0000-000000000003', NULL, 'sp100000-0000-0000-0000-000000000006', 6200000, 'Milestone_1_Paid', '2024-07-05 13:00:00+00', NULL);

-- --------------------------------------------------------------------------
-- 5.5 Milestone Invoices (15 invoices spread across purchases)
-- --------------------------------------------------------------------------
INSERT INTO milestone_invoices (id, purchase_id, milestone_number, amount_cents, description, due_date, paid_at, status) VALUES
    ('mi100000-0000-0000-0000-000000000001', 'p1000000-0000-0000-0000-000000000004', 1, 1350000, 'Discovery phase: Requirements gathering, stakeholder interviews, and system architecture documentation', '2024-07-01', '2024-07-01 10:00:00+00', 'Milestone_1_Paid'),
    ('mi100000-0000-0000-0000-000000000002', 'p1000000-0000-0000-0000-000000000004', 2, 1575000, 'Development phase: Core retention engine build, API integrations, and engagement scoring module', '2024-08-15', '2024-08-14 16:30:00+00', 'Milestone_2_Paid'),
    ('mi100000-0000-0000-0000-000000000003', 'p1000000-0000-0000-0000-000000000004', 3, 1575000, 'Final delivery: QA testing, deployment, client training, and 30-day support handoff', '2024-10-01', NULL, 'Pending'),
    ('mi100000-0000-0000-0000-000000000004', 'p1000000-0000-0000-0000-000000000005', 1, 1230000, 'Project kickoff: Creative brief alignment, wireframe prototyping, and design system setup', '2024-07-20', '2024-07-18 09:00:00+00', 'Milestone_1_Paid'),
    ('mi100000-0000-0000-0000-000000000005', 'p1000000-0000-0000-0000-000000000005', 2, 1435000, 'Build phase: Frontend development, backend integration, and client approval workflow engine', '2024-09-01', NULL, 'Pending'),
    ('mi100000-0000-0000-0000-000000000006', 'p1000000-0000-0000-0000-000000000005', 3, 1435000, 'Launch phase: UAT testing, production deployment, and post-launch optimization sprint', '2024-10-15', NULL, 'Pending'),
    ('mi100000-0000-0000-0000-000000000007', 'p1000000-0000-0000-0000-000000000008', 1, 1050000, 'Analytics foundation: Data pipeline architecture, metric definitions, and warehouse schema design', '2024-06-15', '2024-06-14 11:00:00+00', 'Milestone_1_Paid'),
    ('mi100000-0000-0000-0000-000000000008', 'p1000000-0000-0000-0000-000000000008', 2, 1225000, 'Dashboard build: Interactive visualization components, cohort analysis modules, and forecasting engine', '2024-08-01', '2024-07-30 14:00:00+00', 'Milestone_2_Paid'),
    ('mi100000-0000-0000-0000-000000000009', 'p1000000-0000-0000-0000-000000000008', 3, 1225000, 'Platform delivery: Performance optimization, user acceptance testing, and documentation package', '2024-09-30', '2024-09-28 17:00:00+00', 'Completed'),
    ('mi100000-0000-0000-0000-000000000010', 'p1000000-0000-0000-0000-000000000009', 1, 1740000, 'Legal framework: Case management schema design, document template engine, and billing module architecture', '2024-09-15', '2024-09-14 10:30:00+00', 'Milestone_1_Paid'),
    ('mi100000-0000-0000-0000-000000000011', 'p1000000-0000-0000-0000-000000000009', 2, 1740000, 'Core platform: Court deadline automation, conflict checker, and client portal development', '2024-10-30', '2024-10-28 15:00:00+00', 'Milestone_2_Paid'),
    ('mi100000-0000-0000-0000-000000000012', 'p1000000-0000-0000-0000-000000000009', 3, 2320000, 'Integration and launch: Third-party integrations, security audit, load testing, and go-live deployment', '2024-12-15', '2024-12-10 09:00:00+00', 'Milestone_3_Paid'),
    ('mi100000-0000-0000-0000-000000000013', 'p1000000-0000-0000-0000-000000000012', 1, 1860000, 'Governance foundation: Data catalog setup, lineage mapping engine, and access policy framework', '2024-08-01', '2024-07-30 11:00:00+00', 'Milestone_1_Paid'),
    ('mi100000-0000-0000-0000-000000000014', 'p1000000-0000-0000-0000-000000000012', 2, 2170000, 'Compliance engine: GDPR/CCPA workflow automation, audit trail system, and quality scoring algorithms', '2024-09-30', NULL, 'Pending'),
    ('mi100000-0000-0000-0000-000000000015', 'p1000000-0000-0000-0000-000000000012', 3, 2170000, 'Platform delivery: Dashboard UI build, stakeholder reporting module, and enterprise SSO integration', '2024-11-30', NULL, 'Pending');

-- ============================================================================
-- END OF SCHEMA
-- ============================================================================
