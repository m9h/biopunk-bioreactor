# Datasheet Verification Pass

*Technical note — a datasheet-and-primary-source audit. 2026-07-10.*
*Subject: the open items the companion documents flagged as not-verified-this-session.*

The two companion documents end with an explicit **verified / not-verified-this-session**
split, and the README names the specs still needing a datasheet pass: the OpenEIT Spectra
frequency ceiling, the AD5933 / ADuCM350 register details, the C12880MA range, Red Pitaya
limits, eVOLVER cost, and the Toprak morbidostat / Pioreactor specifics. This note closes
that gap. Each row below traces to a manufacturer datasheet, a repository `LICENSE` file, or
a primary paper — URLs in [`../SOURCES.md`](../SOURCES.md).

It does three things: confirms the specs that held, **corrects four that did not** (one of them
central to this repo's own argument), and resolves the load-bearing half of Open Question 1.

---

## 1. Confirmed against primary sources

| Claim in this repo | Verified value | Primary source | Verdict |
|---|---|---|---|
| C12880MA range 340–850 nm | 340–850 nm; **15 nm max** FWHM; 288-pixel continuous readout | Hamamatsu KACC1226E datasheet | ✓ Confirmed |
| AS7341 multi-channel visible sensing | 11 channels (8 VIS + NIR + clear + flicker); 6 parallel ADCs | ams-OSRAM DS000504 | ✓ Confirmed |
| IO Rodeo module footprint, 730 nm part | 25.4 × 20 × 1.6 mm board, dual 4-pin JST-SH; 730 nm board exists | iorodeo.com product pages + KiCad repo | ✓ Confirmed |
| Red Pitaya as impedance analyzer | STEMlab 125-14: 125 MS/s, 14-bit, DC–60 MHz; Impedance Analyzer app sweeps 1 Hz–60 MHz | redpitaya.readthedocs.io | ✓ Confirmed |
| ADuCM350 DFT excitation to 200 kHz | 0.1 Hz–200 kHz, ±0.3° phase; 16-bit / 160 kSPS front end | ADI ADuCM350 datasheet + AN-1271 | ✓ Confirmed |
| AN-1302 covers 4-wire bioisolated | "Optimizing the ADuCM350 for 4-Wire, Bioisolated Impedance Measurement Applications" | ADI AN-1302 | ✓ Confirmed |
| AD5933 internal oscillator max ~100 kHz | 1 MSPS, 12-bit; DDS excitation 0.1 Hz–100 kHz | ADI AD5933 Rev. F datasheet | ✓ Confirmed |
| OpenEIT Spectra: ADuCM350, 8/16/32 electrodes | Spectra 2″ board, 8/16/32-electrode configurable; ADuCM350 front end; `8_electrode_flex` dir exists | github.com/OpenEIT/EIT_EE | ✓ Confirmed |
| 8-electrode board not tetrapolar | Correct — original 8-electrode board single-ended; tetrapolar is a later Spectra/firmware addition | EIT_EE + EIT_Firmware READMEs | ✓ Confirmed |
| eVOLVER: 16 vials, ~40 mL, open, <$2k | 16 chambers, 40 mL vials, open HW+SW; **<$2k is the prototype build cost** | Wong et al. 2018 + Khalil-lab docs + JoVE 59652 | ✓ Confirmed (see note) |
| ReacSight integrates Chi.Bio-class arrays | Enhances reactor arrays (custom **or Chi.Bio**) with cytometry + reactive control | Bertaux et al., Nat Commun 2022 | ✓ Confirmed |
| eVOLVER downstream directed evolution | ePACE on eVOLVER evolved compact Nme2Cas9 variants | Huang, Heins et al., Nat Biotechnol 2022 | ✓ Confirmed (see note) |
| Toprak morbidostat: titration, protocol not platform | Continuous drug titration to constant inhibition; DIY build protocol + MATLAB code | Toprak et al., Nat Protocols 2013 | ✓ Confirmed |
| Pioreactor: MIT software, cluster, no paper | Software MIT; leader/worker cluster; $329–389; no peer-reviewed methods paper | Pioreactor GitHub + docs | ✓ Confirmed |
| HardwareX 10.1016/j.ohx.2024.e00565 ≠ Pioreactor | Graham et al., "compressive loading and perfusion flow bioreactor" | Crossref | ✓ Confirmed |

**Notes.**
- **C12880MA FWHM.** The datasheet guarantees **15 nm max** only. The "12 nm typical" figure
  circulating on reseller pages is *not* a Hamamatsu spec — cite 15 nm max.
- **eVOLVER cost.** "<$2k" is the *prototype build* cost the authors report, not a commercial
  price; FynchBio units cost more. The DIY figure is accurate for a from-parts build.
- **ePACE.** The clearest downstream example (Nme2Cas9, [doi:10.1038/s41587-022-01410-2](https://doi.org/10.1038/s41587-022-01410-2))
  is a Liu-lab × Khalil-lab collaboration. So it demonstrates eVOLVER's adoption for continuous
  directed evolution, but "a group *entirely independent* of the originators" overstates it for
  this specific paper — the Khalil lab (eVOLVER's originator) is a co-author.

---

## 2. Corrections — specs this repo got wrong

### C-1 — Pioreactor hardware licence · *High* · fixed in place

This repo's own **Error 2** rebuts OpenEvo's claim that only Pioreactor's *software* is open,
citing the "CERN Open Hardware Licence" as evidence. The rebuttal is correct — the hardware is
open — but the licence name is wrong. The `LICENSE` file in `Pioreactor/hardware` reads:

> Hardware © 2024 by Pioreactor Inc. is licensed under **CC BY-SA 4.0**.

**Fix (applied):** CERN-OHL → **CC BY-SA 4.0** in `corrections-and-matrix.{md,html}` (Error 2,
matrix, pros/cons, footer), `two-instruments.{md,html}` (matrix + footnote), and `SOURCES.md`.
The substance of Error 2 is unchanged: Pioreactor hardware *is* openly licensed, so OpenEvo's
dismissal still fails — a document that audits another's licence claim should carry the right
licence name itself. Source: <https://github.com/Pioreactor/hardware> `LICENSE`.

### C-2 — Toprak morbidostat working volume · *Low* · fixed in place

The matrix lists the morbidostat working volume as ~10 mL. The protocol specifies **V = 12 mL**
(ΔV = 1 mL every Δt = 12 min). **Fix (applied):** ~10 mL → **~12 mL** in the matrix (both
formats). Source: Toprak et al., *Nat Protocols* 8:555–567 (2013).

### C-3 — Yeast β-dispersion characteristic frequency · *Low* · fixed in place

Open Question 1 puts the yeast β-dispersion characteristic frequency at f_c ≈ 1–2 MHz. The
commonly cited value for *S. cerevisiae* is **≈2.8 MHz**, with **2 MHz the default manufacturer
setting** on commercial capacitance biomass probes (Aber, Hamilton Incyte). **Fix (applied):**
"1–2 MHz" → **"~2–3 MHz"**. This does not change Q1's logic — the point is that the β-dispersion
foot sits well above Spectra's excitation band — it makes the gap slightly *wider*. Source:
"Universal Capacitance Model for Real-Time Biomass," *Sensors* 15 (2015).

### C-4 — "Module footprint standard" wording · *Low* · noted, not rewritten

`two-instruments.md` proposes adopting "IO Rodeo's 25.4 × 20 mm / dual-JST-SH standard." IO
Rodeo ships a *consistent* board dimension across its LED line, but publishes no formal named
footprint-standard document. The proposal (adopt it *as* the ecosystem standard) reads fine; a
reader should just not infer that IO Rodeo already publishes one. Left as written.

Two more nuances that are naming conventions rather than errors, so left in place: Pioreactor's
"20 / 40 mL" are model/total-capacity names — the *working* volumes are ~15 / 30 mL; and
Pioreactor's ~900 nm OD wavelength is stated in its dev-log/blog but not on a fetched spec page,
so it stays Medium-confidence.

---

## 3. Open Question 1, half resolved

Q1 asked whether Spectra's 80 kHz ceiling is **silicon or firmware**. The primary sources
answer the *what*: it is **firmware/configuration, not silicon**.

- The ADuCM350's DFT impedance engine is specified to **0.1 Hz–200 kHz** (±0.3° phase). The
  silicon does not stop at 80 kHz.
- **80 kHz is the `HSDACCON` low-power ↔ high-power reconfiguration threshold** — set bits
  [8:1] to `0x1B` (low-power) for ≤ 80 kHz, `0x7` (high-power) above it, per AN-1271 and the
  ADI impedance-measurement FAQ. It is a register setting, not a DAC breakpoint.

So the headroom to 200 kHz exists in principle. What remains genuinely open for Jean Rintoul is
the *why* — whether Spectra's firmware exposes high-power mode, and what degrades first (SNR,
DFT settling, DAC flatness) when pushed toward 200 kHz. Q1's other two parts (true tetrapolar
drive on the 32-electrode board; imaging a tube rather than a thorax) are unchanged.

---

## 4. Still not verified this session

Kept honest, in the repo's own discipline:

- **ADI PDFs at page-level.** analog.com's PDF host timed out repeatedly. The ADuCM350 200 kHz
  spec, the AN-1271/AN-1302 titles, and the 80 kHz `HSDACCON` detail were taken from ADI
  landing pages and the ADI EngineerZone FAQ. Re-pull the three PDFs for page-number provenance
  before quoting them in a grant or paper.
- **`8_electrode_flex` coupling.** The directory exists in `EIT_EE`, but its README does not
  state the flex board is *capacitively coupled*. This repo's Risks section asserts capacitive
  coupling as a design idea — treat "the OpenEIT flex board is capacitively coupled" as an
  inference, not a documented fact, until a schematic confirms it.
- **Pioreactor 900 nm OD.** Supported by Pioreactor's dev-log but not a fetched spec page.

---

*Verified this session against primary sources: all rows in §1 and the corrections in §2, at
the confidence noted. Not re-verified at page level: the three ADI PDFs in §4. See
[`../SOURCES.md`](../SOURCES.md) for URLs.*
