# biopunk-bioreactor

An open, evidence-based review of low-cost open-source continuous-culture platforms
(turbidostats / chemostats / morbidostats), and a design proposal for building
best-in-class instruments for two distinct purposes: **characterisation** and **evolution**.

The work started as a reading of two papers —
[Chi.Bio](https://doi.org/10.1371/journal.pbio.3000794) (PLOS Biology 2020) and
[OpenEvo](https://doi.org/10.64898/2026.07.06.735356) (bioRxiv 2026) — and grew into a
field-wide comparison plus a build plan.

## What's here

| Document | What it is |
|---|---|
| [`docs/corrections-and-matrix.md`](docs/corrections-and-matrix.md) | A fair-minded errata of the OpenEvo preprint, plus a like-for-like matrix of six open bioreactor platforms with per-device pros/cons and adoption evidence. **The evidence base.** |
| [`docs/two-instruments.md`](docs/two-instruments.md) | A design proposal: the best characterisation instrument, the best evolution machine, and the argument for sharing a component ecosystem rather than merging into one machine. **The plan.** |
| `docs/*.html` | Rendered, self-contained versions of the same two documents (theme-aware, no external assets). |

## Core argument, in one paragraph

Chi.Bio and OpenEvo look like competitors but serve opposite purposes. **Chi.Bio is an
instrument** — it measures a culture richly in situ while holding it in a defined state.
**OpenEvo is an actuator** — it pushes a culture through selection regimes unattended for
weeks. A third purpose, **turnkey scale-out operation**, is best served by Pioreactor and
eVOLVER, neither of which optimises for the first two. The right move is not one merged
machine but two purpose-built instruments sharing a module standard, sensor designs, a
firmware framework, and a calibration reference.

## Platforms covered

Chi.Bio · OpenEvo · Pioreactor · eVOLVER · EVE · Toprak morbidostat.
See the matrix for a like-for-like comparison across 15 attributes.

## Status & epistemics

This is a **reader's audit**, not peer review, and not all facts carry equal confidence.
Each document ends with an explicit **verified / not-verified-this-session** split. Before
using any spec for budgeting, procurement, or a grant, confirm it against the primary
datasheet or paper. Known items still needing a datasheet pass: OpenEIT Spectra frequency
ceiling, the AD5933/ADuCM350 register details, C12880MA range, Red Pitaya limits, eVOLVER
cost, and the Toprak morbidostat and ReacSight/ePACE adoption specifics.

Corrections to the OpenEvo preprint are stated with the quoted source text and a proposed
fix, and are grouped as verifiable errors, framing/omissions, and methodological limitations.

## Contributing

Contributions welcome — especially:

- **Corrections with citations.** If a spec here is wrong, open an issue or PR with the
  primary source. Every factual claim should be traceable to a DOI or datasheet.
- **New platforms.** Add a column to the matrix and a pros/cons card, with a reference.
- **Adoption evidence.** Peer-reviewed third-party *use* of any platform, especially
  Pioreactor (which has no methods paper).

Edit the Markdown; the HTML is generated from the same content and should be kept in sync.
Keep the verified/unverified discipline — label the confidence of any new claim.

## Licence

Documents and text: [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).
Cite the underlying papers directly; see [`SOURCES.md`](SOURCES.md).
