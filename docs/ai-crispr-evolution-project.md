# Project: AI-directed continuous evolution with a CRISPR-driven loop

*Proposal — 2026-07-10. A concrete build assembled from the components this repository outlines.*
*Companion: the paper's "Toward AI-directed continuous evolution" section
([two-instruments.md](two-instruments.md) is the instrument; this is the campaign).*

## Goal in one sentence

Build a self-driving evolution machine — a replicate fleet of continuous-culture chambers whose
selection pressures and targeted mutation supply are steered in real time by a controller that
learns from the population's own genotype and fitness trajectory — and show it beats a fixed
selection schedule on a defined target.

## The thesis this rests on

- **`devo` is defined by evidence, not actuation.** The champion is the *apparatus* that produces
  an archived, replicated, sequenced, causally-attributed record — not a smarter vessel.
- **The observation layer an AI needs *is* that apparatus.** A controller can only steer what it
  can observe. So building AI-direction necessarily builds the champion as its substrate.
- **Apparatus = champion; AI = autopilot.** Build the apparatus first, prove it produces evidence,
  then close the loop. This is the inverse of OpenEvo's pitch, which offered the autopilot with no
  instruments beneath it.

## The loop

```
        ┌──────────────── observe ────────────────┐
        │  growth rate · conductivity · DO · pH    │   (real-time, in-vessel)
        │  WGS + breseq · fitness coefficients     │   (periodic, from the archive)
        │  CRISPR molecular-recorder readout       │   (high-frequency, in-cell)
        ▼                                          │
   ┌─────────┐        decide         ┌─────────────────────┐
   │ CONTROLLER │ ───────────────────▶│  per-chamber regime  │
   │ rule → BO  │  explore / exploit  │  (a fleet portfolio) │
   │ → RL/AL    │  across the fleet   └─────────────────────┘
   └─────────┘                                   │
        ▲                                        ▼ act
        │   selection media + gradients · light dose · dilution/OD ·
        │   temperature · CRISPR-targeted mutation supply (EvolvR)
        └──────────────────────────────────────────────────────────┘
```

## What is reused vs. new

| Layer | Component | Source |
|---|---|---|
| Chambers + fleet | Pioreactor leader/worker cluster | off-the-shelf (P3 champion substrate) |
| Vessel + fluidics | OpenEvo closed vessel + 3-media + waste | graft |
| Real-time sensing | conductivity cell; DO/pH optodes | shared ecosystem (the `proto` modules) |
| **Archive** | automated chilled fraction collector | **the one new hardware module** |
| Evidence pipeline | WGS → `breseq` → convergence + fitness DB | off-instrument compute |
| Controller | rule-based → Bayesian opt → RL/active learning | software on the leader node |
| **Diversification** | **EvolvR** (CRISPR-guided DNA polymerase) | **IGI / UC Berkeley (Dueber lab)** |
| Readout | CAMERA base-editing molecular recorder | Liu lab |
| Selection | Cas-activity-coupled survival | assembled |

## CRISPR's three concrete roles

1. **Mutation supply — a targeted dial, not a blunt lamp.** OpenEvo proposes UV to raise the
   mutation rate genome-wide when adaptation stalls. Replace it with **EvolvR**
   ([Halperin et al., *Nature* 2018](https://doi.org/10.1038/s41586-018-0384-8); an **Innovative
   Genomics Institute / Berkeley** technology): a nickase-guided low-fidelity polymerase that
   diversifies a *chosen locus* at tunable rates up to ~10⁶-fold over background. The controller
   dials diversification at the gene under selection, so mutational load is spent where it can pay
   off — and the hypermutator-meltdown risk is bounded by construction.
2. **Observation — an in-cell flight recorder.** Between sequencing runs, a CRISPR molecular
   recorder such as **CAMERA** ([Tang & Liu, *Science* 2018](https://doi.org/10.1126/science.aap8992))
   writes stimulus and lineage history into the cells' own genomes, giving the controller a cheap,
   high-frequency readout of the trajectory it is steering.
3. **Selection — programmable pressure.** Coupling Cas activity (cut / interference / base-edit)
   to survival lets the controller compose arbitrary selection pressures beyond what three media
   bottles can express.

## Milestones

- **M0 — Champion baseline.** Fleet + closed vessel + conductivity + DO/pH + automated archive.
  Reproduce a known result (e.g. low-salt *H. volcanii*) at **n ≥ 8** with a frozen record and
  `breseq` convergence. *Deliverable: the `devo` champion, fixed-schedule.*
- **M1 — Fitness loop.** Automate revive-ancestor-vs-descendant competitions on the same OD
  hardware; produce selection coefficients per lineage.
- **M2 — Controller v1.** Rule-based regime control (hold a target adaptation rate); logs a
  state→action→outcome dataset.
- **M3 — EvolvR knob.** Add CRISPR-targeted diversification as a controllable input; validate
  tunable, locus-specific mutation rate in-vessel.
- **M4 — Controller v2.** Bayesian optimisation over the selection-regime + diversification space,
  explore/exploit across the fleet.
- **M5 — The result.** Head-to-head: AI-directed vs. fixed schedule, same target, replicate fleet
  — faster to phenotype, or a phenotype the fixed schedule can't reach.

## Success metric

Generations (or wall-clock) to a defined phenotype, AI-directed vs. fixed, with convergence
evidence across replicates that the causal mutations are shared. A win at M5 is the paper.

## Guardrails

- **Mutational meltdown is an AI-safety constraint.** The controller must optimise against a model
  of mutation load, not a bare "adaptation stalled → mutate more" threshold (six of twelve LTEE
  populations became hypermutators). EvolvR's locus-targeting narrows the blast radius.
- **The ALE trap.** Selection rewards growth; couple product formation to growth *before* the run
  or the controller efficiently finds the pathway-deletion mutant.
- **Containment.** Targeted in-situ diversification + programmable selection warrants biosafety
  review and physical/genetic containment appropriate to the host and the trait.

## Why this is frontier

Machine-learning-guided directed evolution
([Yang, Wu & Arnold 2019](https://doi.org/10.1038/s41592-019-0496-6)) is an *offline*
design–build–test loop over sequences. This puts the learner *inside* a live, continuous culture,
with a CRISPR-targeted mutation dial and an in-cell recorder — a closed loop no current open
platform is close to, built almost entirely from parts that already exist.

---

*Confidence: EvolvR (IGI/Berkeley, Halperin 2018), CAMERA (Tang & Liu 2018), and ML-guided
directed evolution (Yang 2019) verified against primary sources 2026-07-10. The integrated system
is a proposal, not a built result. See [../SOURCES.md](../SOURCES.md).*
