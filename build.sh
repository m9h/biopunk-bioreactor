#!/usr/bin/env bash
# Build the article and slides with tectonic (no pandoc / system TeX needed).
set -euo pipefail
cd "$(dirname "$0")"
echo "building manuscript..."
tectonic manuscript/biopunk-bioreactor.tex
echo "building slides..."
tectonic slides/biopunk-wetware.tex
echo "building poster..."
tectonic poster/biopunk-poster.tex
echo "done:"
ls -la manuscript/*.pdf slides/*.pdf poster/*.pdf
