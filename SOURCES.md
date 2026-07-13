# Sources

Every factual claim in this repo should trace to one of these. Confidence is flagged where
a claim was taken from a secondary source or product page rather than a primary document.

## Platform papers

- **Chi.Bio** — Steel H, Habgood R, Kelly CL, Papachristodoulou A. "In situ characterisation
  and manipulation of biological systems with Chi.Bio." *PLoS Biology* 18(7):e3000794 (2020).
  https://doi.org/10.1371/journal.pbio.3000794 — full text read.
  Hardware baseline (verified 2026-07-10 for `docs/chibio-upgrades.md`): tech-specs
  https://chi.bio/tech-specs/ · hardware/BOM package `BOM13.zip` from https://chi.bio/hardware/ ·
  control OS (Flask/Python, `Adafruit_BBIO`) https://github.com/HarrisonSteel/ChiBio. Confirmed
  from BOM + code (not the paper): BeagleBone Black Rev C; micro-USB reactor link; 3 W resistive
  heater, passive cooling; PWM-driven brushed-DC peristaltic pumps; **ams AS7341** spectral
  sensor (`SensorBreakoutAS7341`, I²C 0x39) — already the baseline optical part, not an upgrade;
  650 nm laser diode `ADL65052TL` for OD. Exact seven-colour emitter part/footprint not in the
  fabrication-level BOM (unverified).

- **OpenEvo** — Cocioba SS, Huang P-C, Mallon J, Chan Z, Geremew AW, Bisson A, Kyriakakis P.
  "OpenEvo: An Open-Source Platform for Automated Evolution and Analysis." *bioRxiv*
  2026.07.06.735356 (2026). https://doi.org/10.64898/2026.07.06.735356 — full text read.
  Repo: https://github.com/Binomica-Labs/OpenEVO · Zenodo: https://doi.org/10.5281/zenodo.20694531

- **eVOLVER** — Wong BG, Mancuso CP, Kiriakov S, Bashor CJ, Khalil AS. "Precise, automated
  control of conditions for high-throughput growth of yeast and bacteria with eVOLVER."
  *Nature Biotechnology* 36:614–623 (2018). https://doi.org/10.1038/nbt.4151
  Docs: https://khalil-lab.gitbook.io/evolver — specs (16 vials, 40 mL, <$2k, open) from
  paper + docs + Rice/FynchBio pages.
  Architecture (verified 2026-07-10 from the eVOLVER docs wiki `khalillab/evolver-docs`):
  **Raspberry-Pi server** (`FYNCH-BIO/evolver`) + **Arduino "SmartSleeve" motorboards**
  (`FYNCH-BIO/evolver-arduino`) + a Data Processing Unit (`FYNCH-BIO/dpu`) + an Electron GUI
  (`FYNCH-BIO/evolver-electron`); hardware (PCB, 3D-printed parts) at `FYNCH-BIO/hardware`.
  Note: mature 2018-lineage platform, not the frontier.

- **EVE** — Gopalakrishnan V, et al. "A low-cost, open-source evolutionary bioreactor and its
  educational use." *eLife* 11:e83067 (2022). https://doi.org/10.7554/eLife.83067
  (orig. bioRxiv 729434, 2019). Specs ($115–200, 12 mL, morbidostat/chemostat/turbidostat, open).

- **Toprak morbidostat** — Toprak E, Veres A, Yildiz S, Pedraza JM, Chait R, Paulsson J,
  Kishony R. "Building a morbidostat: an automated continuous-culture device for studying
  bacterial drug resistance under dynamically sustained drug inhibition." *Nature Protocols*
  8:555–567 (2013). https://doi.org/10.1038/nprot.2013.021 — verified 2026-07-10: working
  volume V = **12 mL** (ΔV = 1 mL / 12 min); continuous drug titration; DIY protocol + MATLAB
  control code, not a maintained platform.

- **Pioreactor** — **No peer-reviewed reference paper.** Cite the platform directly:
  Pioreactor / Cameron Davidson-Pilon, https://pioreactor.com. Hardware under **CC BY-SA 4.0**
  (per the `LICENSE` file at https://github.com/Pioreactor/hardware — *not* CERN-OHL, corrected
  2026-07-10) · Software (MIT): https://github.com/Pioreactor/pioreactor
  Price $329–389 and specs (20/40 mL model names, ~15/30 mL working; ~900 nm OD from dev-log;
  leader/worker cluster) from the product site.
  NB: a HardwareX DOI (10.1016/j.ohx.2024.e00565) is sometimes mis-attributed to Pioreactor;
  it is actually Graham et al., a compressive-loading bioreactor — **not** Pioreactor.

## Adoption / third-party use

- **ReacSight** — Bertaux F, et al. "Enhancing bioreactor arrays for automated measurements and
  reactive control with ReacSight." *Nature Communications* 13:3363 (2022).
  https://doi.org/10.1038/s41467-022-31033-9 — verified 2026-07-10: enhances reactor arrays
  (custom or **Chi.Bio**) with automated cytometry + reactive control; three yeast applications.
- **eVOLVER downstream** — Huang TP, Heins ZJ, et al. "High-throughput continuous evolution of
  compact Cas9 variants targeting single-nucleotide-pyrimidine PAMs." *Nature Biotechnology*
  40:1918–1930 (2022). https://doi.org/10.1038/s41587-022-01410-2 — ePACE on eVOLVER (Liu lab ×
  Khalil lab; the Khalil lab originated eVOLVER, so this is lineage adoption, not fully
  third-party). Base-editor evolution: Thuronyi et al., *Nat Biotechnol* 37:1070 (2019),
  https://doi.org/10.1038/s41587-019-0193-0.

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
- OpenEIT / Spectra — Mindseye Biomedical. https://github.com/OpenEIT (hardware `EIT_EE`,
  firmware `EIT_Firmware`; ADuCM350 front end; 8/16/32-electrode Spectra board; `8_electrode_flex`
  dir exists). CC BY-NC-SA 4.0.

## Component datasheets (verified 2026-07-10 — see `docs/datasheet-verification.md`)

- **Hamamatsu C12880MA** mini-spectrometer — datasheet KACC1226E: 340–850 nm, 15 nm max FWHM.
  https://www.hamamatsu.com/eu/en/product/optical-sensors/spectrometers/mini-spectrometer/C12880MA.html
- **ams-OSRAM AS7341** 11-channel spectral sensor — DS000504.
  https://ams-osram.com/products/sensor-solutions/ambient-light-color-spectral-proximity-sensors/ams-as7341-11-channel-spectral-color-sensor
- **IO Rodeo LED boards** — 25.4 × 20 mm, dual JST-SH, 730 nm part available; KiCad open HW.
  https://iorodeo.com/collections/led-boards · https://github.com/iorodeo/i_control_led
- **Red Pitaya STEMlab 125-14** — 125 MS/s, 14-bit, DC–60 MHz; Impedance Analyzer 1 Hz–60 MHz.
  https://redpitaya.readthedocs.io/en/latest/appsFeatures/applications/impedance/impedance.html
- **Analog Devices ADuCM350** — DFT impedance excitation 0.1 Hz–200 kHz; 80 kHz is the
  `HSDACCON` low/high-power register threshold. AN-1271 (impedance conversion), AN-1302 (4-wire
  bioisolated). https://www.analog.com/en/products/aducm350.html
- **Analog Devices AD5933** — 1 MSPS, 12-bit impedance converter, DDS to 100 kHz.
  https://www.analog.com/en/products/ad5933.html
- **β-dispersion / viable-cell-density** — "Universal Capacitance Model for Real-Time Biomass,"
  *Sensors* 15 (2015). https://pmc.ncbi.nlm.nih.gov/articles/PMC4610510/ · yeast f_c ≈ 2.8 MHz;
  commercial probes: Aber Instruments, Hamilton Incyte.

## Project maintenance / activity (GitHub, as of 2026-07-10)

Snapshot behind the matrix "Maintenance" row and the best-hybrids chassis argument. From the
GitHub REST API (repos, releases, commits since 2025-07-01):

- **Pioreactor** `Pioreactor/pioreactor` — pushed 2026-07-10; latest release **v26.6.0**
  (2026-06-29, monthly CalVer); 100+ commits in the past year; maintained org (`docs.pioreactor`,
  many plugins, `hardware`). https://github.com/pioreactor
- **Chi.Bio** `HarrisonSteel/ChiBio` — pushed 2026-02-10; **no releases**; ~2 commits since
  2025-07. Lightly maintained.
- **OpenEvo** `Binomica-Labs/OpenEVO` — pushed 2026-06-17 (firmware 2026-06-04); no releases;
  new (2026), minimal engagement.
- **eVOLVER** `FYNCH-BIO/evolver` — pushed **2024-05-28**; latest release **v2.0.1 (2022-08-31)**;
  **0 commits** since 2025-07. Server repo effectively dormant (`FYNCH-BIO/dpu` pushed 2025-08).
- **EVE** `vishhvaan/eve-pi` — functional; last release **v1.0 (2019)**.

## devo experiment — bloom-control resistance evolution (for `docs/oxidant-morbidostat.md`)

Verified 2026-07-13 (Crossref-confirmed DOIs) behind the oxidant-morbidostat proposal:

- **Copper resistance selection (the proven contrast)** — García-Villada et al., "Occurrence of
  copper-resistant mutants in Microcystis," *Water Research* (2004), doi:10.1016/j.watres.2004.01.036;
  tolerance ceiling, Rouco et al., *Oecologia* (2014), doi:10.1007/s00442-014-2963-1.
- **H₂O₂ efficacy is non-heritable (the gap)** — Schuurmans et al., *Harmful Algae* (2018),
  doi:10.1016/j.hal.2018.07.008; Sandrini et al., *Harmful Algae* (2020), doi:10.1016/j.hal.2020.101916;
  Smith et al., *AEM* (2022), doi:10.1128/aem.02544-21; Weenink et al., *Environ. Microbiol.* (2021),
  doi:10.1111/1462-2920.15429; whole-lake trial, Matthijs et al., *Water Research* (2012),
  doi:10.1016/j.watres.2011.11.016; selectivity window, Weenink et al., *Front. Microbiol.* (2015),
  doi:10.3389/fmicb.2015.00714.
- **Fluctuation-analysis / ratchet method template** — Costas et al. (Microcystis glyphosate),
  *Evol. Ecol.* (2007), doi:10.1007/s10682-006-9134-8.
- **Morbidostat / automated ALE platforms (heterotroph-only)** — Toprak et al., *Nat. Genet.* (2012),
  doi:10.1038/ng.1034; Liu et al., *JoVE* (2016), doi:10.3791/54426; eVOLVER, doi:10.1038/nbt.4151;
  Chi.Bio, doi:10.1371/journal.pbio.3000794. Algal ALE is manual: Zhang et al., *Front. Microbiol.*
  (2021), doi:10.3389/fmicb.2021.737248. Photoinhibistat (concept), Mairet & Bernard, *IFAC-PapersOnLine*
  (2016), doi:10.1016/j.ifacol.2016.07.344.
- **Cyanobacterial ALE is mature** — Tillich et al. (thermotolerance, automated PBR), *BMC Biotechnol.*
  (2014), doi:10.1186/1472-6750-14-66; Yoshikawa et al. (high light), doi:10.1038/s42003-021-01875-y;
  Xu et al. (cadmium), doi:10.1186/s13068-018-1205-x.
- **Fossil-record / revive-and-compete design** — Lenski et al., *Am. Nat.* (1991), doi:10.1086/285289;
  Collins & Bell (Chlamydomonas), *Nature* (2004), doi:10.1038/nature02945; Lohbeck et al. (E. huxleyi),
  *Nat. Geosci.* (2012), doi:10.1038/ngeo1441; Barten et al. (Picochlorum turbidostat, manual archiving),
  *Biotechnol. J.* (2022), doi:10.1002/biot.202100659.
- **DuckBot** — Subbaraman et al., *PLOS ONE* (2024), doi:10.1371/journal.pone.0296717.
  **ALPHA** (salt-tolerance phenotyping, NOT heat/ammonia) — Robinson et al., *Plant Direct* (2025),
  doi:10.1002/pld3.70048. **ΔmcyB pair** — Dittmann et al., *Mol. Microbiol.* (1997),
  doi:10.1046/j.1365-2958.1997.6131982.x.
- **Home / funder** — US HAB-Control Technologies Incubator (NOAA / UMCES-IMET / Mote),
  https://imet.usmd.edu/ushabcti.
- **Not re-verified at page level** (search-only; excluded from the argument): Hennessey 2025
  (10.1016/j.envpol.2025.125691), Piel 2021 (10.3390/microorganisms9071495), the 2026 Synechocystis
  fluctuating-light ALE (10.1038/s41467-026-72689-x).

## Confidence key

- **Read in full this session:** Chi.Bio, OpenEvo.
- **Verified from primary/product source:** Pioreactor specs + licensing (**CC BY-SA 4.0**
  hardware) + no-paper status; eVOLVER and EVE headline specs.
- **Verified against datasheets / primary papers 2026-07-10** (`docs/datasheet-verification.md`):
  C12880MA, AS7341, IO Rodeo, Red Pitaya, ADuCM350, AD5933, OpenEIT Spectra; Toprak morbidostat
  (~12 mL); ReacSight and ePACE adoption.
- **Still not re-verified at page level:** the three ADI PDFs (analog.com timeouts); the
  capacitive-coupling nature of OpenEIT's `8_electrode_flex`; Pioreactor's exact 900 nm OD.
