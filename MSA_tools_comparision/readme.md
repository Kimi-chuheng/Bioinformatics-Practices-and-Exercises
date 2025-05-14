# Multiple Sequence Alignment Tool Comparison

## Note
This task focuses on comparing three popular multiple sequence alignment (MSA) tools — **MUSCLE**, **ClustalW**, and **MAFFT** — in terms of algorithm type, accuracy, runtime, and alignment characteristics. This is a practical evaluation task without shell script exercises.

## Overview

This comparison highlights how each tool handles the same input dataset and evaluates their differences in alignment behavior and performance. HHblits is included as a reference for HMM-based methods but is not directly compared here.

| Feature             | HHblits              | MUSCLE                      | ClustalW                     | MAFFT                        |
|---------------------|----------------------|-----------------------------|------------------------------|------------------------------|
| Algorithm Type      | HMM-based (iterative)| Progressive alignment       | Progressive alignment        | Progressive alignment        |
| Purpose             | Remote homolog search| Global alignment (small/medium datasets)| Global alignment (small/medium datasets) | Global alignment (small/medium datasets) |
| Use Case            | Large-scale protein homology search (e.g. UniRef) | Phylogenetic or comparative analysis | Sequence comparison          | Large dataset alignment      |
| Input Type          | Protein or HMM       | Protein or nucleic acid     | Protein or nucleic acid      | Protein or nucleic acid      |
| Output              | HHR files            | .aln alignment              | .aln alignment               | .aln alignment               |
| Alignment Accuracy  | High (distant homology) | High for small datasets  | High for small datasets      | High for small datasets      |
| Alignment Strategy  | Iterative HMM search | Stepwise progressive        | Stepwise progressive         | Stepwise progressive         |
| Data Scale Suitability | Large datasets    | Tens to hundreds of sequences | Tens to hundreds of sequences | Tens to hundreds of sequences |
| Resource Demand     | High                 | Moderate                    | Moderate                     | Moderate                     |
| Speed               | Slower               | Fast                        | Fast                         | Fast                         |
| Strength            | Distant homolog detection | Fast and stable        | Well-established, robust     | Fast and efficient           |
| Limitation          | Less efficient on small data | Less effective on large data | Less efficient on large data | Less efficient on large data |


## Installation Instructions

### MUSCLE

```bash
cd tools_comparison/muscle
wget https://drive5.com/muscle/downloads3.8.31/muscle3.8.31_i86linux64.tar.gz
tar -xzvf muscle3.8.31_i86linux64.tar.gz
chmod +x muscle3.8.31_i86linux64
ln -sf muscle3.8.31_i86linux64 muscle
```

### ClustalW

```bash
cd ../clustalw
wget http://www.clustal.org/download/current/clustalw-2.1.tar.gz
tar -xzvf clustalw-2.1.tar.gz
cd clustalw-2.1
./configure --prefix=$HOME/Bio_learning/bioinfo_tools_stage2/tools_comparison/clustalw
make
make install
```

### MAFFT

```bash
cd ../../mafft
wget https://mafft.cbrc.jp/alignment/software/mafft-7.490-without-extensions-src.tgz
tar -xzvf mafft-7.490-without-extensions-src.tgz
cd mafft-7.490-without-extensions/core
sed -i "s|PREFIX = /usr/local|PREFIX = $HOME/Bio_learning/bioinfo_tools_stage2/tools_comparison/mafft|" Makefile
make
make install
```

## Execution

Run all three tools on the same input FASTA file using the wrapper script:

```bash
./compare_alignments.sh input.fasta
```

## Results Summary

| File | Alignment Length |
|------|------------------|
| input_clustalw.aln | 216 |
| input_mafft.aln | 132 |
| input_muscle.aln | 132 |

## Analysis

* **MAFFT and MUSCLE** produced consistent alignments of **132 characters**, indicating conservative gap insertions and similar alignment behavior.
* **ClustalW** produced a longer alignment (**216 characters**), reflecting more gap insertions and a looser alignment strategy.

## Conclusion

This task demonstrated practical installation, usage, and result comparison of popular MSA tools. While ClustalW tends to be more gap-tolerant, MAFFT and MUSCLE are more consistent and conservative in their alignments. Selection of tools should consider the dataset size and required alignment sensitivity.

## Requirements

* Linux operating system
* Basic command-line knowledge
* GCC compiler and related build tools
* Sufficient disk space for tool installation
