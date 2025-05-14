#!/bin/bash
# extract_sequence.sh - Extract FASTA sequence by ID

fasta_file=$1
seq_id=$2
in_target=0
found_sequence=0

while IFS= read -r line; do
    if [[ $line == ">"* ]]; then
        if [[ $line == *"$seq_id"* ]]; then
            in_target=1
            found_sequence=1  
            echo "$line"
        else
            in_target=0
        fi
    elif [[ $in_target -eq 1 ]]; then
        echo "$line"
    fi
done < "$fasta_file"

if [[ $found_sequence -eq 0 ]]; then
    echo "Sequence not found: $seq_id"
fi

