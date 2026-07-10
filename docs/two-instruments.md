# Two Instruments, One Ecosystem

*Design proposal — Rev. B, 2026-07-10.*
*Sources: Chi.Bio (PLOS Biol 18:e3000794), OpenEvo (bioRxiv 2026.07.06.735356), and field.*

Chi.Bio and OpenEvo serve different purposes, so the right move is to build the best machine
for each purpose first — and only then ask whether one machine can do both. The short answer:
**build two, share the parts.**

Companion evidence base: [`corrections-and-matrix.md`](corrections-and-matrix.md).

---

## The two purposes, stated cleanly

- **Purpose 1 — Characterisation.** Hold a culture in a defined, unchanging state and measure
  it richly, in situ, in real time, while closing feedback loops. You want *signal density per
  reactor* and a handful of reactors running different conditions in parallel. Chi.Bio's purpose.
- **Purpose 2 — Evolution.** Push a culture through selection regimes unattended for weeks, and
  produce *evidence* that adaptation occurred and which mutation caused it. You want cheap
  chambers in numbers, archiving, and long-run robustness. OpenEvo's purpose.

These purposes pull hardware in opposite directions. A machine optimised for one is actively
worse at the other — which is why "combine or not" is a real question, not a foregone conclusion.

---

## Part 1 — The best in-situ characterisation instrument

Start from Chi.Bio; its architecture is already correct for this purpose.

**Design law: non-contact is inviolable.** Every Chi.Bio subsystem but the heat plate is
non-contact, which is why tubes hot-swap and sterilisation is trivial. Any sensor added must
read *through the vessel wall* — optical, not immersed. Put an electrode in the culture and
you have built the other machine.

**Keep, unchanged:** the non-contact discipline; PID + MPC control; eight reactors on one
control computer (here, eight *richly instrumented* reactors running eight conditions);
chemostat/turbidostat mode flexibility.

**Upgrades, in order of value:**

| Upgrade | Hardware | Why it serves characterisation | Verdict |
|---|---|---|---|
| Dissolved oxygen + pH | Optode spots + AS7341 | Ratiometric fluorescence read through the wall — non-contact, core physiology | Adopt |
| Dispersive spectrometry | C12880MA | Continuous 340–850 nm replaces eight fixed filter bands; keep AS7341 for fast ratios | Adopt |
| Controlled atmosphere | Sealed lid + gas port | Closes Chi.Bio's open-to-atmosphere gap; makes O₂/CO₂ a controlled variable | Adopt |
| Expanded excitation | IO Rodeo LED modules | Wider excitation grid + tunable UV-C; verify a 730 nm part exists for PhyB | Conditional |
| Viable cell density | β-dispersion, immersed | Needs electrodes → breaks the design law. Belongs on the evolution machine. | Wrong machine |

Net result: a Chi.Bio measuring DO, pH, and a full spectrum in a gas-controlled vessel, still
non-contact, still eight-way parallel — with no evolution-specific hardware on it.

---

## Part 2 — The best automated evolution machine

Start from OpenEvo; its virtues (cheap, closed, buildable, standalone) fit long unattended
runs. But OpenEvo as published cannot produce the evidence an evolution experiment exists to
produce. Fixing that, not adding sensors, is the work.

**Design law: cheap × many, resist sensing bloat.** The output is not a rich time series — it
is an *archived, sequenced, replicated* record of adaptation. Every dollar instrumenting one
chamber is a dollar not spent on the second chamber.

**The two things OpenEvo is missing, and neither is a sensor:**

- **Fix I — Replicate populations.** n = 1 is a failure of causal inference, not a throughput
  limit. Convergence across independent lineages is the only evidence a mutation was selected
  rather than merely present. Build: *eight cheap chambers under one coordinating interface* —
  minimal instrumentation per chamber, many chambers. (The opposite of Part 1's parallelism.)
- **Fix II — Archiving.** The LTEE's real innovation was the freezer, not the flask. Build: an
  automated chilled fraction collector on the existing waste line — divert a programmable
  fraction, on a generation-count schedule, into a chilled glycerol archive. As far as we can
  find, nobody has built this; it is the highest-value addition.

**Upgrades, in order of value:**

| Upgrade | Hardware | Why it serves evolution | Verdict |
|---|---|---|---|
| Replicate parallelism | 8× cheap chamber | Turns anecdote into convergence evidence | Adopt |
| Automated archive | Chilled fraction collector | Turns a claim into a measurable fitness assay | Adopt |
| Batch excursion mode | Firmware only | Recovers carrying capacity — a phenotype a turbidostat structurally cannot see (how the LTEE caught Cit⁺) | Adopt |
| Conductivity | 2–4 electrode cell | Verifies the media switch (OpenEvo's media differ by salt); electrodes fine in a closed vessel | Adopt |
| Variant-calling pipeline | `breseq` | The IS-mediated ~110 kb deletion needs it; the default mapper does not | Adopt |
| Electrical resistance tomography | OpenEIT Spectra | Mixing verification + wall-biofilm; gated to the stirring-off settle window | Research |
| Viable cell density | Spectra, high-power | The β-dispersion modality Part 1 could not have; belongs here | Research (gated on Q1) |
| Rich spectrometry / DO / pH | — | Characterisation sensing here is cost without purpose; borrow the shared optode only if a run needs DO | Resist |

**The ALE trap:** ALE selects for growth, and making product costs growth. Naive selection on
a production strain finds the mutant that deleted your pathway. The field's answer is
**growth-coupled design first**. OpenEvo's negative-selection media line is a hardware stab at
that counterselection — right instinct, build on it.

---

## Part 3 — Should you combine them into one machine?

**Mostly no. Build two instruments, share the ecosystem beneath them.**

The two optimal machines diverge on every axis that matters:

| Axis | Characterisation wants | Evolution wants |
|---|---|---|
| Reactor economics | Few, richly instrumented | Many, minimally instrumented |
| Culture contact | Non-contact, inviolable | Immersed electrodes fine |
| Culture state | Held at defined steady state | Free to run to stationary phase |
| Run length | Hours to days | Weeks to months, unattended |
| Primary output | Dense real-time signal | Archived, sequenced, replicated record |
| Sensing philosophy | More is better | Less is better |

The tension resolves itself: **the sensor modalities sort by contact.** Optode DO/pH and
dispersive spectrometry are optical → characterisation machine. Conductivity, ERT, and
β-dispersion viable-cell-density need immersed electrodes → evolution machine (whose closed
autoclavable vessel welcomes them). Almost no sensor is wanted by both and available to only
one. That is the strongest evidence these are two instruments, not one.

**What they share — the ecosystem** (combine at the platform level, not the product level):

- A **module footprint** — adopt IO Rodeo's 25.4 × 20 mm / dual-JST-SH standard for both.
- The **sensor module designs** — a DO optode reader is the same board on either chassis.
- The **firmware / interface framework** — one codebase, two hardware profiles.
- The **calibration reference** — one open colorimeter on the bench calibrates both OD paths.

**The one honest exception:** if you only ever do ALE with fitness measurement and never pure
characterisation, the Part 2 machine is nearly complete on its own and bolting characterisation
sensing onto it is waste. When in doubt: two machines, shared parts.

---

## Part 4 — The wider landscape, and a third purpose

Two purposes is an undercount. **Purpose 3 — Scale-out operation:** run N reliable reactors
now, minimal build effort, maintained platform, support. Orthogonal to signal density (P1) and
archived evidence (P2).

| Device | Best for | Corner it owns | Open? | Scale · cost |
|---|---|---|---|---|
| Chi.Bio | P1 | In-situ measurement density | HW+SW | 8 / ~$300ea |
| Pioreactor | P3 | Turnkey reliability + fleet | CC BY-SA 4.0 + MIT | cluster / $329–389 |
| eVOLVER | P3 | Max-configurability scale-out | HW+SW | 16 / high |
| Toprak morbidostat | P2 | Drug-gradient selection | HW+SW | few / mid |
| EVE | P2 | Low-cost evolution + teaching | HW+SW | few / low |
| OpenEvo | P2 | Cheapest buildable selection cycler | HW+SW | 1 / ~$300 |

**Uncomfortable implication:** Part 2's fix — "eight cheap chambers under one interface" — is
a description of **Pioreactor's leader/worker cluster**, already productised. The best P2
machine may be *Pioreactor + an archiving plugin + a batch-excursion automation*, not a
scaled-up OpenEvo. OpenEvo's remaining edge shrinks to the three-media fluidics and the closed
vessel — both addable to a Pioreactor; the cluster and ecosystem are not easily addable to an
OpenEvo.

*Correction to the record: OpenEvo states Pioreactor is "available for purchase, but only the
software is open source." A public `Pioreactor/hardware` repo exists under CC BY-SA 4.0. See the
[corrections](corrections-and-matrix.md).*

---

## Build order, two tracks

- **S0 — Shared foundation.** Build one stock Chi.Bio and one stock OpenEvo. Adopt the module
  footprint and a common firmware framework. Stand up the shared calibration reference;
  cross-calibrate the 650 nm and 940 nm OD paths across OD₆₀₀ 0.2–6.0. Nothing forks until
  both baselines agree.
- **C1 — Characterisation · optode DO + pH.** Non-contact spots; proves the shared sensor path.
- **C2 — Characterisation · dispersive spectrometer + atmosphere.** C12880MA + sealed gas lid.
- **E1 — Evolution · archive + batch excursion + conductivity.** The two findings + media
  verification; firmware-and-cheap-hardware.
- **E2 — Evolution · eight-chamber replicate array + `breseq`.** Replicates under one
  interface; the variant-calling pipeline that makes convergence legible.
- **E3 — Evolution · ERT then viable-cell-density (research).** 80 kHz for mixing/biofilm;
  then β-dispersion, gated on Q1.

---

## Open questions for Jean Rintoul (OpenEIT / Mindseye)

Bearing on E3 (mixing verification and viable-cell-density). Q1 is load-bearing.

1. **Is Spectra's 80 kHz ceiling silicon or firmware?** AN-1271 specs the ADuCM350's DFT
   impedance excitation to 200 kHz, with 80 kHz as the `HSDACCON` low/high-power crossover.
   Was 80 kHz a power/noise/thermal/safety call? Does firmware expose high-power mode, and if
   pushed to 200 kHz, what degrades first — SNR, DFT settling, DAC flatness? The β-dispersion
   starts at 100 kHz, so this bit decides whether viable-cell-density on yeast (f_c ≈ 2–3 MHz)
   is reachable.
2. **Did the 32-electrode Spectra land true tetrapolar drive?** The `EIT_EE` README notes the
   8-electrode board was not tetrapolar. Does it follow AN-1302's 4-wire bioisolated config?
   We would measure into archaeal media at 12–18% w/v salt, where electrode polarisation is
   brutal at the low end of the band.
3. **Has Spectra imaged a vessel rather than a body?** A ~2.5 cm glass tube of brine is not a
   thorax; GREIT's priors assume a thorax-shaped domain. Does reconstruction hold, and is 32
   electrodes over- or under-determined for that geometry?

---

## Risks, and what this is not

- **Electrodes cost the evolution machine its hot-swap.** A flex circuit laminated to the
  *outside* of the glass (capacitively coupled, lossy) preserves it; see the `8_electrode_flex`
  directory in the OpenEIT repo.
- **Wall biofilm is both signal and noise for ERT.** The boundary sensitivity that detects
  biofilm is what biofilm corrupts.
- **A mutagenesis controller can hill-climb into meltdown.** Six of twelve LTEE populations
  became hypermutators; a controller that cranks mutagenesis when adaptation stalls needs a
  model, not a threshold.
- **Neither machine, however upgraded, is a bioprocess instrument.** ~20 mL benchtop research
  devices — no gas sparging at scale, no fed-batch, no CIP/SIP. Discovery end only; the strain
  then goes to a real instrumented bioreactor.

---

*A later datasheet pass — [`datasheet-verification.md`](datasheet-verification.md) — confirmed
the C12880MA, AS7341, IO Rodeo, Red Pitaya, AD5933, and ADuCM350 specs against manufacturer
datasheets, and resolved the "silicon or firmware?" half of Q1: the ADuCM350's DFT excitation
is specified to 200 kHz, and 80 kHz is the `HSDACCON` power-mode register threshold, not a
silicon ceiling. The ADI PDFs were not re-pulled at page level; confirm before budgeting. See
[`../SOURCES.md`](../SOURCES.md).*
