#!/bin/bash

QUERY=$1
BASE=$(basename "$QUERY" .fasta)
PFAM_DB="//home/cxnnd/Bio_learning/bioinfo_tools_stage2/pfam_db/Pfam-A.hmm"   

mkdir -p results/${BASE}
echo "=== Scanning query against Pfam domains with hmmscan ==="
hmmscan --tblout results/${BASE}/${BASE}_pfam.tbl "$PFAM_DB" "$QUERY" > results/${BASE}/${BASE}_pfam.out

echo "=== Extracting Top 5 domain hits ==="
grep -v "^#" results/${BASE}/${BASE}_pfam.tbl | sort -k5,5g | head -n 5 > results/${BASE}/${BASE}_top5_domains.txt

