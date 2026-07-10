# Sources

Every factual claim in this repo should trace to one of these. Confidence is flagged where
a claim was taken from a secondary source or product page rather than a primary document.

## Platform papers

- **Chi.Bio** — Steel H, Habgood R, Kelly CL, Papachristodoulou A. "In situ characterisation
  and manipulation of biological systems with Chi.Bio." *PLoS Biology* 18(7):e3000794 (2020).
  https://doi.org/10.1371/journal.pbio.3000794 — full text read.

- **OpenEvo** — Cocioba SS, Huang P-C, Mallon J, Chan Z, Geremew AW, Bisson A, Kyriakakis P.
  "OpenEvo: An Open-Source Platform for Automated Evolution and Analysis." *bioRxiv*
  2026.07.06.735356 (2026). https://doi.org/10.64898/2026.07.06.735356 — full text read.
  Repo: https://github.com/Binomica-Labs/OpenEVO · Zenodo: https://doi.org/10.5281/zenodo.20694531

- **eVOLVER** — Wong BG, Mancuso CP, Kiriakov S, Bashor CJ, Khalil AS. "Precise, automated
  control of conditions for high-throughput growth of yeast and bacteria with eVOLVER."
  *Nature Biotechnology* 36:614–623 (2018). https://doi.org/10.1038/nbt.4151
  Docs: https://khalil-lab.gitbook.io/evolver — specs (16 vials, 40 mL, <$2k, open) from
  paper + docs + Rice/FynchBio pages.

- **EVE** — Gopalakrishnan V, et al. "A low-cost, open-source evolutionary bioreactor and its
  educational use." *eLife* 11:e83067 (2022). https://doi.org/10.7554/eLife.83067
  (orig. bioRxiv 729434, 2019). Specs ($115–200, 12 mL, morbidostat/chemostat/turbidostat, open).

- **Toprak morbidostat** — Toprak E, Veres A, Yildiz S, Pedraza JM, Chait R, Paulsson J,
  Kishony R. "Building a morbidostat: an automated continuous-culture device for studying
  bacterial drug resistance under dynamically sustained drug inhibition." *Nature Protocols*
  8:555–567 (2013). https://doi.org/10.1038/nprot.2013.021 — from prior literature; not
  re-verified this session.

- **Pioreactor** — **No peer-reviewed reference paper.** Cite the platform directly:
  Pioreactor / Cameron Davidson-Pilon, https://pioreactor.com. Hardware under CERN-OHL:
  https://github.com/Pioreactor/hardware · Software (MIT): https://github.com/Pioreactor/pioreactor
  Price $329–389 and specs (20/40 mL, 900 nm OD, leader/worker cluster) from the product site.
  NB: a HardwareX DOI (10.1016/j.ohx.2024.e00565) is sometimes mis-attributed to Pioreactor;
  it is actually Graham et al., a compressive-loading bioreactor — **not** Pioreactor.

## Adoption / third-party use

- **ReacSight** — "Enhancing bioreactor arrays for automated measurements and reactive
  control with ReacSight." *Nature Communications* (2022). https://doi.org/10.1038/s41467-022-31033-9
  — integrates Chi.Bio-class arrays. Adoption specific claims not re-verified this session.
- **eVOLVER downstream** — continuous base-editor evolution and mammalian long-term evolution
  on the eVOLVER/ePACE lineage (multiple groups). Specifics not re-verified this session.

## Supporting context (LTEE, ALE, sensing)

- Barrick JE, et al. "Daily Transfers, Archiving Populations, and Measuring Fitness in the
  LTEE with *E. coli*." *J Vis Exp* (2023). https://doi.org/10.3791/65342
- Blount ZD, Barrick JE, Davidson CJ, Lenski RE. "Genomic analysis of a key innovation…"
  *Nature* 489:513–518 (2012). https://doi.org/10.1038/nature11514
- Sandberg TE, Salazar MJ, Weng LL, Palsson BO, Feist AM. "The emergence of adaptive
  laboratory evolution…" *Metabolic Engineering* 56:1–16 (2019).
  https://doi.org/10.1016/j.ymben.2019.08.004
- `breseq` — Deatherage DE, Barrick JE. *Methods Mol Biol* 1151:165–188 (2014).
  https://doi.org/10.1007/978-1-4939-0554-6_12
- OpenEIT / Spectra — Mindseye Biomedical. https://github.com/OpenEIT ·
  ADuCM350 impedance excitation range per Analog Devices AN-1271 / AN-1302 (not re-verified).

## Confidence key

- **Read in full this session:** Chi.Bio, OpenEvo.
- **Verified from primary/product source this session:** Pioreactor specs + licensing +
  no-paper status; eVOLVER and EVE headline specs.
- **From prior literature, not re-verified this session:** Toprak morbidostat; ReacSight and
  ePACE adoption specifics; sensing-chip register details.
