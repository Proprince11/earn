# Master Webflow Customization Playbook

> A comprehensive developer reference for synchronizing global styles, managing CMS schemas, and implementing clean class architecture using Finsweet Client-First methodology across all elite Webflow templates.

---

## 1. Global Style Guide Synchronization

### 1.1 Mapping Global Swatches to a Unified Color System

Global Swatches in Webflow act as design tokens that propagate changes across every element referencing them. Setting up a systematic color architecture ensures brand consistency and enables rapid theme modifications.

**Step-by-Step Swatch Configuration:**

1. **Open the Style Panel** and navigate to the color picker on any element.
2. **Click the swatch icon** (grid of dots) to access Global Swatches.
3. **Create your base swatches** following this naming convention:

| Swatch Name | Purpose | Example Value |
|-------------|---------|---------------|
| `--color--primary` | Brand primary actions, links, CTAs | `#0A2463` |
| `--color--secondary` | Supporting elements, secondary buttons | `#00E5CC` |
| `--color--accent` | Highlight moments, badges, alerts | `#7B2FBE` |
| `--color--background-dark` | Dark section backgrounds | `#050A1A` |
| `--color--background-light` | Light section backgrounds | `#F8FBFF` |
| `--color--text-primary` | Main body text on light backgrounds | `#1A1A1A` |
| `--color--text-secondary` | Supporting text, captions | `#64748B` |
| `--color--text-inverse` | Text on dark backgrounds | `#E0E6EF` |
| `--color--border` | Borders, dividers, subtle lines | `#E2E8F0` |
| `--color--surface` | Card backgrounds, elevated surfaces | `#FFFFFF` |

4. **Assign swatches to elements** by selecting the swatch from the color picker rather than entering hex values directly.
5. **To update globally:** Edit the swatch value in the swatches panel. Every element using that swatch updates instantly across all pages.
6. **Dark mode implementation:** Create a duplicate set with `-dark` suffix (e.g., `--color--background-dark-mode`) and toggle visibility using a combo class `.is-dark-mode` on the body or section wrapper.

**Propagation Rules:**
- Never use raw hex values on elements; always reference a Global Swatch
- Group swatches by function (backgrounds, text, borders, accents) for quick scanning
- Maintain a maximum of 12-15 swatches per project to avoid swatch bloat
- Document swatch-to-role mapping in a style guide page hidden from navigation

### 1.2 Typography Class Hierarchy with Client-First Naming

Typography in Client-First uses utility classes that separate structure from style. This creates a reusable, maintainable type system.

**Base Typography Scale:**

| Class Name | Element | Size (Desktop) | Weight | Line Height | Letter Spacing |
|-----------|---------|----------------|--------|-------------|----------------|
| `.heading-style-h1` | H1 | 72px / 4.5rem | 700 | 1.1 | -0.02em |
| `.heading-style-h2` | H2 | 56px / 3.5rem | 700 | 1.15 | -0.01em |
| `.heading-style-h3` | H3 | 40px / 2.5rem | 600 | 1.2 | 0 |
| `.heading-style-h4` | H4 | 32px / 2rem | 600 | 1.25 | 0 |
| `.heading-style-h5` | H5 | 24px / 1.5rem | 600 | 1.3 | 0 |
| `.heading-style-h6` | H6 | 20px / 1.25rem | 600 | 1.4 | 0 |
| `.text-size-large` | Body Large | 20px / 1.25rem | 400 | 1.6 | 0 |
| `.text-size-medium` | Body Default | 16px / 1rem | 400 | 1.6 | 0 |
| `.text-size-small` | Body Small | 14px / 0.875rem | 400 | 1.5 | 0 |
| `.text-size-tiny` | Caption/Legal | 12px / 0.75rem | 400 | 1.4 | 0.01em |

**Additional Typography Utilities:**

| Class Name | Purpose | Properties |
|-----------|---------|-----------|
| `.text-weight-bold` | Bold emphasis | font-weight: 700 |
| `.text-weight-semibold` | Semi-bold | font-weight: 600 |
| `.text-weight-medium` | Medium | font-weight: 500 |
| `.text-weight-light` | Light | font-weight: 300 |
| `.text-style-italic` | Italic | font-style: italic |
| `.text-style-allcaps` | Uppercase labels | text-transform: uppercase; letter-spacing: 0.1em |
| `.text-align-center` | Center alignment | text-align: center |
| `.text-align-left` | Left alignment | text-align: left |
| `.text-color-primary` | Primary text color | color: var(--color--text-primary) |
| `.text-color-secondary` | Secondary text color | color: var(--color--text-secondary) |
| `.text-color-inverse` | Light text on dark | color: var(--color--text-inverse) |
| `.text-color-accent` | Accent colored text | color: var(--color--accent) |

**Responsive Typography Setup:**
1. Set base font sizes at desktop (default breakpoint)
2. At Tablet (991px): Reduce H1 to 56px, H2 to 44px, maintain body sizes
3. At Mobile Landscape (768px): Reduce H1 to 44px, H2 to 36px
4. At Mobile Portrait (478px): Reduce H1 to 36px, H2 to 28px, body to 15px

**Font Loading Best Practices:**
- Add Google Fonts via Project Settings > Custom Code > Head with `display=swap`
- Limit to maximum 3 font families per project
- Load only the weights you use (e.g., 300, 400, 600, 700 - not the full family)
- Declare fallback stacks: `font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif`

### 1.3 Button Component Variants with States

Buttons follow a compositional class pattern: base class + variant class + optional size modifier.

**Base Button Structure:**

```
Base Class: .button
Variants: .is-primary, .is-secondary, .is-ghost, .is-icon, .is-text
Sizes: .is-small, .is-large
States: :hover, :active, :focus-visible, .is-disabled
```

**Button Variant Specifications:**

| Variant | Background | Border | Text Color | Hover State |
|---------|-----------|--------|-----------|-------------|
| `.button.is-primary` | var(--color--primary) | none | white | Background darken 10%, translateY(-1px), shadow increase |
| `.button.is-secondary` | transparent | 1.5px solid var(--color--primary) | var(--color--primary) | Background fills with primary, text inverts to white |
| `.button.is-ghost` | transparent | 1px solid var(--color--border) | var(--color--text-primary) | Border darkens, subtle background tint |
| `.button.is-icon` | var(--color--primary) | none | white | Scale 1.05, shadow increase |
| `.button.is-text` | transparent | none | var(--color--primary) | Underline appears, text darkens |

**Button Size Specifications:**

| Size | Padding | Font Size | Border Radius | Min Width |
|------|---------|-----------|---------------|-----------|
| Default | 12px 24px | 16px | 8px | 120px |
| `.is-small` | 8px 16px | 14px | 6px | 80px |
| `.is-large` | 16px 32px | 18px | 10px | 160px |

**Implementation in Webflow:**
1. Create the base `.button` class with shared properties (cursor, display flex, align-items center, justify-content center, transition all 300ms ease, font-weight 500)
2. Add combo classes for variants (`.button.is-primary`, `.button.is-secondary`, etc.)
3. Set hover states on each combo class via the States panel
4. For disabled state, add `.is-disabled` combo class with opacity 0.5 and pointer-events none
5. Add focus-visible state with 2px outline offset for accessibility

### 1.4 Propagating Changes Across the Document Tree

**Global Changes Strategy:**

1. **Swatch-Level Changes (fastest propagation):**
   - Edit a Global Swatch value
   - Every element referencing that swatch updates across all pages instantly
   - Use case: Brand color refresh, seasonal theme changes

2. **Class-Level Changes (structural propagation):**
   - Edit a base class (e.g., `.button`) in the Style Panel
   - All instances using that class inherit the change
   - Combo classes override only their specific properties; base changes still flow through

3. **Symbol/Component-Level Changes:**
   - Edit within a Webflow Symbol (Component)
   - All instances of that symbol update simultaneously
   - Use case: Updating header navigation, footer content, card layouts

4. **Page-Level Overrides (use sparingly):**
   - Body class per page (`.page_home`, `.page_about`) for page-specific overrides
   - Conditional visibility on elements via CMS conditional fields

**Change Propagation Checklist:**
- [ ] Update Global Swatch (colors cascade everywhere)
- [ ] Verify typography classes at all breakpoints
- [ ] Check button variants in all states (hover, active, focus, disabled)
- [ ] Test Symbols/Components in context on multiple pages
- [ ] Verify dark mode sections still have correct contrast
- [ ] Run Webflow Audit panel to catch orphaned classes
- [ ] Check CMS-driven elements for consistent styling


---

## 2. CMS Collection Mapping & Schema Expansion

### 2.1 Adding Custom Fields to Collections

Webflow CMS supports a variety of field types that enable rich, dynamic content structures. Each field type serves specific content modeling needs.

**Available Field Types and Use Cases:**

| Field Type | Use Case | Configuration Notes |
|-----------|----------|-------------------|
| Plain Text | Titles, slugs, short descriptions | Max 256 characters. Use for meta titles. |
| Rich Text | Article bodies, detailed descriptions | Supports headings, lists, images, embeds, code blocks. Cannot be filtered. |
| Image | Thumbnails, hero images, portraits | Accepts JPG, PNG, WebP, GIF. Set alt text field separately. |
| Multi-Image | Photo galleries, product angles | Returns array of images. Use in lightbox or slider components. |
| Video | Embedded video content | URL-based (YouTube, Vimeo). For self-hosted, use File field. |
| Link | External URLs, CTAs | Can be set to open in new tab. Useful for DOI links, external profiles. |
| Email | Contact emails | Validates email format. Use for team member contact. |
| Phone | Contact numbers | Text field with phone intent. |
| Number | Prices, counts, years, metrics | Use for sorting and filtering. Supports decimals. |
| Date/Time | Publish dates, event dates | ISO format. Enables date-based sorting and conditional visibility. |
| Switch (Boolean) | Featured flags, visibility toggles | True/false. Ideal for "Featured" or "Active" flags. |
| Color | Brand colors, category colors | Returns hex value. Use for dynamic accent coloring per item. |
| Option | Status fields, categories, types | Single-select dropdown. Enables filtering on collection lists. |
| File | PDFs, downloads, documents | Max 10MB. Use for press kits, brochures, CVs. |
| Reference | Single relationship to another collection | Links one item to one item in another collection (e.g., Author). |
| Multi-Reference | Many-to-many relationships | Links one item to multiple items (e.g., Tags, Categories). Max 5 per collection. |

**Step-by-Step: Adding a Custom Field:**

1. Navigate to CMS Panel (cube icon in left sidebar)
2. Select the target Collection
3. Click "+ Add New Field" at the bottom of the field list
4. Choose field type from the selector
5. Name the field using descriptive, consistent naming:
   - Use Title Case for display: "Featured Image"
   - Slug auto-generates: `featured-image`
6. Configure field-specific settings:
   - For Options: Add all possible values
   - For References: Select target collection
   - For Numbers: Set min/max if needed
7. Set "Required" toggle if the field must have content
8. Add Help Text to guide content editors
9. Save and verify in the Collection structure view

### 2.2 Multi-Reference Field Patterns

Multi-reference fields create many-to-many relationships between collections. They are essential for taxonomies, tagging systems, and relational content networks.

**Pattern 1: Author System**

```
Collection: Articles
Fields:
  - Title (text)
  - Body (rich text)
  - Authors (multi-reference -> Team Members)
  - Categories (multi-reference -> Categories)
  - Tags (multi-reference -> Tags)

Collection: Team Members
Fields:
  - Name (text)
  - Role (text)
  - Photo (image)
  - Bio (rich text)

Collection: Categories
Fields:
  - Name (text)
  - Description (text)
  - Color (color)

Collection: Tags
Fields:
  - Name (text)
  - Slug (auto)
```

**Pattern 2: Project Portfolio with Technologies**

```
Collection: Projects
Fields:
  - Name (text)
  - Description (rich text)
  - Technologies (multi-reference -> Technologies)
  - Team Members (multi-reference -> Team)
  - Industry (reference -> Industries)

Collection: Technologies
Fields:
  - Name (text)
  - Icon (image)
  - Category (option: Frontend/Backend/Infrastructure/AI)

Collection: Industries
Fields:
  - Name (text)
  - Description (text)
```

**Pattern 3: E-Commerce Product Relationships**

```
Collection: Products
Fields:
  - Name (text)
  - Price (number)
  - Collections (multi-reference -> Product Collections)
  - Related Products (multi-reference -> Products) [self-reference]
  - Materials (multi-reference -> Materials)

Collection: Product Collections
Fields:
  - Name (text)
  - Season (option)
  - Hero Image (image)

Collection: Materials
Fields:
  - Name (text)
  - Sustainability Rating (option)
  - Description (text)
```

**Multi-Reference Implementation Rules:**
- Maximum 5 multi-reference fields per collection
- Each multi-reference can link to a maximum of 5 items per entry (Webflow CMS limit)
- Multi-reference items display in a dynamic list within collection pages
- Cannot filter Collection Lists by multi-reference field values (use Option fields for filterable categories)
- Nesting: You can display multi-reference items within a collection page template by adding a Collection List bound to the multi-reference field

### 2.3 Maintaining Relational Data Integrity

Webflow CMS does not enforce referential integrity at the database level. You must implement discipline through process and structure.

**Integrity Maintenance Protocol:**

1. **Naming Conventions for Collections:**
   - Plural nouns for collections: `Articles`, `Team Members`, `Projects`
   - Singular for reference field names: `Author`, `Category`, `Primary Image`
   - Prefix internal/system collections: `_Settings`, `_Navigation Items`

2. **Preventing Orphaned References:**
   - Before deleting a referenced item, check all collections that reference it
   - Use Webflow's "Used in" indicator when hovering over a CMS item
   - Create a `Status` field with "Archived" option instead of deleting
   - Hide archived items using conditional visibility (Status != Archived)

3. **Required Field Strategy:**
   - Make Reference fields required when the relationship is mandatory (Article must have an Author)
   - Leave multi-reference optional when items may not always have tags/categories
   - Always require: Title/Name, Slug, Status fields
   - Optional: Description, images (provide fallback defaults in design)

4. **Data Consistency Checklist:**
   - [ ] All reference targets exist and are published
   - [ ] Multi-reference items do not exceed 5 items per entry
   - [ ] Option field values match across all entries (no typos in manually typed options)
   - [ ] Date fields use consistent timezone (UTC recommended)
   - [ ] Image alt text is populated for accessibility compliance
   - [ ] Slugs are unique and URL-friendly (auto-generated from title)

### 2.4 Template Page Binding and Conditional Visibility

**Collection Template Pages:**

Every CMS Collection can have one Template Page that generates dynamic pages for each collection item.

1. **Create Template Page:**
   - In the Pages panel, find the Collection under "CMS Collection Pages"
   - Click the purple collection page icon
   - This page auto-generates a URL for every published item: `/collection-slug/item-slug`

2. **Binding Dynamic Content:**
   - Select any text element and click the purple "Get text from" icon
   - Choose the field to bind (Title, Description, Date, etc.)
   - For images: Select the image element, bind the source to an Image field
   - For rich text: Add a Rich Text element and bind it to the Rich Text field
   - For links: Bind the URL property to a Link or URL field

3. **Conditional Visibility Rules:**
   - Select any element on the template page
   - Open Settings panel (D key) and find "Conditional Visibility"
   - Add conditions based on CMS field values:
     - Show element only when "Status" equals "Active"
     - Hide element when "Featured Image" is empty (show placeholder instead)
     - Show "Sale Badge" only when "Sale Price" is set
   - Multiple conditions: All conditions must be true (AND logic)
   - Combine with combo classes for visual state changes

4. **Nested Collection Lists on Template Pages:**
   - Within a Collection Template Page, add a Collection List
   - Bind it to a Reference or Multi-Reference field
   - This displays related items (e.g., articles by the same author, products in the same category)
   - Limit and offset controls for pagination
   - Sort by any field in the nested collection

### 2.5 Dynamic List Filtering and Sorting

**Native Webflow Filtering (CMS Filter):**

1. **Sort Configuration:**
   - Select the Collection List wrapper
   - In Settings, choose "Sort Order"
   - Options: Alphabetical (A-Z, Z-A), Date (Newest, Oldest), Number (Highest, Lowest), Custom Sort
   - Add secondary sort for tie-breaking (e.g., Date then Alphabetical)

2. **Filter Configuration:**
   - In Collection List settings, add filter rules:
   - "Category" equals "Technology" (show only tech items)
   - "Status" equals "Published" (hide drafts)
   - "Date" is before today (show only past events)
   - "Featured" is ON (show only featured items)
   - Combine multiple filters (AND logic)

3. **Limit and Pagination:**
   - Set item limit per list (e.g., 6 items per page)
   - Enable pagination controls at the bottom
   - Custom-style pagination buttons using `.pagination_wrapper`, `.pagination_button`, `.pagination_previous`, `.pagination_next`

**Finsweet CMS Filter (Advanced Filtering):**

For client-side interactive filtering without page reload:

1. **Setup:** Add Finsweet Attributes library via custom code:
   ```html
   <script defer src="https://cdn.jsdelivr.net/npm/@finsweet/attributes-cmsfilter@1/cmsfilter.js"></script>
   ```

2. **Filter Instance:** Add `fs-cmsfilter-element="list"` to the Collection List wrapper

3. **Filter Buttons/Inputs:**
   - Category buttons: Add `fs-cmsfilter-field="category"` to filter trigger elements
   - Text search: Add `fs-cmsfilter-field="name"` to an input element
   - Range filter: Use `fs-cmsfilter-field="price"` on range slider inputs

4. **Active States:** Finsweet automatically adds `.fs-cmsfilter-active` class to active filter buttons

5. **Empty State:** Add `fs-cmsfilter-element="empty"` to a div that shows when no results match

6. **Reset:** Add `fs-cmsfilter-element="reset"` to a "Clear All" button

**Finsweet CMS Sort (Dynamic Sorting):**

```html
<script defer src="https://cdn.jsdelivr.net/npm/@finsweet/attributes-cmssort@1/cmssort.js"></script>
```

- Add `fs-cmssort-element="trigger"` to sort buttons
- Add `fs-cmssort-field="date"` to specify which field to sort by
- Add `fs-cmssort-order="asc"` or `"desc"` for direction
- Combine with filter for complete dynamic collection management


---

## 3. Client-First Clean Class Management

### 3.1 Finsweet Client-First Naming Methodology

Client-First is a class naming system created by Finsweet specifically for Webflow. It provides a standardized, scalable approach to organizing CSS classes that eliminates naming confusion, reduces class duplication, and enables team collaboration.

**Core Principles:**

1. **Classes describe the element, not the style.** A class should tell you WHAT the element is, not how it looks.
   - Correct: `.section_hero` (describes the element)
   - Incorrect: `.blue-bg-padding-large` (describes the style)

2. **Folder-like prefix system.** Classes use underscores as namespace separators, creating a mental file-folder structure.
   - Pattern: `[block]_[element]-[modifier]`
   - Example: `.team_card-large`, `.blog_grid-3col`

3. **Global utility classes for reusable styles.** Shared properties (spacing, colors, typography) use a separate utility system.
   - Pattern: `.[property]-[value]`
   - Example: `.margin-top-large`, `.text-color-primary`

4. **No duplicate styling.** If two elements share the same visual treatment, they share the same class. Never create visually-identical classes with different names.

### 3.2 Structure Classes vs. Utility Classes vs. Custom Classes

**Structure Classes (Component-Specific):**

Structure classes are unique to a specific component or section. They describe the structural role of an element within its parent context.

| Pattern | Example | Usage |
|---------|---------|-------|
| `[page]_[component]` | `.home_hero` | Page-specific sections |
| `[component]_[element]` | `.navbar_link` | Component child elements |
| `[component]_[element]-[variant]` | `.card_image-large` | Element variants |
| `[component]_wrapper` | `.team_wrapper` | Component outer container |
| `[component]_list` | `.blog_list` | Collection list wrappers |
| `[component]_item` | `.blog_item` | Individual list items |
| `[component]_content` | `.hero_content` | Content containers |
| `[component]_heading` | `.feature_heading` | Section-specific headings |

**Utility Classes (Global Reusable):**

Utility classes apply single-property styles globally. They are combined with structure classes on the same element.

| Category | Pattern | Examples |
|----------|---------|---------|
| Spacing | `.margin-[direction]-[size]` | `.margin-top-large`, `.margin-bottom-medium`, `.padding-section-large` |
| Text | `.text-[property]-[value]` | `.text-size-large`, `.text-weight-bold`, `.text-color-primary` |
| Display | `.display-[value]` | `.display-none`, `.display-flex` |
| Alignment | `.align-[value]` | `.align-center`, `.align-left` |
| Width | `.max-width-[size]` | `.max-width-large`, `.max-width-small` |
| Visibility | `.hide-[breakpoint]` | `.hide-mobile`, `.hide-tablet` |
| Background | `.background-color-[name]` | `.background-color-primary`, `.background-color-dark` |

**Custom Classes (Project-Specific Utilities):**

For patterns that repeat across multiple components but are project-specific.

| Pattern | Example | Usage |
|---------|---------|-------|
| `.is-[state]` | `.is-active`, `.is-visible`, `.is-open` | Interactive states (toggled by JS/Interactions) |
| `.has-[feature]` | `.has-border`, `.has-shadow` | Optional visual modifiers |
| `.grid-[columns]` | `.grid-3col`, `.grid-2col` | Reusable grid layouts |
| `.container-[size]` | `.container-large`, `.container-small` | Width containers |

### 3.3 Avoiding Class Duplication

Class duplication is the primary source of technical debt in Webflow projects. Follow these rules strictly:

**Rule 1: Before creating a new class, search existing classes.**
- Use Webflow's Style Panel search to check if a similar class exists
- The Classes panel shows a count of how many elements use each class

**Rule 2: If two elements look identical, they MUST share a class.**
- If your `.about_card` looks exactly like your `.services_card`, create a shared `.card_default` and apply to both
- Use combo classes for variations: `.card_default.is-featured`

**Rule 3: Never use Webflow's auto-generated class names.**
- Webflow generates names like `Div Block 14` or `Section 3`
- Always rename immediately following Client-First conventions
- Auto-names indicate undisciplined development

**Rule 4: Combo classes for variants, not new base classes.**
- Base: `.button` (shared styles)
- Variant: `.button.is-primary`, `.button.is-secondary`
- Never: `.button-primary`, `.button-secondary` as separate base classes (duplicates shared properties)

**Rule 5: Utilities for single-property repetition.**
- If you find yourself setting `margin-top: 3rem` on 15 different classes, create `.margin-top-large` utility
- Apply the utility class as an additional class on the element

**Duplication Audit Process:**
1. Open the Style Panel's class selector
2. Sort by "All Classes" and scan for similar names
3. Look for classes used only once (potential unnecessary custom classes)
4. Identify classes with identical computed styles (candidates for merging)
5. Use Webflow's Audit panel (Cmd+Shift+A) to find unused classes and remove them

### 3.4 Strict Structural Class Organization

**The Folder-Prefix System:**

Think of the underscore `_` as a folder separator. The text before the underscore is the "folder" (component/section), and the text after is the "file" (specific element).

```
navbar_              <- Component folder
  navbar_wrapper     <- Outer container
  navbar_logo        <- Logo element
  navbar_menu        <- Menu container
  navbar_link        <- Individual nav link
  navbar_button      <- CTA button
  navbar_hamburger   <- Mobile menu trigger

hero_                <- Component folder
  hero_wrapper       <- Outer container
  hero_content       <- Text content area
  hero_heading       <- Main heading
  hero_text          <- Supporting paragraph
  hero_button-group  <- Button container
  hero_image         <- Background/feature image
  hero_video         <- Background video

footer_              <- Component folder
  footer_wrapper     <- Outer container
  footer_top         <- Upper section
  footer_bottom      <- Lower section
  footer_link        <- Individual link
  footer_logo        <- Footer logo
  footer_social      <- Social icons container
  footer_legal       <- Legal/copyright text
```

**Modifier Conventions:**

Use hyphens `-` for modifiers and descriptors within the element name:

| Modifier Type | Pattern | Examples |
|--------------|---------|---------|
| Size | `-large`, `-small`, `-medium` | `.card_image-large`, `.section_padding-small` |
| Color | `-dark`, `-light`, `-primary` | `.section_background-dark`, `.text_color-primary` |
| Position | `-left`, `-right`, `-center` | `.hero_content-left`, `.grid_item-center` |
| State | `.is-active`, `.is-hidden` | Added as combo class for states |
| Number | `-2col`, `-3col`, `-4col` | `.grid_layout-3col`, `.flex_row-2col` |

### 3.5 Naming Examples for Every Element Type

**Sections:**
```
.section_hero
.section_about
.section_services
.section_testimonials
.section_cta
.section_features
.section_pricing
.section_contact
.section_faq
```

**Containers:**
```
.container_large        (max-width: 1280px, centered)
.container_medium       (max-width: 960px, centered)
.container_small        (max-width: 640px, centered)
.container_full         (max-width: 100%, with padding)
```

**Grid Layouts:**
```
.grid_layout-2col       (2-column equal grid)
.grid_layout-3col       (3-column equal grid)
.grid_layout-4col       (4-column equal grid)
.grid_layout-sidebar    (70/30 split)
.grid_layout-asymmetric (40/60 or 60/40)
```

**Text Elements:**
```
.heading-style-h1       (H1 typography)
.heading-style-h2       (H2 typography)
.heading-style-h3       (H3 typography)
.text-size-large        (Large body text)
.text-size-medium       (Default body text)
.text-size-small        (Small/caption text)
.text-color-primary     (Primary text color)
.text-color-secondary   (Secondary text color)
.text-color-inverse     (White/light text on dark)
.text-weight-bold       (Bold weight)
.text-style-allcaps     (Uppercase tracking)
```

**Buttons:**
```
.button                 (Base button - shared padding, font, cursor, transition)
.button.is-primary      (Primary filled button)
.button.is-secondary    (Outlined button)
.button.is-ghost        (Minimal/text button)
.button.is-icon         (Icon-only button)
.button.is-small        (Smaller size variant)
.button.is-large        (Larger size variant)
.button.is-disabled     (Disabled state)
```

**Forms:**
```
.form_wrapper           (Form container)
.form_field-wrapper     (Individual field container - label + input)
.form_label             (Field label)
.form_input             (Text inputs)
.form_textarea          (Textarea inputs)
.form_select            (Dropdown selects)
.form_checkbox          (Checkbox + label container)
.form_radio             (Radio + label container)
.form_submit            (Submit button)
.form_error             (Error message)
.form_success           (Success state container)
```

**CMS Items:**
```
.blog_list              (Collection list wrapper)
.blog_item              (Individual collection item)
.blog_image             (Post thumbnail)
.blog_title             (Post title)
.blog_excerpt           (Post excerpt)
.blog_date              (Post date)
.blog_category          (Category tag)
.blog_author            (Author reference)
.blog_card              (Card wrapper if styled as card)
```

**Navigation:**
```
.navbar_component       (Outermost nav wrapper)
.navbar_wrapper         (Inner container for content)
.navbar_brand           (Logo container)
.navbar_logo            (Logo image)
.navbar_menu            (Desktop menu container)
.navbar_link            (Individual nav link)
.navbar_link.is-active  (Current page indicator)
.navbar_dropdown        (Dropdown wrapper)
.navbar_dropdown-list   (Dropdown content)
.navbar_dropdown-link   (Dropdown individual link)
.navbar_button          (Nav CTA button)
.navbar_hamburger       (Mobile toggle)
.navbar_mobile-menu     (Mobile menu overlay)
```

**Spacing Utilities (Applied as additional classes):**
```
.padding-section-large    (Section vertical padding: 8rem)
.padding-section-medium   (Section vertical padding: 5rem)
.padding-section-small    (Section vertical padding: 3rem)
.margin-top-large         (32px top margin)
.margin-top-medium        (24px top margin)
.margin-top-small         (16px top margin)
.margin-bottom-large      (32px bottom margin)
.margin-bottom-medium     (24px bottom margin)
.margin-bottom-small      (16px bottom margin)
.gap-large                (Grid/flex gap: 32px)
.gap-medium               (Grid/flex gap: 24px)
.gap-small                (Grid/flex gap: 16px)
```

**Interactive State Classes:**
```
.is-active              (Active filter, current nav item)
.is-visible             (Element is in viewport / shown)
.is-hidden              (Element is hidden)
.is-open                (Menu/dropdown/accordion is open)
.is-closed              (Menu/dropdown/accordion is closed)
.is-loading             (Loading state)
.is-disabled            (Disabled/non-interactive)
.is-scrolled            (Body has scrolled past threshold)
.is-dark-mode           (Dark mode active on section/page)
.is-inview              (Scroll trigger - element has entered viewport)
```

---

## Summary: Quick Reference Card

| What You Need | Where to Look | Naming Pattern |
|--------------|---------------|----------------|
| Section wrapper | Structure class | `.section_[name]` |
| Component element | Structure class | `.[component]_[element]` |
| Size variant | Modifier | `.[component]_[element]-[size]` |
| Typography | Utility class | `.heading-style-h[n]`, `.text-size-[size]` |
| Spacing | Utility class | `.margin-[direction]-[size]`, `.padding-section-[size]` |
| Color | Utility class | `.text-color-[name]`, `.background-color-[name]` |
| Interactive state | Combo class | `.is-[state]` |
| CMS list | Structure class | `.[content-type]_list`, `.[content-type]_item` |
| Button | Combo class | `.button.is-[variant]` |
| Grid | Utility class | `.grid_layout-[columns]` |
| Visibility | Utility class | `.hide-[breakpoint]` |

**Final Rule:** When in doubt, ask: "Does this class name tell me WHAT this element IS?" If the answer is yes, the name is correct. If it tells you how it LOOKS, refactor to a utility class or rename to describe its role.
