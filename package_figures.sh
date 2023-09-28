#!/usr/bin/env bash
set -euxo pipefail

NOW=$(date +"%Y-%m-%d")
ZIPFILE="pe-mrna-diffexp-figures-$NOW.zip"

zip -r "${ZIPFILE}" "HEK3_1TtoA/figures/" "PRNP_6GtoT/figures/" "venn-diagrams/" "mrna-seq-venn-diag.html"
