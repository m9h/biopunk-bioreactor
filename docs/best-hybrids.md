# Best Hybrids — One Instrument per Purpose

*Design synthesis — Rev. A, 2026-07-10.*
*Builds on [`two-instruments.md`](two-instruments.md) (the thesis), [`corrections-and-matrix.md`](corrections-and-matrix.md)
(the evidence), [`chibio-upgrades.md`](chibio-upgrades.md) (the Pi port), and
[`datasheet-verification.md`](datasheet-verification.md) (the specs).*

The two-instruments thesis says the sensor modalities sort by culture contact, so you build two
purpose-optimal instruments and share the parts rather than merging into one machine. This note
makes that concrete: for each purpose, **which existing platform is the right *chassis*, and
which subsystems do you graft onto it from the others** — a bill of best-of-breed parts, not a
new platform.

A caveat on what these platforms are. Chi.Bio (2020), OpenEvo (2026), Pioreactor, eVOLVER
(2018), EVE (2022), and the Toprak morbidostat (2013) are **mature, proven designs**, not the
frontier. The value of a hybrid is exactly that: it recombines subsystems that already work in
the field, so the risk is integration, not invention. Only one genuinely new build appears
below (the automated archiver), and it is called out as such.

---

## The compute convergence — why "share the firmware" is not aspirational

The thesis asks the two instruments to share a firmware/interface framework. That is now a
grounded fact, not a hope, because **three of the field's platforms already sit — or can sit —
on one Raspberry Pi compute family**:

- **Pioreactor** is a Raspberry Pi platform (leader/worker cluster of Pis).
- **eVOLVER**'s server runs on a **Raspberry Pi** (RPi server + Arduino "SmartSleeve" motorboards
  + a Data Processing Unit + an Electron GUI).
- **Chi.Bio** ports to a Pi at medium effort — the [Pi-migration analysis](chibio-upgrades.md)
  shows it is all-I²C behind a `0x74` mux, so the move is a carrier respin plus a small software
  port, not a rewrite.

So both hybrids below stand on the same substrate: **Raspberry Pi + one Python/web/cluster
codebase, with per-instrument hardware profiles.** This is the single most leveraged decision in
the whole plan — it is what lets the sensor-module designs, the calibration reference, and the
control code actually be shared instead of merely analogous.

---

## proto — The characterisation instrument: Chi.Bio core in an OpenEvo body

**Chassis: Chi.Bio.** Nothing else has the non-contact in-situ optics (AS7341 spectral sensor +
650 nm laser OD + seven-colour excitation, all read through the vessel wall) or the PID/MPC
control that holds OD to ~2% of setpoint. Its one real weakness is that the culture tube is open
to atmosphere. The hybrid fixes that by borrowing OpenEvo's body.

| Subsystem | Source | What it contributes |
|---|---|---|
| Optical core + control | **Chi.Bio** (chassis) | Non-contact AS7341 + laser OD + 7-colour excitation; PID/MPC |
| Closed, autoclavable, gas-capable vessel | **OpenEvo** graft | Fixes the open-atmosphere gap; makes O₂/CO₂ a controlled variable |
| Dissolved O₂ + pH | Optode spots (datasheet-verified) | Ratiometric fluorescence read **through the wall** — non-contact, core physiology |
| Dispersive spectrometry | Hamamatsu **C12880MA** | Continuous 340–850 nm replaces the eight fixed AS7341 bands; keep AS7341 for fast ratios |
| Compute | **Raspberry Pi** | WiFi + quad-core for the dense real-time logging this instrument produces |

**Design law held: everything added is optical / through-wall.** No immersed electrodes — the
moment you put one in, you have built the other machine. Result: **eight richly-instrumented,
gas-controlled, closed reactors on one Pi**, running eight conditions in parallel.

---

## devo — The evolution machine: Pioreactor cluster, OpenEvo fluidics, and the archiver

This is the contested chassis choice, so state it plainly.

**Chassis: Pioreactor — not a scaled-up OpenEvo.** The evolution machine's first requirement is
"eight cheap chambers under one coordinating interface." That is a *description of Pioreactor's
leader/worker cluster*, already productised and Pi-native. The decision turns on what is addable
in which direction:

- OpenEvo's real edge is its **three-media selection fluidics** and **closed autoclavable
  vessel** — both **addable to a Pioreactor**.
- Pioreactor's edge is the **cluster + plugin ecosystem** — **not** easily addable to an OpenEvo.

The asymmetry decides it: graft OpenEvo's vessel onto Pioreactor, not the reverse.

**And you would be building on living ground.** Chassis choice is also a bet on maintenance,
and the platforms are ageing very differently (GitHub, as of 2026-07-10): Pioreactor ships a
**monthly release** (`26.6.0`, 2026-06-29) with 100+ commits in the past year and a maintained
org of plugins and docs; **eVOLVER's server is dormant** — last release 2022, last commit May
2024, zero in the past year; Chi.Bio is lightly maintained (a couple of commits a year, no
releases). Grafting onto eVOLVER means forking a codebase nobody has touched since 2024;
grafting onto Pioreactor means building on something that still ships. That is a second,
independent reason the evolution chassis is Pioreactor — see the maintenance row in
[`corrections-and-matrix.md`](corrections-and-matrix.md).

**The honest alternative.** If cost, openness, or a single autoclavable closed vessel dominate
your requirements over fleet coordination — teaching, a shoestring lab, a one-off campaign —
then an **OpenEvo base** (or EVE, for replicate-capable teaching at $115–200) is the right call,
and this whole section inverts. The Pioreactor choice is for *best-in-class rigorous ALE*, where
the cluster and plugin path carry their weight.

| Subsystem | Source | What it contributes |
|---|---|---|
| Cluster chassis + plugins | **Pioreactor** (chassis) | "Many cheap chambers, one interface"; Pi-native; supported |
| Three-media selection fluidics + closed vessel | **OpenEvo** graft | Native selection cycling; sterility for weeks-long unattended runs |
| **Automated chilled archiver** | **New build** | Generation-scheduled glycerol fraction collector on the waste line — the LTEE's freezer, the field's missing piece; turns a claim into a fitness assay |
| Batch-excursion mode | Firmware | Recovers carrying-capacity phenotypes a turbidostat structurally cannot see (how the LTEE caught Cit⁺) |
| Variant calling | **`breseq`** pipeline | The IS-mediated ~110 kb deletions OpenEvo mis-called need it; a default mapper does not |
| Media-switch verification | Conductivity electrodes | The media differ by salt; electrodes are fine in a closed vessel |

**Design law held: cheap × many, resist sensing bloat.** The output is an *archived, sequenced,
replicated* record, not a dense time series. Every dollar instrumenting one chamber is a dollar
not spent on the second. The archiver is the highest-value addition because, as far as we can
find, **nobody has built an automated one** — it is the difference between an anecdote and a
measurable ancestor-vs-descendant fitness assay.

---

## bior — Scale-out: buy Pioreactor, graft an eVOLVER sleeve only if you must

bior barely wants hybridizing; turnkey reliability *is* the product. **Buy a Pioreactor cluster.**
The one graft worth considering: drop **eVOLVER Smart Sleeves** (Arduino motorboards giving
arbitrary per-vial temperature / stir / OD setpoints) onto the specific vials that need
eVOLVER-grade configurability, while the rest of the fleet runs standard. Reach for that only
when a study genuinely needs arbitrary per-vial control at scale — otherwise it is cost and
build burden (eVOLVER wants a machine shop) for capability you will not use.

---

## The bill of grafts

| Purpose | Chassis | Grafts from | The one new build |
|---|---|---|---|
| **proto · Characterise** | Chi.Bio | OpenEvo vessel + gas; optode DO/pH; C12880MA; Pi compute | — |
| **devo · Evolve** | Pioreactor | OpenEvo fluidics + vessel; conductivity; `breseq` | **Automated chilled archiver** |
| **bior · Scale-out** | Pioreactor | (opt.) eVOLVER Smart Sleeve | — |

---

## What the instruments share — the ecosystem

Combine at the platform level, not the product level:

- **Compute/firmware family** — Raspberry Pi + one codebase, per-instrument profiles (the
  convergence above; the reason the rest of this list is achievable at all).
- **Module footprint** — the IO Rodeo 25.4 × 20 mm / dual-JST-SH board size for sensor modules
  on both chassis.
- **Sensor-module designs** — a DO/pH optode reader is the same board on either machine.
- **Calibration reference** — one open colorimeter cross-calibrating the 650 nm (Chi.Bio) and
  940 nm (OpenEvo-lineage) OD paths across OD₆₀₀ 0.2–6.0, so both instruments agree before
  either forks.

**The one honest exception, unchanged from the thesis:** if you only ever do ALE-with-fitness and
never pure characterisation, the devo machine stands alone, and bolting characterisation optics
onto it is waste. When in doubt: two machines, shared parts.

---

## Confidence & unverified

- **Verified this session:** the platform baselines these grafts draw on — Chi.Bio's all-I²C
  non-contact optics and Pi-portability (from `app.py`); OpenEvo's closed vessel and three-media
  fluidics; Pioreactor's Pi cluster and CC BY-SA 4.0 hardware; **eVOLVER's Raspberry-Pi server +
  Arduino SmartSleeve architecture** (from the eVOLVER docs wiki); the C12880MA / optode / `breseq`
  specs (`datasheet-verification.md`).
- **Design proposal, not built:** every hybrid here is a composition on paper. The integration
  risk (I²C timing on a shared Pi bus, optode cross-talk with excitation LEDs, archiver fraction
  fidelity, conductivity in high-salt media) is real and unbudgeted — see the risks in the
  companion docs.
- **Genuinely novel and therefore highest-risk:** the automated chilled archiver on the waste
  line. No prior art found; it is the piece most worth prototyping first, and the one most likely
  to surprise.

*Sources in [`../SOURCES.md`](../SOURCES.md). A synthesis note; confirm any spec against the
primary source before budgeting.*
