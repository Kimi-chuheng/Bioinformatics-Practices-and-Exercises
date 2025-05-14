#!/bin/bash

# batch_gc_summary.sh - Summarize GC content of multiple FASTA files

if [ $# -eq 0 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

output_file="gc_summary.txt"

# Clear the file if it already exists
> "$output_file"

for file in "$1"/*.fna; do
    echo "Processing: $file"

    gc_count=$(grep -o "[GC]" "$file" | wc -l)

    echo "$(basename "$file"): $gc_count" >> "$output_file"
done

echo "Results have been saved to $output_file"

