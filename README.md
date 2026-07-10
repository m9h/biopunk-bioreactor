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
| [`docs/education.md`](docs/education.md) | The educational materials each platform serves — classroom-validated uses, curricula, and a cross-platform concepts ladder. |
| [`docs/datasheet-verification.md`](docs/datasheet-verification.md) | A primary-source pass resolving the open items above: confirms the sensor/impedance/platform specs, corrects four (incl. Pioreactor's hardware licence), and answers the "silicon or firmware?" half of Open Question 1. **The receipts.** |
| [`docs/chibio-upgrades.md`](docs/chibio-upgrades.md) | A platform-modernisation note for Chi.Bio: base-platform upgrades (compute, connectivity, pumps, thermal, software architecture) anchored to the verified BOM/code baseline — including a correction that Chi.Bio *already* ships the AS7341. Complements `two-instruments.md` Part 1 (sensing). |
| `docs/*.html` | Rendered, self-contained versions of the same documents (theme-aware, no external assets). |

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
datasheet or paper. Most items previously flagged as needing a datasheet pass — OpenEIT
Spectra / ADuCM350 / AD5933 registers, C12880MA range, Red Pitaya limits, eVOLVER cost, the
Toprak morbidostat, and ReacSight/ePACE adoption — are now confirmed in
[`docs/datasheet-verification.md`](docs/datasheet-verification.md), which also **corrects
Pioreactor's hardware licence to CC BY-SA 4.0** (not CERN-OHL). Still open at page level: the
three Analog Devices PDFs, the flex-electrode coupling detail, and Pioreactor's exact OD
wavelength.

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

Documents and text: [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) — see [`LICENSE`](LICENSE) and [`NOTICE.md`](NOTICE.md).
Cite the underlying papers directly; see [`SOURCES.md`](SOURCES.md).
