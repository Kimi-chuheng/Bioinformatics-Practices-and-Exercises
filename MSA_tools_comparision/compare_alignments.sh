#!/bin/bash
# compare_alignments.sh - Perform multiple sequence alignments using different tools

input=$1
base=$(basename "$input" .fasta)

# Run different alignment tools
muscle -in $input -out ${base}_muscle.aln
clustalw2 -infile=$input -outfile=${base}_clustalw.aln -output=clustal
mafft $input > ${base}_mafft.aln

# Compare alignment lengths
echo "Alignment length comparison:"
for aln in ${base}_*.aln; do
    echo -n "$aln: "
    grep -v "^>" $aln | tr -d ' \n' | wc -c
done
