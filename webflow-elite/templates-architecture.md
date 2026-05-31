# 15 Elite Webflow Template Concept Architectures

> A comprehensive architectural reference for 15 premium Webflow templates, each targeting a distinct luxury/enterprise vertical. Every template includes complete visual systems, page architectures, CMS configurations, and interaction specifications using Finsweet Client-First methodology.

---

## 1. OBSIDIAN - Luxury Architecture & Interior Design

### 1. Production Name & Premium Industry Niche

**Template Name:** OBSIDIAN  
**Target Industry:** Luxury Architecture & Interior Design Studios  
**Ideal Client:** High-end residential architects, boutique interior design firms, luxury property developers showcasing bespoke spaces and award-winning projects.

### 2. Visual Aesthetic & Typographic Pairing

**Color Palette:**

| Role | Color Name | Hex Code |
|------|-----------|----------|
| Primary | Obsidian Black | `#0D0D0D` |
| Secondary | Warm Ivory | `#F5F0E8` |
| Accent | Burnished Gold | `#C9A96E` |
| Background Dark | Charcoal Slate | `#1A1A1A` |
| Background Light | Alabaster | `#FAFAF7` |
| Text | Silver Mist | `#B8B8B8` |

**Dark/Light Mode Balance:** 75% dark-dominant. Hero sections use full-bleed dark backgrounds with ivory typography. Portfolio grids alternate between dark and light sections to create visual breathing room. Light mode reserved for project detail pages to let photography dominate.

**Premium Font Combinations:**
- Headlines: Cormorant Garamond 600 (serif, architectural elegance)
- Subheadlines: Josefin Sans 300 (geometric, modern)
- Body: Inter 400 (clean readability)
- Accent/Labels: Josefin Sans 500 uppercase tracking +2px

### 3. Exact Page Architecture

**Page 1: Home**
- Header: Transparent overlay with logo left, hamburger menu right (`.navbar_transparent`)
- Hero: Full-viewport video background with centered headline overlay, scroll-indicator animation (`.section_hero-home`)
- Featured Projects: 3-column asymmetric grid with hover-reveal project titles (`.grid_projects-featured`)
- Philosophy Statement: Single-column centered text block with parallax background image (`.section_philosophy`)
- Awards Ticker: Horizontal auto-scrolling logo bar (`.marquee_awards`)
- Footer: Minimal dark footer with newsletter signup and social links (`.footer_main`)

**Page 2: Projects (CMS Collection)**
- Header: Sticky dark minimal navbar (`.navbar_sticky-dark`)
- Filter Bar: Category filters (Residential, Commercial, Hospitality, Civic) using CMS categories (`.filter_projects`)
- Project Grid: Masonry layout with CMS-driven project cards showing featured image, title, location, year (`.grid_projects-masonry`)
- CMS Collection: `Projects` collection with fields: Name (text), Slug (auto), Featured Image (image), Category (option), Year (number), Location (text), Description (rich text), Gallery (multi-image), Client Name (text), Square Footage (number)
- Load More: Pagination with animated load-more button (`.button_load-more`)

**Page 3: Project Detail (CMS Template)**
- Header: Transparent with back-to-projects link
- Hero: Full-bleed project hero image with title overlay (`.section_hero-project`)
- Project Meta: Grid showing Year, Location, Client, Category, Area (`.grid_project-meta`)
- Gallery: Lightbox-enabled image gallery in 2-column staggered layout (`.gallery_project`)
- Description: Rich text content block with drop-cap first letter (`.richtext_project`)
- Related Projects: 3-card horizontal scroll (`.slider_related-projects`)

**Page 4: Studio / About**
- Header: Sticky dark
- Hero: Split layout - left text, right full-height team photo (`.section_hero-split`)
- Timeline: Vertical timeline showing firm history milestones (`.timeline_studio`)
- Team Grid: CMS-driven team members with photo, name, role (`.grid_team`)
- CMS Collection: `Team Members` with fields: Name, Role, Photo, Bio (rich text), LinkedIn URL
- Clients: Logo grid of past clients (`.grid_clients`)

**Page 5: Services**
- Header: Sticky dark
- Services List: Accordion-style expandable service descriptions (`.accordion_services`)
- Process: 4-step horizontal process diagram with icons (`.process_steps`)
- Pricing Tiers: 3-column comparison cards (`.grid_pricing`)
- CTA Section: Full-width dark section with gold CTA button (`.section_cta`)

**Page 6: Journal / Blog (CMS Collection)**
- Header: Sticky dark
- Featured Post: Large hero card for latest post (`.card_post-featured`)
- Post Grid: 2-column grid with thumbnail, title, date, excerpt (`.grid_posts`)
- CMS Collection: `Journal Posts` with fields: Title, Slug, Featured Image, Author (reference to Team), Category, Publish Date, Body (rich text), Excerpt (text)
- Sidebar: Categories list, newsletter signup (`.sidebar_journal`)

**Page 7: Contact**
- Header: Transparent
- Split Layout: Left side with contact info and map embed, right side with form (`.section_contact-split`)
- Form Fields: Name, Email, Phone, Project Type (dropdown), Budget Range (dropdown), Message (textarea)
- Office Locations: Card list for multiple offices (`.list_offices`)

**Page 8: Awards & Press**
- Header: Sticky dark
- Awards Grid: Year-sorted list of architectural awards with logos (`.grid_awards`)
- Press Mentions: CMS collection list with publication logo, headline, date, external link (`.list_press`)
- CMS Collection: `Press` with fields: Publication Name, Logo, Headline, Date, External URL

### 4. Custom Micro-Interactions & Scroll Mechanics

**Scroll Behaviors:**
- Hero parallax: Background image moves at 0.3x scroll speed using Webflow native parallax on `.section_hero-home` background
- Section reveal: Each `.section_*` fades up with 60px Y-offset using scroll-into-view trigger, easing `cubic-bezier(0.25, 0.46, 0.45, 0.94)`, duration 800ms
- Project cards stagger: Cards in `.grid_projects-masonry` animate in with 100ms stagger delay per item on scroll trigger
- Sticky project meta: On project detail, `.grid_project-meta` uses sticky positioning at top: 100px as user scrolls through gallery

**Hover Behaviors:**
- Project card hover: Image scales to 1.05 with 400ms ease, gold border-bottom reveals from left (width 0 to 100%), title shifts up 4px
- Navigation link hover: Underline expands from center using pseudo-element width transition
- Button hover: Background shifts from transparent to `#C9A96E` with color inversion, magnetic cursor pull (GSAP magnetic effect on `.button_primary`)

**Click Behaviors:**
- Hamburger menu: Full-screen overlay slides from right with staggered link reveals (100ms delay per link), background blur filter applies to page content
- Project card click: Page transition using opacity fade-out (300ms) before navigation
- Gallery image click: Lightbox opens with scale-from-thumbnail animation using GSAP Flip plugin

**Technical Implementation:**
- Webflow Interactions 2.0: All scroll-triggered animations use "While scrolling in view" and "Scroll into view" triggers
- GSAP ScrollTrigger: Used for parallax depth layers in hero and smooth-scroll momentum
- Client-First Classes: All interaction targets use `.is-active`, `.is-visible`, `.is-scrolled` state classes
- Lottie: Loading animation on page enter uses custom architectural line-draw Lottie file

---

## 2. HELIX - AI Biotech & Genomics Research

### 1. Production Name & Premium Industry Niche

**Template Name:** HELIX  
**Target Industry:** AI-Driven Biotechnology & Genomics Research  
**Ideal Client:** Biotech startups, genomics research labs, precision medicine companies, CRISPR technology firms, and computational biology platforms.

### 2. Visual Aesthetic & Typographic Pairing

**Color Palette:**

| Role | Color Name | Hex Code |
|------|-----------|----------|
| Primary | Neural Blue | `#0A2463` |
| Secondary | Genome Cyan | `#00E5CC` |
| Accent | Helix Violet | `#7B2FBE` |
| Background Dark | Deep Lab | `#050A1A` |
| Background Light | Clinical White | `#F8FBFF` |
| Text | Soft Platinum | `#E0E6EF` |

**Dark/Light Mode Balance:** 80% dark-dominant with deep navy and near-black backgrounds. Data visualization sections use dark canvases for high-contrast neon data points. Research publication pages switch to clinical white for readability. Accent gradients (cyan-to-violet) used sparingly on CTAs and section dividers.

**Premium Font Combinations:**
- Headlines: Space Grotesk 700 (geometric, technical authority)
- Subheadlines: IBM Plex Sans 500 (scientific precision)
- Body: IBM Plex Sans 400 (optimized reading)
- Code/Data: IBM Plex Mono 400 (monospaced for data sequences)
- Accent/Labels: Space Grotesk 500 uppercase tracking +1.5px

### 3. Exact Page Architecture

**Page 1: Home**
- Header: Transparent with logo mark (DNA helix icon) left, nav center, "Partner With Us" CTA right (`.navbar_transparent`)
- Hero: Animated DNA helix 3D background (Three.js or Spline embed), headline with gradient text, sub-headline, dual CTAs (`.section_hero-home`)
- Metrics Bar: Horizontal stats showing papers published, patents filed, genomes sequenced (`.bar_metrics`)
- Research Pillars: 3-card grid with icon, title, description for core research areas (`.grid_pillars`)
- Pipeline: Horizontal scrolling pipeline visualization showing discovery-to-market stages (`.section_pipeline`)
- Publications: Latest 3 research papers from CMS (`.list_publications-recent`)
- Partners: Logo marquee of research partners and institutions (`.marquee_partners`)
- Footer: Dark with sitemap, compliance badges, newsletter (`.footer_main`)

**Page 2: Research Areas (CMS Collection)**
- Header: Sticky dark with active section indicator
- Area Grid: Large cards with abstract imagery, research area title, brief description (`.grid_research-areas`)
- CMS Collection: `Research Areas` with fields: Title, Slug, Icon (image), Hero Image, Description (rich text), Key Findings (rich text), Related Publications (multi-reference), Team Lead (reference)
- Each card links to detailed CMS template page

**Page 3: Research Area Detail (CMS Template)**
- Header: Sticky dark
- Hero: Abstract molecular visualization background with area title overlay (`.section_hero-research`)
- Overview: Two-column layout with description left, key metrics right (`.layout_research-overview`)
- Findings: Rich text content with embedded diagrams and charts (`.richtext_findings`)
- Team: Horizontal scroll of researchers working in this area (`.slider_team-area`)
- Publications: Filtered list of papers related to this area (`.list_publications-filtered`)

**Page 4: Platform / Technology**
- Header: Sticky dark
- Hero: Split with animated data visualization left, text right (`.section_hero-split`)
- Tech Stack: Vertical sections for each technology layer (AI/ML, Genomics, Data Infrastructure) (`.section_tech-stack`)
- Architecture Diagram: SVG-based interactive system diagram (`.diagram_architecture`)
- Integration Partners: Grid of technology partners with logos (`.grid_integrations`)
- API Documentation CTA: Card linking to developer docs (`.card_api-cta`)

**Page 5: Pipeline / Products**
- Header: Sticky dark
- Pipeline Table: Filterable table showing drug/product pipeline stages (`.table_pipeline`)
- Product Cards: CMS-driven product/therapy cards with stage indicator, target, mechanism (`.grid_products`)
- CMS Collection: `Pipeline Products` with fields: Name, Target Condition, Mechanism, Stage (option: Discovery/Preclinical/Phase1/Phase2/Phase3/Market), Description, Lead Image
- Timeline: Visual progress bar per product showing development stage (`.progress_pipeline`)

**Page 6: Team / Leadership**
- Header: Sticky dark
- Leadership Grid: Photo, name, title, credentials, LinkedIn (`.grid_leadership`)
- Advisory Board: Separate section for scientific advisors (`.grid_advisors`)
- CMS Collection: `Team` with fields: Name, Role, Department, Photo, Bio (rich text), Credentials (text), LinkedIn URL, Advisory (boolean)
- Careers CTA: Banner linking to open positions (`.banner_careers`)

**Page 7: Publications & Patents**
- Header: Sticky dark
- Filter Bar: Filter by year, research area, publication type (`.filter_publications`)
- Publication List: CMS collection list with title, authors, journal, date, DOI link (`.list_publications`)
- CMS Collection: `Publications` with fields: Title, Authors (text), Journal (text), Date, DOI URL, Abstract (text), Research Area (reference), Type (option: Paper/Patent/Preprint)
- Patent highlights: Featured patent cards (`.grid_patents-featured`)

**Page 8: News & Insights**
- Header: Sticky dark
- Featured Article: Large hero card (`.card_article-featured`)
- Article Grid: 3-column grid with image, title, date, category tag (`.grid_articles`)
- CMS Collection: `Articles` with fields: Title, Slug, Featured Image, Category, Date, Body (rich text), Author (reference)

**Page 9: Contact / Partner**
- Header: Transparent
- Partnership Types: Cards for Research Collaboration, Licensing, Investment (`.grid_partnership-types`)
- Form: Multi-step form with organization info, interest area, message (`.form_partnership`)
- Office: Lab locations with interactive map (`.section_locations`)

### 4. Custom Micro-Interactions & Scroll Mechanics

**Scroll Behaviors:**
- DNA helix hero: 3D helix rotates slowly on scroll using Spline runtime scroll-linked animation, mapped to 0-100% section scroll
- Metrics counter: Numbers count up from 0 when `.bar_metrics` enters viewport using Webflow "Scroll into view" trigger with counter interaction
- Pipeline horizontal scroll: `.section_pipeline` uses horizontal scroll-jacking - vertical scroll maps to horizontal movement using GSAP ScrollTrigger horizontal pin
- Section reveals: All content sections use staggered fade-up (Y: 40px, opacity: 0 to 1) on scroll-into-view, 600ms duration, 80ms stagger

**Hover Behaviors:**
- Research area cards: Background gradient shifts from static to animated (subtle hue rotation), border glows with `#00E5CC` box-shadow (0 0 20px rgba(0,229,204,0.3))
- Publication items: Left border expands from 0 to 3px in accent color, title shifts right 8px
- Team photos: Grayscale-to-color transition (filter: grayscale(100%) to grayscale(0%)), 400ms ease
- CTA buttons: Gradient background animates (background-position shift), icon arrow translates right 4px

**Click Behaviors:**
- Pipeline product click: Modal slides up from bottom with full product detail, dark overlay with backdrop-blur
- Publication click: Accordion expansion revealing abstract and download link with smooth height animation
- Mobile menu: Overlay with staggered link reveals, each link slides from right with 60ms delay

**Technical Implementation:**
- Webflow Interactions 2.0: Scroll-into-view triggers on all section wrappers with stagger children option
- GSAP ScrollTrigger: Horizontal scroll section pinning, parallax layers on hero
- Spline/Three.js: 3D DNA helix embed in hero with scroll-linked rotation
- Lottie: Animated molecular structure loading states, micro-animated icons on hover
- Client-First naming: `.section_hero-home`, `.grid_research-areas`, `.card_publication`, `.button_primary`, `.is-inview` state class

---

## 3. VERTEX - Quantitative Venture Capital & Private Equity

### 1. Production Name & Premium Industry Niche

**Template Name:** VERTEX  
**Target Industry:** Quantitative Venture Capital & Private Equity  
**Ideal Client:** Algorithmic investment firms, quantitative hedge funds, growth-stage VC firms, private equity groups focused on technology investments, and family offices with institutional-grade operations.

### 2. Visual Aesthetic & Typographic Pairing

**Color Palette:**

| Role | Color Name | Hex Code |
|------|-----------|----------|
| Primary | Vault Navy | `#0B1426` |
| Secondary | Signal Green | `#00D4AA` |
| Accent | Titanium Silver | `#C8CDD3` |
| Background Dark | Midnight | `#060D18` |
| Background Light | Ice White | `#F4F7FA` |
| Text | Cool Gray | `#94A3B8` |

**Dark/Light Mode Balance:** 85% dark-dominant. Financial interfaces demand dark backgrounds for data density and professional gravitas. Portfolio company showcases use light backgrounds for brand visibility. Signal Green used exclusively for positive metrics and CTAs to create immediate value association.

**Premium Font Combinations:**
- Headlines: Archivo 800 (bold geometric authority)
- Subheadlines: Archivo 500 (structured hierarchy)
- Body: Inter 400 (maximum data readability)
- Data/Numbers: Tabular Nums feature in Inter 600 (aligned financial figures)
- Accent/Labels: Archivo 600 uppercase tracking +2px

### 3. Exact Page Architecture

**Page 1: Home**
- Header: Transparent ultra-minimal, wordmark left, "LP Login" ghost button right (`.navbar_transparent`)
- Hero: Animated particle network background (representing deal flow), bold headline, sub-text, single "View Thesis" CTA (`.section_hero-home`)
- Track Record: Horizontal scrolling metrics - AUM, IRR, MOIC, Investments Made (`.section_metrics-scroll`)
- Investment Thesis: 2-column text with abstract geometric illustration (`.section_thesis`)
- Portfolio Highlights: 4-card grid of featured portfolio companies with logo, stage, sector (`.grid_portfolio-featured`)
- Team Preview: 3 managing partners with photo and title (`.grid_team-preview`)
- Footer: Minimal dark with compliance disclaimer, legal links (`.footer_main`)

**Page 2: Portfolio (CMS Collection)**
- Header: Sticky dark
- Filter: By sector (SaaS, Fintech, Healthcare, DeepTech), stage (Seed, Series A-C, Growth), status (Active, Exited) (`.filter_portfolio`)
- Portfolio Grid: Cards with company logo, name, sector tag, investment year, status badge (`.grid_portfolio`)
- CMS Collection: `Portfolio Companies` with fields: Name, Slug, Logo, Sector (option), Stage (option), Investment Year (number), Status (option: Active/Exited/IPO), Description (text), Website URL, Featured (boolean)
- Exit Highlights: Separate section for notable exits with return multiples (`.section_exits`)

**Page 3: Portfolio Company Detail (CMS Template)**
- Header: Sticky dark
- Hero: Company logo centered, name, one-line description (`.section_hero-company`)
- Metrics: Investment date, sector, stage at entry, current status (`.grid_company-meta`)
- Description: Rich text company overview (`.richtext_company`)
- Co-Investors: Logo row of other investors in the deal (`.row_coinvestors`)
- Related Companies: Similar portfolio companies by sector (`.grid_related-companies`)

**Page 4: Team**
- Header: Sticky dark
- Partners: Large cards with photo, name, title, investment focus areas (`.grid_partners`)
- Investment Team: Smaller grid of associates and analysts (`.grid_team-investment`)
- Operating Partners: Advisory and operational team (`.grid_team-operating`)
- CMS Collection: `Team` with fields: Name, Role, Photo, Bio (rich text), Focus Areas (text), LinkedIn URL, Level (option: Partner/Principal/Associate/Analyst/Operating)

**Page 5: Thesis / Strategy**
- Header: Sticky dark
- Thesis Statement: Large typography hero section (`.section_thesis-hero`)
- Focus Areas: Vertical sections for each investment vertical with description and example deals (`.section_focus-areas`)
- Market Map: Visual categorization of target markets (`.diagram_market-map`)
- Value Creation: Methodology for post-investment value-add (`.section_value-creation`)

**Page 6: Insights / Research**
- Header: Sticky dark
- Featured Insight: Hero card with gradient overlay (`.card_insight-featured`)
- Insight Grid: Cards with title, category, date, reading time (`.grid_insights`)
- CMS Collection: `Insights` with fields: Title, Slug, Category (option: Market Analysis/Sector Deep Dive/Macro), Featured Image, Date, Body (rich text), Author (reference)
- Newsletter CTA: Email signup for research distribution (`.section_newsletter`)

**Page 7: LP Portal (Gated)**
- Header: Sticky dark
- Login Form: Simple email/password with institutional styling (`.form_lp-login`)
- Dashboard Preview: Blurred screenshot showing what LPs access (`.section_portal-preview`)
- Access Request: Form for prospective LPs (`.form_access-request`)

**Page 8: Contact**
- Header: Transparent
- Split: Left with firm address, select office locations, right with form (`.section_contact-split`)
- Form: Organization, Name, Email, Inquiry Type (Founder/LP/Media/General), Message (`.form_contact`)
- Compliance Footer: Regulatory disclaimers (`.section_compliance`)

### 4. Custom Micro-Interactions & Scroll Mechanics

**Scroll Behaviors:**
- Particle network hero: Particles drift slowly and connect with lines, speed increases subtly on scroll using GSAP ScrollTrigger scrub
- Metrics horizontal scroll: Section pins in viewport while metrics scroll horizontally, each metric fades in with scale animation (0.8 to 1.0)
- Portfolio card stagger: Cards reveal with 80ms stagger, slight Y-offset (30px) fade-up on scroll-into-view
- Thesis text parallax: Large typography moves at 0.5x scroll speed creating depth against fixed background

**Hover Behaviors:**
- Portfolio cards: Border-top transitions from transparent to Signal Green (3px), company logo opacity increases from 0.7 to 1.0, subtle translateY(-4px) lift
- Team photos: Overlay with bio excerpt fades in (opacity 0 to 1, background rgba(11,20,38,0.85)), name and focus areas appear
- Insight cards: Background shifts from dark to slightly lighter shade, arrow icon rotates 45 degrees
- Navigation links: Underline draws from left to right (width 0% to 100%) in Signal Green

**Click Behaviors:**
- Portfolio card click: Smooth page transition with card expanding to fill viewport before navigating (GSAP Flip animation)
- LP Login: Form validates with subtle shake animation on error, success redirects with fade
- Filter buttons: Active state toggles with background fill animation (left-to-right wipe), content re-filters with fade transition
- Mobile nav: Slide-from-right panel with staggered links, semi-transparent dark overlay on content

**Technical Implementation:**
- Webflow Interactions 2.0: Scroll-into-view with stagger on collection lists, hover interactions on cards
- GSAP ScrollTrigger: Horizontal pin-scroll for metrics section, parallax on text elements, page transition animations
- Canvas/Particles.js: Hero particle network visualization (embedded via custom code)
- Client-First naming: `.section_hero-home`, `.grid_portfolio`, `.card_company`, `.filter_portfolio`, `.button_ghost`, `.is-active` for filter states

---

## 4. NOIR - Avant-Garde High Fashion & Couture

### 1. Production Name & Premium Industry Niche

**Template Name:** NOIR  
**Target Industry:** Avant-Garde High Fashion & Couture  
**Ideal Client:** Luxury fashion houses, haute couture ateliers, high-end fashion designers, editorial fashion brands, and exclusive fashion retail experiences.

### 2. Visual Aesthetic & Typographic Pairing

**Color Palette:**

| Role | Color Name | Hex Code |
|------|-----------|----------|
| Primary | Absolute Black | `#000000` |
| Secondary | Porcelain | `#F2EDE8` |
| Accent | Crimson Silk | `#C41E3A` |
| Background Dark | Onyx | `#0A0A0A` |
| Background Light | Bone | `#FAF8F5` |
| Text | Smoke | `#8C8C8C` |

**Dark/Light Mode Balance:** 90% dark-dominant. Fashion demands stark contrast and dramatic staging. Pure black backgrounds let garments command full attention. Bone/Porcelain used only on editorial text-heavy pages. Crimson Silk reserved for singular accent moments - a single line, a CTA, a price tag.

**Premium Font Combinations:**
- Headlines: Playfair Display 700 Italic (editorial drama)
- Subheadlines: Montserrat 300 (modern lightness)
- Body: Montserrat 400 (elegant readability)
- Navigation: Montserrat 500 uppercase tracking +4px (runway precision)
- Accent/Prices: Cormorant Garamond 500 Italic

### 3. Exact Page Architecture

**Page 1: Home**
- Header: Transparent with centered logo, left hamburger, right bag icon with item count (`.navbar_transparent-centered`)
- Hero: Full-viewport editorial video or image carousel with minimal text overlay - collection name only (`.section_hero-editorial`)
- Season Statement: Single line of italic text centered on black (`.section_statement`)
- Collection Preview: 2-column alternating layout - large image left/small right, then reversed (`.layout_collection-preview`)
- Editorial Feature: Full-bleed image with overlaid article link (`.section_editorial-feature`)
- Instagram Feed: Live feed grid embed (`.section_instagram`)
- Footer: Minimal with newsletter, social, legal (`.footer_minimal`)

**Page 2: Collections (CMS Collection)**
- Header: Sticky transparent with scroll-activated white background
- Season Filter: Horizontal scroll tabs (SS24, AW24, Resort, Pre-Fall) (`.tabs_seasons`)
- Collection Grid: Large-format image grid, 2 columns, full-bleed images with hover overlay showing collection name (`.grid_collections`)
- CMS Collection: `Collections` with fields: Name, Slug, Season (option), Year (number), Cover Image, Description (text), Lookbook Images (multi-image), Press Coverage (rich text)

**Page 3: Collection Detail / Lookbook (CMS Template)**
- Header: Transparent
- Hero: Full-viewport cover image with collection name in dramatic typography (`.section_hero-lookbook`)
- Lookbook Gallery: Vertical full-width image sequence with zero gap - editorial scroll experience (`.gallery_lookbook-vertical`)
- Collection Info: Centered text block with season, inspiration, materials (`.section_collection-info`)
- Shop Pieces: Horizontal scroll of shoppable items from this collection (`.slider_shop-collection`)

**Page 4: Shop**
- Header: Sticky with white background, category navigation below
- Category Nav: Horizontal links (Ready-to-Wear, Accessories, Shoes, Bags) (`.nav_shop-categories`)
- Product Grid: 3-column clean grid with image, name, price (`.grid_products`)
- CMS Collection: `Products` with fields: Name, Slug, Price (number), Collection (reference), Category (option), Images (multi-image), Description (rich text), Sizes Available (text), Color (color field)
- Quick View: Click triggers side-panel with product details (`.panel_quickview`)

**Page 5: Product Detail (CMS Template)**
- Header: Sticky white
- Gallery: Left 60% - vertical scrolling product images; Right 40% - sticky product info panel (`.layout_product-detail`)
- Product Info: Name, price, color selector, size selector, add-to-bag button, description accordion (`.panel_product-info`)
- Size Guide: Modal with measurement table (`.modal_size-guide`)
- Related Products: 4-item horizontal scroll (`.slider_related-products`)

**Page 6: Editorial / Journal**
- Header: Sticky white
- Featured Story: Full-width hero image with title overlay (`.card_story-featured`)
- Story Grid: 2-column editorial layout with large images (`.grid_stories`)
- CMS Collection: `Stories` with fields: Title, Slug, Featured Image, Category (option: Behind The Scenes/Campaign/Interview/Culture), Author, Date, Body (rich text)

**Page 7: About / Maison**
- Header: Transparent
- Heritage Hero: Cinematic video or image with founding year (`.section_hero-heritage`)
- History Timeline: Horizontal scrolling timeline with images and milestone text (`.timeline_heritage`)
- Atelier: Behind-the-scenes imagery of craftsmanship (`.section_atelier`)
- Sustainability: Environmental commitment section (`.section_sustainability`)
- Press: Logo grid of featured publications (`.grid_press`)

**Page 8: Runway / Shows**
- Header: Transparent
- Latest Show: Full-viewport video embed of latest runway show (`.section_runway-latest`)
- Past Shows: Grid of show cards with season, location, video thumbnail (`.grid_shows`)
- CMS Collection: `Shows` with fields: Season, Year, Location, Video URL, Cover Image, Description

**Page 9: Contact / Appointments**
- Header: Sticky white
- Boutique Locations: Cards with address, hours, appointment booking (`.grid_boutiques`)
- Private Appointment Form: Name, Email, Phone, Preferred Boutique, Date, Notes (`.form_appointment`)
- Press Inquiries: Separate form for media (`.form_press`)

### 4. Custom Micro-Interactions & Scroll Mechanics

**Scroll Behaviors:**
- Lookbook vertical scroll: Images in `.gallery_lookbook-vertical` have subtle scale (1.05 to 1.0) as they enter viewport, creating cinematic pull-in effect
- Collection preview parallax: In alternating layout, images move at different scroll speeds (0.2x and 0.4x) creating depth
- Statement text reveal: Single line of text reveals character-by-character using Webflow character-split animation on scroll trigger
- Shop product grid: Items fade-in with 60ms stagger, slight scale (0.95 to 1.0)

**Hover Behaviors:**
- Collection grid: Full overlay fades in (rgba(0,0,0,0.4)) with collection name appearing center (translateY 20px to 0), image zooms to 1.08
- Product cards: Image crossfades to alternate angle (second image in multi-image field), price text transitions from Smoke to Crimson Silk
- Navigation links: Thin underline draws from center outward, 300ms ease-out
- Hamburger icon: Lines animate to X with rotation, 400ms spring ease

**Click Behaviors:**
- Quick view panel: Slides from right with content staggered (image first, then text, then CTA), semi-transparent black overlay on main content
- Size selector: Active size gets Crimson Silk border with subtle pulse animation
- Add to bag: Button text changes ("Add to Bag" to "Added"), background fills with Crimson Silk left-to-right wipe, bag icon count increments with bounce
- Image gallery: Lightbox with swipe navigation, black background, minimal close button

**Technical Implementation:**
- Webflow Interactions 2.0: Mouse hover interactions for product image swap, scroll-into-view for reveals, page load for hero entrance
- GSAP ScrollTrigger: Parallax on editorial layouts, text character animation, horizontal timeline scroll
- SplitType + GSAP: Character-by-character text reveals on statement sections
- Lottie: Custom line-drawn brand monogram animation on page load
- Client-First: `.section_hero-editorial`, `.grid_products`, `.card_collection`, `.panel_quickview`, `.is-visible`, `.is-open` states

---

## 5. TITANIUM - Defense & Aerospace Contracting

### 1. Production Name & Premium Industry Niche

**Template Name:** TITANIUM  
**Target Industry:** Defense & Aerospace Contracting  
**Ideal Client:** Defense technology contractors, aerospace engineering firms, military systems integrators, satellite and space technology companies, and government-facing defense solutions providers.

### 2. Visual Aesthetic & Typographic Pairing

**Color Palette:**

| Role | Color Name | Hex Code |
|------|-----------|----------|
| Primary | Stealth Navy | `#0C1B2E` |
| Secondary | Tactical Gray | `#3D4F5F` |
| Accent | Alert Amber | `#F59E0B` |
| Background Dark | Bunker Black | `#0A0F14` |
| Background Light | Briefing White | `#F1F5F9` |
| Text | Radar Green | `#64FFDA` |

**Dark/Light Mode Balance:** 80% dark-dominant. Defense industry demands authority and controlled information density. Dark interfaces echo mission-critical systems. Alert Amber used for CTAs and critical information highlights. Radar Green for data readouts and technical specifications. Light mode reserved for downloadable capability briefs and compliance documentation.

**Premium Font Combinations:**
- Headlines: Rajdhani 700 (angular, military precision)
- Subheadlines: Rajdhani 500 (structured authority)
- Body: Source Sans Pro 400 (government-standard clarity)
- Technical/Data: Source Code Pro 400 (system readout aesthetic)
- Accent/Labels: Rajdhani 600 uppercase tracking +3px

### 3. Exact Page Architecture

**Page 1: Home**
- Header: Sticky dark with angular logo left, security classification badge styling, "Contract Inquiries" CTA right (`.navbar_sticky-classified`)
- Hero: Full-viewport with dark gradient overlay on aerospace imagery, bold headline, capability summary line, "View Capabilities" CTA (`.section_hero-defense`)
- Capabilities Ticker: Horizontal scrolling capability keywords with separator dots (`.marquee_capabilities`)
- Domain Cards: 4-column grid showing Air, Space, Cyber, Land domains with icons (`.grid_domains`)
- Contract Metrics: Counter section showing Active Programs, Years of Operation, Personnel, Countries (`.section_metrics`)
- Recent Programs: 3 featured program cards from CMS (`.grid_programs-featured`)
- Certifications: Logo bar of security clearances and certifications (ITAR, CMMC, ISO) (`.bar_certifications`)
- Footer: Dark with legal disclaimers, ITAR notice, security statement (`.footer_classified`)

**Page 2: Capabilities**
- Header: Sticky dark
- Domain Sections: Full-width sections for each domain (Air Dominance, Space Systems, Cyber Operations, Ground Systems) (`.section_domain`)
- Each Domain: Icon, description, key programs list, technology summary (`.card_domain-detail`)
- Technology Stack: Visual grid of core technologies (radar, EW, satellites, AI/ML, autonomous systems) (`.grid_technologies`)
- Integration: Diagram showing cross-domain integration capabilities (`.diagram_integration`)

**Page 3: Programs (CMS Collection)**
- Header: Sticky dark
- Filter: By domain, status (Active/Completed/Classified), contract type (`.filter_programs`)
- Program Grid: Cards with program icon, name, domain badge, status indicator, brief description (`.grid_programs`)
- CMS Collection: `Programs` with fields: Name, Slug, Domain (option: Air/Space/Cyber/Land/Maritime), Status (option), Description (rich text), Cover Image, Classification Level (option), Contract Value Range (text), Key Technologies (text)

**Page 4: Program Detail (CMS Template)**
- Header: Sticky dark
- Hero: Program name with domain badge and status indicator (`.section_hero-program`)
- Overview: Description, objectives, key metrics (`.section_program-overview`)
- Technologies: Grid of technologies employed (`.grid_program-tech`)
- Timeline: Program milestones visualization (`.timeline_program`)
- Related Programs: Cross-domain related programs (`.grid_related-programs`)

**Page 5: Innovation / R&D**
- Header: Sticky dark
- Lab Intro: Hero with research facility imagery (`.section_hero-innovation`)
- Research Areas: Cards for each R&D focus (Autonomy, AI/ML, Quantum Sensing, Directed Energy, Hypersonics) (`.grid_research`)
- Patents: Counter and highlight section (`.section_patents`)
- Academic Partnerships: University and research institution logos (`.grid_academic`)
- SBIR/STTR: Small business innovation program information (`.section_sbir`)

**Page 6: Careers**
- Header: Sticky dark
- Hero: "Join the Mission" with inspiring team imagery (`.section_hero-careers`)
- Benefits: Grid of clearance support, relocation, education benefits (`.grid_benefits`)
- Open Positions: CMS-driven job listings filterable by location, clearance, domain (`.list_positions`)
- CMS Collection: `Positions` with fields: Title, Location, Clearance Required (option), Domain, Description (rich text), Apply URL
- Culture: Team photos and values statements (`.section_culture`)

**Page 7: Leadership**
- Header: Sticky dark
- Executive Team: Photo, name, title, former military rank/service (`.grid_executives`)
- Board of Directors: Smaller grid with name and affiliation (`.grid_board`)
- CMS Collection: `Leaders` with fields: Name, Title, Photo, Bio (rich text), Former Service (text), Level (option: Executive/Board/Advisory)
- Advisory Panel: Defense and intelligence community advisors (`.grid_advisors`)

**Page 8: News & Contract Awards**
- Header: Sticky dark
- Featured: Latest contract award announcement (`.card_award-featured`)
- News Grid: Cards with date, category badge, title, excerpt (`.grid_news`)
- CMS Collection: `News` with fields: Title, Slug, Category (option: Contract Award/Press Release/Event/Publication), Date, Featured Image, Body (rich text), Featured (boolean)
- Events: Upcoming defense conferences and exhibitions (`.list_events`)

**Page 9: Contact / Contracting**
- Header: Sticky dark
- Contract Vehicles: List of active contract vehicles (GSA, IDIQ, BPA) (`.list_contracts`)
- Inquiry Form: Company, Name, Email, Contract Vehicle Interest, CAGE Code, Message (`.form_contracting`)
- Facility Locations: Map and address cards for cleared facilities (`.grid_facilities`)
- Security: Contact info for FSO and security office (`.section_security-contact`)

### 4. Custom Micro-Interactions & Scroll Mechanics

**Scroll Behaviors:**
- Hero overlay: Dark gradient opacity increases from 0.5 to 0.8 as user scrolls, creating deepening immersion effect via Webflow "While scrolling in view"
- Metrics counter: Numbers count up rapidly with easing when section enters viewport, using Webflow Interactions scroll trigger
- Domain cards: Cards slide in from bottom with 100ms stagger, subtle rotation (2deg to 0deg) creating tactical deployment feel
- Certification bar: Logos fade-in sequentially left-to-right, 80ms apart
- Parallax depth: Hero background image moves at 0.2x creating minimal, controlled parallax (not distracting - military precision)

**Hover Behaviors:**
- Domain cards: Top border transitions from transparent to Alert Amber (3px), icon pulses once with scale(1.1) and back, background lightens slightly
- Program cards: Status indicator dot pulses (Radar Green for active), card lifts with translateY(-3px) and subtle box-shadow increase
- Navigation: Active link gets small amber dot indicator below, hover draws underline
- CTA buttons: Background transitions from transparent border to filled Amber, text color inverts from Amber to Bunker Black

**Click Behaviors:**
- Program card: Page transition with horizontal wipe (left-to-right dark overlay) mimicking security screen reveal
- Domain section expand: Accordion with smooth height animation, chevron rotates 180deg, inner content staggers in
- Capability keywords: Clicking a keyword in the marquee scrolls to relevant domain section with smooth-scroll
- Mobile nav: Full-screen overlay with angled clip-path reveal (diagonal wipe), links appear with typewriter stagger effect

**Technical Implementation:**
- Webflow Interactions 2.0: Counter animations on scroll trigger, hover state transitions on cards, page-load entrance animations
- GSAP ScrollTrigger: Parallax backgrounds, horizontal scroll capabilities section, scroll-linked opacity on hero
- Custom Code: Typewriter effect for hero subtitle using vanilla JS with requestAnimationFrame
- Lottie: Animated radar sweep icon, satellite orbit path animation for space section
- Client-First: `.section_hero-defense`, `.grid_domains`, `.card_program`, `.navbar_sticky-classified`, `.is-active`, `.is-classified` state modifiers

---

## 6. MERIDIAN - Luxury Yacht & Maritime Charter

### 1. Production Name & Premium Industry Niche

**Template Name:** MERIDIAN  
**Target Industry:** Luxury Yacht & Maritime Charter  
**Ideal Client:** Superyacht charter companies, luxury marina developments, private yacht brokerages, maritime luxury experience providers, and exclusive sailing expedition operators.

### 2. Visual Aesthetic & Typographic Pairing

**Color Palette:**

| Role | Color Name | Hex Code |
|------|-----------|----------|
| Primary | Deep Ocean | `#0A2540` |
| Secondary | Seafoam | `#7DD3C0` |
| Accent | Sunset Gold | `#E8A838` |
| Background Dark | Abyss | `#061520` |
| Background Light | Salt White | `#FDFCFA` |
| Text | Mist Blue | `#A8C4D4` |

**Dark/Light Mode Balance:** 65% dark / 35% light. Ocean-inspired design uses dark depths for dramatic yacht photography, transitioning to light salt-white for booking forms and yacht specification details. Sunset Gold reserved for pricing, CTAs, and luxury highlight moments.

**Premium Font Combinations:**
- Headlines: Lora 700 (classic maritime elegance)
- Subheadlines: Raleway 300 (breezy lightness)
- Body: Raleway 400 (clean nautical)
- Navigation: Raleway 500 uppercase tracking +2.5px
- Accent/Pricing: Cormorant Garamond 600 (luxury numeral styling)

### 3. Exact Page Architecture

**Page 1: Home**
- Header: Transparent with white logo, navigation center, "Book Charter" gold CTA right (`.navbar_transparent-light`)
- Hero: Full-viewport aerial drone video of yacht on ocean, centered headline with script accent word, scroll indicator wave animation (`.section_hero-ocean`)
- Fleet Preview: Horizontal scrolling yacht cards with name, length, guests capacity, starting price (`.slider_fleet-preview`)
- Destinations: 3-column image cards showing Mediterranean, Caribbean, Southeast Asia with overlay text (`.grid_destinations`)
- Experience: Split section - left video of onboard life, right stacked text points (`.section_experience-split`)
- Testimonial: Single centered quote with guest photo and destination (`.section_testimonial`)
- Awards: Maritime industry awards and superyacht design awards (`.bar_awards`)
- Footer: Dark with newsletter, social, legal, Flag State registration info (`.footer_maritime`)

**Page 2: Fleet (CMS Collection)**
- Header: Sticky dark
- Filter Bar: By yacht type (Motor/Sail), length range, guest capacity, price range (`.filter_fleet`)
- Fleet Grid: Large image cards with yacht photo, name, specs overlay (length, guests, crew), "View Details" CTA (`.grid_fleet`)
- CMS Collection: `Yachts` with fields: Name, Slug, Type (option: Motor Yacht/Sailing Yacht/Explorer/Catamaran), Length (number), Guests (number), Crew (number), Cabins (number), Built Year (number), Builder (text), Price Per Week (text), Hero Image, Gallery (multi-image), Description (rich text), Amenities (rich text), Destinations Available (multi-reference)
- Comparison: "Compare Yachts" floating button opening side-by-side comparison modal (`.button_compare`)

**Page 3: Yacht Detail (CMS Template)**
- Header: Transparent
- Hero: Full-bleed yacht image with name overlay and quick specs bar below (`.section_hero-yacht`)
- Gallery: Full-width image slider with thumbnail navigation below (`.slider_yacht-gallery`)
- Specifications: Table with length, beam, draft, speed, range, builder, year, refit (`.table_specifications`)
- Description: Rich text overview of yacht character and unique features (`.richtext_yacht`)
- Deck Plans: Tabbed deck plan images (Main, Upper, Lower, Sun) (`.tabs_deck-plans`)
- Amenities: Icon grid of water toys, entertainment, spa facilities (`.grid_amenities`)
- Pricing: Seasonal rate table (High/Low/Holiday) with "Request Quote" CTA (`.table_pricing`)
- Availability Calendar: Visual month calendar showing booked/available periods (`.calendar_availability`)
- Similar Yachts: 3-card horizontal scroll of similar vessels (`.slider_similar-yachts`)

**Page 4: Destinations (CMS Collection)**
- Header: Sticky dark
- Destination Grid: Large image cards with destination name and itinerary count (`.grid_destinations`)
- CMS Collection: `Destinations` with fields: Name, Slug, Region (option: Mediterranean/Caribbean/Southeast Asia/Pacific/Arctic), Hero Image, Description (rich text), Best Season (text), Itineraries (multi-reference), Gallery (multi-image)
- Map: Interactive map with destination pins (`.section_destination-map`)

**Page 5: Destination Detail (CMS Template)**
- Header: Transparent
- Hero: Aerial destination imagery with name overlay (`.section_hero-destination`)
- Overview: Description, best season, highlights (`.section_destination-overview`)
- Itineraries: CMS-driven itinerary cards for this destination (`.grid_itineraries`)
- Available Yachts: Yachts filtered by this destination availability (`.grid_yachts-available`)
- Gallery: Masonry photo gallery of destination highlights (`.gallery_destination`)

**Page 6: Charter Experience**
- Header: Sticky dark
- Service Tiers: Cards for Crewed Charter, Bareboat, Corporate Events, Special Occasions (`.grid_services`)
- Day-in-the-Life: Visual timeline of a typical charter day (morning to evening) (`.timeline_charter-day`)
- Cuisine: Section on onboard dining with chef imagery (`.section_cuisine`)
- Water Toys: Grid of available water toys and activities (`.grid_water-toys`)
- Testimonials: Multi-slide testimonial carousel (`.slider_testimonials`)

**Page 7: About / Brokerage**
- Header: Sticky dark
- Heritage: Company history and founding story (`.section_heritage`)
- Team: Charter brokers with photo, specialization, languages spoken (`.grid_brokers`)
- CMS Collection: `Brokers` with fields: Name, Photo, Specialization (text), Languages (text), Bio (text), Email, Phone
- Process: Step-by-step charter booking process visualization (`.process_booking`)
- Partnerships: Marina partners, yacht builders, luxury concierge services (`.grid_partnerships`)

**Page 8: Journal / Blog**
- Header: Sticky dark
- Featured: Latest article with ocean imagery (`.card_journal-featured`)
- Article Grid: Cards with image, title, category (Destinations/Charter Tips/Industry/Yachts), date (`.grid_journal`)
- CMS Collection: `Journal` with fields: Title, Slug, Featured Image, Category (option), Author, Date, Body (rich text), Yacht (reference - optional)

**Page 9: Inquiry / Booking**
- Header: Transparent
- Booking Form: Multi-step form - Step 1: Dates & Destination, Step 2: Group Size & Preferences, Step 3: Budget & Contact Info (`.form_booking-multistep`)
- Quick Contact: Phone number and WhatsApp for immediate inquiries (`.section_quick-contact`)
- FAQ: Accordion with common charter questions (`.accordion_faq`)

### 4. Custom Micro-Interactions & Scroll Mechanics

**Scroll Behaviors:**
- Ocean hero: Background video/image has gentle parallax (0.15x), overlay gradient deepens on scroll creating underwater descent effect
- Fleet cards horizontal: On mobile, fleet cards auto-scroll gently; on desktop, section pins and scrolls horizontally using GSAP ScrollTrigger
- Yacht specs reveal: Specification numbers count up with wave-like stagger (each column delays 150ms after previous) using scroll-into-view trigger
- Section transitions: Sections separated by subtle wave SVG dividers that animate stroke on scroll

**Hover Behaviors:**
- Yacht cards: Image zooms 1.06, name shifts up revealing "View Details" text below, border-bottom transitions to Sunset Gold
- Destination cards: Overlay opacity reduces (0.3 to 0.1) revealing more of the destination image, text container slides up 10px
- Navigation: Link hover reveals small anchor icon to the left with fade-in
- Price elements: Sunset Gold highlight background expands from center on hover

**Click Behaviors:**
- Yacht comparison: Modal slides up from bottom with spring animation, yacht cards inside can be added/removed with scale pop
- Gallery images: Full-screen lightbox with horizontal swipe, subtle parallax between image layers (background blurs and shifts)
- Booking form steps: Step transitions use horizontal slide animation (current slides left, new slides from right), progress indicator fills with Sunset Gold
- Destination map pins: Click expands info popup with yacht count and "Explore" link, neighboring pins dim

**Technical Implementation:**
- Webflow Interactions 2.0: Multi-step form progress, hover card interactions, scroll-triggered counters, page-load hero entrance
- GSAP ScrollTrigger: Horizontal fleet scroll on desktop, parallax ocean layers, wave SVG stroke animation
- Mapbox GL JS: Interactive destination map with custom markers styled to match brand palette (embedded via custom code)
- Lottie: Wave loading animation, compass animation on page transitions, anchor icon animations
- Client-First: `.section_hero-ocean`, `.grid_fleet`, `.card_yacht`, `.slider_fleet-preview`, `.form_booking-multistep`, `.is-booked`, `.is-available` calendar states

---

## 7. CIPHER - Cybersecurity & Zero-Trust Enterprise

### 1. Production Name & Premium Industry Niche

**Template Name:** CIPHER  
**Target Industry:** Cybersecurity & Zero-Trust Enterprise  
**Ideal Client:** Enterprise cybersecurity firms, zero-trust architecture providers, threat intelligence platforms, SOC-as-a-service companies, and identity/access management solutions.

### 2. Visual Aesthetic & Typographic Pairing

**Color Palette:**

| Role | Color Name | Hex Code |
|------|-----------|----------|
| Primary | Terminal Dark | `#0D1117` |
| Secondary | Matrix Green | `#00FF88` |
| Accent | Threat Red | `#FF3B3B` |
| Background Dark | Void | `#010409` |
| Background Light | Screen White | `#F0F6FC` |
| Text | Phosphor | `#8B949E` |

**Dark/Light Mode Balance:** 92% dark-dominant. Cybersecurity interfaces must mirror SOC environments and terminal aesthetics. Matrix Green signals system-healthy states and CTAs. Threat Red used sparingly for vulnerability indicators and critical alerts. Light mode only for documentation and compliance report pages.

**Premium Font Combinations:**
- Headlines: JetBrains Mono 700 (terminal authority)
- Subheadlines: Inter 600 (structured clarity)
- Body: Inter 400 (maximum scan-ability)
- Code/Technical: JetBrains Mono 400 (authentic code aesthetic)
- Accent/Status: JetBrains Mono 500 uppercase tracking +1px

### 3. Exact Page Architecture

**Page 1: Home**
- Header: Fixed dark with small logo left, product nav center, "Get Demo" green CTA right, subtle green bottom border on scroll (`.navbar_fixed-terminal`)
- Hero: Dark background with animated particle mesh representing network nodes, headline with Matrix Green gradient text, sub-text, dual CTAs "See Platform" and "Read Report" (`.section_hero-terminal`)
- Threat Counter: Live-updating animated counter showing threats blocked today (simulated) (`.section_threat-counter`)
- Platform Overview: 3-column cards for Detect, Respond, Prevent with terminal-style icons (`.grid_platform-pillars`)
- Social Proof: Customer logos in monochrome with customer count metric (`.section_social-proof`)
- Attack Surface Visual: Animated SVG showing attack vectors and protection points (`.section_attack-surface`)
- Latest Threat Intel: 3 latest threat advisories from CMS (`.list_threat-intel`)
- Footer: Dark with product links, compliance badges (SOC2, ISO27001, FedRAMP), legal (`.footer_secure`)

**Page 2: Platform / Products**
- Header: Fixed dark
- Product Hero: Split with platform screenshot left, features list right (`.section_hero-platform`)
- Feature Tabs: Tabbed interface showing different platform modules (XDR, SIEM, SOAR, IAM) (`.tabs_platform`)
- Each Tab: Screenshot, feature bullets, integration logos, "Learn More" link (`.tab-content_module`)
- Architecture Diagram: Interactive SVG showing data flow through platform layers (`.diagram_architecture`)
- Integration Grid: Grid of supported integrations with logos (AWS, Azure, Okta, CrowdStrike, etc.) (`.grid_integrations`)

**Page 3: Solutions (CMS Collection)**
- Header: Fixed dark
- Solution Grid: Cards with threat icon, solution name, brief description, industry badge (`.grid_solutions`)
- CMS Collection: `Solutions` with fields: Name, Slug, Icon (image), Description (rich text), Industry Focus (option: Financial/Healthcare/Government/Technology/Retail), Key Features (rich text), Case Study (reference)
- By Industry: Filtered views for each industry vertical (`.filter_industry`)

**Page 4: Threat Intelligence / Blog**
- Header: Fixed dark
- Threat Level Banner: Current global threat level indicator (Low/Elevated/High/Critical) with color coding (`.banner_threat-level`)
- Featured Advisory: Large card for latest critical advisory (`.card_advisory-featured`)
- Intel Grid: Cards with severity badge, title, date, category (`.grid_threat-intel`)
- CMS Collection: `Advisories` with fields: Title, Slug, Severity (option: Critical/High/Medium/Low), Category (option: Malware/Ransomware/APT/Vulnerability/Phishing), Date, Body (rich text), IOCs (rich text), Affected Systems (text)
- Research Reports: Downloadable whitepapers and research (`.list_reports`)

**Page 5: Case Studies (CMS Collection)**
- Header: Fixed dark
- Stats Hero: Key metrics across all case studies (threats stopped, response time reduction, ROI) (`.section_stats-hero`)
- Case Study Grid: Cards with customer industry, challenge headline, key metric result (`.grid_case-studies`)
- CMS Collection: `Case Studies` with fields: Title, Slug, Customer Name, Industry (option), Challenge (text), Solution (rich text), Results (rich text), Key Metric (text), Logo (image), Quote (text)
- Industry Filter: Filter by customer industry (`.filter_case-studies`)

**Page 6: Resources**
- Header: Fixed dark
- Resource Types: Tabs for Whitepapers, Webinars, Documentation, Tools (`.tabs_resources`)
- Resource Grid: Cards with type badge, title, description, download/watch CTA (`.grid_resources`)
- CMS Collection: `Resources` with fields: Title, Type (option), Description (text), File/URL, Thumbnail, Date, Gated (boolean)
- Developer Docs: Link to external documentation portal (`.card_docs-cta`)

**Page 7: Company**
- Header: Fixed dark
- Mission: Bold statement about securing the digital world (`.section_mission`)
- Leadership: Grid with photos styled in green-tinted duotone (`.grid_leadership`)
- Timeline: Company milestones and funding rounds (`.timeline_company`)
- Certifications: Compliance and security certifications with badges (`.grid_certifications`)
- Careers CTA: Join the security team banner (`.banner_careers`)

**Page 8: Pricing**
- Header: Fixed dark
- Tier Cards: 3-column pricing (Starter, Professional, Enterprise) with feature comparison (`.grid_pricing`)
- Feature Comparison: Expandable table showing all features by tier (`.table_features`)
- Calculator: Interactive slider for endpoints/users showing estimated price (`.calculator_pricing`)
- Enterprise CTA: Custom pricing contact form (`.section_enterprise`)
- FAQ: Common pricing questions accordion (`.accordion_pricing-faq`)

**Page 9: Contact / Demo Request**
- Header: Fixed dark
- Demo Form: Company, Name, Email, Company Size (dropdown), Current Solutions (multi-select), Message (`.form_demo`)
- Sales Regions: Regional sales contacts (Americas, EMEA, APAC) (`.grid_regions`)
- Partner Program: Link to partner/reseller program (`.card_partner-cta`)
- Support: Existing customer support portal link (`.section_support`)

### 4. Custom Micro-Interactions & Scroll Mechanics

**Scroll Behaviors:**
- Network mesh hero: Particles shift and reconnect based on scroll position, creating sense of live network activity using GSAP ScrollTrigger with canvas
- Threat counter: Numbers randomize rapidly then settle on final value when entering viewport (slot-machine effect using Webflow Interactions)
- Platform pillars: Cards slide up from below with 120ms stagger, green border-left animates from 0 to full height
- Attack surface SVG: SVG paths draw themselves (stroke-dashoffset animation) as section scrolls into view, dots pulse sequentially
- Section reveals: All sections use opacity 0 to 1 with subtle Y-offset (20px), 500ms duration, ease-out

**Hover Behaviors:**
- Platform cards: Left border pulses Matrix Green, icon gains green glow (box-shadow: 0 0 15px rgba(0,255,136,0.4)), subtle translateY(-2px)
- Threat intel cards: Severity badge pulses, title text gains green color, card background lightens one shade
- Integration logos: Grayscale to full color transition (400ms), scale 1.0 to 1.08
- CTA buttons: Matrix Green background shifts to lighter green, text tracking increases slightly, cursor becomes pointer with custom green dot cursor

**Click Behaviors:**
- Platform tabs: Active tab gets green underline that slides from previous tab position (animated left property), content crossfades (opacity transition)
- Threat advisory expand: Accordion with terminal-style ">" indicator that rotates to "v", content types in with typewriter effect (50ms per character using JS)
- Pricing calculator slider: Real-time price updates with counting animation, tier recommendation highlights with green pulse
- Demo form submit: Button changes to loading state with animated dots "Encrypting...", success shows green checkmark Lottie

**Technical Implementation:**
- Webflow Interactions 2.0: Tab indicators, hover states, scroll-into-view reveals, counter animations
- GSAP ScrollTrigger: Canvas particle animation scroll-linking, SVG path drawing, horizontal parallax on stats
- Canvas API: Custom particle network in hero (embedded via custom code embed)
- Lottie: Shield animation on page load, checkmark on form success, loading dots animation
- Custom JS: Typewriter effect for advisory content, pricing calculator logic, threat counter randomization
- Client-First: `.section_hero-terminal`, `.grid_solutions`, `.card_advisory`, `.tabs_platform`, `.navbar_fixed-terminal`, `.is-critical`, `.is-high`, `.is-medium`, `.is-low` severity states

---

## 8. AURORA - Luxury Hospitality & Private Resorts

### 1. Production Name & Premium Industry Niche

**Template Name:** AURORA  
**Target Industry:** Luxury Hospitality & Private Resorts  
**Ideal Client:** 5-star private resorts, luxury boutique hotels, exclusive island retreats, wellness spa destinations, and ultra-premium hospitality brands.

### 2. Visual Aesthetic & Typographic Pairing

**Color Palette:**

| Role | Color Name | Hex Code |
|------|-----------|----------|
| Primary | Sunset Rosewood | `#8B2252` |
| Secondary | Warm Sand | `#E8D5B7` |
| Accent | Lagoon Teal | `#1A8B7F` |
| Background Dark | Twilight | `#1A0A12` |
| Background Light | Linen | `#FBF8F4` |
| Text | Dusk Rose | `#C4A0A0` |

**Dark/Light Mode Balance:** 50/50 balanced. Luxury hospitality requires warmth and invitation. Dark sections for dramatic resort photography and nighttime ambiance. Light linen backgrounds for room details, dining menus, and booking interfaces. Sunset Rosewood for headings creates warmth without aggression.

**Premium Font Combinations:**
- Headlines: Playfair Display 700 (timeless luxury)
- Subheadlines: Libre Franklin 300 (airy modern)
- Body: Libre Franklin 400 (inviting readability)
- Navigation: Libre Franklin 500 uppercase tracking +2px
- Accent/Pricing: Playfair Display 500 Italic (elegant emphasis)

### 3. Exact Page Architecture

**Page 1: Home**
- Header: Transparent with centered gold logo, split navigation left and right, "Reserve" CTA (`.navbar_transparent-centered`)
- Hero: Full-viewport cinematic video of resort at golden hour with centered property name, tagline, subtle down-arrow animation (`.section_hero-resort`)
- Welcome: Centered text block with founder's welcome message, decorative line dividers (`.section_welcome`)
- Accommodations Preview: 3-card horizontal scroll showing signature suites (`.slider_accommodations`)
- Experiences: 4-column icon grid (Spa, Dining, Adventures, Wellness) with descriptions (`.grid_experiences`)
- Gallery Mosaic: Asymmetric photo grid showcasing property highlights (`.grid_gallery-mosaic`)
- Testimonials: Large centered quote with guest attribution, carousel dots (`.slider_testimonials`)
- Seasonal Offer: Banner with current special offer and "Book Now" CTA (`.banner_seasonal`)
- Footer: Warm dark with contact, social, booking widget link, awards (`.footer_hospitality`)

**Page 2: Accommodations (CMS Collection)**
- Header: Sticky with linen background
- Room Filter: By type (Suite, Villa, Overwater, Treehouse), guests, view (Ocean, Garden, Mountain) (`.filter_rooms`)
- Room Grid: Large image cards with room name, type badge, guest count, starting rate, "Explore" link (`.grid_accommodations`)
- CMS Collection: `Accommodations` with fields: Name, Slug, Type (option: Suite/Villa/Overwater Bungalow/Treehouse/Penthouse), View (option), Max Guests (number), Bedrooms (number), Size Sqm (number), Nightly Rate (text), Hero Image, Gallery (multi-image), Description (rich text), Amenities (rich text), Floor Plan (image)

**Page 3: Room Detail (CMS Template)**
- Header: Transparent
- Hero: Full-bleed room image with name overlay (`.section_hero-room`)
- Gallery: Horizontal image slider with counter (1/12) (`.slider_room-gallery`)
- Details: Split layout - left description and amenities, right sticky booking widget with rate and "Reserve" CTA (`.layout_room-detail`)
- Floor Plan: Expandable floor plan image (`.section_floor-plan`)
- Amenities: Icon grid of room amenities (minibar, rainfall shower, private pool, etc.) (`.grid_room-amenities`)
- Similar Rooms: 3-card recommendations (`.slider_similar-rooms`)

**Page 4: Dining**
- Header: Sticky linen
- Restaurant Cards: Each restaurant with hero image, cuisine type, dress code, hours (`.grid_restaurants`)
- CMS Collection: `Restaurants` with fields: Name, Cuisine Type, Description (rich text), Hero Image, Gallery (multi-image), Hours (text), Dress Code (text), Menu PDF (file)
- Chef Profile: Executive chef feature with photo and philosophy (`.section_chef`)
- Private Dining: In-villa and special occasion dining options (`.section_private-dining`)
- Menu Preview: Downloadable PDF menus per restaurant (`.list_menus`)

**Page 5: Spa & Wellness**
- Header: Sticky linen
- Hero: Serene spa imagery with centered heading (`.section_hero-spa`)
- Treatments: CMS-driven treatment cards with name, duration, price (`.grid_treatments`)
- CMS Collection: `Treatments` with fields: Name, Category (option: Massage/Facial/Body/Holistic/Signature), Duration (text), Price (text), Description (text)
- Wellness Programs: Multi-day program cards (Detox, Mindfulness, Fitness) (`.grid_programs`)
- Facilities: Photo grid of pools, saunas, yoga pavilion, gym (`.grid_spa-facilities`)

**Page 6: Experiences & Activities**
- Header: Sticky linen
- Category Tabs: Water, Land, Cultural, Culinary (`.tabs_activities`)
- Activity Cards: Image, name, duration, price, difficulty level (`.grid_activities`)
- CMS Collection: `Activities` with fields: Name, Category (option), Duration (text), Price (text), Difficulty (option: Easy/Moderate/Advanced), Description (rich text), Image, Seasonal (boolean)
- Curated Itineraries: Pre-planned multi-day experience packages (`.section_itineraries`)

**Page 7: Weddings & Events**
- Header: Transparent
- Hero: Romantic ceremony imagery (`.section_hero-weddings`)
- Venues: CMS-driven venue cards with capacity, indoor/outdoor, style (`.grid_venues`)
- Packages: Tiered wedding packages (Intimate, Grand, Royal) with inclusions (`.grid_packages`)
- Planning Form: Multi-step form for event inquiry (`.form_event-inquiry`)
- Gallery: Past event photography masonry grid (`.gallery_events`)

**Page 8: Location & Transfers**
- Header: Sticky linen
- Map: Interactive property map showing buildings, pools, restaurants, beach (`.section_property-map`)
- Getting Here: Transfer options (helicopter, seaplane, luxury car) with pricing (`.grid_transfers`)
- Surroundings: Local attractions and day trips (`.section_surroundings`)
- Climate: Monthly weather chart for trip planning (`.section_climate`)

**Page 9: Reservations**
- Header: Sticky linen
- Booking Widget: Date picker, room type selector, guests, promo code, "Check Availability" (`.widget_booking`)
- Special Offers: Current promotional packages (`.grid_offers`)
- Cancellation Policy: Clear policy accordion (`.accordion_policies`)
- Contact: Direct reservation team phone, email, WhatsApp (`.section_reservation-contact`)

### 4. Custom Micro-Interactions & Scroll Mechanics

**Scroll Behaviors:**
- Resort hero: Video/image with smooth parallax (0.3x), warm gradient overlay that deepens creating sunset effect as user scrolls
- Gallery mosaic: Images scale from 0.9 to 1.0 and fade in with 150ms stagger as grid enters viewport using Webflow scroll-into-view
- Welcome text: Letters reveal word-by-word with soft opacity fade (not typewriter - smoother luxury feel), triggered by scroll position
- Section transitions: Soft warm gradient dividers between sections animate opacity on scroll
- Accommodation cards: Float-up animation with subtle rotation (1deg to 0deg) creating a breeze-like gentle movement

**Hover Behaviors:**
- Room cards: Image zooms 1.04, warm vignette overlay lightens, price text transitions to Lagoon Teal, subtle shadow increase
- Experience icons: Icon scales 1.15 with Sunset Rosewood color transition, description text fades in below (max-height 0 to auto)
- Restaurant cards: Border-bottom appears in Sunset Rosewood, "View Menu" text slides up from below the card
- Gallery images: Brightness increases slightly (filter: brightness(1.05)), cursor changes to zoom-in

**Click Behaviors:**
- Gallery lightbox: Opens with scale-from-origin animation, images have gentle Ken Burns effect (slow zoom) in slideshow mode
- Booking widget dates: Calendar popup with smooth fade, selected dates highlight in Lagoon Teal with soft pulse
- Room detail booking: Sticky booking widget scrolls into fixed position with spring animation when user reaches details section
- Activity filter tabs: Active tab gets Rosewood underline that slides smoothly to new position, grid items crossfade with stagger

**Technical Implementation:**
- Webflow Interactions 2.0: Scroll-based parallax, hover card interactions, booking widget sticky behavior, tab content switching
- GSAP ScrollTrigger: Ken Burns gallery effect, word-by-word text reveal, gradient overlay scroll-linking
- Flatpickr: Custom-styled date picker for booking form (embedded via custom code)
- Lottie: Decorative leaf/wave animation dividers between sections, loading animation with brand monogram
- Client-First: `.section_hero-resort`, `.grid_accommodations`, `.card_room`, `.slider_testimonials`, `.widget_booking`, `.is-selected`, `.is-available` states

---

## 9. QUANTUM - Quantum Computing & Deep Tech

### 1. Production Name & Premium Industry Niche

**Template Name:** QUANTUM  
**Target Industry:** Quantum Computing & Deep Tech Research  
**Ideal Client:** Quantum computing startups, quantum hardware manufacturers, deep-tech research labs, quantum-as-a-service platforms, and post-quantum cryptography companies.

### 2. Visual Aesthetic & Typographic Pairing

**Color Palette:**

| Role | Color Name | Hex Code |
|------|-----------|----------|
| Primary | Qubit Indigo | `#1A0533` |
| Secondary | Superposition Blue | `#4361EE` |
| Accent | Entanglement Pink | `#E040FB` |
| Background Dark | Absolute Zero | `#08000F` |
| Background Light | Frost | `#F5F3FF` |
| Text | Probability Gray | `#B4A7D6` |

**Dark/Light Mode Balance:** 88% dark-dominant. Quantum computing demands a cosmic, deep-space aesthetic reflecting the abstract nature of quantum mechanics. Deep purples and indigos create a sense of operating at the quantum level. Entanglement Pink for accent creates visual "quantum links" between elements. Light mode only for technical documentation and API reference pages.

**Premium Font Combinations:**
- Headlines: Outfit 800 (geometric futurism)
- Subheadlines: Outfit 500 (clean technical)
- Body: Plus Jakarta Sans 400 (modern readability)
- Code/Technical: Fira Code 400 (ligature-enabled monospace)
- Accent/Labels: Outfit 600 uppercase tracking +2px

### 3. Exact Page Architecture

**Page 1: Home**
- Header: Transparent with quantum-dot animated logo, nav center, "Access Platform" gradient CTA right (`.navbar_transparent-quantum`)
- Hero: Dark background with animated quantum circuit diagram (SVG lines connecting qubit nodes with pulse animations), gradient headline text, sub-text explaining quantum advantage, dual CTAs (`.section_hero-quantum`)
- Metrics: Qubit count, gate fidelity percentage, quantum volume, research papers (`.section_metrics-quantum`)
- Platform Pillars: 3-column cards (Hardware, Software, Cloud) with holographic border effects (`.grid_pillars`)
- Use Cases: Scrolling section showing quantum applications (Optimization, Simulation, Cryptography, ML) (`.section_use-cases`)
- Research Highlights: Latest 3 publications from CMS (`.list_research-recent`)
- Partners: Academic and corporate partner logos (`.marquee_partners`)
- Footer: Dark with API status indicator, documentation links, social, legal (`.footer_quantum`)

**Page 2: Platform / Technology**
- Header: Sticky dark with active section indicator
- Architecture: Layered diagram showing hardware > control electronics > middleware > SDK > applications (`.section_architecture`)
- Hardware: Qubit technology explanation with technical specifications (`.section_hardware`)
- Software Stack: SDK features, supported languages, quantum gates catalog (`.section_software`)
- Cloud Access: API overview, pricing tiers for quantum compute time (`.section_cloud`)
- Benchmarks: Performance comparison tables and charts (`.section_benchmarks`)
- Roadmap: Visual timeline of qubit scaling roadmap (`.timeline_roadmap`)

**Page 3: Solutions / Use Cases (CMS Collection)**
- Header: Sticky dark
- Industry Filter: Finance, Pharma, Materials, Logistics, Energy, Cryptography (`.filter_industries`)
- Solution Cards: Industry icon, problem statement, quantum advantage description, case study link (`.grid_solutions`)
- CMS Collection: `Solutions` with fields: Name, Slug, Industry (option), Problem Statement (text), Quantum Approach (rich text), Speedup Factor (text), Case Study (reference), Icon (image)

**Page 4: Research & Publications**
- Header: Sticky dark
- Research Areas: Cards for each focus area (Error Correction, Topological Qubits, Quantum Algorithms, Quantum ML) (`.grid_research-areas`)
- Publications: CMS list with title, authors, journal/conference, date, arxiv link (`.list_publications`)
- CMS Collection: `Publications` with fields: Title, Authors (text), Venue (text), Date, Abstract (text), ArXiv URL, DOI URL, Research Area (reference), Type (option: Paper/Patent/Preprint)
- Patent Portfolio: Count and highlights (`.section_patents`)

**Page 5: Developers / Documentation**
- Header: Sticky dark
- Quick Start: Code snippet showcasing simple quantum circuit in their SDK (`.section_quickstart`)
- SDK Features: Feature cards with code examples (`.grid_sdk-features`)
- API Reference: Link to full docs with preview of endpoint structure (`.section_api-preview`)
- Tutorials: Step-by-step guides from CMS (`.grid_tutorials`)
- Community: GitHub stars count, Discord members, contributor info (`.section_community`)

**Page 6: Team & Advisors**
- Header: Sticky dark
- Founders: Large cards with photo, name, PhD institution, research focus (`.grid_founders`)
- Engineering Team: Grid with specialization badges (Quantum Physics, Cryogenics, Controls, Software) (`.grid_engineering`)
- Scientific Advisory: Nobel laureates and senior researchers (`.grid_advisors`)
- CMS Collection: `Team` with fields: Name, Role, Photo, Institution (text), Specialization (text), Bio (rich text), Publications Count (number), Level (option)
- Open Positions: Link to careers with team size counter (`.card_careers`)

**Page 7: News & Events**
- Header: Sticky dark
- Featured: Latest milestone announcement (`.card_news-featured`)
- News Grid: Cards with category badge, date, title, excerpt (`.grid_news`)
- CMS Collection: `News` with fields: Title, Slug, Category (option: Milestone/Partnership/Research/Funding/Event), Date, Featured Image, Body (rich text)
- Events: Conference appearances, webinars, demos (`.list_events`)

**Page 8: Partners & Ecosystem**
- Header: Sticky dark
- Partner Tiers: Strategic, Technology, Academic partner levels (`.section_partner-tiers`)
- Partner Grid: Logos with link to co-created solutions (`.grid_partners`)
- Integration: How their platform integrates with classical computing infrastructure (`.section_integration`)
- Partner Program: Become a partner CTA with benefits overview (`.section_partner-program`)

**Page 9: Contact / Access**
- Header: Sticky dark
- Access Tiers: Free tier, Research, Enterprise with feature comparison (`.grid_access-tiers`)
- Demo Request: Form for scheduling live quantum computation demo (`.form_demo`)
- Academic Access: Special access program for universities (`.section_academic-access`)
- Contact: General inquiries, partnerships, media (`.form_contact`)

### 4. Custom Micro-Interactions & Scroll Mechanics

**Scroll Behaviors:**
- Quantum circuit hero: SVG circuit nodes pulse in sequence on scroll, connection lines draw progressively (stroke-dashoffset controlled by scroll position via GSAP ScrollTrigger)
- Metrics counters: Numbers display in binary (0/1 rapid toggle) before settling on final decimal value, creating quantum measurement collapse effect
- Architecture layers: Each layer slides in from alternating sides with depth (translateZ) as user scrolls through section
- Use cases section: Horizontal pin-scroll with each use case card snapping into center focus position
- Platform pillars: Cards emerge from center with scale (0.7 to 1.0) and rotate slightly (rotateY 5deg to 0deg)

**Hover Behaviors:**
- Pillar cards: Holographic border effect - border color cycles through spectrum (hue-rotate animation activates on hover), background gains subtle animated gradient
- Solution cards: Entanglement Pink glow appears (box-shadow: 0 0 30px rgba(224,64,251,0.2)), icon floats up 5px with spring easing
- Team photos: Circular clip-path expands revealing full rectangular image, background quantum noise pattern appears
- Code blocks: Syntax highlighting intensifies (increased contrast), copy button slides in from right

**Click Behaviors:**
- Architecture diagram layers: Clicking a layer expands it vertically showing detail, other layers compress with reduced opacity (GSAP accordion with shared timeline)
- Publication item: Expands inline showing abstract with smooth height animation, "View Paper" and "Cite" buttons fade in
- Access tier select: Selected tier card lifts with increased scale (1.02), others dim (opacity 0.6), gradient border activates on selected
- Quantum circuit nodes (hero): Clicking a node creates ripple animation (expanding circle that fades), connected nodes pulse in response (entanglement visual)

**Technical Implementation:**
- Webflow Interactions 2.0: Hover effects on cards, scroll-into-view triggers for section reveals, click interactions for expandable elements
- GSAP ScrollTrigger: SVG circuit drawing, horizontal pin-scroll for use cases, parallax layer depth, binary counter effect
- Three.js/Spline: 3D quantum chip visualization rotatable by mouse movement (embedded in hero section)
- Custom JS: Binary-to-decimal counter animation, hue-rotate border effect, ripple click animation on SVG nodes
- Lottie: Quantum spin loading animation, particle entanglement connection effect, wavefunction collapse animation
- Client-First: `.section_hero-quantum`, `.grid_solutions`, `.card_pillar`, `.timeline_roadmap`, `.navbar_transparent-quantum`, `.is-expanded`, `.is-selected`, `.is-entangled` state classes

---

## 10. SOVEREIGN - Private Banking & Family Office

### 1. Production Name & Premium Industry Niche

**Template Name:** SOVEREIGN  
**Target Industry:** Private Banking & Family Office  
**Ideal Client:** Multi-family offices, private wealth management firms, boutique private banks, trust and estate planning firms, and ultra-high-net-worth advisory services.

### 2. Visual Aesthetic & Typographic Pairing

**Color Palette:**

| Role | Color Name | Hex Code |
|------|-----------|----------|
| Primary | Heritage Navy | `#0F1C3F` |
| Secondary | Bullion Gold | `#BFA14A` |
| Accent | Trust Emerald | `#1B6B4A` |
| Background Dark | Vault Black | `#0A0E1A` |
| Background Light | Parchment | `#FAF7F2` |
| Text | Sterling | `#9CA3AF` |

**Dark/Light Mode Balance:** 60% dark / 40% light. Private banking requires gravitas and trust. Dark sections establish authority for hero and capability presentations. Light parchment backgrounds for service descriptions, team bios, and contact sections create approachable professionalism. Bullion Gold used exclusively for key metrics and primary CTAs.

**Premium Font Combinations:**
- Headlines: EB Garamond 700 (established authority)
- Subheadlines: EB Garamond 500 (timeless structure)
- Body: Source Serif Pro 400 (trusted readability)
- Navigation: Lato 500 uppercase tracking +3px (refined modern)
- Data/Figures: Lato 700 tabular figures (financial precision)

### 3. Exact Page Architecture

**Page 1: Home**
- Header: Sticky with navy background, gold logo left, navigation center, "Client Portal" button right (`.navbar_sticky-sovereign`)
- Hero: Half-height with textured dark background (subtle linen texture overlay), centered headline in gold, sub-text, "Schedule Consultation" CTA (`.section_hero-sovereign`)
- Heritage Bar: Founded year, AUM, generations served, jurisdictions (`.bar_heritage`)
- Services Preview: 3 elegant cards (Wealth Management, Estate Planning, Tax Strategy) with gold line accents (`.grid_services-preview`)
- Philosophy: Full-width centered text on parchment background with pull-quote styling (`.section_philosophy`)
- Differentiators: 4-point value proposition with icons (`.grid_differentiators`)
- Discreet Testimonial: Anonymous quote attributed to "Managing Director, Fortune 500" style (`.section_testimonial-discreet`)
- Footer: Navy with minimal links, regulatory disclosures, compliance text (`.footer_regulated`)

**Page 2: Services**
- Header: Sticky navy
- Service Categories: Large clickable blocks for each service area (`.grid_service-categories`)
- Wealth Management: Description, approach, minimum thresholds (`.section_wealth-mgmt`)
- Estate & Trust: Multi-generational planning overview (`.section_estate`)
- Tax Strategy: Cross-border and domestic tax optimization (`.section_tax`)
- Philanthropic Advisory: Foundation and charitable giving strategy (`.section_philanthropy`)
- Direct Investments: Co-investment and direct deal access (`.section_direct-invest`)
- CMS Collection: `Services` with fields: Name, Slug, Category (option), Description (rich text), Key Benefits (rich text), Icon (image), Minimum (text)

**Page 3: Team (CMS Collection)**
- Header: Sticky navy
- Partners: Large portrait cards with name, title, decades of experience, specialization (`.grid_partners`)
- Directors: Medium cards with credentials and focus areas (`.grid_directors`)
- CMS Collection: `Team` with fields: Name, Title, Photo, Bio (rich text), Credentials (text), Specialization (text), Experience Years (number), Level (option: Partner/Director/Associate)
- Advisory Council: Names and former positions of advisory board (`.list_advisory`)

**Page 4: Team Member Detail (CMS Template)**
- Header: Sticky navy
- Profile: Large photo, name, title, credentials, specialization (`.section_profile-hero`)
- Biography: Rich text biography (`.richtext_biography`)
- Expertise Areas: Tag list of expertise (`.list_expertise`)
- Publications: Any authored insights or thought pieces (`.list_member-publications`)

**Page 5: Insights**
- Header: Sticky navy
- Market Commentary: Latest macro perspective (`.card_commentary-featured`)
- Insight Grid: Cards with category (Market/Tax/Estate/Strategy), date, title (`.grid_insights`)
- CMS Collection: `Insights` with fields: Title, Slug, Category (option), Author (reference), Date, Body (rich text), Summary (text), Featured (boolean)
- Quarterly Letter: Download link for latest quarterly client letter (`.section_quarterly`)

**Page 6: Heritage / About**
- Header: Sticky navy
- Founding Story: Elegant narrative with historical imagery (`.section_founding`)
- Timeline: Key milestones in firm history (`.timeline_heritage`)
- Values: Discretion, Stewardship, Independence, Alignment of Interest (`.section_values`)
- Governance: Firm structure and independence statement (`.section_governance`)
- Memberships: Professional association memberships (`.list_memberships`)

**Page 7: Client Portal (Gated)**
- Header: Sticky navy
- Login: Minimal login form with multi-factor authentication note (`.form_client-login`)
- Portal Preview: Blurred dashboard screenshot showing portfolio overview (`.section_portal-preview`)
- Security Statement: Encryption and data protection information (`.section_security`)
- New Client Onboarding: Link to onboarding process overview (`.card_onboarding`)

**Page 8: Contact**
- Header: Sticky navy
- Consultation Request: Form with assets range selector, service interest, preferred contact method (`.form_consultation`)
- Offices: Elegant cards with major city locations (Zurich, London, Singapore, New York) (`.grid_offices`)
- Compliance Note: Regulatory and confidentiality assurances (`.section_compliance-note`)

### 4. Custom Micro-Interactions & Scroll Mechanics

**Scroll Behaviors:**
- Hero texture: Linen texture overlay has subtle movement (translateX/Y shifts by 2-3px) on scroll creating living texture effect
- Heritage bar: Numbers count up with refined easing (ease-out-expo) when entering viewport, gold underline draws beneath each metric
- Service cards: Reveal with 150ms stagger, gold left-border draws from top to bottom (height 0 to 100%)
- Philosophy text: Paragraph fades in line-by-line with 200ms delay between lines using Webflow scroll-into-view with stagger
- Section dividers: Thin gold horizontal rule expands from center (width 0% to 60%) on scroll

**Hover Behaviors:**
- Service category blocks: Background shifts from navy to slightly lighter shade, gold border-top appears (3px), inner text slightly brighter
- Team photos: Subtle warm filter applied (filter: sepia(0.1) brightness(1.05)), name card slides up from bottom with title
- Insight cards: Left gold accent bar expands from 0 to 4px, title color transitions from Sterling to Bullion Gold
- Navigation links: Understated underline appears from left, 300ms ease-in-out, thin 1px gold line

**Click Behaviors:**
- Service category: Smooth scroll to relevant section with anchor offset, category in nav highlights
- Client portal login: Form validates with subtle animation, loading state shows gold spinner, redirects with fade
- Team member: Page transition with soft fade-out (400ms) before navigating to detail page
- Consultation form submit: Button transforms to "Thank you" message with checkmark, form fields gracefully fade out

**Technical Implementation:**
- Webflow Interactions 2.0: Scroll-triggered reveals with stagger, hover interactions on cards, form submission states, page load entrance
- GSAP ScrollTrigger: Counter animations with easing, line-by-line text reveal, horizontal rule expansion from center
- Custom CSS: Subtle texture overlay animation using background-position shift on scroll
- Lottie: Elegant monogram reveal on page load, gold spinner for loading states
- Client-First: `.section_hero-sovereign`, `.grid_services-preview`, `.card_service`, `.navbar_sticky-sovereign`, `.form_consultation`, `.is-authenticated`, `.is-loading` states

---

## 11. PRISM - Contemporary Art Gallery & Auction House

### 1. Production Name & Premium Industry Niche

**Template Name:** PRISM  
**Target Industry:** Contemporary Art Gallery & Auction House  
**Ideal Client:** Blue-chip contemporary art galleries, international auction houses, private art dealerships, museum exhibition spaces, and art investment advisory firms.

### 2. Visual Aesthetic & Typographic Pairing

**Color Palette:**

| Role | Color Name | Hex Code |
|------|-----------|----------|
| Primary | Gallery White | `#FFFFFF` |
| Secondary | Carbon | `#1A1A1A` |
| Accent | Vermillion | `#E63946` |
| Background Dark | Exhibition Black | `#0D0D0D` |
| Background Light | Canvas | `#FEFEFE` |
| Text | Graphite | `#4A4A4A` |

**Dark/Light Mode Balance:** 55% light / 45% dark. Art galleries prioritize the artwork itself. Light gallery-white backgrounds serve as neutral canvases for art display. Dark backgrounds used for evening auctions, exclusive viewings, and dramatic artist spotlight sections. Vermillion used as a single punctuation accent - for live auction indicators, prices, and urgent CTAs.

**Premium Font Combinations:**
- Headlines: Canela 700 (contemporary editorial)
- Subheadlines: Neue Haas Grotesk Display 500 (museum standard)
- Body: Neue Haas Grotesk Text 400 (gallery-grade readability)
- Navigation: Neue Haas Grotesk Display 500 uppercase tracking +3px
- Prices/Data: Suisse Intl 600 (Swiss precision for figures)
- Note: If Google Fonts only: Headlines: DM Serif Display 400, Body: DM Sans 400

### 3. Exact Page Architecture

**Page 1: Home**
- Header: Fixed transparent with logo left (wordmark), navigation right, no background until scroll (`.navbar_fixed-gallery`)
- Hero: Full-viewport single artwork image (rotates from CMS featured works) with artist name and title in corner, "Current Exhibition" text link (`.section_hero-artwork`)
- Current Exhibition: Large banner card with exhibition title, dates, "View Works" CTA (`.section_exhibition-current`)
- Selected Works: Horizontal scrolling artwork cards with image, artist, title, medium, year (`.slider_selected-works`)
- Upcoming: Next 2 exhibitions with dates and preview images (`.grid_upcoming`)
- Artists: Horizontal marquee of represented artist names in large text (`.marquee_artists`)
- Newsletter: Minimal signup for exhibition notifications (`.section_newsletter`)
- Footer: Clean white with gallery hours, address, social, "By Appointment" note (`.footer_gallery`)

**Page 2: Exhibitions (CMS Collection)**
- Header: Fixed minimal
- Exhibition List: Large-format entries with hero image, title, artist(s), dates, status (Current/Upcoming/Past) (`.list_exhibitions`)
- CMS Collection: `Exhibitions` with fields: Title, Slug, Artist(s) (multi-reference), Start Date, End Date, Status (option: Current/Upcoming/Past), Hero Image, Description (rich text), Press Release (rich text), Works (multi-reference to Artworks)
- Filter: Status tabs (Current, Upcoming, Past) (`.tabs_exhibition-status`)
- Archive: Searchable past exhibition archive (`.section_archive`)

**Page 3: Exhibition Detail (CMS Template)**
- Header: Fixed transparent
- Hero: Exhibition title with dates, large-format hero image (`.section_hero-exhibition`)
- Description: Curatorial statement and exhibition text (`.richtext_exhibition`)
- Works Grid: Artworks in this exhibition displayed in clean grid with generous white space (`.grid_exhibition-works`)
- Press: Downloadable press release and press images (`.section_press-kit`)
- Related: Other exhibitions by the same artist(s) (`.grid_related-exhibitions`)

**Page 4: Artists (CMS Collection)**
- Header: Fixed minimal
- Artist Grid: Clean grid with representative artwork image, artist name, nationality, birth year (`.grid_artists`)
- CMS Collection: `Artists` with fields: Name, Slug, Nationality (text), Birth Year (number), Bio (rich text), Portrait (image), Representative Image, CV (rich text), Website (URL), Represented (boolean)
- Alphabet Navigation: A-Z jump links for artist directory (`.nav_alphabet`)

**Page 5: Artist Detail (CMS Template)**
- Header: Fixed transparent
- Hero: Artist name large, nationality, born year, representative artwork background (`.section_hero-artist`)
- Bio: Artist biography and statement (`.richtext_artist-bio`)
- Available Works: Grid of available artworks by this artist (`.grid_artist-works`)
- Exhibition History: List of exhibitions at this gallery (`.list_artist-exhibitions`)
- CV: Formatted artist CV (education, exhibitions, collections, publications) (`.section_artist-cv`)

**Page 6: Artworks / Available Works (CMS Collection)**
- Header: Fixed minimal
- Filter: By artist, medium, price range, year, availability (`.filter_artworks`)
- Artwork Grid: Clean white-space-heavy grid with image, artist, title, year, medium, dimensions (`.grid_artworks`)
- CMS Collection: `Artworks` with fields: Title, Slug, Artist (reference), Year (number), Medium (text), Dimensions (text), Edition (text), Price (number), Price Display (text: "Price on Request" or formatted), Hero Image, Additional Images (multi-image), Status (option: Available/Sold/On Hold/On Loan), Exhibition (reference)
- Inquiry: Each work has "Inquire" link triggering contact form pre-filled with artwork info (`.link_inquire`)

**Page 7: Auctions**
- Header: Fixed with countdown timer for next auction
- Upcoming Auction: Hero with auction date, preview dates, catalog download (`.section_auction-upcoming`)
- Lot Preview: Grid of featured lots with estimate ranges (`.grid_lots-preview`)
- Past Results: Notable past auction results (`.section_past-results`)
- Register: Bidder registration form and requirements (`.form_register-bidder`)
- Calendar: Annual auction schedule (`.calendar_auctions`)

**Page 8: Viewing Room (Online)**
- Header: Fixed minimal
- Virtual Exhibition: Large-format single artwork per viewport with details panel (`.section_viewing-room`)
- Navigation: Previous/Next arrows, artwork counter (`.nav_viewing-room`)
- Details Panel: Expandable side panel with full artwork info and "Inquire" CTA (`.panel_artwork-details`)
- Private Access: Password-protected viewing rooms for VIP collectors (`.section_private-viewing`)

**Page 9: Contact / Visit**
- Header: Fixed transparent
- Gallery Info: Hours, address with map, visiting guidelines (`.section_gallery-info`)
- Inquiry Form: Name, Email, Phone, Inquiry Type (General/Artwork/Exhibition/Consignment), Message, Artwork Reference (optional) (`.form_inquiry`)
- Private Appointments: Request form for private viewings (`.form_appointment`)
- Art Advisory: Services for collectors and institutions (`.section_advisory`)

### 4. Custom Micro-Interactions & Scroll Mechanics

**Scroll Behaviors:**
- Hero artwork: No parallax - artwork remains perfectly static (respecting the art), only UI elements (text, navigation) fade on scroll
- Selected works slider: Auto-advances slowly (8s per slide) but pauses when user is in viewport, controlled by Webflow scroll position
- Exhibition entries: Each entry fades in with very subtle Y-offset (15px only - understated), 300ms ease, maintaining gallery minimalism
- Artist marquee: Continuous scroll speed increases slightly as user scrolls down the page (GSAP ScrollTrigger modifying CSS animation speed)
- Artwork grid: Items appear with pure opacity fade (no movement - letting art speak), 100ms stagger

**Hover Behaviors:**
- Artwork cards: Zero movement or scale (respecting the artwork). Only: thin Vermillion border appears (1px), "View" text fades in at bottom-right corner
- Artist names in marquee: Hovered name gets Vermillion color, other names reduce opacity to 0.4
- Exhibition cards: Date text shifts to Vermillion, subtle arrow appears indicating clickable state
- Navigation: Clean underline appears, 200ms, no bounce or spring - gallery-appropriate restraint

**Click Behaviors:**
- Artwork "Inquire": Side panel slides from right with artwork image, details, and pre-filled inquiry form, overlay at 0.3 opacity only
- Exhibition entry: Page transition with clean fade (no fancy effects - gallery aesthetic demands simplicity)
- Viewing Room navigation: Artwork crossfades with 600ms transition, details panel updates with stagger (title first, then details)
- Filter selections: Grid items fade out (200ms), reflow, fade in (300ms) - no jarring movements

**Technical Implementation:**
- Webflow Interactions 2.0: Minimal hover states (opacity only), scroll-into-view for subtle reveals, click for panel open/close
- GSAP: ScrollTrigger for marquee speed modulation, Flip plugin for filter grid reflow animation
- No Lottie: Intentionally minimal animation to maintain gallery gravitas - art is the hero, not the interface
- Custom CSS: Precise grid gaps using CSS Grid with responsive breakpoints maintaining gallery-standard white space ratios
- Client-First: `.section_hero-artwork`, `.grid_artworks`, `.card_artwork`, `.panel_artwork-details`, `.slider_selected-works`, `.is-available`, `.is-sold`, `.is-current`, `.is-past` states

---

## 12. CATALYST - Pharmaceutical & Clinical Trials

### 1. Production Name & Premium Industry Niche

**Template Name:** CATALYST  
**Target Industry:** Pharmaceutical & Clinical Trials  
**Ideal Client:** Pharmaceutical companies, clinical trial CROs (Contract Research Organizations), biotech drug development firms, medical device companies, and regulatory affairs consultancies.

### 2. Visual Aesthetic & Typographic Pairing

**Color Palette:**

| Role | Color Name | Hex Code |
|------|-----------|----------|
| Primary | Pharma Blue | `#1B4B8A` |
| Secondary | Clinical Teal | `#0D9488` |
| Accent | Trial Orange | `#F97316` |
| Background Dark | Lab Dark | `#0C1220` |
| Background Light | Clinical White | `#F8FAFC` |
| Text | Dosage Gray | `#64748B` |

**Dark/Light Mode Balance:** 35% dark / 65% light. Pharmaceutical demands clinical cleanliness and regulatory compliance feel. Light backgrounds dominate for trustworthiness and accessibility compliance (WCAG AAA). Dark sections reserved for hero moments and data visualization dashboards. Trial Orange used for active trial indicators and key CTAs.

**Premium Font Combinations:**
- Headlines: Lexend 700 (accessibility-optimized readability)
- Subheadlines: Lexend 500 (structured hierarchy)
- Body: Lexend 400 (designed for reading ease)
- Technical/Data: IBM Plex Mono 400 (clinical data display)
- Accent/Status: Lexend 600 uppercase tracking +1.5px

### 3. Exact Page Architecture

**Page 1: Home**
- Header: Sticky white with blue logo, navigation, "For Patients" and "For Investigators" dual CTAs (`.navbar_sticky-clinical`)
- Hero: Light background with abstract molecular animation (subtle), headline about transforming patient outcomes, sub-text, "View Pipeline" primary CTA (`.section_hero-clinical`)
- Pipeline Snapshot: Visual progress indicators showing Phase I/II/III/Approved counts (`.section_pipeline-snapshot`)
- Therapeutic Areas: 4-column cards with icons for Oncology, Neurology, Immunology, Rare Disease (`.grid_therapeutic-areas`)
- Featured Trial: Card highlighting actively recruiting trial with "Learn More" (`.card_trial-featured`)
- News: Latest 3 press releases (`.list_news-recent`)
- Partners: Research institution and hospital logos (`.bar_partners`)
- Compliance Footer: Detailed regulatory disclaimers, adverse event reporting contact, privacy notice (`.footer_regulated`)

**Page 2: Pipeline**
- Header: Sticky white
- Pipeline Visualization: Interactive horizontal pipeline chart showing all products by phase (`.chart_pipeline`)
- Filter: By therapeutic area, phase, indication (`.filter_pipeline`)
- Product List: Cards with molecule name, indication, phase badge, mechanism of action summary (`.grid_pipeline-products`)
- CMS Collection: `Pipeline Products` with fields: Molecule Name, Slug, Brand Name (text), Indication (text), Therapeutic Area (option: Oncology/Neurology/Immunology/Cardiology/Rare Disease/Infectious Disease), Phase (option: Preclinical/Phase I/Phase II/Phase III/Filed/Approved), Mechanism (text), Description (rich text), Trial ID (text), Status (option: Active/Completed/Paused)
- Legend: Phase definitions and regulatory pathway explanation (`.section_legend`)

**Page 3: Product Detail (CMS Template)**
- Header: Sticky white
- Hero: Product name, indication, phase badge, therapeutic area tag (`.section_hero-product`)
- Overview: Mechanism of action, target patient population, unmet need (`.section_product-overview`)
- Clinical Data: Key efficacy and safety data summaries with charts (`.section_clinical-data`)
- Trial Information: Associated clinical trial details with ClinicalTrials.gov link (`.section_trial-info`)
- Publications: Related peer-reviewed publications (`.list_product-publications`)
- Regulatory Status: Approval status by geography (`.table_regulatory-status`)

**Page 4: Clinical Trials**
- Header: Sticky white
- Active Trials: Cards with trial ID, title, phase, status (Recruiting/Active/Completed), locations (`.grid_trials`)
- CMS Collection: `Clinical Trials` with fields: Trial ID, Title, Slug, Phase (option), Status (option: Recruiting/Active Not Recruiting/Completed/Terminated), Indication (text), Product (reference), Locations (text), Start Date, Primary Completion Date, ClinicalTrials.gov URL, Inclusion Criteria (rich text), Contact Info (text)
- Trial Finder: Filter by condition, location, phase (`.section_trial-finder`)
- Patient Resources: Information for potential trial participants (`.section_patient-resources`)

**Page 5: Science & Research**
- Header: Sticky white
- Research Philosophy: Company approach to drug discovery (`.section_research-philosophy`)
- Technology Platforms: Cards for proprietary technology platforms (`.grid_platforms`)
- Publications: Peer-reviewed paper list with filters (`.list_publications-filtered`)
- CMS Collection: `Publications` with fields: Title, Authors, Journal, Date, DOI, Abstract, Therapeutic Area (reference), Type (option: Clinical/Preclinical/Review)
- Collaborations: Academic and industry research partnerships (`.grid_collaborations`)

**Page 6: About / Company**
- Header: Sticky white
- Mission: Patient-centric mission statement (`.section_mission`)
- Leadership: Executive team grid with credentials (`.grid_leadership`)
- CMS Collection: `Leaders` with fields: Name, Title, Photo, Bio (rich text), Previous (text), Education (text)
- History: Company milestones and drug approvals timeline (`.timeline_company`)
- ESG: Environmental, social, governance commitments (`.section_esg`)
- Locations: Global offices and research facilities (`.grid_locations`)

**Page 7: Investors**
- Header: Sticky white
- Stock Info: Ticker display, latest price (placeholder), market cap (`.section_stock-info`)
- Financial Highlights: Revenue, R&D spend, cash position cards (`.grid_financials`)
- SEC Filings: List of recent filings with download links (`.list_filings`)
- Events: Upcoming investor conferences and earnings calls (`.list_investor-events`)
- Governance: Board of directors and committee information (`.section_governance`)
- Contact IR: Investor relations contact info (`.section_ir-contact`)

**Page 8: Careers**
- Header: Sticky white
- Culture: Values and working environment (`.section_culture`)
- Benefits: Grid of employee benefits (`.grid_benefits`)
- Open Positions: CMS-driven job listings filterable by department, location (`.list_positions`)
- CMS Collection: `Positions` with fields: Title, Department (option), Location (text), Type (option: Full-time/Contract), Description (rich text), Apply URL
- Diversity: Inclusion and diversity commitment (`.section_diversity`)

**Page 9: Contact**
- Header: Sticky white
- Contact Types: Separate sections for Medical Information, Adverse Events, General, Media, Investors (`.grid_contact-types`)
- Medical Information: Phone and form for HCP inquiries (`.section_medical-info`)
- Adverse Event Reporting: Prominent reporting mechanism (required by regulation) (`.section_adverse-events`)
- General Form: Department selector, name, email, message (`.form_general`)
- Global Offices: Address cards with map (`.grid_offices`)

### 4. Custom Micro-Interactions & Scroll Mechanics

**Scroll Behaviors:**
- Pipeline chart: Phase columns build up (height animation from 0 to data-driven height) sequentially left-to-right as section scrolls into view, 200ms stagger per phase
- Therapeutic area cards: Fade up with 100ms stagger, icon draws itself (Lottie trigger on scroll-into-view)
- Trial status indicators: Dot indicators pulse animation triggers when visible (green pulse for recruiting, amber for active)
- Stats counters: Numbers count up with ease-out-quint easing, formatted with commas appearing at correct thresholds
- Section navigation: Sticky side-nav dots appear showing current section for long pages (Pipeline, Products)

**Hover Behaviors:**
- Pipeline product cards: Phase badge pulses once, left border extends from top (0 to full height) in Clinical Teal, shadow increases subtly
- Trial cards: Status badge background brightens, "View Details" text appears below with slide-up transition
- Leadership photos: Professional hover - subtle brightness increase (1.02), thin bottom border in Pharma Blue appears
- Navigation links: Pharma Blue underline from left to right, 250ms ease

**Click Behaviors:**
- Pipeline chart bars: Clicking a phase column filters the product list below to show only that phase, smooth scroll to filtered results
- Trial card: Expands inline with smooth height animation showing inclusion criteria, contact info, and "Apply" button
- Product detail tabs: Content crossfades between Overview/Data/Trials sections, tab indicator slides left/right
- Adverse event form: Multi-step with progress bar, each step slides horizontally, final step shows confirmation with file reference number

**Technical Implementation:**
- Webflow Interactions 2.0: Scroll-into-view triggers for section reveals, hover states on cards, tab switching, form step navigation
- GSAP ScrollTrigger: Pipeline chart bar animations, counter animations with custom number formatting, sticky section navigation
- Chart.js: Simple bar/line charts for clinical data visualization on product detail pages (embedded via custom code)
- Lottie: Medical/molecular icon animations on therapeutic area hover, loading spinners, success checkmarks
- Accessibility: All interactions respect prefers-reduced-motion, focus states on all interactive elements, ARIA labels on dynamic content
- Client-First: `.section_hero-clinical`, `.grid_pipeline-products`, `.card_trial`, `.chart_pipeline`, `.navbar_sticky-clinical`, `.is-recruiting`, `.is-active`, `.is-completed` phase states

---

## 13. NEXUS - Smart City & Urban Development

### 1. Production Name & Premium Industry Niche

**Template Name:** NEXUS  
**Target Industry:** Smart City & Urban Development  
**Ideal Client:** Smart city technology providers, urban planning consultancies, IoT infrastructure companies, sustainable urban development firms, and municipal innovation departments.

### 2. Visual Aesthetic & Typographic Pairing

**Color Palette:**

| Role | Color Name | Hex Code |
|------|-----------|----------|
| Primary | Urban Slate | `#1E293B` |
| Secondary | Grid Cyan | `#06B6D4` |
| Accent | Civic Green | `#10B981` |
| Background Dark | Metro Dark | `#0F172A` |
| Background Light | Blueprint White | `#F1F5F9` |
| Text | Concrete | `#94A3B8` |

**Dark/Light Mode Balance:** 70% dark / 30% light. Smart city platforms require data-dense dashboards on dark backgrounds for optimal visualization. Light backgrounds for project case studies, community engagement sections, and proposal documents. Grid Cyan represents digital connectivity. Civic Green signals sustainability and progress.

**Premium Font Combinations:**
- Headlines: Urbanist 800 (geometric, city-inspired)
- Subheadlines: Urbanist 500 (structured grid feel)
- Body: Inter 400 (universal clarity)
- Data/Technical: Space Mono 400 (engineering precision)
- Accent/Labels: Urbanist 700 uppercase tracking +2px

### 3. Exact Page Architecture

**Page 1: Home**
- Header: Sticky dark with icon logo, navigation, "Request Proposal" CTA in Civic Green (`.navbar_sticky-urban`)
- Hero: Dark background with animated city grid visualization (CSS grid lines pulsing with data flow dots), headline about connected urban futures, dual CTAs (`.section_hero-nexus`)
- Impact Metrics: Cities deployed, sensors connected, data points processed daily, carbon reduced (`.section_impact-metrics`)
- Solutions Preview: 4-column cards for Mobility, Energy, Safety, Infrastructure (`.grid_solutions-preview`)
- Live Dashboard: Simulated real-time city dashboard showing traffic, energy, air quality metrics (`.section_dashboard-live`)
- Case Study Featured: Large card with city name, challenge, impact metrics (`.card_casestudy-featured`)
- Technology Partners: IoT platform, cloud provider, and hardware partner logos (`.bar_partners`)
- Footer: Dark with product links, press, careers, compliance (`.footer_smart-city`)

**Page 2: Solutions (CMS Collection)**
- Header: Sticky dark
- Solution Categories: Large clickable category blocks (Smart Mobility, Smart Energy, Public Safety, Smart Infrastructure, Digital Governance) (`.grid_solution-categories`)
- Solution Grid: Cards with icon, solution name, brief description, deployment count (`.grid_solutions`)
- CMS Collection: `Solutions` with fields: Name, Slug, Category (option: Mobility/Energy/Safety/Infrastructure/Governance), Icon (image), Description (rich text), Key Features (rich text), Deployments (number), Hero Image, Case Studies (multi-reference)
- Comparison: Feature matrix comparing solution packages (`.table_comparison`)

**Page 3: Solution Detail (CMS Template)**
- Header: Sticky dark
- Hero: Solution name with category badge and deployment count (`.section_hero-solution`)
- Overview: Problem statement, approach, architecture diagram (`.section_solution-overview`)
- Features: Detailed feature cards with icons (`.grid_features`)
- Architecture: System architecture SVG diagram showing IoT to cloud to analytics flow (`.diagram_solution-arch`)
- Data: Key performance metrics and ROI figures (`.section_solution-metrics`)
- Case Studies: Deployments of this solution (`.grid_solution-cases`)

**Page 4: Projects / Case Studies (CMS Collection)**
- Header: Sticky dark
- Map View: Interactive map showing global deployments with pins (`.section_project-map`)
- Project Grid: Cards with city photo, name, solutions deployed, year, key metric improvement (`.grid_projects`)
- CMS Collection: `Projects` with fields: City Name, Slug, Country (text), Population (number), Solutions Deployed (multi-reference), Year (number), Hero Image, Description (rich text), Key Metrics (rich text), Testimonial (text), Contact (text), Latitude (number), Longitude (number)
- Filter: By region, solution type, city size (`.filter_projects`)

**Page 5: Project Detail (CMS Template)**
- Header: Sticky dark
- Hero: City aerial image with name overlay and quick stats (`.section_hero-project`)
- Challenge: Urban challenge description (`.section_challenge`)
- Solution: Technologies deployed and integration approach (`.section_solution-deployed`)
- Results: Before/after metrics with progress bars and percentages (`.section_results`)
- Timeline: Project implementation timeline (`.timeline_project`)
- Testimonial: City official quote (`.section_testimonial-official`)

**Page 6: Technology Platform**
- Header: Sticky dark
- Platform Layers: Visual stack showing Edge/Network/Cloud/Analytics/Applications (`.section_platform-layers`)
- IoT Devices: Hardware catalog with specs (`.grid_devices`)
- Data Platform: Analytics and AI capabilities (`.section_data-platform`)
- Integrations: Third-party system integrations (legacy city systems, GIS, etc.) (`.grid_integrations`)
- Security: Cybersecurity approach for critical infrastructure (`.section_security`)
- API: Developer access and open data initiatives (`.section_api`)

**Page 7: About / Company**
- Header: Sticky dark
- Mission: Building sustainable, equitable, efficient cities (`.section_mission`)
- Team: Leadership grid with urban planning and technology credentials (`.grid_leadership`)
- Global Presence: Office locations with specialization per region (`.grid_offices`)
- Sustainability: Company ESG report highlights and commitments (`.section_sustainability`)
- Awards: Smart city and innovation awards (`.grid_awards`)

**Page 8: Resources & Insights**
- Header: Sticky dark
- Resource Types: Tabs for Whitepapers, Webinars, Reports, Data Sheets (`.tabs_resources`)
- Resource Grid: Cards with type, title, description, download CTA (`.grid_resources`)
- CMS Collection: `Resources` with fields: Title, Type (option), Description (text), File URL, Thumbnail, Date, Gated (boolean)
- Blog: Thought leadership articles on urban innovation (`.grid_blog`)
- Events: Smart city conferences and speaking engagements (`.list_events`)

**Page 9: Contact / RFP**
- Header: Sticky dark
- RFP Form: Comprehensive form for municipal procurement (City, Population, Department, Budget Range, Timeline, Requirements) (`.form_rfp`)
- Partner Inquiry: Technology and channel partner interest form (`.form_partner`)
- Demo: Request live platform demonstration (`.section_demo-request`)
- Regional Offices: Contact info organized by region with specialization (`.grid_regional-contacts`)

### 4. Custom Micro-Interactions & Scroll Mechanics

**Scroll Behaviors:**
- City grid hero: CSS grid lines pulse with traveling dots (representing data flow) that accelerate on scroll using GSAP ScrollTrigger controlling CSS animation speed
- Impact metrics: Numbers count up with locale formatting (1,000,000+) using Webflow scroll trigger with counter interaction
- Dashboard section: Simulated live data updates (numbers change subtly every 3s), section pins briefly during scroll creating "monitoring" moment
- Solution categories: Cards rotate in from slight perspective (rotateX 5deg to 0deg) with 120ms stagger
- Map pins: Appear with bounce animation as map section enters viewport, staggered by region

**Hover Behaviors:**
- Solution cards: Grid Cyan border-left appears (3px), icon gains animated pulse ring (expanding circle opacity fade), card lifts 3px
- Project cards: Image overlay lightens revealing city name, key metric number scales up (1.0 to 1.2) in Civic Green, directional arrow appears
- Dashboard metrics: Individual metric card highlights with brighter background, value text gains Civic Green color
- Partner logos: Grayscale to color, subtle floating animation (translateY 0 to -3px oscillating)

**Click Behaviors:**
- Map pins: Click expands info card with city details, connecting lines draw to nearby related deployments (SVG animation)
- Solution category: Smooth scroll to filtered solution grid, category header highlights with Civic Green underline
- Dashboard metric: Expands inline showing 30-day trend mini-chart (sparkline), historical context text appears
- RFP form: Multi-step wizard with progress bar, each step validates before allowing next, final step shows summary for review

**Technical Implementation:**
- Webflow Interactions 2.0: Scroll-into-view for all section reveals, hover card interactions, multi-step form progress
- GSAP ScrollTrigger: Data flow animation speed control, dashboard pin-scroll, map pin stagger, metric counters
- Mapbox GL JS: Interactive deployment map with custom-styled markers and popup cards (embedded via custom code)
- D3.js: Mini sparkline charts for dashboard metric expansion (embedded via custom code)
- Lottie: Data flow dot animations, loading states, success confirmations
- Client-First: `.section_hero-nexus`, `.grid_solutions`, `.card_project`, `.section_dashboard-live`, `.navbar_sticky-urban`, `.is-deployed`, `.is-planned`, `.is-active` project states

---

## 14. ECLIPSE - Luxury Automotive & Hypercar

### 1. Production Name & Premium Industry Niche

**Template Name:** ECLIPSE  
**Target Industry:** Luxury Automotive & Hypercar  
**Ideal Client:** Hypercar manufacturers, luxury automotive brands, exclusive car customization ateliers, automotive design studios, and ultra-luxury car dealerships with limited-edition inventory.

### 2. Visual Aesthetic & Typographic Pairing

**Color Palette:**

| Role | Color Name | Hex Code |
|------|-----------|----------|
| Primary | Asphalt | `#111111` |
| Secondary | Titanium | `#D4D4D8` |
| Accent | Racing Red | `#DC2626` |
| Background Dark | Midnight Carbon | `#0A0A0A` |
| Background Light | Silver Mist | `#F4F4F5` |
| Text | Exhaust | `#71717A` |

**Dark/Light Mode Balance:** 88% dark-dominant. Automotive luxury demands dramatic dark canvases that make car photography pop with maximum visual impact. Carbon fiber textures and deep blacks create the showroom-at-night atmosphere. Silver Mist reserved for specification sheets and configurator interfaces. Racing Red used as a single-point accent for performance figures and the primary CTA.

**Premium Font Combinations:**
- Headlines: Bebas Neue 400 (uppercase automotive impact)
- Subheadlines: Barlow 600 (mechanical precision)
- Body: Barlow 400 (engineered readability)
- Navigation: Barlow 500 uppercase tracking +3px
- Performance Figures: Barlow 700 tabular nums (specification authority)

### 3. Exact Page Architecture

**Page 1: Home**
- Header: Fixed transparent with minimal logo left, "Configure" CTA right in Racing Red, nav hidden in hamburger (`.navbar_fixed-automotive`)
- Hero: Full-viewport dramatic car hero image with cinematic lighting, car model name in large Bebas Neue, tagline below, "Explore" scroll-triggered CTA (`.section_hero-automotive`)
- Performance Bar: Horizontal metrics strip - 0-60, top speed, horsepower, torque (`.bar_performance`)
- Model Showcase: Full-bleed alternating image sections for each model in lineup (`.section_model-showcase`)
- Design Philosophy: Split with engineering sketch left, text about design language right (`.section_design-philosophy`)
- Heritage: Founding story with vintage imagery (`.section_heritage`)
- Latest News: 2 featured articles (`.grid_news-featured`)
- Footer: Minimal dark with legal, social, configurator link (`.footer_automotive`)

**Page 2: Models (CMS Collection)**
- Header: Fixed transparent
- Model Cards: Full-width hero images for each model with name and starting price, stacked vertically (`.list_models`)
- CMS Collection: `Models` with fields: Name, Slug, Starting Price (text), Hero Image, Gallery (multi-image), Description (rich text), Horsepower (number), Torque (text), Zero to Sixty (text), Top Speed (text), Weight (text), Engine (text), Transmission (text), Production Limit (number), Status (option: Current/Coming Soon/Sold Out/Heritage)
- Filter: By status, price range (`.filter_models`)

**Page 3: Model Detail (CMS Template)**
- Header: Fixed transparent (fades to dark on scroll)
- Hero: Cinematic car photo with model name and tagline (`.section_hero-model`)
- Gallery: Full-bleed immersive image sequence (one image per viewport height on scroll) (`.gallery_model-immersive`)
- Specifications: Full technical spec table (Engine, Performance, Chassis, Dimensions, Weight) (`.table_specifications`)
- Design: Design highlight sections with close-up detail photos and descriptions (`.section_design-details`)
- Performance: Dynamic performance data visualization (power curve, acceleration graph) (`.section_performance-data`)
- Configurator CTA: "Build Yours" full-width CTA linking to configurator (`.section_configurator-cta`)
- Pricing: Starting price with "Contact for Availability" for limited models (`.section_pricing`)

**Page 4: Configurator (Interactive)**
- Header: Minimal with back-to-model link
- Car Visualizer: Large car render area (placeholder for 3D or image swap system) (`.section_configurator-view`)
- Options Panel: Side panel with Exterior Color, Interior Material, Wheels, Carbon Package, Performance Package selections (`.panel_options`)
- Summary: Running total and selected options list (`.section_config-summary`)
- Save/Share: Save configuration and share link functionality (`.section_config-actions`)
- Submit: "Request Quote" form with configuration reference (`.form_config-request`)

**Page 5: Ownership**
- Header: Sticky dark
- Ownership Benefits: Concierge service, track days, owner events (`.grid_ownership-benefits`)
- Service: Maintenance programs and certified service centers (`.section_service`)
- Warranty: Coverage details and extension options (`.section_warranty`)
- Finance: Leasing and finance partners (`.section_finance`)
- Pre-Owned: Certified pre-owned program with available inventory (`.section_preowned`)

**Page 6: Motorsport**
- Header: Transparent
- Racing Heritage: Full-bleed motorsport imagery hero (`.section_hero-motorsport`)
- Championships: Racing series participation and results (`.grid_championships`)
- Race Cars: Track-specific model variants (`.grid_race-cars`)
- Technology Transfer: How racing tech feeds production cars (`.section_tech-transfer`)
- Calendar: Racing calendar with upcoming events (`.list_race-calendar`)

**Page 7: Design & Innovation**
- Header: Sticky dark
- Design Language: Visual essay on brand design philosophy (`.section_design-language`)
- Materials: Carbon fiber, aluminum, titanium material explorations with macro photography (`.grid_materials`)
- Aerodynamics: CFD visualization images and active aero explanations (`.section_aerodynamics`)
- Sustainability: Electric/hybrid future and sustainable material initiatives (`.section_sustainability`)
- Design Team: Lead designers with portfolio highlights (`.grid_designers`)

**Page 8: News & Events**
- Header: Sticky dark
- Featured: Launch announcement or event hero (`.card_news-featured`)
- News Grid: Cards with date, category, title, car model reference (`.grid_news`)
- CMS Collection: `News` with fields: Title, Slug, Category (option: Launch/Motorsport/Event/Partnership/Technology), Date, Featured Image, Body (rich text), Model (reference - optional)
- Events: Auto shows, private reveals, track days (`.list_events`)
- Media Kit: Downloadable press images and specs (`.section_media-kit`)

**Page 9: Contact / Dealership**
- Header: Sticky dark
- Dealer Locator: Map with authorized dealership pins (`.section_dealer-map`)
- Inquiry Form: Model interest, purchase timeline, trade-in, contact info (`.form_inquiry`)
- Test Drive: Request a test drive or private viewing (`.form_test-drive`)
- VIP: Existing owner services and concierge contact (`.section_vip-contact`)

### 4. Custom Micro-Interactions & Scroll Mechanics

**Scroll Behaviors:**
- Immersive gallery: Full-viewport images crossfade on scroll (each image occupies 100vh scroll distance before fading to next) using GSAP ScrollTrigger scrub with opacity transitions
- Performance bar: Numbers count up rapidly (0-60: counts from 0.0 to actual time, HP: counts from 0 to final number) with precision decimals when entering viewport
- Model showcase sections: Each section has the car image with subtle parallax (0.1x - very controlled, no cheap floating), text elements slide in from the side
- Hero: On page load, car image has slight zoom-out (1.05 to 1.0) over 2s creating cinematic reveal
- Specification table rows: Each row slides in from left with 50ms stagger, subtle motion conveying engineering precision

**Hover Behaviors:**
- Model cards: Image brightness increases slightly (filter: brightness(1.08)), model name gains Racing Red color, price fades in from below
- Performance figures: Individual metric scales up (1.1) with Racing Red color transition, unit text appears (mph, hp, lb-ft)
- Gallery thumbnails: Border appears in Racing Red (2px), scale 1.03, other thumbnails dim to 0.6 opacity
- Configure options: Selected option gets Racing Red checkmark, deselected options brighten on hover indicating interactivity

**Click Behaviors:**
- Configurator color selection: Car image crossfades to selected color variant (image swap with 400ms transition), color swatch gets elevated ring indicator
- Model entry click: Full-screen zoom effect - car image scales up filling viewport (GSAP Flip to new page hero position) before navigation
- Gallery full-screen: Image expands from position to full viewport with parallax depth effect, dark overlay, swipe navigation
- Performance data: Clicking a metric reveals comparison bar (vs competitors or vs previous model) with animated fill

**Technical Implementation:**
- Webflow Interactions 2.0: Page load hero reveal, scroll-linked gallery crossfade, hover states on all interactive elements, configurator panel open/close
- GSAP ScrollTrigger: Immersive image sequence scroll-linking, performance counter with decimal precision, parallax on model showcase, page transition flip effect
- Spline/Three.js: Optional 3D car model in configurator section (or fallback to pre-rendered image angles)
- Custom JS: Configurator logic for option selection, price calculation, configuration save/share URL generation
- Lottie: Engine start animation on page load, speedometer animation for performance section
- Client-First: `.section_hero-automotive`, `.gallery_model-immersive`, `.card_model`, `.panel_options`, `.bar_performance`, `.navbar_fixed-automotive`, `.is-selected`, `.is-available`, `.is-soldout` states

---

## 15. PANTHEON - Luxury Real Estate & Penthouse Development

### 1. Production Name & Premium Industry Niche

**Template Name:** PANTHEON  
**Target Industry:** Luxury Real Estate & Penthouse Development  
**Ideal Client:** Ultra-luxury real estate developers, penthouse and sky-residence projects, luxury condo marketing, high-end real estate brokerages, and architectural development firms selling $10M+ residential properties.

### 2. Visual Aesthetic & Typographic Pairing

**Color Palette:**

| Role | Color Name | Hex Code |
|------|-----------|----------|
| Primary | Marble Black | `#1C1C1E` |
| Secondary | Champagne | `#D4AF37` |
| Accent | Sky Azure | `#38BDF8` |
| Background Dark | Penthouse Night | `#0F0F11` |
| Background Light | Travertine | `#FAF9F7` |
| Text | Concrete Mist | `#A1A1AA` |

**Dark/Light Mode Balance:** 72% dark / 28% light. Luxury real estate requires aspirational, dramatic presentation. Dark backgrounds create the evening-penthouse-viewing atmosphere. Champagne gold communicates exclusivity and premium positioning. Light backgrounds for floor plans, availability, and practical buying information. Sky Azure represents the sky-high living proposition.

**Premium Font Combinations:**
- Headlines: Cormorant Garamond 700 (classic real estate luxury)
- Subheadlines: Cormorant Garamond 500 (established elegance)
- Body: Nunito Sans 400 (approachable modern)
- Navigation: Nunito Sans 600 uppercase tracking +2.5px
- Pricing/Data: Nunito Sans 700 tabular nums (property authority)

### 3. Exact Page Architecture

**Page 1: Home**
- Header: Transparent with gold logo centered, split navigation, "Schedule Viewing" CTA in Champagne (`.navbar_transparent-luxury`)
- Hero: Full-viewport cinematic aerial video/image of the development with city skyline, development name in gold, tagline, down-arrow indicator (`.section_hero-penthouse`)
- Address Bar: Prominent address display with neighborhood context (`.bar_address`)
- Lifestyle Statement: Centered text about elevated living on dark background (`.section_lifestyle`)
- Residences Preview: 3-card layout showing representative residences with floor, beds, area, price from (`.grid_residences-preview`)
- Amenities Highlight: 6-icon grid of key amenities (Pool, Spa, Concierge, Valet, Gym, Terrace) (`.grid_amenities-highlight`)
- Views: Full-bleed panoramic view image with compass orientation (`.section_views`)
- Developer: Developer brand and track record (`.section_developer`)
- Footer: Dark with broker contact, legal disclaimers, equal housing logo (`.footer_realestate`)

**Page 2: Residences (CMS Collection)**
- Header: Sticky with dark background
- Filter: By floor level, bedrooms, price range, availability (`.filter_residences`)
- Residence Grid: Cards with floor plan thumbnail, unit number, floor, beds/baths, area sqft, price, availability badge (`.grid_residences`)
- CMS Collection: `Residences` with fields: Unit Number, Slug, Floor (number), Bedrooms (number), Bathrooms (number), Area Sqft (number), Price (number), Price Display (text), Floor Plan Image, Gallery (multi-image), Description (rich text), View Direction (option: North/South/East/West/Corner), Status (option: Available/Reserved/Sold), Features (rich text)
- Building Section: Visual building elevation showing available units (`.diagram_building-elevation`)

**Page 3: Residence Detail (CMS Template)**
- Header: Transparent
- Hero: Full-width interior render or photo with unit identifier overlay (`.section_hero-residence`)
- Gallery: Full-width image slider with interior/view images (`.slider_residence-gallery`)
- Details: Split layout - left with description, right with sticky spec panel (unit, floor, beds, baths, area, price, "Schedule Viewing" CTA) (`.layout_residence-detail`)
- Floor Plan: Interactive floor plan with room labels (`.section_floor-plan`)
- Features: Room-by-room feature list (kitchen, bathrooms, living, bedroom finishes) (`.section_features`)
- Views: Directional view images from this specific unit (`.section_unit-views`)
- Similar: Other available units on similar floors (`.grid_similar-residences`)

**Page 4: Amenities**
- Header: Sticky dark
- Amenity Categories: Wellness, Social, Service, Outdoor (`.tabs_amenity-categories`)
- Amenity Cards: Full-width alternating image-text sections for each major amenity (`.section_amenity-feature`)
- Complete List: Grid of all amenities with icons (`.grid_amenities-all`)
- Renderings: Full-bleed architectural renderings of amenity spaces (`.gallery_amenity-renders`)

**Page 5: Views & Location**
- Header: Transparent
- Panoramic Views: 360-degree view imagery or multi-directional view photos (`.section_panoramic`)
- Floor-by-Floor: View comparison showing how views change by floor level (`.section_views-by-floor`)
- Neighborhood: Map with nearby points of interest (restaurants, parks, cultural venues, transit) (`.section_neighborhood`)
- Walk Score: Transit and walk scores displayed (`.section_scores`)
- Commute: Key distances to business districts, airports, attractions (`.list_commute`)

**Page 6: Design & Architecture**
- Header: Sticky dark
- Architect: Architecture firm profile with past notable projects (`.section_architect`)
- Design Vision: Material palette presentation with close-up photography (`.section_materials`)
- Interior Designer: Designer profile and concept statement (`.section_interior-designer`)
- Sustainability: Green building certifications (LEED, WELL) and sustainable features (`.section_sustainability`)
- Construction: Progress updates and timeline for under-construction projects (`.timeline_construction`)

**Page 7: Developer / Team**
- Header: Sticky dark
- Developer Profile: Company overview, track record, philosophy (`.section_developer-profile`)
- Past Projects: Portfolio of completed luxury developments (`.grid_past-projects`)
- Sales Team: Broker/agent profiles with contact information (`.grid_sales-team`)
- CMS Collection: `Team` with fields: Name, Role, Photo, Phone, Email, Bio (text), License Number (text)
- Press: Media coverage of the development (`.list_press`)

**Page 8: Gallery**
- Header: Transparent
- Gallery Tabs: Exteriors, Interiors, Amenities, Views, Construction Progress (`.tabs_gallery`)
- Image Grid: Masonry layout within each category (`.grid_gallery-masonry`)
- Virtual Tour: Embed for 3D virtual tour (Matterport-style) (`.section_virtual-tour`)
- Downloads: Brochure PDF, floor plans PDF, fact sheet (`.section_downloads`)

**Page 9: Contact / Register Interest**
- Header: Sticky dark
- Registration Form: Full buyer qualification form (Name, Email, Phone, Budget Range, Bedrooms Desired, Timeline, Broker Name if applicable, How Did You Hear) (`.form_register-interest`)
- Sales Gallery: Address and hours for physical sales center (`.section_sales-gallery`)
- Virtual Appointment: Schedule video call viewing (`.section_virtual-appointment`)
- Broker Portal: Login for real estate agents with inventory access (`.section_broker-portal`)
- Legal: Fair housing statement, developer disclaimers (`.section_legal`)

### 4. Custom Micro-Interactions & Scroll Mechanics

**Scroll Behaviors:**
- Hero cinematic: Video/image with slow parallax (0.2x), Champagne gold text fades in with slight upward drift (20px) after 200ms delay on page load
- Address bar: Pins to top of viewport as user scrolls past hero, becoming a sticky navigation element
- Residence cards: Stagger in with 100ms delay, subtle scale (0.97 to 1.0) and opacity transition
- Amenity sections: Full-bleed images have parallax (0.15x), text sections slide in from appropriate side (alternating left/right)
- Building elevation: Floors highlight sequentially from bottom to top as user scrolls through the section
- Views panoramic: Image rotates slowly (subtle CSS transform perspective shift) as scroll progresses, simulating head-turn viewing

**Hover Behaviors:**
- Residence cards: Champagne gold border-top appears (3px), price text transitions to Champagne, availability badge brightens, subtle lift (translateY -3px)
- Amenity icons: Icon scales 1.2 with Sky Azure color transition, label text appears below
- Floor plan rooms: Hovered room highlights with light fill and tooltip showing room name and dimensions
- Gallery images: Subtle brightness increase (1.05), champagne border appears (1px), cursor becomes zoom-in
- CTA buttons: Champagne background fills left-to-right (wipe transition), text inverts to dark

**Click Behaviors:**
- Residence card: Page transition with elegant fade-through-black (opacity to 0, 200ms black, then new page fades in)
- Floor plan rooms: Click highlights room permanently and shows detailed finish schedule for that room in side panel
- Gallery image: Lightbox with dark overlay, image scales from thumbnail position (GSAP Flip), swipe navigation between images
- Building elevation unit: Click scrolls to residence detail or opens quick-view panel with key specs and "View Full Details" link
- Register form submit: Multi-step with Champagne progress line, final submit shows elegant "Thank you" with confirmation number and next steps

**Technical Implementation:**
- Webflow Interactions 2.0: Scroll-into-view reveals, hover card states, sticky address bar behavior, form multi-step, page load hero sequence
- GSAP ScrollTrigger: Parallax on full-bleed images, building elevation sequential highlight, panoramic perspective shift
- GSAP Flip: Gallery lightbox open/close from thumbnail position, residence card to full-page transition
- Mapbox GL JS: Neighborhood map with branded pins and custom style matching template palette (embedded via custom code)
- Matterport Embed: 3D virtual tour iframe in gallery section
- Lottie: Elegant loading animation (building outline drawing), success confirmation on form submit
- Client-First: `.section_hero-penthouse`, `.grid_residences`, `.card_residence`, `.diagram_building-elevation`, `.navbar_transparent-luxury`, `.is-available`, `.is-reserved`, `.is-sold`, `.is-sticky` states
