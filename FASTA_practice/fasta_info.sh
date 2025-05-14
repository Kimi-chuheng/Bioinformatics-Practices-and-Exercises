#!/bin/bash
# fasta_info.sh - A simple FASTA file analysis script

if [ $# -eq 0 ]; then
    echo "Usage: $0 <fasta file>"
    exit 1
fi

echo "Analyzing file: $1"
echo "Number of sequences: $(grep -c ">" $1)"
echo "Total base count: $(grep -v ">" $1 | tr -d '\n' | wc -c)"

