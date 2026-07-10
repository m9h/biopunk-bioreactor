# Contributing

This repo is an evidence-based, correction-friendly review of open bioreactor platforms.
The bar for a contribution is simple: **every factual claim must trace to a primary source**,
and every claim carries a confidence level.

## What's wanted

- **Corrections with citations.** If a spec, price, or claim here is wrong, open an issue or PR
  with the primary source (a DOI, datasheet, or the project's own repo). Fixing an error is the
  most valuable contribution.
- **New platforms.** Add a column to the matrix in `docs/corrections-and-matrix.md` and a
  pros/cons card, with a reference in `SOURCES.md`.
- **Adoption evidence.** Peer-reviewed, third-party *use* of any platform — especially
  Pioreactor, which has no methods paper and whose credibility rests on independent use.
- **Educational materials.** Curricula, lesson plans, or classroom-validation reports for any
  platform go in `docs/education.md`.

## Ground rules

- **Markdown is canonical.** Edit the `.md` files; the `.html` renderings and the LaTeX in
  `manuscript/` and `slides/` are generated from the same content — keep them in sync or note in
  the PR that they need regenerating.
- **Label confidence.** Every new claim is either *verified against a primary source* or
  *unverified / from a secondary source*. The docs carry an explicit verified/not-verified split;
  preserve it. Do not launder a product-page number into an asserted fact.
- **Be fair.** Corrections name authors and critique specific claims. Keep the tone an audit, not
  an attack: quote the source text, state the issue, propose the fix.
- **Frontmatter.** Section `.md` files use research-infra frontmatter (`category`, `section`,
  `weight`, `title`, `status`, `slide_summary`) so they assemble into the manuscript and slides.
  Keep it valid — see any existing doc for the schema.

## Building the PDFs

The article and slides build with [tectonic](https://tectonic-typesetting.github.io/) (no
pandoc or system TeX needed):

```bash
./build.sh          # builds manuscript + slides to build/
```

## Licence

By contributing you agree your contributions are licensed under
[CC BY 4.0](https://creativecommons.org/licenses/by/4.0/), matching the repo.
