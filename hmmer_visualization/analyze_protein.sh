#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Please provide two arguments: the FASTA file path and the output file path"
    exit 1
fi

fasta=$1
output_tbl=$2
output_dir=$(dirname "$output_tbl")

mkdir -p "$output_dir"

python run_hmmer.py "$fasta" "$output_tbl"

if [ ! -f "$output_tbl" ]; then
    echo "HMMER result file not generated, please check run_hmmer.py"
    exit 1
fi

# Use Rscript
Rscript plot_protein_features.R

# Check if the plots were generated
for pdf in hmmer_score_vs_evalue.pdf hmmer_top_hits.pdf hmmer_significance.pdf; do
    if [ ! -f "$pdf" ]; then
        echo "Warning: The plot $pdf was not generated!"
    fi
done

echo "Analysis completed."

