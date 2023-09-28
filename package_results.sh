#!/usr/bin/env bash
set -euxo pipefail

NOW=$(date +"%Y-%m-%d")
ZIPFILE="pe-mrna-diffexp-results-$NOW.zip"

find . -regex ".*report\.zip\|.*multiqc_report\.html" | tar czvf "${ZIPFILE}" --files-from -
