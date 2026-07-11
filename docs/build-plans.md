# Concrete build plans: proto, devo, bior

*Engineering plans — 2026-07-10. Milestoned builds for the three champions.*
*Design rationale lives in [`two-instruments.md`](two-instruments.md) (thesis),
[`best-hybrids.md`](best-hybrids.md) (chassis + grafts), and
[`chibio-upgrades.md`](chibio-upgrades.md) (Chi.Bio Pi port). The goal beyond these is
[`ai-crispr-evolution-project.md`](ai-crispr-evolution-project.md).*

These turn the design synthesis into actionable, milestoned builds. Each names a chassis, the
grafts, the milestones with a demonstrable deliverable, a success metric, and the guardrails.
They **share one substrate** — Raspberry Pi + one codebase with per-instrument profiles, the IO
Rodeo 25.4 × 20 mm / dual-JST-SH module footprint, and one open-colorimeter calibration
reference (see [`best-hybrids.md`](best-hybrids.md) → "the ecosystem"). Build the shared
foundation once; both instruments fork from it.

---

## proto — Updated Chi.Bio (characterisation champion)

**Chassis: Chi.Bio.** Nothing else has the non-contact in-situ optics + PID/MPC. **Design law:
everything added is optical / through-wall — no immersed electrodes.** Subsystem detail:
[`chibio-upgrades.md`](chibio-upgrades.md); grafts: [`best-hybrids.md`](best-hybrids.md) → proto.

| Reused | Grafted / new |
|---|---|
| AS7341 spectral sensor + 650 nm laser OD + 7-colour excitation; PID/MPC | OpenEvo closed, gas-capable vessel · DO/pH optodes (through-wall) · Hamamatsu C12880MA dispersive spectrometer · Raspberry Pi compute |

- **M0 — Pi port + baseline.** Migrate Chi.Bio off the BeagleBone to a Pi (all-I²C behind the
  `0x74` mux; carrier respin + software port, not a rewrite). Reproduce a published growth/
  fluorescence run to confirm parity. *Deliverable: Pi-native Chi.Bio at parity.*
- **M1 — Closed gas-controlled vessel.** Graft OpenEvo's autoclavable vessel + a gas port;
  demonstrate a controlled micro-aerobic condition the open tube cannot hold.
- **M2 — Optode DO + pH.** Ratiometric spots read through the wall by existing LEDs + AS7341;
  validate against a benchtop DO/pH meter. *Deliverable: non-contact physiology.*
- **M3 — Dispersive spectrometer.** Add the C12880MA (continuous 340–850 nm) alongside AS7341;
  demonstrate resolving two fluorophores the eight fixed bands cannot separate.
- **M4 — Eight-reactor parallel run.** Eight richly-instrumented, gas-controlled, closed reactors
  on one Pi, running eight conditions. *Deliverable: the proto champion.*

**Success metric:** signal density — DO, pH, and a full emission spectrum per reactor, in situ,
non-contact, ×8 in parallel, with MPC holding OD to ~2% of setpoint.
**Guardrails:** optode cross-talk with excitation LEDs; I²C timing on a shared Pi bus (integration
risk, unbudgeted). No electrodes — that is the other machine.

---

## devo — The evolution machine: OpenEvo lineage + evidence apparatus (evolution champion)

The championship-making part is the **evidence apparatus**, which is chassis-agnostic. The
chassis choice is a separate, honest decision:

- **Recommended chassis: Pioreactor cluster** (per [`best-hybrids.md`](best-hybrids.md) → devo) —
  "many cheap chambers, one interface" is a description of its leader/worker cluster, it is
  Pi-native, and it still ships monthly releases while eVOLVER's server is dormant. Graft
  OpenEvo's three-media fluidics + closed vessel onto it.
- **Honest alternative: an OpenEvo base** (or EVE at \$115–200) when cost, openness, or a single
  autoclavable vessel dominate over fleet coordination — teaching, a shoestring lab, a one-off
  campaign. The evidence apparatus below is identical either way.

| Reused | Evidence capabilities (what makes it champion) | Additional features |
|---|---|---|
| Pioreactor cluster + plugins **or** OpenEvo base; OpenEvo 3-media fluidics + closed vessel; 940 nm OD | Replicate manifold (≥8 lineages) · **automated chilled archiver** (new build) · WGS → `breseq` → convergence · revive-ancestor fitness assay | Batch-excursion mode (carrying capacity) · conductivity (media-switch verification) · gradient media blending |

- **M0 — Replicate fleet + vessel.** ≥8 chambers under one interface with OpenEvo's closed
  vessel + three-media fluidics + conductivity. *Deliverable: cheap × many, closed, verified media.*
- **M1 — The archiver (build this first; highest risk, highest value).** Automated chilled
  fraction collector on the waste line, banking a glycerol stock on a generation schedule. No
  prior art found. *Deliverable: the field's missing freezer.*
- **M2 — Evidence pipeline.** Archive → WGS → `breseq` → per-lineage convergence + a
  genotype/fitness database; automate revive-ancestor-vs-descendant competitions on the OD
  hardware. *Deliverable: fitness coefficients, not anecdotes.*
- **M3 — Batch-excursion firmware.** Periodic run-to-stationary to recover carrying-capacity
  phenotypes a turbidostat structurally cannot see.
- **M4 — The champion, proven.** Reproduce a known adaptation (e.g. low-salt *H. volcanii*) at
  n ≥ 8 with archived record and shared causal mutations across replicates. *Deliverable: the
  `devo` champion — the empty slot filled.*

**Then:** the champion is the substrate for the autopilot —
[`ai-crispr-evolution-project.md`](ai-crispr-evolution-project.md) adds the controller + CRISPR.
**Success metric:** an archived, replicated, sequenced, causally-attributed record of adaptation.
**Guardrails:** archiver fraction fidelity (the novel, surprising piece); conductivity in
12–18% salt media; resist sensing bloat — the output is evidence, not a dense time series.

---

## bior — Updated Pioreactor (scale-out champion)

**Chassis: Pioreactor — buy it.** For `bior`, turnkey reliability *is* the product; the plan is
mostly configuration and shared-ecosystem alignment, not fabrication.

| Reused | Optional graft | Shared |
|---|---|---|
| Pioreactor leader/worker cluster; monthly-maintained software + plugin ecosystem | eVOLVER Smart Sleeves on the specific vials needing arbitrary per-vial control | Module footprint + optode designs + calibration reference (from proto) |

- **M0 — Cluster stood up.** N-Pioreactor leader/worker cluster; the calibration reference
  cross-checks its 900 nm OD against the shared open colorimeter.
- **M1 — Shared modules.** Bring the proto instrument's optode DO/pH module (same footprint)
  onto the vials that need physiology, via the plugin path — no new board.
- **M2 — Selective eVOLVER graft (only if needed).** Drop Smart Sleeves onto the handful of vials
  that genuinely need eVOLVER-grade per-vial setpoints; the rest run standard. Reach for this
  only when a study needs it — otherwise it is a machine-shop cost for capability you won't use.

**Success metric:** many reliable reactors running now, reproducibly, with minimal build effort
and a maintained software path.
**Guardrails:** don't over-graft — every eVOLVER sleeve added is build burden; the value of
`bior` is that you *didn't* build it.

---

## Build order across the three

1. **Shared foundation** — Pi compute family + one codebase; module footprint; calibration
   reference. Cross-calibrate 650 nm (Chi.Bio) and 940/900 nm (OpenEvo/Pioreactor) OD paths
   across OD₆₀₀ 0.2–6.0 so all instruments agree before any forks.
2. **proto M0–M2** and **bior M0** can proceed in parallel (both Pi, both mostly integration).
3. **devo M1 (the archiver) first within the devo track** — it is the novel, highest-risk piece
   and the one most worth prototyping before committing the rest.
4. **devo M4 → the AI/CRISPR project** once the champion produces evidence.

---

## Confidence

- **Verified this session / prior:** the platform baselines these plans draw on (Chi.Bio all-I²C
  non-contact optics + Pi-portability; OpenEvo closed vessel + 3-media fluidics; Pioreactor Pi
  cluster + CC BY-SA 4.0 + monthly releases; eVOLVER Pi-server + SmartSleeve; C12880MA / optode /
  `breseq` specs) — see [`best-hybrids.md`](best-hybrids.md) and
  [`datasheet-verification.md`](datasheet-verification.md).
- **Design proposal, not built:** every plan here is a composition on paper. The named
  integration risks (I²C bus timing, optode cross-talk, **archiver fraction fidelity**,
  conductivity in high-salt media) are real and unbudgeted. The archiver is the piece with no
  prior art and the one most worth building first.
