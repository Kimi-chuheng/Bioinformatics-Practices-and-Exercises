# HMMER Protein Sequence Alignment and Visualization

This practice performs protein sequence alignment using **HMMER** and visualizes the results using **R**. It includes:
- A Python script to run `hmmscan`
- An R script to parse and visualize the alignment results
- A Bash script to automate the entire process



##  Directory Structure

```plaintext
bioinfo_tools_stage2/
├── hmmer_pipeline/
│   └── query_hmmer.fasta             # Input protein sequence in FASTA format
├── pfam_db/
│   └── Pfam-A.hmm                    # HMMER database (Pfam-A)
├── hmmer_visualization/
│   ├── run_hmmer.py                  # Python script to run hmmscan
│   ├── plot_protein_features.R       # R script to visualize the output
│   ├── analyze_protein.sh            # Bash script for full pipeline
│   └── hmmer_results.tbl             # Output from HMMER
```

## How to Run

You can execute the full workflow with a single command:

```bash
./analyze_protein.sh <input_fasta> <output_tbl_path>
```

Example:

```bash
./analyze_protein.sh ~/Bio_learning/bioinfo_tools_stage2/hmmer_pipeline/query_hmmer.fasta ~/Bio_learning/bioinfo_tools_stage2/analysis_scripts/hmmer_results.tbl
```

## Script Breakdown

### run_hmmer.py

Runs hmmscan against the Pfam database:

```bash
python run_hmmer.py <input_fasta> <output_tbl>
```

Requires: hmmscan, Pfam-A HMM database

### plot_protein_features.R

Parses and visualizes HMMER results using ggplot2:
- Reads the .tbl output
- Cleans and structures the data
- Generates three plots:
  - hmmer_score_vs_evalue.pdf – Score vs E-value
  - hmmer_top_hits.pdf – Top scoring hits
  - hmmer_significance.pdf – -log10(E-value)

### analyze_protein.sh

A wrapper to run the Python and R scripts:

```bash
#!/bin/bash
# Usage: analyze_protein.sh <fasta> <output_tbl>
```
- Verifies inputs
- Runs HMMER
- Checks output file
- Launches R visualization
- Verifies PDFs are generated

## Output Files

After successful execution, the following PDF files are generated:
- hmmer_score_vs_evalue.pdf: HMMER score vs E-value (log scale)
- hmmer_top_hits.pdf: Top 10 hits by score
- hmmer_significance.pdf: Significance plot (-log10(E-value))

All plots are saved in the current working directory.

From the generated figures, we can draw the following conclusions:

- The top 3 hits are I-set, Ig_3, and ig, as shown in the bar plots.

- There is a negative correlation between score and E-value, i.e., higher scores correspond to lower (more significant) E-values.

- This supports the reliability of the HMMER alignment results, where higher scoring matches are typically more biologically relevant.

## Dependencies

Ensure the following tools are available in your environment:
- hmmscan (from HMMER)
- R with ggplot2, dplyr, and viridis installed
- Python 3

## Notes

- The Pfam database path is hardcoded in run_hmmer.py. Adjust if needed.
- You may need to run chmod +x analyze_protein.sh to make the Bash script executable.
