# The Oxidant Morbidostat

*Experiment proposal — a **devo** application of the evolution machine. 2026-07-13.*
*Question: is chemical harmful-algal-bloom control evolutionarily durable? Nobody has asked it for H₂O₂.*

Every chemical used to suppress a harmful cyanobacterial bloom is a selection pressure. The
question a lake manager should ask before committing to a treatment program — *does the
target adapt to it?* — is answered for copper and **unasked for hydrogen peroxide**, the leading
selective alternative. This proposal turns the evolution machine ([`two-instruments.md`](two-instruments.md)
Part 2, [`best-hybrids.md`](best-hybrids.md)) into an **H₂O₂-morbidostat** and runs the missing
experiment: directed evolution of a bloom cyanobacterium under a ramped oxidant, with an
automated frozen fossil record and a DuckBot assay layer.

It is a **devo** experiment — the one purpose the field has no champion for, because no platform
archives or replicates as the science requires. Here, that gap *is* the experiment.

**Motivating context.** Lake Wylie (Catawba River, NC/SC) is under an active chelated-copper
algaecide program against benthic *Lyngbya* (*Microseira wollei*), and its coves have thrown
toxin-producing planktonic cyanobacterial blooms — microcystin at 8.88 µg/L, above SC's 8 µg/L
recreational standard ([SC DES advisory](https://www.des.sc.gov/news/dhec-issues-recreational-water-advisory-cove-lake-wylie-due-harmful-algae)).
The natural home for the result is the **US HAB-Control Technologies Incubator** (US HAB-CTI), a
NOAA / UMCES-IMET / Mote Marine Laboratory partnership whose entire remit is evaluating
bloom-control technologies — for whom "does this control technology select for resistance?" is a
first-order question. <https://imet.usmd.edu/ushabcti>

---

## 1. Three stacked novelty claims

The scoping literature is unusually clean: three separate gaps converge on one experiment.

### Claim 1 — H₂O₂ resistance evolution in bloom cyanobacteria has never been tested

The copper contrast makes the gap sharp. Heritable copper resistance in *Microcystis* by
pre-selective spontaneous mutation is *proven* by Luria–Delbrück fluctuation analysis
(García-Villada et al. 2004, *Water Research*, [10.1016/j.watres.2004.01.036](https://doi.org/10.1016/j.watres.2004.01.036);
tolerance ceiling, Rouco et al. 2014, [10.1007/s00442-014-2963-1](https://doi.org/10.1007/s00442-014-2963-1)).
For **H₂O₂**, by contrast, every account of reduced or short-lived field efficacy invokes
*non-heritable* mechanisms: pre-existing strain variation (Schuurmans et al. 2018,
[10.1016/j.hal.2018.07.008](https://doi.org/10.1016/j.hal.2018.07.008)), nutrient/light plasticity
of peroxiredoxin defenses (Sandrini et al. 2020, [10.1016/j.hal.2020.101916](https://doi.org/10.1016/j.hal.2020.101916)),
and **community-level** bacterial detox — most *Microcystis* genomes lack catalase, and in-situ
`katG` expression is dominated by heterotrophic bacteria (Smith et al. 2022,
[10.1128/aem.02544-21](https://doi.org/10.1128/aem.02544-21); Weenink et al. 2021,
[10.1111/1462-2920.15429](https://doi.org/10.1111/1462-2920.15429)). No controlled
serial-passage or fluctuation-analysis study has ever asked whether H₂O₂ *resistance evolves*.
The method to do it exists and has simply never been pointed at H₂O₂: the López-Rodas / Costas
group ran fluctuation-analysis + "ratchet" experimental evolution on *Microcystis* for glyphosate
(Costas et al. 2007, [10.1007/s10682-006-9134-8](https://doi.org/10.1007/s10682-006-9134-8)) and
salinity.

### Claim 2 — No automated continuous-culture / morbidostat ALE has ever been run on a phototroph

The morbidostat (Toprak et al. 2012, [10.1038/ng.1034](https://doi.org/10.1038/ng.1034); low-cost
build, Liu et al. 2016, [10.3791/54426](https://doi.org/10.3791/54426)), eVOLVER (Wong et al.
2018, [10.1038/nbt.4151](https://doi.org/10.1038/nbt.4151)), and Chi.Bio (Steel et al. 2020,
[10.1371/journal.pbio.3000794](https://doi.org/10.1371/journal.pbio.3000794)) were all built and
demonstrated on **heterotrophs**; Chi.Bio names algae only as a future possibility. The
microalgal-ALE review states plainly that algal adaptive evolution is done by **manual serial
transfer**, the automated chemostat paradigm "not adopted" for phototrophs (Zhang et al. 2021,
[10.3389/fmicb.2021.737248](https://doi.org/10.3389/fmicb.2021.737248)). The nearest prior art is
**concept-only**: the "Photoinhibistat," a control-theory proposal to hold a culture at a light
stressor, with no evolutionary run or genomics (Mairet & Bernard 2016,
[10.1016/j.ifacol.2016.07.344](https://doi.org/10.1016/j.ifacol.2016.07.344)). A morbidostat that
ramps a *chemical* stressor on a phototroph, with sequencing, would be a first.

### Claim 3 — Automated cryo-archiving of a phototroph fossil record is white space

The *design* is established and expected in phytoplankton evolution — replicate lineages plus a
revived-ancestor common-garden competition (Collins & Bell 2004, *Chlamydomonas*,
[10.1038/nature02945](https://doi.org/10.1038/nature02945); Lohbeck et al. 2012, *E. huxleyi*
revive-and-compete, [10.1038/ngeo1441](https://doi.org/10.1038/ngeo1441)), the direct descendant
of the LTEE frozen fossil record (Lenski et al. 1991, [10.1086/285289](https://doi.org/10.1086/285289)).
But the *engineering* — automated fraction-collection + cryo-archiving integrated into an algal
ALE loop — has never been assembled. It exists piecemeal for heterotrophs; the one representative
automated phototroph ALE (Barten et al. 2022, *Picochlorum* turbidostat,
[10.1002/biot.202100659](https://doi.org/10.1002/biot.202100659)) kept sampling and cryo **manual
and offline**. This is exactly the automated chilled fraction collector proposed as the evolution
machine's one genuinely new build.

---

## 2. The machine — every piece already specified in this repo

| Function | Component | Source in this repo |
|---|---|---|
| Selection | Evolution machine run as an **H₂O₂-morbidostat** — oxidant titrated to hold constant growth inhibition, ramped over generations (Toprak logic) | [`best-hybrids.md`](best-hybrids.md) **devo** machine (Pioreactor chassis + closed vessel) |
| Replication | 8 parallel chambers under one interface — the whole point, to separate selection from drift | the **devo** design law: cheap × many |
| Monitoring | **Near-IR OD (850 nm)**, *not* Chi.Bio's 650 nm — the cells are pigmented (allophycocyanin ~650, phycocyanin ~620, chl-a ~680) | [`datasheet-verification.md`](datasheet-verification.md), the phototroph OD-wavelength result |
| Fossil record | **Automated chilled fraction collector** on the waste line, diverting a programmed fraction on a generation schedule into a glycerol archive | [`best-hybrids.md`](best-hybrids.md), the one new build |
| Assay engine | **DuckBot / Jubilee** — its OECD-221-by-accident machinery (multiwell plates, top-down imaging, dose series, segmentation) repurposed for automated H₂O₂ dose-response on archived timepoints; PlanktoScope for colony imaging | the `jubilee-tandem` verification layer; DuckBot, Subbaraman et al. 2024, [10.1371/journal.pone.0296717](https://doi.org/10.1371/journal.pone.0296717) |

The experiment therefore exercises the **devo** machine, the archiver, the near-IR monitoring
fix, and the DuckBot assay layer at once — the whole session's synthesis, run for evidence.

---

## 3. Design and rigor

- **Organism (biosafety-first).** Run selection on the **non-toxigenic** *Synechocystis* sp.
  PCC 6803 or the *Microcystis aeruginosa* PCC 7806 **ΔmcyB** mutant (Dittmann et al. 1997,
  [10.1046/j.1365-2958.1997.6131982.x](https://doi.org/10.1046/j.1365-2958.1997.6131982.x)).
  *Microcystis* is BSL-1 (the hazard is the toxin, not infection); microcystin is **not** a
  federal Select Agent (saxitoxin is). Escalate to a toxigenic wild-type strain only under an
  explicit permit and containment plan.
- **The morbidostat law.** A feedback loop measures growth from near-IR OD each cycle and doses
  H₂O₂ to hold inhibition at a set fraction of the untreated rate — automatically ramping the
  effective dose upward exactly as (and only as) the population adapts. Selective window matters:
  H₂O₂'s cyanobacteria-vs-eukaryote selectivity holds **below ~5 mg/L** and erodes at high
  biomass (Weenink et al. 2015, [10.3389/fmicb.2015.00714](https://doi.org/10.3389/fmicb.2015.00714)).
- **Separate pre-existing from evolved — the load-bearing control.** Interleave **Luria–Delbrück
  fluctuation analysis** (García-Villada's design) so a rise in tolerance is attributed to
  selection of standing/spontaneous variants versus induced plasticity. Without this the result
  is not interpretable — it is the exact conflation the H₂O₂ literature has never resolved.
- **Revive-and-compete.** From the automated archive, revive ancestor and descendant and run a
  common-garden H₂O₂ dose-response (the DuckBot assay) to *quantify* the resistance gain — the
  Lohbeck design, made automatic.
- **Read the genome.** Whole-genome resequencing of endpoint clones and convergent timepoints;
  look for oxidative-stress loci (`katG`/catalase acquisition or upregulation, peroxiredoxin
  `prx`, thioredoxin, `perR`/`fur` regulators). Convergence across replicate lineages is the
  causal signal.
- **Watch the toxin.** Any H₂O₂ dose-response releases intracellular microcystin on lysis;
  measure *dissolved* toxin, not just cell death, on any toxigenic run.

---

## 4. Prior art to differentiate against

- **Photoinhibistat** (Mairet & Bernard 2016) — morbidostat logic with *light*, concept only, no
  evolution or genomics. The clearest thing to cite and differ from.
- **Copper resistance selection** (García-Villada 2004) — the method template *and* the proof the
  concern is real; H₂O₂ is the untested counterpart.
- **Cyanobacterial ALE is mature** — thermotolerance (Tillich et al. 2014,
  [10.1186/1472-6750-14-66](https://doi.org/10.1186/1472-6750-14-66) — notably the *one*
  precedent run in an automated turbidostat-mode PBR), high light (Yoshikawa et al. 2021,
  [10.1038/s42003-021-01875-y](https://doi.org/10.1038/s42003-021-01875-y)), cadmium (Xu et al.
  2018, [10.1186/s13068-018-1205-x](https://doi.org/10.1186/s13068-018-1205-x)). The biology is
  de-risked; the automation and the stressor are the new parts.
- **Barten et al. 2022** — automated *Picochlorum* turbidostat with *manual* archiving; the
  automated fossil record is what this adds.

---

## 5. What this is *not*, and the honest limits

- **Duckweed is not the devo arm.** *Lemna* reproduces clonally (~3–4 day doubling, rare sex), so
  the duckweed work ([`biopunk-duckweed`](../../biopunk-duckweed)) is **accession screening /
  clonal selection**, not mutation-accumulation ALE. DuckBot's value here is *phenotyping and
  dose-response assays*, not evolving the organism.
- **ALPHA correction.** The Sartor "heat + ammonia tolerance" selection paper sometimes assumed
  in the duckweed line **does not exist**: ALPHA (Robinson et al. 2025, *Plant Direct*,
  [10.1002/pld3.70048](https://doi.org/10.1002/pld3.70048)) is a **salt-tolerance phenotyping**
  platform; heat/ammonia are stated breeding *goals* in press coverage only.
- **Interpretability ceiling.** A community lab result is a *screen*, not a regulatory arbiter:
  laboratory selection can over- or under-state field evolvability, and single-strain runs miss
  the community detox that dominates the field. The claim is "resistance is/ isn't readily
  selectable under controlled oxidant ramping," which is decision-relevant precisely because it
  is currently unknown either way.

---

## 6. Why it matters, in one line

If H₂O₂ resistance evolves readily, a peroxide bloom-control program is a treadmill and the money
should go to nutrient control; if it does not, H₂O₂ is a more durable tool than copper. Either
answer is a first-of-kind, management-relevant result — and it is produced by the one machine the
field has been missing: a **devo** instrument that archives and replicates.

---

*Verified against primary sources (Crossref-confirmed DOIs): García-Villada 2004; Schuurmans
2018; Sandrini 2020; Smith 2022; Weenink 2015/2021; Costas 2007; Toprak 2012; Wong 2018; Steel
2020; Zhang 2021; Mairet & Bernard 2016; Collins & Bell 2004; Lohbeck 2012; Lenski 1991; Barten
2022; Tillich 2014; Yoshikawa 2021; Xu 2018; Dittmann 1997; Subbaraman 2024; Robinson 2025.
Not re-verified at page level this session: a small number of search-only DOIs (Hennessey 2025,
Piel 2021, and the 2026 Synechocystis fluctuating-light ALE) are deliberately excluded from the
argument above. Lake Wylie microcystin figure per SC DES advisory. See [`../SOURCES.md`](../SOURCES.md).*
