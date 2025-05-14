#!/bin/bash
# compare_alignments.sh - 使用不同工具进行多序列比对

input=$1
base=$(basename "$input" .fasta)

# 运行不同的比对工具
muscle -in $input -out ${base}_muscle.aln
clustalw2 -infile=$input -outfile=${base}_clustalw.aln -output=clustal
mafft $input > ${base}_mafft.aln

# 计算比对结果的差异
echo "比对长度对比："
for aln in ${base}_*.aln; do
    echo -n "$aln: "
    grep -v "^>" $aln | tr -d ' \n' | wc -c
done
