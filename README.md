# Bioinformatics Tools Suite

This repository contains a comprehensive suite of bioinformatics tools and scripts for genomic data analysis, sequence alignment, and protein structure prediction. The tools are designed to work with standard bioinformatics file formats such as FASTA and provide various functionalities for both nucleotide and protein sequence analysis.For each task, there is a readme file for further details.

## Table of Contents

- [Getting Started](#getting-started)
- [GC Content Analysis](#gc-content-analysis)
- [BLAST Analysis](#blast-analysis)
- [HHblits Setup and Protein Alignment](#hhblits-setup-and-protein-alignment)
- [Multiple Sequence Alignment Tool Comparison](#multiple-sequence-alignment-tool-comparison)
- [HMMER Analysis](#hmmer-analysis)
- [HMMER Protein Sequence Visualization](#hmmer-protein-sequence-visualization)
- [CASP14 Target Analysis](#casp14-target-analysis)
- [MSA Quality Assessment and Visualization](#msa-quality-assessment-and-visualization)
- [Future Work](#future-work)
- [Dependencies](#dependencies)
- [License](#license)

## Getting Started

To use these tools, clone this repository and ensure you have the necessary dependencies installed. Most tools require a Linux/Unix environment with Bash and common bioinformatics software.

```bash
git clone https://github.com/username/bioinformatics-tools.git
cd bioinformatics-tools
```

## GC Content Analysis

Scripts for analyzing GC content and other basic statistics in genomic FASTA files.

### Features

- Calculate GC content in FASTA files
- Extract specific sequences by ID
- Generate summary statistics for multiple files
- Report sequence count and total base count

### Usage

```bash
# Calculate GC content for a single FASTA file
./gc_content.sh <fasta_file>

# Process all .fna files in a directory
./batch_gc.sh <directory>

# Generate a summary of GC content for all files
./batch_gc_summary.sh <directory>

# Get basic statistics about a FASTA file
./fasta_info.sh <fasta_file>

# Extract a specific sequence by ID
./extract_sequence.sh <fasta_file> <sequence_id>
```

## BLAST Analysis

Tools for setting up and using BLAST+ for sequence alignment against nucleotide databases.

### Features

- Download and install BLAST+
- Create searchable nucleotide databases
- Run BLAST searches with custom parameters
- Parse and interpret alignment results

### Usage

```bash
# Create a BLAST database from a FASTA file
makeblastdb -in <fasta_file> -dbtype nucl -out <output_database>

# Run a BLAST search
./run_blast.sh <query_fasta> <database_path>
```

## HHblits Setup and Protein Alignment

Tools for setting up HHblits and performing protein sequence alignments using hidden Markov models.

### Features

- HH-suite installation and configuration
- UniRef30 database setup
- Protein sequence alignment using HHblits
- Output in A3M format for further analysis

### Usage

```bash
# Run HHblits alignment
hhblits -i <query_fasta> -d <uniclust_db_path> -oa3m <output_file> -n 3
```

## Multiple Sequence Alignment Tool Comparison

A comparative analysis of popular MSA tools: MUSCLE, ClustalW, and MAFFT.

### Features

- Installation scripts for all three tools
- Comparison of alignment accuracy and performance
- Analysis of alignment characteristics
- Wrapper script to compare results

### Usage

```bash
# Compare all three alignment tools on the same input
./compare_alignments.sh <input_fasta>
```

## HMMER Analysis

Tools for domain identification using HMMER and the Pfam database.

### Features

- HMMER installation and configuration
- Pfam database setup
- Protein sequence scanning for domain identification
- Result parsing and extraction of top domains

### Usage

```bash
# Scan a protein sequence against Pfam domains
./hmmer_pipeline.sh <query_sequence_fasta>
```

## HMMER Protein Sequence Visualization

Scripts for visualizing HMMER results using R.

### Features

- Python script to run hmmscan
- R script for parsing and visualizing results
- Automated workflow through a Bash script

### Usage

```bash
# Run the full workflow
./analyze_protein.sh <input_fasta> <output_tbl_path>
```

### Output

- `hmmer_score_vs_evalue.pdf`: HMMER score vs E-value (log scale)
- `hmmer_top_hits.pdf`: Top 10 hits by score
- `hmmer_significance.pdf`: Significance plot (-log10(E-value))

## CASP14 Target Analysis

Tools for analyzing protein targets from the CASP14 dataset.

### Features

- Download and prepare CASP14 sequences
- Automated conversion of FASTA to A3M format
- Generation of detailed analysis reports
- Prediction confidence assessment

### Usage

```bash
# Download CASP14 sequences
mkdir -p casp14/whole_file
cd casp14/whole_file
wget "https://predictioncenter.org/download_area/CASP14/sequences/casp14.seq.txt" -O "casp14.fa"

# Split the file into individual FASTA files
awk '/^>/{f="targets/" substr($0,2) ".fasta"} {print > f}' casp14_dedup.fa

# Run the Makefile to process all sequences
make

# Analyze a specific alignment
./analyze_alignment.sh <a3m_file> <fasta_file>
```

## MSA Quality Assessment and Visualization

Tools to assess and visualize the quality of multiple sequence alignments.

### Features

- MSA quality assessment metrics
- Interactive visualization of results
- Analysis of sequence diversity and conservation

### Usage

```bash
# Assess MSA quality
./assess_msa.sh <path_to_a3m_file>

# Visualize the results
./visualize_results.sh
```

### Output

- MSA statistics in the `msa_stats/` directory
- Interactive visualization in `reports/conservation_vs_seqcount_interactive.html`

## Future Work

This project is currently exploring the next steps in structural bioinformatics, specifically the use of AlphaFold3 for structure prediction from the generated A3M files. Due to current storage limitations on our computing infrastructure, we are waiting for alternative solutions to implement this phase of the project. The A3M files generated from our MSA pipeline are ready for structure prediction once the computational resources become available.

## Dependencies

- **Basic Tools**: Bash, wget, grep, sed, awk
- **BLAST+**: For sequence alignment
- **HH-suite**: For HHblits
- **MUSCLE, ClustalW, MAFFT**: For multiple sequence alignment
- **HMMER**: For protein domain analysis
- **Pfam Database**: For domain identification
- **R with ggplot2, dplyr, viridis**: For visualization
- **Python 3 with pandas, plotly**: For interactive visualization

## License

This project is licensed under the MIT License - see the LICENSE file for details.
