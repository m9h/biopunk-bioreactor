# Chi.Bio — Platform-Modernisation Upgrades

*Design note — low-hanging modernisation of a well-engineered platform. 2026-07-10.*
*Baseline verified against Steel et al. 2020 (PLOS Biol 18:e3000794), [chi.bio/tech-specs](https://chi.bio/tech-specs/),
the `BOM13` hardware package, and the [ChiBio OS repo](https://github.com/HarrisonSteel/ChiBio).*

Chi.Bio is an exceptionally well-engineered open framework, and its architecture is still the
right one for in-situ characterisation. But it froze a set of hardware choices in 2018–2020,
and several have since been overtaken by cheaper, faster, or more available parts. This note
lists the modernisation upgrades — the *base platform*: compute, connectivity, actuation,
thermal range, and software architecture — with each proposal anchored to what Chi.Bio
**actually ships today**, verified from the paper, the tech-specs page, the BOM, and the
control code.

**Scope, and the one thing to read first.** The companion [`two-instruments.md`](two-instruments.md)
Part 1 already covers new *sensing modalities* for Chi.Bio (DO/pH optodes, dispersive
spectrometry, controlled atmosphere). This note is the orthogonal axis — modernising the base
platform, not the measurement core — and it **defers to Part 1 on optics**. It also corrects
one common misconception up front: **Chi.Bio already uses the ams AS7341 11-channel spectral
sensor** (BOM board `SensorBreakoutAS7341`; the OS instantiates `AS7341` at I²C `0x39`,
reading eight bands plus Clear/NIR). "Upgrade the spectrometer to an AS7341" is therefore not
an upgrade — it is the current part. See §4 for what a real optical upgrade would be.

---

## The verified baseline — what Chi.Bio actually ships

| Subsystem | Current part / design | Source |
|---|---|---|
| Control computer | **BeagleBone Black Rev C** — single-core AM335x Cortex-A8 @1 GHz, 10/100 Ethernet, **no onboard WiFi** | tech-specs + BOM (`BBB01-SC-505`) + code (`Adafruit_BBIO`) |
| Reactor ↔ computer link | **micro-USB** (data); reactor powered separately by a 12 V 3 A supply, not bus-powered | paper + tech-specs + BOM |
| Heating / thermal | **resistive PCB heat-plate**, 3 W, up to 2.0 °C·min⁻¹; **heat-only, passive cooling** (no active/Peltier) | paper + tech-specs + BOM (`Heater3`) |
| Pumps | up to 4× **brushed-DC peristaltic**, speed by **PWM duty-cycle**, direction by H-bridge, ≤1 mL·s⁻¹ | paper + BOM + code (PWM at 0x60/0x61) |
| Spectral sensor | **ams AS7341** — 11-channel (8 spectral + Clear + NIR + flicker); Chi.Bio reads 8 bands + Clear | BOM (`SensorBreakoutAS7341`) + code (0x39) |
| Excitation source | one **multi-die "seven-colour" emitter** behind focusing optics + a 650 nm laser diode (OD) + a UV LED | paper + tech-specs + BOM (`ADL65052TL`) |
| Software | **Python / Flask** backend + HTML/JS web UI; **native** BeagleBone install (no Docker); no formal REST/MQTT API | paper + tech-specs + code (`app.py`) |

*The paper does not name the AS7341, the SBC model, or the emitter part; those are BOM- and
code-verified, not paper-verified — flagged per the repo's no-laundering rule.*

---

## Upgrades, by subsystem

Each carries an honest **effort** rating, because "low-hanging fruit" is not uniform: some are
drop-in, and the highest-impact one (the SBC) is a genuine re-architecture.

### 1. Control computer & connectivity — highest impact, *not* lowest effort

- **BeagleBone Black → Raspberry Pi (Zero 2 W, 4, or 5).** The BBB is single-core with no
  onboard wireless; a Pi Zero 2 W is quad-core with WiFi + BT, and Pi 4/5 add substantial
  compute for logging, deconvolution, and web-UI responsiveness. Broader supply and community
  too. **Effort: high.** Chi.Bio's I/O layer is BeagleBone-specific (`Adafruit_BBIO`, the
  PRU/PWM/GPIO mapping, and the cape/HAT form factor). A Pi port means rewriting the hardware
  abstraction layer and respinning the interface board — the biggest single change here, worth
  it but not a swap. **Verdict: adopt, budget for a HAL rewrite.**
- **micro-USB → USB-C on the reactor link.** micro-USB ports are the classic mechanical failure
  point under lab handling; USB-C is more durable and unlocks better power-delivery options.
  **Effort: low** (connector + cable change; the link is data-only, power is already separate).
  **Verdict: adopt.**

### 2. Liquid handling & pumping

- **Brushed-DC peristaltic → stepper-driven peristaltic.** Chi.Bio meters low flow by
  PWM-duty-cycling brushed-DC pumps, which pulses the flow. Stepper heads give smooth,
  pulsation-free micro-metering of media and inducers, and open-loop-repeatable volume per step.
  **Effort: medium** (new drivers + firmware; more $ per channel). **Verdict: adopt where
  metering precision matters; keep DC for coarse waste.**
- **Brushed → brushless DC (if staying DC).** Brushless motors remove the brush-wear failure
  mode that kills pumps mid-run on multi-week cultures. **Effort: low–medium.** **Verdict:
  adopt for longevity.**

### 3. Thermal management

- **Resistive heater → Peltier (thermoelectric) module.** Chi.Bio's 3 W resistive plate with
  passive cooling can only hold *above* ambient. A Peltier heats *and* actively cools, enabling
  psychrophilic organisms and precise cold-shock / cold-inducible optogenetic protocols.
  **Effort: medium** (Peltier + heatsink/fan + H-bridge driver + more power budget; watch
  condensation on the optical path). **Verdict: adopt for a "±ambient" variant; a real
  capability gain, not just a spec bump.**

### 4. Optics — read the correction first

- **The premise correction.** Chi.Bio **already has** the AS7341 (11 channels). So "upgrade the
  8-band array to an AS7341" is a no-op. Two real options exist:
  - *In-family:* **AS7341 → ams AS7343 (14-channel).** Near-drop-in (same vendor/interface
    class), a few more bands for marginally cleaner GFP/YFP/mCherry deconvolution. **Effort:
    low; payoff: modest.**
  - *Step-change:* a **dispersive micro-spectrometer (Hamamatsu C12880MA)** replaces fixed
    filter bands with a continuous 340–850 nm spectrum. This is the higher-value optical
    upgrade and is already specced in [`two-instruments.md`](two-instruments.md) Part 1 —
    defer there. **Effort: high; payoff: large.**
- **Discrete, standard-footprint excitation LEDs.** Chi.Bio's excitation is one multi-die
  seven-colour emitter behind focusing optics — powerful, but *not* a set of swappable discrete
  LEDs. Re-laying the optical PCB with discrete **Star/MCPCB or 3535** footprints would let
  users populate their own excitation wavelengths (e.g. a specific optogenetic driver line) from
  off-the-shelf parts. **Effort: high** — it trades the integrated emitter's focusing and
  co-alignment for modularity, so it is a redesign, not a swap. **Verdict: worthwhile for an
  optogenetics-focused variant; know the trade.**

### 5. Software & integration architecture

- **Containerise the backend (Docker).** Chi.Bio installs natively on the BeagleBone via shell
  scripts, with no Dockerfile; Python-dependency drift is a real setup pain. A container makes
  install one command and pins the stack. **Effort: low–medium** (note the current armv7/32-bit
  target; a Pi move in §1 eases this). **Verdict: adopt.**
- **Add a REST or MQTT layer.** The Flask UI exposes JSON endpoints for its own front-end but no
  documented external API; automation today means editing the Python app. A small REST/MQTT
  surface makes Chi.Bio composable with cloud-lab schedulers and liquid-handling robots
  (Opentrons, etc.). **Effort: medium.** **Verdict: adopt — the single biggest integration win.**

---

## Effort vs. impact, at a glance

| Upgrade | Impact | Effort | Verdict |
|---|---|---|---|
| micro-USB → USB-C | Low–med | **Low** | Adopt |
| Brushless DC pumps | Med (reliability) | Low–med | Adopt |
| Docker packaging | Med | Low–med | Adopt |
| AS7341 → AS7343 | Low | **Low** | Optional |
| REST / MQTT API | **High** (integration) | Med | Adopt |
| Stepper pumps | Med–high (precision) | Med | Adopt selectively |
| Peltier heat+cool | **High** (new regimes) | Med | Adopt (variant) |
| BeagleBone → Raspberry Pi | **High** (compute + WiFi) | **High** | Adopt, budget HAL rewrite |
| Discrete LED footprints | Med (customisation) | High | Variant only |
| Dispersive spectrometer | High (see Part 1) | High | Defer to `two-instruments.md` |

---

## Already present — do *not* propose these as upgrades

Verified against the BOM and control code, so an "upgrade" list should not include them:

- **ams AS7341 11-channel spectral sensor** — already the baseline optical part.
- **Independent per-pump speed control** — already done via PWM (the issue is pulsation, not
  lack of control).
- **Per-colour excitation control** — the seven-colour emitter already drives each band
  independently.
- **Python + web UI** — already the stack; the gap is packaging and an external API, not the UI.

---

## Confidence & unverified

- **Paper-verified:** heater rate (2.0 °C·min⁻¹), PWM pump drive, seven-colour emitter, the
  Python/web-UI stack.
- **BOM/site/code-verified (not in the paper):** BeagleBone Black Rev C; micro-USB link; 3 W
  heater; AS7341 identity; native-install / no-Docker / no-API status.
- **Not verified from a primary source:** the exact manufacturer part/footprint of the
  seven-colour emitter is not in the fabrication-level `BOM13` package (a 7-die visible+white
  emitter is *consistent with* an LED Engin LZ7-series part, but treat that as inference until
  the full schematic confirms it). The BeagleBone's single-core / no-WiFi detail is from the
  SBC's own datasheet, not a Chi.Bio document.

*Sources in [`../SOURCES.md`](../SOURCES.md). This is a design note, not an endorsement of any
specific part number; confirm against the current Chi.Bio BOM before ordering.*
