#!/bin/bash

#gc_content.sh-Analyze the G-C in FASTA files

if [ $# -eq 0 ]; then
	echo "Use like this: $0 <fasta file>"
	exit 1
fi
grep -o "[GC]" $1 | wc -l
