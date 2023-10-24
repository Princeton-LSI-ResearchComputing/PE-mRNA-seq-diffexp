#!/usr/bin/env bash
set -euxo pipefail

awk -v OFS='\t' '
    NR == 1 { print "\"comparison\"", $0 }
    FNR > 1 { gsub(/^\.\/|results\/diffexp\/|\.diffexp\.tsv$/,"",FILENAME); print FILENAME, $0 }
' ./*"/results/diffexp/"*.diffexp.tsv > "all-comparisons.diffexp.tsv"

NOW=$(date +"%Y-%m-%d")
ARCHIVEFILE="pe-mrna-diffexp-results-$NOW.tar.gz"

find . -regex ".*report\.zip\|.*multiqc_report\.html\|.*all-comparisons\.diffexp\.tsv" | tar czvf "${ARCHIVEFILE}" --files-from -
