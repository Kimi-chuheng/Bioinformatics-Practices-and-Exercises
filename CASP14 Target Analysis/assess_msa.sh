#!/bin/bash
# assess_msa.sh - Assess the quality of multiple sequence alignment and output to the msa_stats folder

# Check input arguments
if [ -z "$1" ]; then
    echo "Usage: $0 <path to a3m file>"
    exit 1
fi

a3m_file="$1"
out_dir="msa_stats"
mkdir -p "$out_dir"

# Get output file name
base_name=$(basename "$a3m_file" .a3m)
output="${out_dir}/${base_name}_stats.txt"

# Perform statistics and write to output file
python3 - <<EOF > "$output"
import sys
from collections import Counter

with open("$a3m_file") as f:
    lines = f.readlines()

seqs = []
for line in lines:
    if not line.startswith(">"):
        seqs.append(line.strip())

positions = list(zip(*seqs))
diversities = []

for pos in positions:
    counter = Counter(pos)
    diversity = len([aa for aa, count in counter.items() if aa != '-'])
    diversities.append(diversity)

print(f"Number of sequences: {len(seqs)}")
print(f"Alignment length: {len(diversities)}")
print(f"Average diversity: {sum(diversities)/len(diversities):.2f}")
print(f"Number of conserved positions: {len([d for d in diversities if d == 1])}")
EOF

echo "MSA quality assessment completed: $output"

