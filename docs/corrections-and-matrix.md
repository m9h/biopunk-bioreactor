# OpenEvo Corrections & the Open-Bioreactor Matrix

*Technical note — a reader's audit, not peer review. 2026-07-10.*
*Subject: OpenEvo preprint ([bioRxiv 2026.07.06.735356](https://doi.org/10.64898/2026.07.06.735356)) and the surrounding field.*

A fair-minded correction of the errors and overstatements in the OpenEvo preprint, followed
by a like-for-like matrix of six open continuous-culture platforms.

---

## First, credit where due

OpenEvo is a real contribution and the corrections below are not a dismissal of it. Genuine
strengths:

- A **peak-to-peak growth readout** tied to hardware dilution events, sidestepping
  local-maxima noise.
- A **940 nm OD path** avoiding optogenetic and ambient overlap; inverse model R² ≥ 0.98 out
  to OD₆₀₀ 6.0.
- A **closed autoclavable vessel** with better sterility than Chi.Bio's open tube.
- A **4,000-hour remote run** demonstrating robustness.
- An **illustrated assembly manual validated by having an inexperienced undergraduate build a
  working unit** — a rare reproducibility contribution.

It is the cheapest buildable three-media selection cycler in the field. The issues below are
correctable and mostly concern framing and analysis, not the hardware.

---

## 1. Corrections to the OpenEvo preprint

### Error 1 — Internal contradiction · *High*

**The headline growth-rate figure disagrees with itself.**

> Abstract: "Evolved cells grew **55% faster** than wild-type at 12% salt."
> Results: "a doubling time of 4.9 hours versus 7.6 hours (a **36% increase in growth rate**)."

Both describe the same data, and the two numbers are different quantities. A doubling time of
7.6 → 4.9 h is a **36% reduction in doubling time** but a **55% increase in growth rate**
(rate ∝ 1/doubling time; (1/4.9)/(1/7.6) = 1.55). The abstract's 55% is the correct
growth-rate figure; the results sentence mislabels the 36% doubling-time reduction *as* a
growth-rate increase. **Fix:** "36% shorter doubling time, equivalently a 55% higher growth rate."

### Error 2 — False claim about prior art · *High*

**Pioreactor's hardware is open source; the paper says it is not.**

> "A research-scale device called the 'Pioreactor' is available for purchase, but only the
> software is open source."

A public `Pioreactor/hardware` repository exists and the hardware is released under
**CC BY-SA 4.0** (per its `LICENSE` file). The claim is used to clear competitive space and is false.
**Fix:** describe Pioreactor as open-hardware-and-software; distinguish it on the real axis —
a supported product with a fleet platform, not a from-scratch build.

### Framing 1 — Nearest prior art uncited · *Medium*

**Chi.Bio is never cited, and it is the closest comparator that exists.** Open hardware and
software, ~$300, in-situ measurement and continuous culture, six years prior. The preprint
surveys eVOLVER, the Toprak morbidostat, and Pioreactor, then frames an unfilled gap while
omitting the system that most directly occupies it. **Fix:** cite and contrast Chi.Bio; the
honest distinction is selection fluidics and buildability, not the existence of a gap.

### Framing 2 — Unsupported superlative · *Medium*

**"The most affordable modern continuous growth system available" is not established.**
Pioreactor ships turnkey at $329 with no build; EVE builds a triplicate system for $115–200.
**Fix:** qualify — "among the lowest-cost *buildable* systems with three-media selection."

### Framing 3 — Success overstated · *Medium*

**The campaign includes a hard failure the framing understates.** The 9% salt step did not
partially adapt — growth ceased, OD flatlined, and the run terminated at cycle 152. The
adaptation claim rests on a *single hand-picked glycerol stock* at cycle 145, assayed offline.
**Fix:** foreground that it is one successful selection step with a failed extension, not a ladder.

### Method 1 — No replicates · *High*

**n = 1 forecloses causal attribution of the mutations.** A single clone from a single
population was sequenced. Without independent replicate lineages there is no convergence
signal — no way to distinguish a selected driver from a hitchhiker. The reported SNPs and two
large deletions therefore cannot be attributed to the low-salt adaptation. (The LTEE runs
twelve populations for exactly this reason.) **Fix:** replicate populations; identify
mutations recurring across them.

### Method 2 — Wrong variant caller · *Medium*

**Structural variants were called with a default read mapper, not `breseq`.**

> "…mapped to the DS2 genome using Geneious's default mapper with low-medium sensitivity for
> 5 iterations."

The key finding — a ~110 kb pHV4 deletion with "sparse read mapping … primarily
transposon-associated elements" — is IS-mediated rearrangement, the case a default short-read
mapper handles worst. `breseq` exists for this, and its author (Barrick) is cited five times.
**Fix:** re-call with `breseq`; confirm the pHV4 structure with long reads (which the authors
already flag).

### Method 3 — No systematic archiving · *Low*

**One manual glycerol stock is not a fossil record.** The paper cites Barrick 2023 — "Daily
Transfers, *Archiving Populations*, and Measuring Fitness" — as motivation, then implements
neither archiving nor fitness measurement. Head-to-head ancestor-vs-descendant competition is
impossible without a time-series archive. **Fix:** even manual periodic stocks at fixed cycle
intervals would strengthen future runs.

---

## 2. The matrix — six platforms, like for like

Purpose codes: **P1** characterise · **P2** evolve · **P3** scale-out.
Confidence markers in cells: ✓ strength, ✗ weakness, ~ qualified.

| Attribute | Chi.Bio | OpenEvo | Pioreactor | eVOLVER | EVE | Morbidostat |
|---|---|---|---|---|---|---|
| Primary purpose | P1 | P2 | P3 | P3 | P2 | P2 |
| Reference | PLOS Biol 2020 | bioRxiv 2026 | ✗ none | Nat Biotech 2018 | eLife 2022 | Nat Protoc 2013 |
| Parallelism | ✓ 8 / 1 computer | ✗ 1 chamber | ✓ cluster (N) | ✓ 16 vials | ≥3 replicates | few |
| Working volume | 12–25 mL | ~20 mL | 20 / 40 mL | ~40 mL | ~12 mL | ~12 mL |
| OD source | 650 nm laser | 940 nm IR | 900 nm IR | LED/photodiode | LED/photodiode | LED/photodiode |
| Rich sensing | ✓ spectrometer + 7-LED | ✗ OD only | ~ plugin (AS7341) | ~ configurable | ✗ OD only | ✗ OD only |
| Culture contact | ✓ non-contact | closed, contact OK | contact | contact | contact | contact |
| Sterility / vessel | ~ open to atmosphere | ✓ closed, autoclavable | autoclavable vial | autoclavable vial | 3D-printed | glass |
| Selection fluidics | 2+2 pumps | ✓ 3 media + waste | pumps (plugin) | ✓ configurable | drug line | ✓ drug gradient |
| Control law | ✓ PID + MPC | threshold | Kalman GR | configurable | threshold | drug titration |
| Archiving | ✗ none | ✗ manual, 1× | ✗ none | ✗ none | ✗ none | ✗ none |
| Open HW / SW | ✓ both | ✓ both | ✓ both (CC BY-SA 4.0) | ✓ both | ✓ both | protocol |
| Cost / unit | ~$300 +PCB | ~$300 | $329–389 | ~ <$2k (16) | ✓ $115–200 | mid |
| Build effort | ~ PCB fab | ✓ manual, guided | ✓ buy turnkey | ✗ machine shop | moderate | ~ bespoke |
| Independent use | ReacSight, others | ~ too new | ~ community only | ✓ ePACE, base editors | teaching | ✓ widely adapted |

*Cells reflect the platform as published/shipped, not what a motivated builder could add.
"Independent use" = peer-reviewed work by groups other than the originators.*

---

## 3. Pros and cons, per platform

**Chi.Bio** — *P1 · in-situ measurement density* · PLOS Biol 2020 · ~$300 +PCB · 8-way
- ✓ Only platform with a real in-situ spectrometer + 7-colour actuation
- ✓ Non-contact; tubes hot-swap, sterilisation trivial
- ✓ PID + MPC; OD held ~2% of setpoint
- ✗ Vessel open to atmosphere — no gas control
- ✗ Needs PCB fabrication; not a from-manual build
- ✗ No archiving; no DO/pH

**OpenEvo** — *P2 · cheap buildable selection cycler* · bioRxiv 2026 · ~$300 · 1 chamber
- ✓ Three-media selection cycling, native
- ✓ Closed autoclavable vessel; standalone firmware
- ✓ Best assembly manual in the field
- ✗ Single chamber — no replicates, no convergence
- ✗ No archiving; no rich sensing
- ✗ Validation is n = 1

**Pioreactor** — *P3 · turnkey fleet operation* · no paper · $329–389 · cluster
- ✓ Buy and run — no build, supported, maintained
- ✓ Leader/worker cluster + plugin ecosystem
- ✓ CC BY-SA 4.0 hardware, MIT software
- ✗ No peer-reviewed reference — hard to cite
- ✗ Rich sensing only via plugins
- ✗ Not evolution- or characterisation-optimised

**eVOLVER** — *P3 · max-config research fleet* · Nat Biotech 2018 · <$2k / 16 · 16 vials
- ✓ 16 vials, arbitrary per-vial control
- ✓ Proven base for independent work (ePACE)
- ✓ Modular, deeply extensible
- ✗ Machine shop + 3D printer to build
- ✗ Highest setup/cleanup burden
- ✗ Overkill for small or simple studies

**EVE** — *P2 · low-cost evolution + teaching* · eLife 2022 · $115–200 · ≥3
- ✓ Cheapest replicate-capable system
- ✓ Morbidostat / chemostat / turbidostat modes
- ✓ Explicit educational design + full build docs
- ✗ OD only; no rich sensing
- ✗ 3D-printed vessel; modest sterility
- ✗ No archiving

**Toprak morbidostat** — *P2 · drug-gradient selection* · Nat Protoc 2013 · mid · few
- ✓ The canonical antibiotic-resistance device
- ✓ Continuous drug titration to constant inhibition
- ✓ Widely adapted and cited
- ✗ Dated build; not a modern platform
- ✗ Low throughput; bespoke assembly
- ✗ Protocol, not maintained hardware/software

---

## 4. Independent use — the credibility signal

For a platform with no methods paper, third-party *use* is the only external validation.

- **Chi.Bio** — integrated by external tooling such as **ReacSight** (Nat Commun 2022); cited
  across optogenetic feedback work. Established.
- **eVOLVER** — the strongest independent record: **ePACE**, mammalian long-term evolution,
  evolved base editors, built by groups other than Khalil's.
- **Toprak morbidostat** — a decade of adaptation; the reference other devices position against.
- **Pioreactor** — broad hobbyist / classroom / workshop adoption, but **no indexed
  peer-reviewed methods citations**. Credibility is commercial and community, not bibliographic.
- **EVE** — primarily educational uptake; younger and narrower than eVOLVER.
- **OpenEvo** — days old at this writing; no independent use yet.

---

## 5. Bottom line, by what you actually need

- **Characterise a strain or circuit:** **Chi.Bio**, decisively — nothing else has the in-situ optics.
- **Reliable parallel cultures now, minimal fuss:** **Pioreactor** (turnkey) or **eVOLVER**
  (16 vials, arbitrary control, if you have a machine shop).
- **Evolve on a teaching or shoestring budget:** **EVE**.
- **Antibiotic-resistance / drug-gradient evolution:** a **morbidostat** lineage device.
- **Three-media selection cycling in one cheap closed vessel:** **OpenEvo** — its real niche,
  once the §1 analysis gaps are addressed.
- **Rigorous ALE that produces evidence:** none as shipped. Needs replicates + archiving +
  `breseq` — the argument of the companion build proposal, [`two-instruments.md`](two-instruments.md).

---

*Verified this session: OpenEvo and Chi.Bio full text; Pioreactor specs, pricing, CC BY-SA 4.0
hardware, and absence of a reference paper; eVOLVER and EVE headline specs. Sensor, impedance,
and adoption specs confirmed against datasheets and primary papers in
[`datasheet-verification.md`](datasheet-verification.md). See [`../SOURCES.md`](../SOURCES.md).*
