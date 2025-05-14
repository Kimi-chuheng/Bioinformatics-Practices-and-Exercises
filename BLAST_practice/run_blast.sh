#!/bin/bash 
# run_blast.sh - Run BLAST and extract the top 10 results

query=$1
db=$2
out="${query%.*}_results.txt"

blastn -query $query -db $db -outfmt "6 qseqid sseqid pident length evalue" -max_target_seqs 10 > $out

echo "BLAST complete, results saved to $out"

