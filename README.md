# biopunk-bioreactor

An open, evidence-based **review of low-cost open-source bioreactors** — the continuous-culture
platforms (turbidostats / chemostats / morbidostats) the field has produced — synthesized into a
series of **upgrade paths that compose best-of-breed solutions for specific applications**:
characterisation, evolution, and turnkey scale-out.

The review covers six platforms, each traced to its primary source:
[Chi.Bio](https://doi.org/10.1371/journal.pbio.3000794) (PLOS Biology 2020),
[OpenEvo](https://doi.org/10.64898/2026.07.06.735356) (bioRxiv 2026),
[Pioreactor](https://pioreactor.com) (no methods paper),
[eVOLVER](https://doi.org/10.1038/nbt.4151) (Nature Biotechnology 2018),
[EVE](https://doi.org/10.7554/eLife.83067) (eLife 2022), and the
[Toprak morbidostat](https://doi.org/10.1038/nprot.2013.021) (Nature Protocols 2013).
From there it builds a like-for-like comparison and a set of concrete upgrade paths — the best
instrument to assemble for each purpose by recombining proven subsystems across the field.

## What's here

| Document | What it is |
|---|---|
| [`docs/corrections-and-matrix.md`](docs/corrections-and-matrix.md) | A fair-minded errata of the OpenEvo preprint, plus a like-for-like matrix of six open bioreactor platforms with per-device pros/cons and adoption evidence. **The evidence base.** |
| [`docs/two-instruments.md`](docs/two-instruments.md) | A design proposal: the best characterisation instrument, the best evolution machine, and the argument for sharing a component ecosystem rather than merging into one machine. **The plan.** |
| [`docs/education.md`](docs/education.md) | The educational materials each platform serves — classroom-validated uses, curricula, and a cross-platform concepts ladder. |
| [`docs/datasheet-verification.md`](docs/datasheet-verification.md) | A primary-source pass resolving the open items above: confirms the sensor/impedance/platform specs, corrects four (incl. Pioreactor's hardware licence), and answers the "silicon or firmware?" half of Open Question 1. **The receipts.** |
| [`docs/chibio-upgrades.md`](docs/chibio-upgrades.md) | A platform-modernisation note for Chi.Bio: base-platform upgrades (compute, connectivity, pumps, thermal, software architecture) anchored to the verified BOM/code baseline — including a correction that Chi.Bio *already* ships the AS7341. Complements `two-instruments.md` Part 1 (sensing). |
| [`docs/best-hybrids.md`](docs/best-hybrids.md) | The best instrument to *build* for each purpose by recombining proven subsystems: chassis + grafts per purpose, the Raspberry-Pi compute convergence that makes a shared firmware framework real, and a bill of grafts. **The build.** |
| `docs/*.html` | Rendered, self-contained versions of the same documents (theme-aware, no external assets). |

## Core argument, in one paragraph

Chi.Bio and OpenEvo look like competitors but serve opposite purposes. **Chi.Bio is an
instrument** — it measures a culture richly in situ while holding it in a defined state.
**OpenEvo is an actuator** — it pushes a culture through selection regimes unattended for
weeks. A third purpose, **turnkey scale-out operation**, is best served by Pioreactor and
eVOLVER, neither of which optimises for the first two. The right move is not one merged
machine but two purpose-built instruments sharing a module standard, sensor designs, a
firmware framework, and a calibration reference.

## Platforms compared

Purpose codes: **P1** characterise · **P2** evolve · **P3** scale-out.

| Platform | Purpose | Reference | Working vol. | Cost / unit | Build effort | Maintenance (2026-07) | Best for |
|---|---|---|---|---|---|---|---|
| **Chi.Bio** | P1 | PLOS Biol 2020 | 12–25 mL | ~$300 +PCB | PCB fab | light, no releases | In-situ measurement density |
| **OpenEvo** | P2 | bioRxiv 2026 | ~20 mL | ~$300 | guided manual build | new, low | Cheapest buildable selection cycler |
| **Pioreactor** | P3 | *no paper* | 20 / 40 mL | $329–389 | buy turnkey | **monthly releases** | Turnkey fleet + active ecosystem |
| **eVOLVER** | P3 | Nat Biotech 2018 | ~40 mL | <$2k / 16 | machine shop | dormant since '24 | Max-config research fleet |
| **EVE** | P2 | eLife 2022 | ~12 mL | $115–200 | moderate | frozen '19 | Low-cost evolution + teaching |
| **Toprak morbidostat** | P2 | Nat Protoc 2013 | ~12 mL | mid | bespoke | protocol | Drug-gradient selection |

*Headline attributes only — see [`docs/corrections-and-matrix.md`](docs/corrections-and-matrix.md)
for the full like-for-like matrix across 15 attributes with per-device pros/cons, and
[`docs/best-hybrids.md`](docs/best-hybrids.md) for which to build per purpose. Maintenance =
GitHub release/commit activity; see [`SOURCES.md`](SOURCES.md).*

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
