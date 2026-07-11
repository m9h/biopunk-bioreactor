# Educational materials these platforms serve

Open bioreactors are teaching instruments as much as research tools. Because a single device
spans **microbiology, electronics, firmware, control theory, and data analysis**, it is a rare
piece of lab hardware that a biology class, an engineering class, and a CS class can all use —
and several of these projects were designed for exactly that, with classroom validation and
published curricula.

This document maps each platform to its educational remit and concrete materials, then to the
broader curricula and theory the whole class of device supports.

---

## At a glance

| Platform | Level | Concrete educational materials | Classroom-validated? | Disciplines taught |
|---|---|---|---|---|
| **EVE** | High school → undergrad | eLife *Science Forum* paper *is* the education paper; full build docs | ✓ Yes — real class, *E. coli* + chloramphenicol | Evolution, antibiotic resistance, micro |
| **Pioreactor** | High school → university | Educators portal + live docs (incl. Python scripting), lesson concepts | ✓ Widely, many institutions | Micro, EE, CS, data analysis |
| **OpenEvo** | Undergrad + makers | Illustrated assembly manual as teaching artifact; global hackathon | ✓ Undergrad build; TurBioHackathon 2025 | Maker skills, evolution, firmware |
| **Chi.Bio** | Late-HS → grad | "Core features as a stand-alone teaching platform"; observe fluorescence by eye | ~ Stated remit; used in courses | Synthetic biology, measurement, control |
| **eVOLVER** | Advanced undergrad → grad | Research-grade; used in advanced courses | ~ Course use, not education-first | Continuous culture, automation |
| **Toprak morbidostat** | Grad / concept | The *concept* (morbidostat) is taught; device is a research protocol | ✗ Not education-oriented | Drug-resistance evolution theory |

*✓ validated / documented · ~ stated or partial · ✗ not a teaching focus.*

---

## Per platform

### EVE — the education-first device

EVE's eLife paper is literally titled *"A low-cost, open-source evolutionary bioreactor **and its
educational use**."* It is a morbidostat buildable for **under $200** by students with minimal
engineering or programming experience, and it was **validated in a real classroom**: students
evolved replicate *E. coli* populations under chloramphenicol challenge and observed antibiotic
resistance arise. It is explicitly pitched for high-school and undergraduate teaching of
evolution and microbial population dynamics. If your goal is *teaching evolution with a
bioreactor*, this is the reference design and the reference curriculum.
(Gopalakrishnan et al., *eLife* 2022; Jacob Scott lab.)

**Live materials:** paper [elifesciences.org/articles/83067](https://elifesciences.org/articles/83067) ·
build repo [github.com/vishhvaan/eve-pi](https://github.com/vishhvaan/eve-pi) (STLs + KiCad;
note the repo is frozen at its 2019 v1.0 release — functional, not actively refreshed) ·
teaching write-up [mathematical-oncology.org/blog/eve.html](https://mathematical-oncology.org/blog/eve.html).

### Pioreactor — the productised classroom platform

Pioreactor maintains a dedicated **educators portal** and positions the device for classrooms
from high school through university. Its cross-disciplinary reach is the selling point: one
device teaches **optical density via light scattering, turbidostat/chemostat principles,
mixing and aeration, microbial growth phases, fermentation, antibiotic resistance, and
evolution**, and simultaneously exposes students to the **electronics and computing** that run
it. A typical lab: students prepare varying media, run the fleet for a few days, export
growth-rate datasets, and correlate media composition with growth curves. Because it ships
turnkey under ~$300 against $5k–50k commercial reactors, it reaches high schools, community
colleges, and lower-resource settings.

**Live materials:** educators portal
[pioreactor.com/pages/science-educators-use-the-pioreactor-to-show-their-students-hands-on-biology](https://pioreactor.com/pages/science-educators-use-the-pioreactor-to-show-their-students-hands-on-biology)
(documents classroom experiments: yeast growth vs temperature, osmotic pressure, directed
evolution of salt-tolerant yeast) · docs [docs.pioreactor.com](https://docs.pioreactor.com/),
including a hands-on [intro to Python scripting](https://docs.pioreactor.com/user-guide/intro-python-scripting)
for the CS/automation angle · community [forum.pioreactor.com](https://forum.pioreactor.com/).
This is the most actively maintained resource set of any platform here (see the maintenance row
in [`corrections-and-matrix.md`](corrections-and-matrix.md)). *(An ASM/CSM 2025 workshop was
previously cited but no live official page could be found; dropped pending a source.)*

### OpenEvo — the manual *is* the curriculum

OpenEvo was designed as a teaching tool for becoming a **"maker"** across 3D printing,
electronics, and firmware/software. Its central pedagogical artifact is the **illustrated
assembly manual**, whose completeness was validated by having an undergraduate with no prior
electronics experience build a working unit, then fixing every step where they got stuck — so
the manual doubles as a build-it-yourself course. It also anchored the international
**TurBioHackathon (TurBiohacks 2025)**, where students worldwide (including from Nepal)
remotely controlled an OpenEvo running in California — a vivid demonstration of remote,
distributed lab access. (Cocioba et al., bioRxiv 2026.)

**Live materials:** repo [github.com/Binomica-Labs/OpenEVO](https://github.com/Binomica-Labs/OpenEVO)
(actively updated — latest release June 2026) · assembly manual, stable archive
[Zenodo 10.5281/zenodo.20694532](https://doi.org/10.5281/zenodo.20694532) ·
[turbiohacks.vercel.app](https://turbiohacks.vercel.app/) (Sept 5–7 2025). *Caveat: the
OpenEvo↔TurBiohacks link is stated in the OpenEvo preprint, but neither the repo nor the
hackathon site states it — treat the association as the preprint's claim, not independently
established.*

### Chi.Bio — the instrument you can see through

Chi.Bio's own documentation states it is "very easy to set up and use, making it suitable for
teaching at graduate, undergraduate, and late high-school levels," and that its **core features
(heating, stirring, spectrometry) can be used as a stand-alone low-cost measurement platform**
so students can *watch* how measurements are taken — removing the lid and observing
fluorescence by eye. It is the natural wet-lab complement to a synthetic-biology / genetic-
circuits course (see below). (Steel et al., PLOS Biol 2020, S1 supplement.)

**Live materials:** [chi.bio/getting-started](https://chi.bio/getting-started/) — the User Area
(Getting Started, Hardware, Software, Operation, FAQ, Forum). The site is live; note it carries
no post-2019 date signal and the software repo is only lightly maintained.

### eVOLVER & the Toprak morbidostat — research-grade, teaching-adjacent

eVOLVER is powerful enough for advanced coursework and student research projects, but it is
configurability-first, not education-first — the build needs a machine shop. The Toprak
morbidostat contributes a *concept* every evolution course teaches — titrating a drug to hold
constant growth inhibition — more than a classroom-ready device.

**Live materials (eVOLVER):** the JoVE visual protocol
[*Designing Automated, High-throughput, Continuous Cell Growth Experiments Using eVOLVER*](https://www.jove.com/t/59652/designing-automated-high-throughput-continuous-cell-growth)
(2019) is the closest thing to a teaching protocol · docs wiki
[khalil-lab.gitbook.io/evolver](https://khalil-lab.gitbook.io/evolver) (maintained) · community
[evolver.bio](https://www.evolver.bio/) forum. Caveat: the eVOLVER *device* repos are largely
dormant (server last released 2022) — the community/docs, not the code, are what's current.
**Morbidostat:** the concept's origin is the Nature Protocols paper
([doi:10.1038/nprot.2013.021](https://doi.org/10.1038/nprot.2013.021)); its education-ready
descendant is EVE.

---

## The concepts ladder — what you can actually teach

These platforms let a curriculum climb from first principles to research methodology on one
bench:

1. **Measurement.** Optical density as light scattering; calibration against a spectrophotometer;
   why OD is a proxy, not a cell count; nonlinearity at high density.
2. **Control.** Feedback loops; turbidostat (fix density) vs chemostat (fix dilution) vs
   morbidostat (fix inhibition); PID and model-predictive control (Chi.Bio).
3. **Growth.** Lag/exponential/stationary phases; growth rate vs doubling time (the exact
   distinction OpenEvo's paper muddles — a teachable error); carrying capacity.
4. **Selection & evolution.** Directed vs adaptive laboratory evolution; fitness; the reason
   replicates and archiving are non-negotiable (LTEE); growth-coupling.
5. **Making.** 3D printing, soldering, wiring, firmware, and data pipelines — real engineering
   skills carried by the same device (OpenEvo, Pioreactor).

---

## The curricula and theory these instruments serve

- **Synthetic biology / genetic circuits.** CU Boulder's *Engineering Genetic Circuits*
  Coursera specialization (Chris Myers; SBML/SBOL, iBioSim) teaches the design-and-modelling
  theory — [coursera.org/specializations/engineering-genetic-circuits](https://www.coursera.org/specializations/engineering-genetic-circuits)
  (live, active session). Chi.Bio is the wet-lab counterpart — its resource-competition and
  multi-fluorophore experiments are exactly where a naive parts-composition model leaks.
- **Experimental & adaptive laboratory evolution.** The **LTEE** ([the-ltee.org](https://the-ltee.org/))
  is the pedagogical touchstone — 38 years, twelve populations, a frozen fossil record — and
  Barrick's teaching materials formalise the method, notably the JoVE daily-transfer protocol
  [*Daily Transfers, Archiving Populations, and Measuring Fitness…*](https://www.jove.com/t/65342/daily-transfers-archiving-populations-measuring-fitness-long-term)
  (2023). EVE and OpenEvo bring that method into a single class period. Review anchor: Sandberg
  et al., *Metab Eng* 2019.
- **Cross-disciplinary maker education.** The devices double as project platforms for
  electronics, embedded firmware, control theory, and reproducible data analysis — a genuinely
  rare convergence in a single low-cost instrument.

---

## Gaps and opportunities (for contributors)

- **No shared cross-platform curriculum exists.** Each project documents its own device; nobody
  has written the device-agnostic course that teaches the *concepts ladder* above and lets an
  instructor pick whichever reactor they own.
- **Under-taught concepts:** archiving and ancestor-vs-descendant fitness competition (the
  LTEE's real lesson), replicate-based causal inference, and carrying capacity via batch
  excursion — precisely the methodological gaps flagged in
  [`corrections-and-matrix.md`](corrections-and-matrix.md). The teaching materials inherit the
  research blind spots.
- **A "growth rate vs doubling time" lesson** almost writes itself from OpenEvo's own 55%/36%
  slip — a real, citable teachable moment.

---

*Live links verified 2026-07-10: every URL above returns current content — Pioreactor educators
portal + docs + forum (site © 2026); eVOLVER JoVE #59652, gitbook wiki, evolver.bio; EVE eLife
83067 + eve-pi repo (frozen at 2019) + math-onco blog; OpenEvo repo (2026) + Zenodo manual +
turbiohacks.vercel.app; Chi.Bio getting-started; LTEE the-ltee.org + Barrick JoVE #65342; CU
Boulder Coursera specialization (active). Two prior claims corrected against the audit: the
Pioreactor "CSM 2025 workshop" (no live page found — dropped) and the OpenEvo↔TurBiohacks link
(stated only in the OpenEvo preprint, not on either site — attributed accordingly). See
[`../SOURCES.md`](../SOURCES.md).*
