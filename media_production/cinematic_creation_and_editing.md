# Cinematic Creation & Editing: Technical Execution Guide

## Table of Contents
1. [Cinematography](#cinematography)
2. [Video Editing](#video-editing)
3. [Sound Design](#sound-design)

---

## Section 1: Cinematography

### 1.1 Lighting Physics

#### The Inverse-Square Law

The foundational principle governing all photographic lighting is the inverse-square law, expressed mathematically as:

**I = 1/d^2**

Where:
- I = Intensity (measured in lux or foot-candles)
- d = Distance from the light source to the subject

This formula dictates that when you double the distance between a light source and a subject, the illumination falls to one-quarter of its original intensity. Conversely, halving the distance quadruples the light intensity.

**Practical Calculation Example:**
If a 1000W tungsten fresnel produces 2400 lux at 2 meters, then at 4 meters it produces:
- 2400 * (2/4)^2 = 2400 * 0.25 = 600 lux

This has critical implications for multi-subject lighting setups. When lighting two subjects at different distances from a single source, the exposure differential follows the inverse-square relationship precisely.

#### Key/Fill/Rim Lighting Setups

The three-point lighting system remains the industry standard for controlled illumination:

**Key Light:**
- Primary illumination source positioned 30-45 degrees from the camera-subject axis
- Typically placed slightly above eye level (15-30 degrees vertical angle)
- Intensity determines the base exposure setting
- Quality (hard/soft) establishes the visual mood

**Fill Light:**
- Reduces shadow density created by the key light
- Positioned opposite the key light, closer to the camera axis
- Fill ratio determines contrast: 2:1 (broadcast), 4:1 (dramatic), 8:1 (noir)
- Calculation: If key reads f/5.6 and fill reads f/2.8, that produces a 4:1 ratio (two stops difference = 4x intensity difference)

**Rim/Back Light:**
- Separates subject from background through edge highlighting
- Positioned behind and above the subject (120-180 degrees from camera)
- Typically 1/2 to 1 stop brighter than the key light for visible effect
- Kicker variant: positioned at 3/4 rear angle for more wrap

#### Light Falloff Calculations

Falloff rate determines the transition gradient between highlight and shadow areas:

**Rapid falloff (source close to subject):**
- At 1 meter distance, moving from 1m to 1.5m = 56% intensity reduction
- Creates dramatic, contrasty lighting with quick shadow transitions
- Useful for moody, cinematic looks

**Gradual falloff (source far from subject):**
- At 5 meters distance, moving from 5m to 5.5m = only 17% intensity reduction
- Creates even, flat illumination across the subject
- Used for broadcast, corporate, and beauty lighting

#### Color Temperature (Kelvin Scale)

Color temperature quantifies the spectral distribution of a light source:

| Light Source | Color Temperature (K) | Mired Value |
|---|---|---|
| Candle flame | 1800-2000K | 500-556 |
| Tungsten bulb (60W) | 2700K | 370 |
| Halogen lamp | 3200K | 313 |
| Fluorescent (warm) | 3500K | 286 |
| Midday sun | 5600K | 179 |
| Overcast sky | 6500-7500K | 133-154 |
| Shade/blue sky | 8000-12000K | 83-125 |

**Mired Shift Calculations:**
Mired = 1,000,000 / Kelvin
To convert from 3200K to 5600K: Mired shift = 313 - 179 = 134 (requires CTO gel)
To convert from 5600K to 3200K: Mired shift = 179 - 313 = -134 (requires CTB gel)

#### CRI/TLCI Ratings

**Color Rendering Index (CRI):**
- Ra value measures fidelity across 8 standard color samples (R1-R8)
- Extended CRI includes R9-R15 for saturated colors
- Professional minimum: CRI 90+ for accurate skin tone reproduction
- R9 (saturated red) is critical for skin tones and often the weakest point in LED fixtures
- Limitations: CRI uses outdated reference illuminants and only 8 samples

**Television Lighting Consistency Index (TLCI):**
- Developed by the EBU specifically for video/film applications
- Uses a virtual camera model instead of human observer model
- Scale: 0-100, with 85+ considered broadcast-quality
- Tests against 24 color samples including camera-specific spectral sensitivities
- More relevant than CRI for digital cinema applications

**Spectral Power Distribution (SPD):**
- Full-spectrum sources (tungsten, HMI) produce continuous SPD curves
- LED sources produce peaked distributions with potential spectral gaps
- Gaps in SPD cause metameric failure: colors appear correct to eye but shift on camera
- High-quality LEDs use phosphor-converted or RGBWW arrays to fill spectral gaps

#### Hard vs Soft Light Physics

The apparent softness of a light source is determined by its angular size relative to the subject:

**Angular size formula:**
Angular size (degrees) = 2 * arctan(source_diameter / (2 * distance))

**Hard light characteristics:**
- Small angular size (point source approximation)
- Sharp, well-defined shadow edges
- High specular-to-diffuse ratio
- Examples: bare bulb at distance, focused fresnel, direct sun

**Soft light characteristics:**
- Large angular size relative to subject
- Gradual shadow transitions (penumbra wider than umbra)
- Low specular-to-diffuse ratio
- Examples: large diffusion panel close to subject, overcast sky, bounced light

**Practical softness guide:**
- A 4x4 foot diffusion panel at 3 feet from subject = very soft (angular size ~67 degrees)
- Same panel at 12 feet = medium-hard (angular size ~19 degrees)
- Softness is always relative to subject size and distance

### 1.2 Camera Color Profiles

#### LOG vs RAW Workflows

**LOG (Logarithmic) Recording:**

LOG gamma curves compress the sensor's linear data into a logarithmic curve, prioritizing shadow and highlight detail within the limitations of a video codec. This is a baked-in gamma curve applied before codec compression.

| LOG Profile | Camera System | Claimed Dynamic Range | Base ISO |
|---|---|---|---|
| S-Log3 | Sony (FX6, FX9, A7S III) | 15+ stops | 800 (dual base: 12800) |
| V-Log | Panasonic (GH6, S1H, EVA1) | 14+ stops | 640 (dual base: 4000) |
| C-Log3 | Canon (C70, C300 III, R5C) | 14+ stops | 800 (dual base: 3200) |
| Log3G10 | RED (DSMC2, V-RAPTOR) | 16.5+ stops | 800 |
| LogC3/LogC4 | ARRI (Alexa Mini, Alexa 35) | 14.5-17 stops | 800 |

**RAW Recording:**

RAW captures the unprocessed sensor data before debayering, preserving maximum latitude for post-production manipulation:

- **BRAW (Blackmagic RAW):** Partially debayered with configurable quality (Q0, Q1, Q3, Q5 constant quality; 3:1 to 12:1 constant bitrate). Maintains full color science flexibility while reducing file sizes 3-6x vs CinemaDNG.
- **ProRes RAW:** Apple-developed format recording linear light sensor data in ProRes container. Supports up to 8K, metadata-driven ISO/WB adjustment in post. Available on Atomos recorders and select cameras.
- **REDCODE RAW:** Wavelet-compressed RAW format (R3D files). Compression ratios from 2:1 to 22:1. Full IPP2 color science with ACES support.
- **CinemaDNG:** Open-standard uncompressed RAW format. Individual DNG frames. Largest file sizes but no proprietary decode required.
- **ARRIRAW:** Uncompressed linear Bayer data from ARRI sensors. Gold standard for feature film acquisition.

#### Dynamic Range Measured by Profile

Dynamic range in cinema cameras is measured in stops (each stop = doubling of light):

**Measured usable dynamic range (Xyla chart, 2% noise threshold):**
- ARRI Alexa 35 (LogC4): 17.0 stops
- RED V-RAPTOR (Log3G10): 16.5 stops
- Sony VENICE 2 (S-Log3): 16.0 stops
- Canon C500 II (C-Log3): 15.2 stops
- Blackmagic URSA 12K (Gen 5): 14.5 stops
- Sony A7S III (S-Log3): 14.7 stops
- Panasonic S1H (V-Log): 14.0 stops

#### IRE Levels for Proper LOG Exposure

Proper LOG exposure requires exposing to specific IRE values to maximize signal-to-noise ratio:

**S-Log3 (Sony):**
- Middle gray (18%): 41 IRE
- 90% white: 61 IRE
- Skin tones: 47-55 IRE
- Recommended over-exposure: +1.7 to +2 stops (ETTR method)
- Clipping point: 94 IRE

**V-Log (Panasonic):**
- Middle gray (18%): 42 IRE
- 90% white: 61 IRE
- Skin tones: 48-56 IRE
- Recommended over-exposure: +1 to +1.5 stops

**C-Log3 (Canon):**
- Middle gray (18%): 32 IRE
- 90% white: 56 IRE
- Skin tones: 38-48 IRE
- More conservative headroom allocation

**Expose-to-the-Right (ETTR) Strategy:**
LOG profiles allocate significant code values to highlights. Overexposing 1-2 stops from manufacturer recommendations pushes noise floor lower in the shadows while maintaining highlight headroom. This maximizes SNR in the midtones and shadows where noise is most visible.

#### LUT Application Workflows

Look-Up Tables (LUTs) transform color data from one color space to another:

**Technical LUT Types:**
1. **Input/Camera LUT:** Converts LOG footage to a standard working space (e.g., S-Log3/S-Gamut3.Cine to Rec.709)
2. **Display LUT:** Applied for monitoring on-set (burned into SDR displays while recording LOG)
3. **Creative/Look LUT:** Stylistic color transforms applied after normalization
4. **Output/Delivery LUT:** Converts working space to delivery specification (P3-D65 for cinema, Rec.709 for broadcast)

**1D vs 3D LUTs:**
- 1D LUTs: Single-channel transforms (R, G, B independently). Used for gamma curves, contrast adjustments.
- 3D LUTs: Cross-channel transforms (R affects G and B). Used for color space conversions, complex looks. Typical size: 33x33x33 or 65x65x65 cube points.

#### ACES Color Management Pipeline

The Academy Color Encoding System provides a standardized, scene-referred color management framework:

**Pipeline stages:**
1. **IDT (Input Device Transform):** Converts camera-native color space to ACES AP0 (linear, scene-referred)
2. **Working Space:** ACEScg (AP1 primaries, linear) for compositing/VFX, or ACEScc/ACEScct (log) for grading
3. **RRT (Reference Rendering Transform):** Scene-referred to display-referred conversion with filmic tone mapping
4. **ODT (Output Device Transform):** Converts to target display (Rec.709, P3-D65, Rec.2020)

**ACES color spaces:**
- AP0 (ACES 2065-1): Encompasses all visible colors, archival format
- AP1 (ACEScg): Smaller than AP0, encompasses Rec.2020, used for CGI/compositing
- ACEScc: Logarithmic encoding for color grading (pure log, no toe)
- ACEScct: Similar to ACEScc with a toe region below 0.0078125 for familiar grading behavior

### 1.3 Framing Psychology

#### Rule of Thirds vs Golden Ratio vs Dynamic Symmetry

**Rule of Thirds:**
- Frame divided into 9 equal sections by two horizontal and two vertical lines
- Key subjects placed at intersection points (power points)
- Horizon placed on upper or lower third line
- Simple but effective for quick composition decisions
- Aspect ratio independent: works with 16:9, 2.39:1, 4:3

**Golden Ratio (Phi Grid):**
- Based on phi (1.618:1 ratio)
- Grid lines are closer to center than rule of thirds (approximately 38/62 split vs 33/67)
- Produces slightly tighter, more balanced compositions
- Golden spiral (Fibonacci spiral) guides eye movement through the frame
- More mathematically precise but harder to visualize during shooting

**Dynamic Symmetry:**
- Based on root rectangles (root-2, root-3, root-4, root-5)
- Diagonal lines create armatures (baroque diagonal, sinister diagonal)
- Reciprocal lines create additional intersection points
- Used extensively in classical painting composition
- Most complex system: requires pre-visualization or post-crop adjustment

#### Leading Lines and Vanishing Points

**Leading lines** direct viewer attention through deliberate geometric paths:
- Convergent lines (roads, railways) create depth and pull attention to vanishing point
- Curved lines (rivers, paths) create grace and flow
- Diagonal lines create dynamic tension and energy
- Horizontal lines suggest stability and calm
- Vertical lines convey power and permanence

**Vanishing point placement:**
- Centered vanishing point: symmetry, confrontation, power
- Off-center vanishing point: dynamism, tension, narrative direction
- Multiple vanishing points (two-point perspective): architectural grandeur
- Vanishing point at subject: maximum attention convergence

#### Headroom and Nose Room Ratios

**Headroom (vertical framing):**
- Close-up: minimal headroom, eyes at upper third line
- Medium shot: slight headroom, top of head near frame edge
- Wide shot: context-dependent headroom
- Rule: tighter shots require less headroom
- Excessive headroom diminishes subject importance

**Nose room (horizontal framing):**
- Subject looking left: position subject in right third of frame
- Subject looking right: position subject in left third of frame
- Ratio: approximately 2/3 space ahead of gaze direction, 1/3 behind
- Breaking nose room deliberately creates tension, claustrophobia, or unease
- Walking room follows the same principle: more space in direction of travel

#### Focal Length Compression Effects on Perception

**Wide angle (14-35mm full frame equivalent):**
- Exaggerates depth: near objects appear larger, far objects smaller
- Stretches facial features when close (bulging nose effect)
- Increases apparent distance between foreground and background
- Creates dynamic, immersive perspective
- Environmental storytelling: shows subject in context

**Normal (40-60mm full frame equivalent):**
- Approximates human visual perception (50mm = standard)
- Neutral perspective compression
- Neither flattering nor unflattering for faces
- Documentary feel: observational without manipulation

**Telephoto (85-300mm+ full frame equivalent):**
- Compresses depth: stacks layers together
- Flattens facial features (flattering for portraits at 85-135mm)
- Isolates subject from environment through narrow angle of view
- Creates voyeuristic/surveillance feel at extreme lengths
- Reduces apparent distance between objects (traffic appears denser, crowds appear larger)

#### Depth of Field as Narrative Tool

**Circle of Confusion (CoC) Formula:**

CoC = f^2 / (N * d)

Where:
- f = focal length (mm)
- N = f-number (aperture)
- d = focus distance (mm)

**Full depth of field equation:**

DOF = 2 * N * CoC * d^2 / (f^2 - N^2 * CoC^2)

For practical purposes (hyperfocal distance):
H = f^2 / (N * CoC)

**Narrative applications:**
- Shallow DOF (f/1.4-2.8): Isolation, intimacy, romanticism, selective attention
- Medium DOF (f/4-5.6): Balanced attention between subject and environment
- Deep DOF (f/8-16): Environmental context, ensemble framing, documentary realism
- Rack focus: Shifts narrative attention between depth planes, reveals information
- Split diopter: Simultaneously sharp near and far subjects (Brian De Palma technique)

---

## Section 2: Video Editing

### 2.1 High-Leverage Editing Workflows

#### Assembly Cut to Rough Cut to Fine Cut Methodology

**Assembly Cut (First pass):**
- All selected takes placed in chronological/script order
- No timing refinements or transitions
- Purpose: verify coverage completeness and identify missing shots
- Typically 2-3x final runtime
- Director and editor review for performance selects

**Rough Cut (Second pass):**
- Performance selections locked
- Basic timing established (scene pacing approximated)
- Placeholder music/temp score added
- VFX shots identified with temp markers
- Major structural decisions made (scene order, deletions)
- Typically 1.3-1.5x final runtime

**Fine Cut (Third pass):**
- Frame-precise timing on every cut
- Audio premix (dialogue levels balanced)
- Transitions placed (dissolves, wipes where needed)
- Color placeholder applied
- Music edits refined
- Picture lock target: +/- 2% of final runtime

**Picture Lock:**
- No further editorial changes after this point
- Enables parallel workflows: color grading, sound mix, VFX, music
- Any changes after lock require re-conforming all dependent workflows
- Locked cut list (EDL/AAF/XML) distributed to all departments

#### Proxy Workflow Setup

**Resolution hierarchy:**
- Full resolution: Native camera files (4K-8K, RAW/ProRes)
- Half resolution: 1/2 linear dimensions (e.g., 4K becomes 1920x1080)
- Quarter resolution: 1/4 linear dimensions (e.g., 4K becomes 960x540)
- Recommended proxy: Quarter res for offline editing, half res for client review

**Codec selection for proxies:**
- ProRes Proxy (Apple ecosystem): 45 Mbps at 1080p, excellent quality/size ratio
- DNxHR LB (Avid ecosystem): Similar quality to ProRes Proxy
- H.264 (universal): Smaller files but higher CPU decode overhead
- Recommendation: ProRes Proxy or DNxHR LB for editing performance

**Proxy linking strategies:**
- Frame count based: Proxy and source share identical frame counts/timecodes
- Metadata based: Reel names, clip names, file paths used for relinking
- Automatic (DaVinci Resolve, Premiere Pro): Software manages proxy/source switching
- Critical rule: Never alter proxy clip durations or timecodes after creation

#### Multicam Sync Techniques

**Audio waveform sync:**
- Most reliable method for multi-camera productions
- Software analyzes audio peaks across all angles
- Requires at least ambient audio on all cameras
- Accuracy: frame-accurate in most cases, occasionally +/- 1 frame

**Timecode sync:**
- Requires jam-synced timecode across all cameras (Tentacle Sync, Deity TC-1)
- Frame-accurate by definition (when TC is properly maintained)
- Preferred for professional multi-camera productions
- Limitation: TC drift over long recording durations without periodic re-jam

**Manual sync points:**
- Clapperboard/slate: visual and audio sync point
- Flash/beep at start of each take
- Used as backup when electronic sync fails
- Slowest method but most universally applicable

#### Timeline Organization

**Color-coded track system (recommended):**
- V1 (blue): Primary footage / A-roll / interviews
- V2 (green): B-roll / cutaway footage
- V3 (yellow): Graphics / titles / lower thirds
- V4 (red): VFX plates / composites
- A1-A2 (blue): Dialogue / interview audio
- A3-A4 (green): Sound effects / foley
- A5-A6 (purple): Music
- A7-A8 (orange): Ambience / room tone

**Nesting/Compound clips:**
- Group related edits into compound clips to reduce timeline complexity
- Multicam groups: multiple angles collapsed into single switchable clip
- VFX nests: complex composites represented as single timeline elements
- Audio nests: dialogue chains with processing baked in

### 2.2 Color Grading Mechanics

#### Vectorscope Reading

The vectorscope displays color information on a circular graph representing hue (angle) and saturation (distance from center):

**Key positions on vectorscope:**
- 0 degrees (right): Red
- 60 degrees: Yellow
- 120 degrees: Green
- 180 degrees (left): Cyan
- 240 degrees: Blue
- 300 degrees: Magenta

**Skin tone line:**
- Located at approximately 123 degrees (between yellow and red, toward orange)
- Also described as the I-line (in-phase line) in NTSC color science
- All human skin tones (regardless of ethnicity) fall on this line
- Deviation indicates color cast: above line = too yellow, below line = too magenta
- Monitoring tool: most professional scopes display a skin tone indicator line

**Gamut compliance:**
- Rec.709: inner target area on vectorscope (75% saturation boxes)
- P3: larger gamut, used for digital cinema delivery
- Rec.2020: largest standardized gamut for HDR/UHD delivery
- Illegal colors: signals exceeding broadcast gamut specifications
- Gamut mapping: soft-clip vs hard-clip strategies for legal delivery

#### Parade/Waveform Monitor Interpretation

**Waveform monitor (Luma):**
- Vertical axis: 0 IRE (black) to 100 IRE (white)
- Horizontal axis: corresponds to horizontal frame position
- Clipping visible as flat lines at 0 or 100 IRE
- Proper exposure: signal fills range without crushing or clipping
- 18% gray card should read approximately 40-43 IRE in Rec.709

**RGB Parade:**
- Three side-by-side waveforms (Red, Green, Blue channels)
- Color balance visible as alignment between channels
- Whites should align at top of all three channels equally
- Blacks should align at bottom of all three channels equally
- Misalignment indicates color cast (e.g., raised blue in shadows = cool shadow cast)

**Histogram:**
- Displays tonal distribution as a graph
- Left side: shadows, Right side: highlights
- Peaks indicate concentrations of tonal values
- Gaps indicate missing tonal information (posterization risk)
- Useful for quick exposure assessment but lacks spatial information

#### Primary Corrections

**Lift/Gamma/Gain (DaVinci Resolve, most NLEs):**
- Lift: Adjusts shadow values while anchoring whites
- Gamma: Adjusts midtone values while anchoring blacks and whites
- Gain: Adjusts highlight values while anchoring blacks
- Each control affects a range of values with soft rolloff

**Offset/Power/Slope (ASC CDL standard):**
- Slope: Multiplies all values (equivalent to gain/exposure adjustment)
- Offset: Adds or subtracts from all values uniformly (lifts entire signal)
- Power: Raises values to a power function (gamma adjustment, midtone emphasis)
- Mathematical relationship: output = (input * slope + offset)^power
- CDL is interchangeable across all professional grading systems

**Practical primary workflow:**
1. Set black point using Lift (shadows just touching 0 IRE)
2. Set white point using Gain (highlights approaching but not exceeding 100 IRE)
3. Adjust overall exposure using Gamma (skin tones to proper IRE range)
4. White balance using RGB channel controls (neutralize color casts)
5. Adjust saturation globally

#### Secondary Qualifications

**HSL Keyers (Hue/Saturation/Luminance):**
- Isolate specific color ranges for targeted correction
- Hue range: select specific colors (e.g., sky blues, skin tones, foliage greens)
- Saturation range: include only colors of certain intensity
- Luminance range: further refine by brightness
- Softness controls: feather the edges of qualification for natural blending
- Matte finesse: shrink/grow, blur, clean operations on the generated matte

**Shape masks (Power Windows):**
- Geometric isolation: circle, square, polygon, gradient, custom bezier
- Tracking: point tracking, planar tracking (perspective), mesh tracking
- Feathering: soft edge transitions to avoid visible mask boundaries
- Combine with qualifiers: shape limits the area, qualifier refines within shape
- Common uses: vignettes, exposure correction for sky/ground, face isolation

#### Color Space Transforms

**Common transforms:**
- Rec.709 to Rec.2020: gamut expansion for HDR delivery
- LOG to Rec.709: applying a technical LUT for standard display
- ACES transforms: IDT/ODT pairs for standardized pipeline
- DaVinci Wide Gamut/Intermediate: Resolve native working space
- Camera-specific: S-Gamut3.Cine to Rec.709, V-Gamut to Rec.709

**HDR grading considerations:**
- PQ (Perceptual Quantizer, ST.2084): absolute luminance scale (0-10,000 nits)
- HLG (Hybrid Log-Gamma): scene-referred, backward compatible with SDR
- Dolby Vision: dynamic metadata, trim passes for multiple target displays
- HDR10+: Samsung dynamic metadata alternative to Dolby Vision
- MaxFALL/MaxCLL: content light level metadata requirements

#### Node-Based Grading Architecture

**Serial nodes:**
- Sequential processing (output of node 1 feeds input of node 2)
- Order matters: each node builds upon previous corrections
- Recommended workflow: corrections flow from technical to creative
- Node 1: Exposure/balance, Node 2: Contrast, Node 3: Qualifiers, Node 4: Look

**Parallel nodes:**
- Process the same input simultaneously, then combine
- Each parallel branch operates on the original unmodified image
- Results blended together (additive mixing)
- Useful for isolating corrections without interaction effects

**Layer nodes:**
- Foreground/background compositing within the grading pipeline
- Alpha channel based: qualifier or external matte defines layer boundary
- Enables independent correction of isolated elements
- Similar to Photoshop layer concept

### 2.3 Pacing Formulas

#### YouTube Retention Patterns

**Hook Window (0-8 seconds):**
- Average viewer decides to stay or leave within first 8 seconds
- First frame must contain visual intrigue (not a blank screen or logo)
- Audio hook within first 2 seconds (compelling statement, question, or sound)
- Pattern interrupt in first 3 seconds disrupts scroll behavior
- Optimal retention at 8 seconds: 70%+ indicates strong hook
- Techniques: cold open into action, provocative statement, visual mystery

**Pattern Interrupt Cadence (every 30-60 seconds):**
- Human attention naturally wanes in 30-60 second cycles
- Re-engagement tools: camera angle change, B-roll cut, graphic overlay, sound effect
- Vocal variation: change pace, volume, or energy at regular intervals
- Information density: new data point or insight every 30 seconds minimum
- Visual novelty: never show the same frame composition for more than 60 seconds

**Re-engagement Hooks (every 3-4 minutes):**
- Open loops: introduce a question answered later in the video
- Verbal signposting: "But first..." or "Coming up, I will show you..."
- Chapter transitions: clear demarcation between sections with mini-hooks
- Stakes escalation: each section more interesting/valuable than the last
- End screen tease: reference content coming in the next minute

**YouTube algorithm signals (2024 data):**
- Average View Duration (AVD): most weighted metric for recommendations
- Click-Through Rate (CTR): 4-10% typical, 10%+ exceptional
- Engagement actions: likes, comments, shares multiply algorithmic weight
- Session time: videos that lead to more viewing on platform are promoted
- Returning viewers: subscriber bell notification activation rate

#### Instagram Reels Optimal Pacing

**Average Shot Length (ASL) targets:**
- Optimal ASL for Reels: 0.5-1.5 seconds per shot
- Never exceed 3 seconds on a single shot without motion/change
- First shot: maximum 1 second (immediate visual hook)
- High-energy content (dance, sports): 0.3-0.8 second ASL
- Educational content: 1.0-2.0 second ASL with text overlays

**Reel structure formula (30-60 seconds):**
- 0-1s: Visual hook (most eye-catching frame)
- 1-3s: Context establishment (who/what/where)
- 3-15s: Value delivery (primary content)
- 15-25s: Escalation (build complexity or stakes)
- 25-end: Payoff + CTA (resolution + follow/save prompt)

**Music-driven editing:**
- Cut precisely on beat (quantize edits to musical grid)
- Emphasis cuts on downbeat (beat 1 of each measure)
- Speed ramps synced to tempo changes or drops
- Silence moments for dramatic effect (pull music, cut to black)

#### L-cuts and J-cuts for Seamless Flow

**L-cut (audio leads video):**
- Outgoing audio extends under incoming video
- Creates smooth flow: audience hears context before seeing it
- Applications: interview edits (hear answer before cutting to speaker), scene transitions
- Typical overlap: 6-24 frames (0.25-1 second)

**J-cut (audio precedes video):**
- Incoming audio begins before its corresponding video
- Creates anticipation: audience hears the next scene arriving
- Applications: pre-lap dialogue, environmental audio foreshadowing
- Creates forward momentum in narrative

**Combined J-L technique:**
- Never cut audio and video at the same frame (straight cut feels jarring)
- Offset audio and video transitions by at least 4-12 frames
- Creates invisible editing: viewer does not perceive the cut consciously
- Standard practice in all professional narrative editing

#### Music-Driven Editing Tempo

**BPM to cut timing conversion:**
- 60 BPM = 1 beat per second = 24/25/30 frames per beat (depending on frame rate)
- 120 BPM = 2 beats per second = 12/12.5/15 frames per beat
- 140 BPM = 2.33 beats per second = 10.3/10.7/12.9 frames per beat

**Formula: Frames per beat = (Frame rate * 60) / BPM**

Examples at 24fps:
- 90 BPM: 16 frames per beat
- 120 BPM: 12 frames per beat
- 150 BPM: 9.6 frames per beat (alternate between 9 and 10)

**Musical structure for editing:**
- 4-bar phrases (most common structural unit): plan major transitions on phrase boundaries
- Verse sections: lower energy, establish context
- Chorus sections: higher energy, maximize visual impact
- Bridge/breakdown: tempo shift, change visual rhythm
- Drop/buildup: match energy escalation with edit density increase

---

## Section 3: Sound Design

### 3.1 Acoustic Treatment Math

#### Room Mode Calculation

Room modes are resonant frequencies where sound waves constructively interfere based on room dimensions:

**Axial mode formula:**
f = c / (2 * L)

Where:
- f = resonant frequency (Hz)
- c = speed of sound (343 m/s at 20 degrees C)
- L = room dimension (meters)

**Example calculation for a room 5m x 4m x 3m:**
- Length modes: 343/(2*5) = 34.3 Hz, 68.6 Hz, 102.9 Hz, 137.2 Hz...
- Width modes: 343/(2*4) = 42.9 Hz, 85.8 Hz, 128.6 Hz...
- Height modes: 343/(2*3) = 57.2 Hz, 114.3 Hz, 171.5 Hz...

**Tangential modes (two dimensions):**
f = (c/2) * sqrt((nx/Lx)^2 + (ny/Ly)^2)

**Oblique modes (three dimensions):**
f = (c/2) * sqrt((nx/Lx)^2 + (ny/Ly)^2 + (nz/Lz)^2)

Where nx, ny, nz are integers (mode numbers).

**Ideal room ratios (minimize mode clustering):**
- IEC recommendation: 1 : 1.4 : 1.9
- Bolt area: ranges of acceptable ratios for uniform mode distribution
- Golden ratio variant: 1 : 1.618 : 2.618
- Avoid integer multiples (1:2:3) which cause severe mode stacking

#### Absorption Coefficient Requirements

**NRC (Noise Reduction Coefficient):**
- Single-number rating averaging absorption at 250, 500, 1000, and 2000 Hz
- Range: 0.00 (perfectly reflective) to 1.00 (perfectly absorptive)
- Typical values:
  - Concrete: NRC 0.02
  - Drywall: NRC 0.05
  - Carpet (heavy): NRC 0.55
  - 2-inch acoustic foam: NRC 0.60
  - 4-inch rockwool panel: NRC 0.95
  - Bass trap (corner-mounted, 4-inch): NRC 0.80

**Sabine absorption coefficient (frequency-specific):**
- More detailed than NRC: measured at 125, 250, 500, 1000, 2000, 4000 Hz
- Critical for designing treatment targeting specific problem frequencies
- Higher-frequency absorption is easier (thinner materials work)
- Low-frequency absorption requires mass, depth, or resonant designs

**Coverage targets:**
- Recording studio control room: 60-70% of wall/ceiling surface treated
- Voice-over booth: 80-95% coverage (near-anechoic)
- Podcast studio: 40-60% coverage (controlled but not dead)
- Mix room: 50-65% coverage with strategic reflection management (first reflection points)

#### Reflection Point Identification (Mirror Trick)

The mirror method identifies first-order specular reflections that reach the listener from walls and ceiling:

**Procedure:**
1. Sit in listening position (mix position)
2. Have assistant slide a mirror along wall surface
3. Mark every point where you can see a speaker reflected in the mirror
4. These points are first reflection locations requiring absorption/diffusion

**First reflection timing:**
- Direct sound arrives at time t0
- First reflections arrive at t0 + delta_t
- If delta_t < 15ms: comb filtering (coloration) occurs
- If delta_t = 15-30ms: early reflections (add spaciousness but can color tonality)
- If delta_t > 30ms: perceived as discrete echoes
- Treatment goal: absorb or diffuse reflections arriving within 15ms of direct sound

#### Bass Trap Dimensions (Quarter-Wavelength Principle)

**Porous absorber depth:**
For a porous absorber to be effective at a given frequency, its depth must be at least 1/4 wavelength:

Depth = wavelength / 4 = c / (4 * f)

Examples:
- 100 Hz: depth = 343 / (4 * 100) = 0.86 meters (34 inches)
- 80 Hz: depth = 343 / (4 * 80) = 1.07 meters (42 inches)
- 60 Hz: depth = 343 / (4 * 60) = 1.43 meters (56 inches)

**Air gap enhancement:**
- Mounting absorber away from wall with an air gap increases low-frequency effectiveness
- Peak absorption occurs when absorber is at 1/4 wavelength from the wall
- 4-inch panel with 4-inch air gap performs like an 8-inch panel for lower frequencies
- Allows thinner, more practical panels to achieve bass absorption

**Corner mounting:**
- Pressure maxima for all room modes occur at room corners (tri-corners)
- Corner-mounted bass traps interact with all axial, tangential, and oblique modes
- Broadband bass trapping most effective when spanning corners floor-to-ceiling
- Minimum trap dimensions: 8-12 inches deep, spanning full corner length

#### RT60 Targets

RT60 (reverberation time) is the time for sound to decay by 60 dB after source stops:

**Sabine equation:**
RT60 = 0.161 * V / A

Where:
- V = room volume (cubic meters)
- A = total absorption (sum of surface_area * absorption_coefficient for all surfaces)

**Target RT60 by room type:**
| Room Type | Target RT60 (seconds) |
|---|---|
| Recording studio (tracking) | 0.3-0.5 |
| Control room / mix room | 0.2-0.4 |
| Voice-over booth | 0.1-0.2 |
| Podcast studio | 0.3-0.5 |
| Home theater | 0.3-0.5 |
| Concert hall | 1.5-2.2 |
| Lecture hall | 0.6-1.0 |

### 3.2 Frequency Equalization Frameworks

#### Fundamental Frequencies of Human Voice

**Male voice:**
- Fundamental frequency (F0): 85-180 Hz (average speaking: 100-130 Hz)
- First formant (F1): 300-700 Hz
- Second formant (F2): 700-2500 Hz
- Chest resonance: 100-300 Hz
- Nasal resonance: 1000-3000 Hz
- Sibilance: 4000-9000 Hz

**Female voice:**
- Fundamental frequency (F0): 165-255 Hz (average speaking: 180-220 Hz)
- First formant (F1): 400-900 Hz
- Second formant (F2): 900-3000 Hz
- Chest resonance: 150-400 Hz
- Nasal resonance: 1500-4000 Hz
- Sibilance: 5000-10000 Hz

**Critical frequency bands for voice processing:**
| Frequency Range | Character | Common Treatment |
|---|---|---|
| 60-100 Hz | Rumble, proximity effect | High-pass filter to remove |
| 100-250 Hz | Chest, warmth, body | Slight boost for richness or cut for clarity |
| 250-500 Hz | Muddiness, boxiness | Often requires 2-4 dB cut |
| 500-1000 Hz | Hollowness, honk | Narrow cuts to remove room resonances |
| 1000-2500 Hz | Presence, intelligibility | Critical for clarity in mix |
| 2500-5000 Hz | Presence peak, attack | 2-3 dB boost for cut-through |
| 5000-8000 Hz | Sibilance, brightness | De-esser target range |
| 8000-12000 Hz | Air, breathiness | Shelving boost for modern open sound |
| 12000-20000 Hz | Ultra-air, sparkle | Subtle enhancement, diminishing returns |

#### Presence Peak and Sibilance Range

**Presence peak (2-5 kHz):**
- Human hearing is most sensitive at 2-5 kHz (Fletcher-Munson equal loudness contours)
- Boosting here makes vocals "cut through" a dense mix
- Broadcast standard: 3 dB boost at 3 kHz for intelligibility
- Excessive boost: harsh, fatiguing, aggressive quality
- Musical instruments also occupy this range: guitar attack, snare crack, piano hammer

**Sibilance range (6-10 kHz):**
- Sibilant consonants: S, T, Z, SH, CH
- Problematic frequencies vary by speaker: typically 5-9 kHz peak
- De-essing: frequency-specific compression or dynamic EQ targeting sibilance
- De-esser threshold: typically 3-6 dB of gain reduction on sibilant peaks
- Split-band approach: only compress the sibilant frequency band, leave rest untouched

#### Subtractive vs Additive EQ Philosophy

**Subtractive EQ (cut to improve):**
- Remove unwanted frequencies before boosting desired ones
- Narrower Q values for surgical cuts (Q = 4-10)
- Identify problems: sweep a narrow boost across spectrum to find resonances, then cut
- Typical cuts: 2-6 dB at problem frequencies
- Benefits: preserves headroom, reduces noise, cleaner overall signal
- Rule: "Cut narrow, boost wide"

**Additive EQ (boost to enhance):**
- Broader Q values for musical boosts (Q = 0.5-2.0)
- Enhance desirable characteristics already present in the source
- Typical boosts: 1-3 dB for subtle enhancement
- Shelf boosts for broad tonal shaping (low shelf for warmth, high shelf for air)
- Risk: increased noise floor, potential for distortion, masking issues

**Q factor (bandwidth) guide:**
- Q = 0.5: Very wide (approximately 2.5 octave bandwidth)
- Q = 1.0: Wide (approximately 1.4 octave bandwidth)
- Q = 2.0: Medium (approximately 0.7 octave bandwidth)
- Q = 4.0: Narrow (approximately 0.35 octave bandwidth)
- Q = 10.0: Very narrow (approximately 0.14 octave bandwidth)
- Relationship: Bandwidth (octaves) = 2 / Q (approximate)

#### High-Pass Filter Strategy

**Filter slopes:**
- 6 dB/octave (1st order): Gentle rolloff, minimal phase shift, natural sound
- 12 dB/octave (2nd order): Moderate rolloff, some phase rotation
- 18 dB/octave (3rd order): Steeper rolloff, noticeable phase effects
- 24 dB/octave (4th order): Aggressive rolloff, significant phase shift near cutoff
- 48 dB/octave (8th order): Brick-wall filter, maximum phase disruption

**Recommended HPF frequencies by source:**
| Source | HPF Frequency | Slope |
|---|---|---|
| Male vocal | 80-100 Hz | 18-24 dB/oct |
| Female vocal | 100-150 Hz | 18-24 dB/oct |
| Acoustic guitar | 80-100 Hz | 12-18 dB/oct |
| Electric guitar | 80-120 Hz | 12 dB/oct |
| Drum overheads | 200-300 Hz | 12-18 dB/oct |
| Piano | 40-60 Hz | 12 dB/oct |
| Bass guitar/synth | Do not HPF | -- |
| Kick drum | 30-40 Hz | 18-24 dB/oct |

#### EQ-Before-Compression vs Compression-Before-EQ

**EQ before compression:**
- Removes problematic frequencies before compressor reacts to them
- Prevents compressor from triggering on unwanted resonances
- Cleaner compression behavior: compressor responds to desired signal only
- Common approach: HPF and subtractive cuts before compressor
- Use case: removing proximity effect rumble, taming room resonances

**Compression before EQ:**
- EQ operates on a dynamically controlled signal
- Boosts and cuts are more predictable (consistent level going into EQ)
- EQ changes do not affect compression behavior
- Better for tonal shaping after dynamic control
- Use case: adding presence/air after leveling dynamics

**Hybrid approach (most professional):**
1. Corrective EQ first (HPF, narrow cuts for resonances)
2. Compression (dynamic control)
3. Tonal EQ (broad boosts for character, shelving for color)
4. De-esser (frequency-specific dynamic processing)
5. Limiter (final peak control)

### 3.3 Spatial Audio Configuration

#### Stereo Field Placement (Pan Law)

Pan law determines how signal level is compensated as a source is panned between left and right:

**Pan law options:**
- **-3 dB center:** When panned center, each speaker receives -3 dB (power sum = 0 dB). Accurate for loudspeaker playback.
- **-4.5 dB center:** Compromise between -3 and -6 dB. Works for both speakers and headphones.
- **-6 dB center:** When panned center, each speaker receives -6 dB (voltage sum = 0 dB). Better for headphone monitoring.

**Stereo placement guidelines:**
- Center (0): Lead vocal, bass, kick drum, snare (fundamental)
- Narrow (10-30%): Rhythm guitar, keys, toms
- Medium (30-60%): Background vocals, synths, percussion
- Wide (60-90%): Ambient mics, room mics, stereo effects
- Hard pan (100%): Dual guitar arrangements, stereo overheads, stereo synths
- LCR mixing: Pan only to hard left, center, or hard right (minimalist approach)

**Frequency-dependent panning perception:**
- Below 80 Hz: panning largely imperceptible (wavelength > head width)
- 80-800 Hz: Interaural Time Difference (ITD) dominates localization
- Above 1500 Hz: Interaural Level Difference (ILD) dominates localization
- 800-1500 Hz: transition zone, both cues relevant

#### Surround Sound Standards

**5.1 channel configuration:**
- L (Left): 30 degrees from center
- C (Center): 0 degrees (directly ahead)
- R (Right): -30 degrees from center
- Ls (Left Surround): 110-120 degrees
- Rs (Right Surround): -110 to -120 degrees
- LFE (Low Frequency Effects): .1 channel, 20-120 Hz, no spatial position

**7.1 channel configuration:**
- Adds Lss (Left Side Surround): 90 degrees
- Adds Rss (Right Side Surround): -90 degrees
- Rear speakers move to 135 degrees (Lrs, Rrs)

**Dolby Atmos (object-based audio):**
- Bed channels: 7.1.2 or 7.1.4 speaker layout (height channels)
- Audio objects: up to 128 simultaneous objects in cinema, 16 in consumer
- Objects carry positional metadata (x, y, z coordinates)
- Renderer maps objects to actual speaker layout dynamically
- Binaural rendering: Atmos mixed down to headphone delivery via HRTF
- Height channels: overhead speakers at 30-45 degree elevation angles

#### Binaural Rendering (HRTF Functions)

**Head-Related Transfer Function (HRTF):**
- Mathematical model of how sound is filtered by pinnae, head, and torso
- Unique to each individual (shape of ears, head size)
- Measured by placing microphones in ear canals and playing impulses from all directions
- Generic HRTFs: averaged from multiple subjects (less accurate for individuals)
- Personalized HRTFs: measured individually or estimated from ear photographs (Apple, Sony)

**HRTF cues encoded:**
- ITD (Interaural Time Difference): up to 0.7ms delay between ears for lateral sources
- ILD (Interaural Level Difference): up to 20 dB at high frequencies for lateral sources
- Spectral filtering: pinna notches at 6-10 kHz encode elevation information
- Head shadow: frequencies above 1500 Hz attenuated on far side of head
- Torso reflection: below 3 kHz, body reflections provide elevation cues

#### Reverb Parameters

**Pre-delay:**
- Time between direct sound and first reverb onset
- Range: 0-100ms
- Determines perceived distance: longer pre-delay = closer source, further walls
- Calculation: pre-delay (ms) = distance to nearest wall (m) / 343 * 2 * 1000
- Typical values: 15-40ms for intimate spaces, 60-100ms for large spaces

**Decay time (RT60):**
- Time for reverb tail to decrease by 60 dB
- Determines perceived room size and material
- Short (0.3-1.0s): small rooms, absorbent surfaces
- Medium (1.0-2.0s): medium halls, general purpose
- Long (2.0-5.0s): cathedrals, large concert halls
- Very long (5.0+s): special effects, ambient textures

**Early reflections:**
- First discrete echoes from nearest surfaces (floor, walls, ceiling)
- Arrive within 5-80ms of direct sound
- Shape the perception of room size, shape, and materials
- More early reflections = smaller, more enclosed space
- Sparse early reflections = larger, more open space
- Pattern determines room geometry

**Diffusion:**
- Controls density and smoothness of reverb tail
- High diffusion: smooth, lush tail (no discernible discrete echoes)
- Low diffusion: grainy, textured tail (individual echoes partially audible)
- Higher diffusion for vocals and sustained instruments
- Lower diffusion for percussive sources (preserves transient clarity)

#### Haas Effect for Width (1-40ms Delay)

The Haas effect (precedence effect) states that when two identical sounds arrive within 1-40ms, the brain fuses them into a single percept localized at the earlier source:

**Application for stereo width:**
1. Duplicate a mono signal to a second channel
2. Pan original hard left, copy hard right
3. Delay the copy by 10-35ms
4. Sound appears to come from the earlier (undelayed) side but with perceived width
5. Adjust delay time to control width perception

**Frequency considerations:**
- Below 800 Hz: delays up to 10ms produce tonal coloring (comb filtering)
- Above 1500 Hz: Haas effect works cleanly for localization
- Full-band Haas: risk of comb filtering when summed to mono
- Solution: EQ the delayed copy differently to reduce mono compatibility issues

**Timing thresholds:**
- 0-1ms: Summing localization, comb filtering, tone changes
- 1-10ms: Haas effect begins, fusion with widening
- 10-35ms: Full Haas effect, maximum width without perceived echo
- 35-50ms: Transition zone, echo starts becoming audible
- 50ms+: Distinct echo perceived as separate event

---

## References and Further Reading

- American Society of Cinematographers (ASC) Manual, 11th Edition
- Color Correction Handbook by Alexis Van Hurkman
- Sound System Engineering by Don Davis and Eugene Patronis
- Master Handbook of Acoustics by F. Alton Everest
- ACES Documentation (Academy of Motion Picture Arts and Sciences)
- EBU Tech 3355 (TLCI Measurement Standard)
- ITU-R BS.775 (Multichannel Stereophonic Sound System)
- AES Convention Papers on Spatial Audio and HRTF
- YouTube Creator Academy Technical Documentation
- Instagram for Business: Content Strategy Guidelines
