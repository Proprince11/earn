# Genetics & Automotive Engineering: Dual-Domain Technical Brief

## Table of Contents
1. [Genetics and GMOs](#genetics--gmos)
2. [Automotive Engineering](#automotive-engineering)

---

## Section 1: Genetics & GMOs

### 1.1 CRISPR-Cas9 Mechanics

#### Cas9 Protein Structure

The Streptococcus pyogenes Cas9 (SpCas9) is a 1368-amino acid RNA-guided endonuclease with a bilobed architecture:

**Recognition lobe (REC):**
- REC1 domain: primary interaction surface with guide RNA
- REC2 domain: assists in target DNA strand separation
- Bridge helix: connects REC and NUC lobes, positions guide RNA

**Nuclease lobe (NUC):**
- **RuvC domain:** Cleaves the non-target (displaced) DNA strand
  - RuvC I, II, and III subdomains form the active site
  - Catalytic residues: D10, E762, H983, D986
  - Mutations: D10A creates a nickase (cuts only target strand via HNH)
- **HNH domain:** Cleaves the target (guide-complementary) DNA strand
  - Single catalytic center with active site residue H840
  - Mutations: H840A creates a nickase (cuts only non-target strand via RuvC)
  - Both mutations (D10A + H840A) = dead Cas9 (dCas9, no cutting, used for CRISPRi/CRISPRa)
- **PAM-interacting domain (PID):** Recognizes and binds PAM sequence on target DNA

**Conformational dynamics:**
- Apo state: open, flexible configuration
- sgRNA binding: induces conformational change to pre-targeting state
- PAM recognition: PID locks onto DNA, initiates strand separation
- R-loop formation: sequential base-pairing between guide RNA and target DNA
- HNH domain repositioning: swings 180 degrees into active position upon full R-loop formation
- Coordinated cleavage: both strands cut within 3-4 bp of each other

#### Guide RNA Architecture

**Natural system (dual RNA):**
- crRNA (CRISPR RNA): 20-nucleotide spacer complementary to target + repeat region
- tracrRNA (trans-activating crRNA): scaffolding structure that binds Cas9 protein
- crRNA:tracrRNA form partial duplex through repeat:anti-repeat hybridization

**Engineered system (single guide RNA / sgRNA):**
- 20-nucleotide spacer (target recognition) at 5-prime end
- Tetraloop linker connecting crRNA and tracrRNA portions
- Repeat:anti-repeat stem (stabilizes Cas9 binding)
- Stem-loop 1, 2, 3 (scaffolding structures)
- Total length: approximately 100 nucleotides

**Spacer design considerations:**
- GC content: 40-70% optimal (extreme values reduce efficiency)
- Avoid runs of 4+ Ts (terminates RNA Pol III transcription)
- Self-complementarity: avoid extensive secondary structure in spacer
- Seed region: positions 1-12 from PAM are most critical for specificity
- Truncated guides (17-18nt): reduced off-target activity with maintained on-target efficiency

#### PAM Sequence Recognition

**SpCas9 PAM: 5-prime-NGG-3-prime (on non-target strand)**

- N = any nucleotide, G = guanine
- PAM is adjacent to the 3-prime end of the target sequence
- Cas9 does NOT cut within the PAM itself
- Cut site: 3 bp upstream of PAM (creating blunt ends)
- PAM recognition occurs before DNA unwinding (initial target interrogation)

**Alternative Cas9 PAM variants:**
| Enzyme | PAM Sequence | Source Organism | Application |
|---|---|---|---|
| SpCas9 | NGG | S. pyogenes | Standard, most validated |
| SpCas9-NG | NG | Engineered SpCas9 | Expanded targeting range |
| xCas9 | NG, GAA, GAT | Engineered SpCas9 | Broadest PAM flexibility |
| SaCas9 | NNGRRT | S. aureus | Smaller protein (AAV-compatible) |
| CjCas9 | NNNNRYAC | C. jejuni | Smallest Cas9 (984 aa) |
| FnCas9 | NGG | F. novicida | Low off-target activity |

#### Double-Strand Break Repair Pathways

**NHEJ (Non-Homologous End Joining):**
- Active in all cell cycle phases (G1, S, G2, M)
- Error-prone: introduces insertions or deletions (indels) at cut site
- Typical indels: 1-20 bp, predominantly single-nucleotide insertions or short deletions
- Ku70/Ku80 heterodimer binds broken ends
- DNA-PKcs recruited for end processing
- XRCC4/Ligase IV complex ligates processed ends
- Outcome: gene knockout through frameshift mutations
- Efficiency: 50-95% in most cell types

**HDR (Homology-Directed Repair):**
- Active only in S/G2 phases (requires sister chromatid or donor template)
- High-fidelity: introduces precise edits using provided template
- Donor template types:
  - ssODN (single-stranded oligodeoxynucleotide): 80-200nt, for small edits
  - dsDNA plasmid: for large insertions (1-10+ kb)
  - AAV donor: for in vivo gene correction
- Homology arm length: 30-50nt each for ssODN, 500-1000bp each for plasmid
- Efficiency: typically 5-50% (varies greatly by cell type, locus, and template design)
- Enhancement strategies: cell cycle synchronization (nocodazole arrest in G2), NHEJ inhibitors (SCR7, M3814), cold shock treatment

**MMEJ (Microhomology-Mediated End Joining):**
- Alternative pathway using 2-25bp microhomology sequences flanking the break
- Produces predictable deletions between microhomology regions
- Active in G1 through M phase (broader activity than HDR)
- Can be exploited for predictable gene disruption (MMEJ-based knock-in strategies)

#### Off-Target Effects and Specificity Scoring

**Sources of off-target cleavage:**
- Mismatch tolerance: Cas9 tolerates 1-3 mismatches in non-seed region (positions 13-20)
- DNA/RNA bulges: insertions in guide or target can be accommodated
- PAM variants: NAG recognized at approximately 10% of NGG efficiency
- Chromatin accessibility: open chromatin regions more susceptible to off-target binding

**Specificity scoring algorithms:**

**MIT Specificity Score (Hsu et al., 2013):**
- Aggregates all potential off-target sites in the genome
- Weights each mismatch position by empirically determined penalties
- Score 0-100: higher = fewer/lower-quality off-target sites
- Threshold: >50 considered acceptable, >80 preferred

**CFD Score (Cutting Frequency Determination, Doench et al., 2016):**
- Measures individual off-target site likelihood of being cut
- Based on empirical cutting frequency data for all possible mismatch combinations
- Score 0-1: higher = more likely to be cut
- Most accurate predictor of off-target activity to date
- Incorporates both mismatch identity and position

**Experimental off-target detection methods:**
- GUIDE-seq: unbiased genome-wide detection of DSBs via dsODN integration
- CIRCLE-seq: in vitro detection of all cleavable sites in genomic DNA
- DISCOVER-seq: ChIP-seq of DSB repair factors for in vivo detection
- CHANGE-seq: tagmentation-based in vitro detection with high sensitivity

#### Delivery Vectors

**Viral delivery:**

*AAV (Adeno-Associated Virus):*
- Cargo capacity: 4.7 kb (limiting for SpCas9 at 4.2 kb + guide + promoter)
- Serotypes: AAV1-9, AAVrh10, AAV-PHP.eB (tissue tropism varies)
- Integration: Predominantly episomal (non-integrating)
- Immunogenicity: Low, but pre-existing antibodies in 30-60% of humans
- Duration: Long-term expression in non-dividing cells (weeks to years)
- Solution for size: Split-Cas9 (N-terminal/C-terminal in separate AAVs) or use SaCas9 (3.2 kb)

*Lentivirus:*
- Cargo capacity: 8-10 kb (sufficient for SpCas9 + guide)
- Integration: Random genomic integration (insertional mutagenesis risk)
- Transduction: Both dividing and non-dividing cells
- Sustained expression: constitutive Cas9 expression (increases off-target risk over time)
- Application: pooled CRISPR screens (library delivery)

**Non-viral delivery:**

*Electroporation:*
- Delivers Cas9 protein + sgRNA as ribonucleoprotein (RNP) complex
- Immediate activity upon delivery (no transcription/translation lag)
- Transient: RNP degraded within 24-48 hours (minimizes off-target accumulation)
- Cell type dependent efficiency (T cells: >90%, stem cells: 50-80%)
- No foreign DNA: no integration risk, no innate immune activation from DNA

*Lipofection (lipid nanoparticles):*
- Cationic lipid formulations encapsulate Cas9 mRNA + sgRNA or RNP
- Suited for in vivo delivery (liver targeting via LNP: Intellia NTLA-2001)
- Ionizable lipids: neutral at physiological pH, charged in endosomes (membrane fusion)
- Transient expression: mRNA translated once then degraded

*RNP (Ribonucleoprotein) delivery:*
- Pre-formed Cas9 protein + sgRNA complex
- Most transient editing modality (active within minutes, cleared within hours)
- Lowest off-target risk due to brief activity window
- Best for: therapeutic applications, precious cell types, high-fidelity editing
- Combined with electroporation: gold standard for ex vivo therapeutic editing

#### Next-Generation CRISPR Systems

**Cas12a (Cpf1):**
- PAM: TTTV (T-rich, complementary to SpCas9 G-rich PAM)
- Cut type: 5-prime staggered cuts (5nt overhang, away from PAM)
- Single crRNA (no tracrRNA needed, simpler guide design)
- Smaller protein than Cas9 (approximately 1300 aa)
- Intrinsic RNase activity: processes pre-crRNA arrays into individual guides
- Advantage: targets AT-rich regions inaccessible to SpCas9

**Cas13 (RNA targeting):**
- Targets RNA instead of DNA (no permanent genomic modification)
- Cas13a (formerly C2c2): HEPN domains for RNA cleavage
- Applications: transcript knockdown (alternative to RNAi), RNA editing, diagnostics (SHERLOCK)
- Collateral cleavage: non-specific RNase activity upon target recognition (exploited in diagnostics)
- Cas13d (CasRx): smallest RNA-targeting Cas (967 aa), efficient mammalian knockdown

**Base editors:**
- CBE (Cytosine Base Editor): C to T conversion (C-G to T-A base pair)
  - Architecture: nCas9 (D10A) + cytidine deaminase (APOBEC1/A3A) + UGI (uracil glycosylase inhibitor)
  - Activity window: positions 4-8 of the protospacer
  - No DSB required: single-strand nick + deamination
- ABE (Adenine Base Editor): A to G conversion (A-T to G-C base pair)
  - Architecture: nCas9 (D10A) + evolved TadA adenine deaminase (TadA8e)
  - Activity window: positions 4-8 of the protospacer
  - Addresses approximately 48% of known pathogenic point mutations (A-T to G-C class)

**Prime editors:**
- pegRNA (prime editing guide RNA): encodes both target site and desired edit
- Architecture: nCas9 (H840A) + M-MLV reverse transcriptase fusion
- Mechanism: nick target strand, reverse transcribe new sequence from pegRNA template
- Capabilities: All 12 possible point mutations, small insertions (up to 44bp demonstrated), small deletions
- No DSB, no donor template, no HDR required
- Lower efficiency than base editors but far more versatile
- PE2, PE3, PE4, PE5 generations with increasing efficiency

### 1.2 Epigenetic Alteration Vectors

#### DNA Methylation

**CpG islands and methylation patterns:**
- CpG dinucleotides: cytosine followed by guanine (5-prime to 3-prime direction)
- CpG islands: regions >200bp with >50% GC content and observed/expected CpG ratio >0.6
- 70% of gene promoters contain CpG islands
- Methylation at promoter CpG islands: transcriptional silencing (gene off)
- Methylation at gene body: associated with active transcription (gene on)
- Global methylation: 70-80% of all CpG dinucleotides are methylated in somatic cells

**DNMT enzymes (DNA methyltransferases):**

*DNMT1 (maintenance methyltransferase):*
- Recognizes hemimethylated DNA during replication
- Copies methylation pattern to newly synthesized strand
- PCNA and UHRF1 recruit DNMT1 to replication fork
- Ensures faithful inheritance of methylation patterns across cell divisions
- Knockout: embryonic lethal, global demethylation

*DNMT3A/DNMT3B (de novo methyltransferases):*
- Establish new methylation patterns (not dependent on pre-existing methylation)
- Critical during embryonic development and germ cell specification
- DNMT3A: broad expression, haploinsufficiency causes Tatton-Brown-Rahman syndrome
- DNMT3B: mutations cause ICF syndrome (immunodeficiency, centromeric instability)
- DNMT3L: catalytically inactive cofactor that enhances DNMT3A/B activity

**Active demethylation pathway:**
- TET enzymes (TET1/2/3): oxidize 5-methylcytosine (5mC) stepwise
  - 5mC -> 5-hydroxymethylcytosine (5hmC)
  - 5hmC -> 5-formylcytosine (5fC)
  - 5fC -> 5-carboxylcytosine (5caC)
- TDG (Thymine DNA Glycosylase): excises 5fC and 5caC
- Base Excision Repair (BER): replaces with unmodified cytosine
- Net result: active enzymatic demethylation of targeted loci

#### Histone Modifications

**Histone acetylation/deacetylation:**

*HATs (Histone Acetyltransferases):*
- Add acetyl groups to lysine residues on histone tails
- Neutralize positive charge on lysines: weaken histone-DNA electrostatic interaction
- Open chromatin (euchromatin): accessible to transcriptional machinery
- Key HATs: p300/CBP, GCN5, PCAF, MOZ, MORF
- Acetylated marks: H3K9ac, H3K14ac, H3K27ac (all activating)

*HDACs (Histone Deacetylases):*
- Remove acetyl groups: restore positive charge, condense chromatin
- Classes: I (HDAC1,2,3,8), II (HDAC4,5,6,7,9,10), III (Sirtuins 1-7), IV (HDAC11)
- HDAC inhibitors (HDACi): vorinostat, romidepsin, panobinostat (cancer therapeutics)
- Condensed chromatin (heterochromatin): transcriptionally silent

**Histone methylation:**

*HMTs (Histone Methyltransferases):*
- Add methyl groups to lysine or arginine residues
- Can be activating OR repressive depending on specific residue and degree

**Key methylation marks:**
| Mark | Residue | Effect | Writer Enzyme | Reader Domain |
|---|---|---|---|---|
| H3K4me3 | Histone 3, Lysine 4, trimethyl | Activation | MLL/SET1 complex | PHD finger, Chromodomain |
| H3K4me1 | Histone 3, Lysine 4, monomethyl | Enhancer mark | MLL3/4 | -- |
| H3K27me3 | Histone 3, Lysine 27, trimethyl | Repression | PRC2 (EZH2) | Chromodomain (Pc) |
| H3K9me3 | Histone 3, Lysine 9, trimethyl | Heterochromatin | SUV39H1/2 | HP1 chromodomain |
| H3K36me3 | Histone 3, Lysine 36, trimethyl | Transcription elongation | SETD2 | PWWP domain |
| H4K20me3 | Histone 4, Lysine 20, trimethyl | Heterochromatin | SUV4-20H | -- |

**Bivalent domains:**
- Promoters carrying both H3K4me3 (active) and H3K27me3 (repressive) simultaneously
- Found at developmental genes in embryonic stem cells
- Poised state: gene ready for rapid activation or permanent silencing upon differentiation
- Resolution: lineage commitment removes one mark, establishing active or silent state

#### Non-Coding RNA Mechanisms

**miRNA (microRNA):**
- 19-22 nucleotide single-stranded RNAs
- Processing: pri-miRNA (Drosha/DGCR8) -> pre-miRNA (Exportin-5) -> mature miRNA (Dicer)
- RISC complex: miRNA guides Argonaute protein to target mRNA 3-prime UTR
- Seed sequence: nucleotides 2-8 of miRNA determine target recognition
- Effects: mRNA degradation or translational repression
- Each miRNA can target hundreds of mRNAs; each mRNA targeted by multiple miRNAs
- >2000 human miRNAs identified; regulate approximately 60% of protein-coding genes

**lncRNA (long non-coding RNA):**
- >200 nucleotides, diverse mechanisms of action
- Scaffold function: organize protein complexes on chromatin (e.g., XIST for X-inactivation)
- Guide function: direct chromatin-modifying complexes to specific loci (e.g., HOTAIR guides PRC2)
- Decoy function: titrate transcription factors or miRNAs away from targets
- Enhancer function: eRNAs (enhancer RNAs) facilitate enhancer-promoter looping
- Estimated 16,000+ lncRNA genes in the human genome

**siRNA (small interfering RNA):**
- 20-25 nucleotide double-stranded RNA
- Exogenous origin (therapeutic) or endogenous (endo-siRNAs)
- RISC-mediated: perfect complementarity to target mRNA leads to cleavage
- Therapeutic applications: patisiran (TTR amyloidosis), givosiran (acute hepatic porphyria)
- Delivery: GalNAc conjugation for hepatocyte targeting, LNP formulation

#### Chromatin Remodeling Complexes

**SWI/SNF (BAF/PBAF) complex:**
- ATP-dependent chromatin remodeling
- Catalytic subunits: BRG1 (SMARCA4) or BRM (SMARCA2)
- Mechanism: uses ATP hydrolysis to slide, eject, or restructure nucleosomes
- Opens chromatin at promoters and enhancers for transcription factor access
- Tumor suppressor: mutated in approximately 20% of human cancers (ARID1A, SMARCB1)

**ISWI complexes (NURF, ACF, CHRAC):**
- ATP-dependent, primarily involved in nucleosome spacing
- Establishes regular nucleosome arrays (compaction)
- Antagonistic to SWI/SNF in some contexts
- Important for DNA replication and repair (nucleosome reassembly)

**CHD family:**
- Chromodomain helicase DNA-binding proteins
- CHD1: H3K4me3 reader, maintains euchromatin
- NuRD complex (CHD3/4): contains HDAC1/2, couples remodeling with deacetylation (repression)
- CHD7: mutations cause CHARGE syndrome (developmental disorder)

#### Transgenerational Epigenetic Inheritance

**Evidence in mammals:**
- Dutch Hunger Winter (1944-45): offspring of famine-exposed mothers showed increased metabolic disease 60+ years later, and effects observed in F2 generation
- Overkalix cohort (Sweden): grandpaternal food supply in pre-puberty correlated with grandchildren cardiovascular mortality
- Animal models: Agouti mouse (Avy allele methylation inheritance), vinclozolin-exposed rats show reproductive effects to F3

**Mechanisms of transgenerational transmission:**
- Incomplete epigenetic reprogramming in germline (some marks escape erasure)
- Retained histone modifications at specific loci (histone replacement is incomplete)
- piRNA pathway: PIWI-interacting RNAs maintain transposon silencing across generations
- Metabolites in follicular/seminal fluid: environmental programming of gametes
- Limitation: most epigenetic marks erased in two waves (pre-implantation and primordial germ cells)

#### Environmental Epigenetics

**Diet:**
- Methyl donors (folate, B12, choline, betaine): supply one-carbon metabolism for DNA methylation
- Polyphenols: EGCG (green tea) inhibits DNMT activity in vitro
- Caloric restriction: activates Sirtuins (SIRT1-7), modifies histone deacetylation patterns
- High-fat diet: alters methylation at metabolic gene promoters (PPARgamma, GLUT4)

**Stress:**
- Glucocorticoid exposure alters methylation at NR3C1 (glucocorticoid receptor) promoter
- Childhood adversity associated with increased methylation of stress-response genes
- Telomere shortening accelerated by chronic stress (epigenetic aging markers)

**Toxin exposure:**
- BPA (bisphenol A): hypomethylation at imprinted loci (Igf2, H19)
- Heavy metals (arsenic, lead, cadmium): global hypomethylation, specific gene hypermethylation
- Air pollution (PM2.5): LINE-1 and Alu repetitive element hypomethylation
- Endocrine disruptors: transgenerational effects on reproductive epigenome

### 1.3 Synthetic Biology Basics

#### Genetic Circuit Design

**Core components of a genetic circuit:**

1. **Promoter:** DNA sequence that recruits RNA polymerase to initiate transcription
   - Constitutive promoters: constant expression (e.g., pTet, pLac without inducer)
   - Inducible promoters: expression controlled by external signal (IPTG, arabinose, aTc, light)
   - Strength measurement: relative promoter units (RPU) normalized to standard reference

2. **RBS (Ribosome Binding Site):** mRNA sequence enabling ribosome attachment for translation
   - Shine-Dalgarno sequence in prokaryotes (AGGAGG complementary to 16S rRNA)
   - Spacing from start codon: 5-10 nucleotides optimal
   - RBS Calculator (Salis Lab): computational design of precise translation initiation rates
   - Strength range: 0.01 to 100 au (arbitrary units)

3. **Coding Sequence (CDS):** Gene encoding the protein of interest
   - Codon optimization: adapt codon usage to host organism tRNA abundance
   - Rare codon clusters can reduce translation rate (used for protein folding control)
   - Fusion tags: fluorescent reporters (GFP, mCherry), affinity tags (His6, FLAG)

4. **Terminator:** Stops transcription, releases RNA polymerase
   - Rho-independent (intrinsic): stem-loop structure followed by U-rich tract
   - Efficiency: 50-99% termination (leaky terminators allow read-through)
   - Double terminators: two in series for >99% termination fidelity
   - Bidirectional terminators: prevent interference between adjacent genetic elements

**Logic gates in genetic circuits:**
- NOT gate (inverter): repressor protein (e.g., LacI represses downstream gene)
- AND gate: two inputs both required (e.g., split T7 RNA polymerase halves)
- OR gate: either input sufficient (two promoters driving same output)
- Toggle switch: bistable circuit with mutual repression (Gardner et al., 2000)
- Oscillator: repressilator (Elowitz & Leibler, 2000) - three mutual repressors in ring

#### BioBrick Standard Assembly (RFC 10)

**BioBrick standard parts:**
- Prefix: EcoRI (GAATTC) ... XbaI (TCTAGA) ... [Part] ... SpeI (ACTAGT) ... PstI (CTGCAG) : Suffix
- Assembly: Cut upstream part with EcoRI + SpeI, downstream part with EcoRI + XbaI
- Ligate: XbaI/SpeI scar (TACTAG) is non-functional, no longer cut by either enzyme
- Iterative: assembled composite part retains prefix and suffix for further assembly
- Registry of Standard Biological Parts (iGEM): >20,000 characterized parts

**Limitations of BioBrick:**
- Scar sequences between parts may affect function (6bp insertion)
- Only one assembly junction per reaction
- Slow iterative process (one part added per cloning cycle)
- No scarless assembly possible

#### Golden Gate and Gibson Assembly

**Golden Gate Assembly:**
- Uses Type IIS restriction enzymes (BsaI, BsmBI): cut outside recognition site
- Custom 4-bp overhangs designed for ordered, directional assembly
- 4-12+ parts assembled simultaneously in single reaction
- Standardized systems: MoClo (Modular Cloning), GoldenBraid, CIDAR MoClo
- Scar-free: fusion sites designed at natural junctions (between coding regions)
- Efficiency: 95%+ correct assemblies for 4-part constructs

**Gibson Assembly:**
- Isothermal single-reaction assembly (50 degrees C, 1 hour)
- Three enzymes: T5 exonuclease (creates overhangs), Phusion polymerase (fills gaps), Taq ligase (seals nicks)
- Requires 20-40bp overlap between adjacent fragments
- No restriction enzymes needed: sequence-independent
- Assemble 2-6 fragments routinely (up to 15 demonstrated)
- Scar-free: overlaps designed at exact junction points
- Limitation: repetitive sequences can misassemble

#### Metabolic Engineering (Flux Balance Analysis)

**Principles:**
- Stoichiometric matrix (S): encodes all metabolic reactions and their stoichiometry
- Steady-state assumption: S * v = 0 (metabolite concentrations constant)
- Constraint-based: flux bounds represent enzyme capacity limits
- Objective function: maximize biomass production, product synthesis, or ATP yield
- Linear programming: solve underdetermined system with defined objective

**Applications:**
- Predict gene knockout effects on metabolic flux
- Identify metabolic bottlenecks limiting product yield
- Design synthetic pathways for non-natural product synthesis
- Strain optimization for industrial fermentation (yield improvement)
- Models: E. coli iML1515 (2719 reactions), yeast iMM904, human Recon3D

#### Cell-Free Systems (TX-TL)

**Components:**
- Cell extract: crude lysate from E. coli (S30 extract) or wheat germ or rabbit reticulocyte
- Energy regeneration: ATP, GTP, creatine phosphate/creatine kinase or PEP/pyruvate kinase
- Amino acids: all 20 standard amino acids
- NTPs: nucleotides for transcription
- Template: linear DNA (PCR product) or plasmid
- Buffer: salts, pH buffer, reducing agents

**Advantages over in vivo systems:**
- No cell growth constraints (toxic products tolerated)
- Open system: add/remove components freely
- Rapid prototyping: results in 2-12 hours vs days for cloning
- Precise control: defined concentrations of all components
- No biosafety concerns: non-living system, no GMO regulations

**Applications:**
- Rapid prototyping of genetic circuits before in vivo implementation
- Diagnostics: paper-based cell-free sensors (toehold switches for Zika detection)
- Education and iGEM competition (safe classroom demonstrations)
- Biomanufacturing: cell-free synthesis of proteins, natural products

#### Minimal Genome Projects

**Mycoplasma mycoides JCVI-syn3.0 (Hutchison et al., 2016):**
- 473 genes (531,490 bp): smallest genome capable of independent growth
- Derived from JCVI-syn1.0 (1079 genes) through systematic gene deletion
- 149 genes of unknown function (32%): essential but no known role
- Doubling time: approximately 180 minutes (vs 60 min for syn1.0)
- Demonstrates: our incomplete understanding of essential cellular processes

**Design-Build-Test-Learn cycle:**
1. Design: computational genome design with genetic code annotation
2. Build: chemical synthesis of DNA fragments, assembled by yeast recombination
3. Test: genome transplantation into recipient cell, viability testing
4. Learn: identify essential genes, refine minimal gene set, iterate

### 1.4 Precision Agricultural Science

#### Bt Crop Engineering

**Cry protein insecticidal mechanism:**
1. Crystal protein (Cry1Ab, Cry2Ab, Cry3Bb) produced by Bacillus thuringiensis gene in plant cells
2. Insect ingests plant tissue containing Cry protoxin (130 kDa)
3. Alkaline midgut conditions (pH 9-11) solubilize crystal
4. Midgut proteases (trypsin-like) cleave protoxin to active toxin (65 kDa)
5. Active toxin binds cadherin receptors on midgut epithelial cells
6. Oligomerization: toxin forms pre-pore oligomeric structure (tetramer)
7. Oligomer binds aminopeptidase N or alkaline phosphatase (GPI-anchored receptors)
8. Membrane insertion: creates pores (1-2 nm diameter) in cell membrane
9. Osmotic lysis: ion/water influx destroys midgut cells
10. Septicemia: gut bacteria invade body cavity, larval death within 24-72 hours

**Specificity:**
- Each Cry protein has narrow insect target range (receptor binding specificity)
- Cry1Ab: Lepidoptera (caterpillars)
- Cry3Bb: Coleoptera (beetles, rootworms)
- Cry4: Diptera (mosquitoes, flies)
- Mammalian safety: acidic stomach (pH 1-3) degrades protein, no cadherin receptors present
- Gene stacking: multiple Cry proteins for broader spectrum and resistance management

#### Herbicide Tolerance

**CP4-EPSPS (Glyphosate resistance / Roundup Ready):**
- Target enzyme: EPSPS (5-enolpyruvylshikimate-3-phosphate synthase)
- Shikimate pathway: produces aromatic amino acids (Phe, Tyr, Trp)
- Glyphosate: competitive inhibitor of plant EPSPS (binds PEP binding site)
- CP4-EPSPS: variant from Agrobacterium sp. strain CP4 with low glyphosate affinity
- Km for PEP unchanged, but Ki for glyphosate increased 5000-fold
- Constitutive expression (CaMV 35S or plant actin promoter) provides whole-plant tolerance

**PAT/bar gene (Glufosinate resistance / Liberty Link):**
- Target: Glutamine synthetase (GS) - ammonia assimilation
- Glufosinate (phosphinothricin): GS inhibitor, ammonia accumulates to toxic levels
- PAT (phosphinothricin acetyltransferase): acetylates glufosinate, rendering it inactive
- Source: Streptomyces hygroscopicus (bar gene) or S. viridochromogenes (pat gene)
- Detoxification: rapid N-acetylation of herbicide within plant cells

#### Drought Tolerance Mechanisms

**DREB/CBF transcription factors:**
- DREB (Dehydration-Responsive Element Binding): AP2/ERF family transcription factors
- Bind DRE/CRT cis-elements (A/GCCGAC) in promoters of drought-responsive genes
- Downstream targets: LEA proteins, osmoprotectant synthesis, antioxidant enzymes
- DREB1/CBF: cold-induced pathway
- DREB2: drought and heat-induced pathway
- Constitutive overexpression: drought tolerance but growth penalties (dwarfism)
- Stress-inducible promoter (rd29A): avoids growth penalties, activates under stress only

**Osmolyte accumulation:**
- Proline: accumulated 10-100x under drought, stabilizes proteins and membranes
- Glycine betaine: quaternary ammonium compound, protects enzymes under osmotic stress
- Trehalose: non-reducing disaccharide, stabilizes membrane lipid bilayers
- Engineering approach: overexpress biosynthetic enzymes (P5CS for proline, BADH for betaine)

#### Biofortification

**Golden Rice (provitamin A enrichment):**
- Problem: Vitamin A deficiency causes 250,000-500,000 childhood blindness cases annually
- Solution: Engineer beta-carotene biosynthesis in rice endosperm
- Genes inserted:
  - PSY (phytoene synthase) from Narcissus pseudonarcissus (later replaced with Zea mays PSY for higher expression)
  - CRTI (carotene desaturase) from Erwinia uredovora (performs 4 desaturation steps in one enzyme)
- Pathway: GGPP -> Phytoene (PSY) -> Lycopene (CRTI) -> Beta-carotene (endogenous cyclases)
- Golden Rice 2 (GR2): 23 micrograms beta-carotene/g (37x increase over GR1)
- One cup of Golden Rice provides 50% of daily vitamin A requirement for children

#### Gene Drive Technology

**Cas9-based suppression drives:**
- Mechanism: CRISPR cassette copies itself to homologous chromosome during meiosis
- Inheritance: >99% (vs normal 50% Mendelian) = super-Mendelian inheritance
- Population spread: gene drive allele increases in frequency each generation regardless of fitness cost
- Suppression drives: target female fertility genes (e.g., doublesex in Anopheles)

**Applications:**
- Malaria vector control: suppress Anopheles gambiae populations
- Invasive species management: fertility reduction in invasive rodents
- Agricultural pest control: Drosophila suzukii (spotted wing drosophila)
- Conservation: remove invasive species from island ecosystems

**Safeguards:**
- Daisy-chain drives: require multiple elements, limited spread potential
- Temporal drives: self-limiting, decay after fixed number of generations
- Anti-drives: CRISPR systems that neutralize existing drives
- Split drives: components on separate chromosomes (no self-propagation)

---

## Section 2: Automotive Engineering

### 2.1 Thermodynamics of Internal Combustion Engines

#### Otto Cycle (Spark-Ignition Engines)

The idealized Otto cycle describes the thermodynamic process in gasoline engines:

**Four processes:**
1. **1-2: Isentropic compression** (adiabatic, reversible)
   - Piston compresses air-fuel mixture
   - No heat transfer (idealized)
   - PV^gamma = constant (gamma = Cp/Cv = 1.4 for air)
   - Temperature rises: T2/T1 = (V1/V2)^(gamma-1) = r^(gamma-1)

2. **2-3: Constant-volume heat addition**
   - Spark ignites mixture at TDC
   - Combustion occurs so rapidly it approximates constant volume
   - Pressure and temperature rise dramatically
   - Q_in = m * Cv * (T3 - T2)

3. **3-4: Isentropic expansion** (power stroke)
   - Hot gases expand, pushing piston down
   - No heat transfer (idealized)
   - Work extracted from expanding gases
   - T4/T3 = (V3/V4)^(gamma-1) = (1/r)^(gamma-1)

4. **4-1: Constant-volume heat rejection**
   - Exhaust valve opens, pressure drops to atmospheric
   - Remaining thermal energy rejected
   - Q_out = m * Cv * (T4 - T1)

#### Thermal Efficiency Formula

**Otto cycle thermal efficiency:**
eta = 1 - 1/r^(gamma-1)

Where:
- eta = thermal efficiency (fraction)
- r = compression ratio (V_max/V_min)
- gamma = specific heat ratio (Cp/Cv)

**Example calculations:**
| Compression Ratio | Gamma | Theoretical Efficiency |
|---|---|---|
| 8:1 | 1.4 | 56.5% |
| 10:1 | 1.4 | 60.2% |
| 12:1 | 1.4 | 63.0% |
| 14:1 | 1.4 | 65.2% |
| 14:1 (Atkinson) | 1.35 | 58.2% |

**Real-world vs theoretical:**
- Actual gasoline engine efficiency: 25-35% (thermal)
- Losses: friction (10-15%), pumping (5-8%), incomplete combustion (3-5%), heat transfer (25-35%)
- Peak brake thermal efficiency (modern GDI turbo): 38-40%
- Peak BTE (Toyota Dynamic Force 2.5L): 41%

#### Compression Ratios

**Gasoline engines: 10-14:1**
- Limited by knock (auto-ignition of end-gas before flame front arrives)
- Higher octane fuel allows higher compression ratios
- Direct injection allows higher CR than port injection (charge cooling effect)
- Miller/Atkinson cycle: effective expansion ratio > compression ratio (late/early IVC)

**Diesel engines: 14-25:1**
- Compression ignition: no knock limit in traditional sense
- Higher CR needed to achieve air temperatures (700-900 degrees C) for fuel auto-ignition
- Modern common-rail diesel: 15-17:1 (lower than older diesels due to turbocharging)
- No throttle plate: load controlled by fuel injection quantity

#### Knock/Detonation Physics

**Auto-ignition mechanism:**
- Normal combustion: flame front propagates from spark plug at 15-30 m/s
- End-gas: unburned mixture ahead of flame front is compressed and heated
- If end-gas temperature exceeds auto-ignition threshold: spontaneous combustion occurs
- Knock: pressure wave from auto-ignition impacts cylinder walls (5-7 kHz oscillation)

**Factors promoting knock:**
- High compression ratio (increased end-gas temperature/pressure)
- Advanced ignition timing (more time for end-gas heat soak)
- High inlet air temperature
- Low fuel octane rating (higher auto-ignition tendency)
- Carbon deposits (hot spots, increased effective CR)
- Lean air-fuel mixtures (slower flame speed, more time for end-gas to heat)

**Anti-knock strategies:**
- Knock sensors (piezoelectric): detect knock vibration, retard timing in real-time
- Direct injection: fuel evaporation cools charge by 20-30 degrees C
- Variable valve timing: Miller cycle reduces effective CR
- Cooled EGR: dilutes charge, reduces peak temperatures
- Water/methanol injection: latent heat absorption (charge cooling)
- Higher-octane fuels: increase auto-ignition resistance

#### Turbocharger Thermodynamics

**Compressor operation:**
- Centrifugal compressor: exhaust-driven turbine spins compressor wheel (50,000-300,000 RPM)
- Pressure ratio: 1.5-3.0:1 for passenger vehicles, up to 5.0:1 for diesel/racing
- Compressor efficiency: 65-78% (isentropic efficiency)
- Temperature rise: T2 = T1 * (PR)^((gamma-1)/(gamma*eta_c))
- Example: PR 2.0, T1 = 25 C (298K), eta_c = 0.72: T2 = 298 * 2.0^(0.286/0.72) = 370K (97 C)

**Compressor maps:**
- X-axis: corrected mass flow rate
- Y-axis: pressure ratio
- Efficiency islands: concentric regions of equal efficiency
- Surge line (left boundary): flow reversal, compressor stall (damaging)
- Choke line (right boundary): sonic velocity in compressor passages
- Operating line must fall between surge and choke at all engine speeds

**Intercooler effectiveness:**
- epsilon = (T_hot_in - T_hot_out) / (T_hot_in - T_cold_in)
- Typical air-to-air intercooler: 60-80% effectiveness
- Air-to-water intercooler: 80-95% effectiveness
- Purpose: increase charge density (more air mass in fixed volume = more fuel = more power)
- Every 10 C reduction in intake temperature: approximately 3% power increase

#### BSFC Optimization

**Brake Specific Fuel Consumption:**
BSFC = fuel_flow_rate / brake_power (g/kWh)

**Typical values:**
- Naturally aspirated gasoline: 250-300 g/kWh (best point)
- Turbocharged GDI gasoline: 230-260 g/kWh
- Diesel (common rail): 195-220 g/kWh
- F1 power unit (2024): approximately 210 g/kWh at 50%+ thermal efficiency
- Ideal Otto cycle (no losses): approximately 165 g/kWh at 60% efficiency

**BSFC map (fuel island plot):**
- X-axis: engine speed (RPM)
- Y-axis: BMEP (Brake Mean Effective Pressure) or torque
- Contour lines: constant BSFC values
- Sweet spot: typically 2000-3000 RPM, 75-85% load
- Transmission gear ratios selected to keep engine operating near minimum BSFC point

### 2.2 Fluid Dynamics

#### Bernoulli Equation

**Statement (incompressible, inviscid, steady flow along streamline):**

P + 1/2 * rho * v^2 + rho * g * h = constant

Where:
- P = static pressure (Pa)
- rho = fluid density (kg/m^3, air at STP: 1.225 kg/m^3)
- v = flow velocity (m/s)
- g = gravitational acceleration (9.81 m/s^2)
- h = elevation (m)

**Terms:**
- P: static pressure (force per unit area from random molecular motion)
- 1/2 * rho * v^2: dynamic pressure (kinetic energy per unit volume)
- rho * g * h: hydrostatic pressure (potential energy per unit volume)
- P + 1/2 * rho * v^2 = total pressure (stagnation pressure when v = 0)

**Automotive application:**
- Venturi effect in intake manifolds: velocity increase at restriction causes pressure drop
- Underbody diffuser: expanding cross-section decelerates flow, increases pressure (reduces drag)
- Pitot tube: measures airspeed from stagnation-static pressure difference

#### Aerodynamic Drag

**Drag force equation:**
Fd = 1/2 * Cd * A * rho * v^2

Where:
- Fd = drag force (Newtons)
- Cd = drag coefficient (dimensionless)
- A = frontal area (m^2)
- rho = air density (1.225 kg/m^3 at sea level, 20 C)
- v = vehicle velocity relative to air (m/s)

**Typical drag coefficients:**
| Vehicle Type | Cd | Frontal Area (m^2) | CdA (m^2) |
|---|---|---|---|
| Formula 1 (low drag config) | 0.70-1.00 | 1.5 | 1.0-1.5 |
| SUV/Truck | 0.35-0.45 | 2.5-3.0 | 0.9-1.35 |
| Sedan (average) | 0.28-0.35 | 2.1-2.3 | 0.59-0.81 |
| Sports car | 0.25-0.33 | 1.8-2.0 | 0.45-0.66 |
| Tesla Model S | 0.208 | 2.34 | 0.487 |
| Mercedes EQS | 0.20 | 2.51 | 0.502 |
| Hyper-miler prototype | 0.12-0.15 | 1.0-1.5 | 0.12-0.23 |

**Power required to overcome drag:**
P_drag = Fd * v = 1/2 * Cd * A * rho * v^3

Note: Power increases with the CUBE of velocity. Doubling speed requires 8x the power to overcome drag.

#### Lift/Downforce Coefficient Engineering

**Lift/downforce equation:**
Fl = 1/2 * Cl * A * rho * v^2

Where:
- Fl = lift force (positive up) or downforce (negative Cl = downforce)
- Cl = lift coefficient (negative for downforce)

**Downforce generation methods:**
1. **Front splitter:** Stagnation pressure above, low pressure below (Bernoulli)
2. **Rear wing:** Inverted airfoil, creates low pressure on upper (lower) surface
3. **Underbody diffuser:** Accelerates air under car (low pressure), decelerates at exit
4. **Ground effect (Venturi tunnels):** Convergent-divergent channel under floor
5. **Vortex generators:** Energize boundary layer, delay separation

**F1 car aerodynamics (2024 regulations):**
- Total downforce at 250 km/h: approximately 1500-2000 kg
- L/D ratio (efficiency): 3.5-5.0:1 (downforce:drag)
- 40% downforce from floor/diffuser, 30% front wing, 20% rear wing, 10% body

#### Boundary Layer Theory

**Laminar vs turbulent transition:**
- Laminar boundary layer: orderly parallel flow layers, low skin friction
- Turbulent boundary layer: chaotic mixing, higher skin friction but better energy transfer
- Transition Reynolds number on flat plate: Re_x approximately 5 x 10^5

**Reynolds number:**
Re = rho * v * L / mu

Where:
- rho = fluid density
- v = free-stream velocity
- L = characteristic length
- mu = dynamic viscosity (air at 20 C: 1.81 x 10^-5 Pa*s)

**Example (car at 100 km/h):**
Re = 1.225 * 27.8 * 4.5 / (1.81 * 10^-5) = 8.5 x 10^6 (fully turbulent)

**Boundary layer thickness:**
- Laminar: delta = 5.0 * x / sqrt(Re_x) (grows as sqrt of distance)
- Turbulent: delta = 0.37 * x / Re_x^0.2 (grows faster, thicker)
- Separation: occurs when adverse pressure gradient decelerates near-wall fluid to zero velocity
- Separation causes: form drag increase, loss of downforce, flow instability

#### CFD Simulation Methodology

**Reynolds-Averaged Navier-Stokes (RANS) equations:**
- Time-averaged NS equations with turbulence modeled via Reynolds stress tensor
- Closure problem: Reynolds stresses require turbulence model
- Most common approach for industrial automotive aerodynamics
- Steady-state (time-averaged) results: cost-effective for design iteration

**Turbulence models:**

*k-epsilon model:*
- Two transport equations: turbulent kinetic energy (k) and dissipation rate (epsilon)
- Good for: free-stream flows, simple geometries
- Weakness: poor near-wall behavior without wall functions, separation prediction
- Variants: Standard, RNG, Realizable (most used in automotive)

*k-omega SST (Shear Stress Transport):*
- Menter (1994): blends k-omega (near wall) with k-epsilon (free stream)
- Superior separation prediction vs k-epsilon
- Industry standard for automotive external aerodynamics
- Better boundary layer resolution with appropriate y+ values (y+ approximately 1 for resolved BL)

**Mesh requirements for automotive CFD:**
- Surface mesh: 2-5 million cells for quarter car, 10-30 million for full car
- Prism layers: 10-20 layers for boundary layer resolution (growth ratio 1.2-1.3)
- Wake region: refinement zones extending 3-5 car lengths downstream
- Total cell count: 50-200 million for production-quality results
- Computation time: 4-48 hours on 100-500 CPU cores (RANS steady-state)

#### Cooling System Flow Dynamics

**Radiator pressure drop vs heat rejection:**
- Heat rejection: Q = m_dot * Cp * delta_T (coolant side)
- Pressure drop through radiator core: delta_P = f * (L/Dh) * (1/2 * rho * v^2) + entrance/exit losses
- Trade-off: denser fins increase heat transfer area but increase pressure drop
- Optimal: maximize heat transfer per unit pressure drop (j/f factor)

**Cooling system sizing:**
- Engine waste heat to coolant: approximately 30% of fuel energy at full load
- Example: 200 kW engine rejects approximately 60 kW to coolant
- Required coolant flow: m_dot = Q / (Cp * delta_T) = 60000 / (3800 * 10) = 1.58 kg/s
- Thermostat: maintains coolant at 80-105 C operating range
- Electric water pumps: variable flow independent of engine speed (efficiency gain)

### 2.3 EV Powertrain Mechanics

#### Battery Chemistry Comparison

**NMC (Nickel Manganese Cobalt):**
- Chemistry: LiNi_xMn_yCo_zO2 (x+y+z = 1)
- Variants: NMC 111, NMC 532, NMC 622, NMC 811 (ratios of Ni:Mn:Co)
- Energy density: 150-250 Wh/kg (cell level), increasing with higher Ni content
- Cycle life: 1000-2000 cycles to 80% capacity (NMC 811 fewer, NMC 111 more)
- Thermal stability: decreases with higher Ni content (NMC 811 most sensitive)
- Voltage range: 3.0-4.2V nominal (3.6-3.7V average)
- Application: premium EVs requiring maximum range (Tesla Model S/X older packs, BMW, Audi)

**LFP (Lithium Iron Phosphate):**
- Chemistry: LiFePO4
- Energy density: 90-160 Wh/kg (lower than NMC)
- Cycle life: 2000-5000+ cycles to 80% capacity (significantly longer than NMC)
- Thermal stability: excellent (decomposition above 270 C vs 200 C for NMC)
- Voltage range: 2.5-3.65V nominal (3.2-3.3V average)
- Cost: 30-40% lower than NMC per kWh
- Application: Standard range EVs, energy storage, buses (Tesla Model 3 SR, BYD)

**NCA (Nickel Cobalt Aluminum):**
- Chemistry: LiNi_0.8Co_0.15Al_0.05O2
- Energy density: 200-260 Wh/kg (highest among current commercial chemistries)
- Cycle life: 500-1500 cycles to 80% capacity
- Thermal stability: moderate (aluminum doping stabilizes vs pure NMC)
- Voltage range: 3.0-4.2V nominal (3.6V average)
- Application: Tesla Model 3/Y Long Range (2170 cells), energy-density-critical applications

#### Cell Configurations

**Cylindrical (2170 / 4680):**
- 2170: 21mm diameter, 70mm length (Tesla Model 3/Y, Panasonic)
- 4680: 46mm diameter, 80mm length (Tesla next-gen, 5x energy, 6x power, 16% more range)
- Advantages: High structural rigidity (hoop stress containment), established manufacturing, excellent thermal management (round geometry allows coolant channels between cells)
- Disadvantages: Packing efficiency limited (circles leave gaps), many cells per module (7000+ in Model S)
- Tabless electrode (4680): reduced internal resistance, improved thermal uniformity, faster charging

**Prismatic:**
- Rectangular aluminum or steel cans (various sizes, no standard)
- Examples: BYD Blade (LFP), BMW Gen5 (NMC)
- Advantages: Better packing efficiency (rectangular stacking), larger individual cells (fewer connections)
- Disadvantages: Cell swelling under cycling (needs compression), thermal gradients across large cell face
- Typically used with foam compression pads between cells

**Pouch:**
- Aluminum-laminated polymer film packaging
- Examples: LG Chem (Bolt EV), SK Innovation (Kia EV6)
- Advantages: Highest gravimetric energy density (lightest packaging), flexible form factor
- Disadvantages: Requires external structural support (swelling management), more complex assembly
- Typically stacked in modules with compression plates

#### BMS Architecture

**Cell balancing:**

*Passive balancing:*
- Dissipates excess energy from highest-SOC cells as heat through resistors
- Simple, inexpensive, reliable
- Limitation: only equalizes at top of charge (during CV phase)
- Typical balance current: 50-200 mA per cell
- Energy lost as heat (inefficient but adequate for small imbalances)

*Active balancing:*
- Transfers energy from higher-SOC cells to lower-SOC cells
- Methods: capacitor-based (flying capacitor), inductor-based (boost converter), transformer-based
- Higher efficiency (80-95% energy transfer vs 0% for passive)
- More complex, expensive, potential reliability concern
- Justified for large packs where imbalance significantly reduces usable capacity

**SOC Estimation:**

*Coulomb counting:*
- Integrate current over time: SOC = SOC_initial + integral(I * dt) / Q_total
- Simple, fast computation
- Drift: accumulated measurement error over time (current sensor accuracy)
- Requires periodic recalibration (at full/empty states)

*Kalman filter (Extended/Unscented):*
- State estimation combining: Coulomb counting, voltage model, and temperature model
- Predicts SOC then corrects based on measured terminal voltage
- Handles noisy measurements and model uncertainty
- Typical accuracy: +/- 2-3% SOC across operating range
- Computationally intensive but gold standard for production BMS

**Voltage-based methods (supplementary):**
- OCV (Open Circuit Voltage) vs SOC lookup table
- Requires extended rest period (no current flow) for accurate OCV measurement
- Used for initial SOC calibration after long rest (overnight parking)
- LFP challenge: very flat OCV curve (3.2-3.3V for 20-80% SOC)

#### Motor Types

**PMSM (Permanent Magnet Synchronous Motor):**
- Rotor: NdFeB (neodymium) permanent magnets embedded in rotor core (IPM) or surface-mounted (SPM)
- Torque: T = (3/2) * p * [lambda_m * Iq + (Ld - Lq) * Id * Iq]
  - First term: magnet torque (PM interaction with stator field)
  - Second term: reluctance torque (salient pole geometry, IPM only)
- Efficiency: 93-97% peak (high across wide operating range)
- Power density: highest among EV motor types
- Disadvantage: rare earth magnet supply chain (cost, geopolitics)
- Application: Most production EVs (Tesla rear motor, Porsche Taycan, Hyundai E-GMP)

**Induction Motor (IM / Asynchronous):**
- Rotor: copper or aluminum bars in squirrel cage configuration (no magnets)
- Torque production: Stator rotating field induces current in rotor bars (slip required)
- Slip: s = (n_sync - n_rotor) / n_sync (typically 1-5% at rated load)
- Efficiency: 90-95% peak (drops at low loads and high speeds due to magnetizing current)
- Advantage: no rare earth materials, inherently zero-torque at zero-slip (no drag when coasting)
- Disadvantage: lower power density, higher rotor losses (heat generation)
- Application: Tesla front motor (AWD vehicles), older EV designs

#### Regenerative Braking Energy Recovery

**Energy recovery principle:**
- Kinetic energy: KE = 1/2 * m * v^2
- During deceleration: motor operates as generator, converts KE to electrical energy
- Electrical energy stored back in battery (minus losses)

**Example calculation:**
- Vehicle mass: 2000 kg
- Speed: 100 km/h (27.8 m/s) to 0 km/h
- Available KE: 1/2 * 2000 * 27.8^2 = 772,840 J = 0.215 kWh
- Typical recovery efficiency: 60-70% (motor + inverter + battery charging losses)
- Recovered energy: 0.215 * 0.65 = 0.14 kWh per stop from 100 km/h
- City driving improvement: 15-25% range increase vs no regen

**Loss sources in regenerative braking:**
- Motor efficiency as generator: 90-95%
- Inverter/power electronics: 95-98%
- Battery charging efficiency: 95-98%
- Wiring/connection losses: 99%
- Total system efficiency: 0.92 * 0.96 * 0.96 * 0.99 = 84% (optimistic)
- Real-world average including partial braking: 60-70%

**Limitations:**
- Battery charge acceptance limited when SOC >80% (regen reduced/disabled)
- Maximum regen torque limited at low speeds (motor back-EMF too low)
- Maximum regen power limited at high speeds (battery C-rate limit)
- Friction brakes still needed for: emergency stops, >0.3g deceleration, low battery temp

#### Thermal Management

**Battery optimal temperature range: 20-40 degrees C**

**Below 0 degrees C:**
- Internal resistance increases dramatically (lithium plating risk during charging)
- Available capacity reduced 20-40%
- Charging must be severely limited (0.1C or less below -10 C)
- Pre-conditioning: resistive heaters or waste heat from motor/inverter warm battery before use

**Above 45 degrees C:**
- Accelerated calendar aging (SEI layer growth)
- Accelerated cycle aging (transition metal dissolution, electrolyte decomposition)
- Safety concern above 60 C (thermal runaway onset for NMC at approximately 200 C)
- Every 10 C above optimal: approximately 2x aging rate (Arrhenius relationship)

**Liquid cooling circuits:**
- Coolant: 50/50 ethylene glycol/water (or dielectric fluid for immersion)
- Flow configuration: series (simpler) vs parallel (more uniform temperature)
- Cold plate design: channels machined or stamped between cell rows
- Heat rejection: via chiller (refrigerant loop) or radiator (ambient air)
- Target: maximum 5 C temperature variation across pack (cell-to-cell uniformity)
- Tesla: serpentine coolant tube winding between cylindrical cells
- Rivian/GM: cold plates on cell bottom surfaces

### 2.4 Structural Mechanics

#### Material Science

**Steel grades for crash structures:**

*AHSS (Advanced High-Strength Steel):*
- Tensile strength: 500-1000 MPa
- Types: Dual Phase (DP), Complex Phase (CP), Transformation-Induced Plasticity (TRIP)
- Application: B-pillars, side impact beams, roof rails
- Advantage: excellent formability while maintaining high strength (good energy absorption)

*UHSS (Ultra High-Strength Steel):*
- Tensile strength: 1000-2000 MPa
- Types: Martensitic, Press-Hardened (hot-stamped boron steel, 22MnB5)
- Application: Safety cage (A/B/C pillars, roof crossmembers, tunnel)
- Hot stamping: 950 C forming then die-quenching to martensite (1500+ MPa)
- Limitation: Low elongation (3-8%), requires careful design to avoid brittle fracture

**Aluminum alloys:**

*5xxx series (Al-Mg):*
- Good formability, moderate strength (200-350 MPa yield)
- Weldable (suitable for MIG/TIG welding)
- Application: body panels, inner structures, closure panels
- No heat treatment needed (strain-hardenable)

*6xxx series (Al-Mg-Si):*
- Heat-treatable (T6 temper: 240-350 MPa yield)
- Good extrudability (complex cross-section extrusions)
- Application: crash management systems (front/rear crush rails), frame rails
- Excellent energy absorption in axial crush (progressive folding behavior)

**CFRP (Carbon Fiber Reinforced Polymer):**
- Specific strength: 5-10x steel, 3-5x aluminum (per unit mass)
- Anisotropic: properties depend on fiber orientation (layup design critical)
- Layup orientations: 0/90/+45/-45 degree plies combined for desired stiffness/strength
- Quasi-isotropic: [0/+45/90/-45]s provides equal in-plane properties
- Application: monocoque structures (F1, supercars), roof panels, body panels
- Limitation: Brittle failure mode (shatters vs deforms), expensive, difficult to repair

#### Crash Energy Management

**Crumple zone progressive deformation:**
- Front structure designed to collapse in controlled manner, absorbing kinetic energy
- Energy absorbed = integral of Force * displacement over crush distance
- Target: constant force over maximum distance (rectangular force-displacement curve is ideal)
- Trigger mechanisms: notches, holes, or thickness changes initiate folding at predetermined locations
- Progressive folding mode: concertina-like collapse of thin-walled tubes (highest energy/mass)

**Force-displacement curves:**
- Ideal: constant force plateau (all energy absorbed uniformly)
- Real: initial peak (fold initiation) then oscillating force (each subsequent fold)
- Peak-to-mean ratio: design target <1.5 (minimize initial peak transmitted to occupant)
- Crush distance: typically 400-700mm for frontal impact at 56 km/h (Euro NCAP)
- Energy: KE = 1/2 * m * v^2 = 1/2 * 1500 * 15.6^2 = 182 kJ (frontal, 56 km/h)

**Load path engineering:**
- Multiple parallel load paths distribute force across structure
- Upper load path: shotgun/rail through A-pillar
- Lower load path: front rails to rocker/floor
- Subframe: cradle transmits loads to tunnel and floor
- Redundancy: if one path fails, others maintain structural integrity

#### NVH Engineering

**Natural frequency calculation:**
f = 1/(2*pi) * sqrt(k/m)

Where:
- f = natural frequency (Hz)
- k = stiffness (N/m)
- m = mass (kg)

**Vehicle NVH targets:**
| Component | Target Frequency | Rationale |
|---|---|---|
| Body first bending | >40 Hz | Above idle excitation (25-35 Hz 4-cyl) |
| Body first torsion | >35 Hz | Above road input frequency |
| Steering column | >45 Hz | Avoid resonance with engine |
| Exhaust system | Avoid 20-200 Hz resonances | Prevent booming |
| Suspension | 1.0-1.5 Hz (ride) | Comfort threshold |
| Seat | 3-5 Hz (primary) | Avoid human body resonances |

**Modal analysis:**
- FEA-based: compute natural frequencies and mode shapes of body structure
- Experimental: accelerometer array + impact hammer or shaker table
- Mode shapes: bending, torsion, local panel modes, acoustic cavity modes
- Target: separate modal frequencies to avoid coupling (minimum 10% separation)
- Body torsional stiffness target: 15,000-30,000 Nm/degree (modern unibody)

**Damping treatments:**
- Constrained layer damping (CLD): viscoelastic layer between steel panels
- Free layer damping (FLD): bituminous or polymer sheets applied to panel surfaces
- Acoustic absorption: fibrous materials in cavities (polyester, felt, foam)
- Sealing: rubber grommets, body seals to prevent airborne noise paths
- Active noise cancellation (ANC): microphone + anti-phase speaker output (low frequency)

#### Fatigue Analysis

**S-N curves (Stress-Number of cycles):**
- Plot of stress amplitude (S) vs number of cycles to failure (N)
- Log-log relationship: linear in high-cycle fatigue region
- Endurance limit (ferrous metals): stress below which infinite life is achieved (typically 40-50% UTS for steel)
- Non-ferrous (aluminum): no true endurance limit, fatigue life defined at 10^7 or 10^8 cycles
- Basquin equation: S = A * N^b (where A and b are material constants)

**Miner Rule (cumulative damage):**
sum(ni/Ni) = 1 (failure criterion)

Where:
- ni = number of cycles at stress level i
- Ni = number of cycles to failure at stress level i (from S-N curve)
- Damage fraction at each level: Di = ni/Ni
- Failure predicted when sum of all damage fractions reaches 1.0

**Example:**
- Stress level 1: 200 MPa, N1 = 100,000 cycles, applied for 40,000 cycles: D1 = 0.40
- Stress level 2: 150 MPa, N2 = 500,000 cycles, applied for 200,000 cycles: D2 = 0.40
- Stress level 3: 100 MPa, N3 = 10,000,000 cycles, applied for 2,000,000 cycles: D3 = 0.20
- Total damage: 0.40 + 0.40 + 0.20 = 1.00 (failure predicted)

**Limitations of Miner rule:**
- Does not account for load sequence effects (high-low vs low-high)
- Assumes linear damage accumulation (reality often non-linear)
- Does not account for mean stress effects (Goodman/Gerber corrections needed)
- Practical application: use with safety factor (design to D_max = 0.5-0.7)

**Stress concentration factors:**
- Kt = sigma_max / sigma_nominal
- Holes, notches, fillet radii, cross-section changes all create stress concentrations
- Fatigue cracks initiate at stress concentrations
- Mitigation: generous fillet radii, smooth transitions, surface finish improvement
- Typical Kt values: circular hole = 3.0, sharp notch = 4-6, fillet radius = 1.5-3.0

---

## References

- Jinek M et al. (2012). A programmable dual-RNA-guided DNA endonuclease in adaptive bacterial immunity. Science.
- Hsu PD et al. (2013). DNA targeting specificity of RNA-guided Cas9 nucleases. Nature Biotechnology.
- Doench JG et al. (2016). Optimized sgRNA design to maximize activity and minimize off-target effects. Nature Biotechnology.
- Hutchison CA et al. (2016). Design and synthesis of a minimal bacterial genome. Science.
- Anzalone AV et al. (2019). Search-and-replace genome editing without double-strand breaks. Nature.
- Heywood JB. (2018). Internal Combustion Engine Fundamentals. McGraw-Hill Education.
- Gillespie TD. (1992). Fundamentals of Vehicle Dynamics. SAE International.
- Hucho WH. (1998). Aerodynamics of Road Vehicles. SAE International.
- Menter FR. (1994). Two-equation eddy-viscosity turbulence models for engineering applications. AIAA Journal.
- Sun Y, Li Q. (2018). Crashworthiness design and optimization of thin-walled structures. Science Press.
