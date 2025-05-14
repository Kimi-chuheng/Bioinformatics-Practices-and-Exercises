# GC Content Analysis of FASTA Files

This project provides a suite of Bash scripts for basic bioinformatics analysis of genomic FASTA files. The main functionalities include **GC content calculation**, **sequence information extraction**, and **sequence count statistics**.

## 📁 Directory Structure

```
FASTA_practice/
├── GCF_009858895.2_genomic.fna  # Example FASTA file
├── gc_summary.txt               # Summary of GC content for multiple files
├── batch_gc.sh                  # Processes all .fna files in a directory to calculate GC content
├── batch_gc_summary.sh          # Summarizes GC counts for all files into gc_summary.txt
├── gc_content.sh                # Calculates GC content for a single FASTA file
├── fasta_info.sh                # Reports sequence count and total base count
├── extract_sequence.sh          # Extracts specific sequences by ID
```

## 🧪 Script Descriptions

### gc_content.sh
Counts the total number of G and C bases in a single FASTA file.

```bash
Usage: ./gc_content.sh <fasta_file>
```

### batch_gc.sh
Processes all `.fna` files in a specified directory and outputs their GC content statistics.

```bash
Usage: ./batch_gc.sh <directory>
```

### batch_gc_summary.sh
Generates a summary file (`gc_summary.txt`) containing GC base counts for each `.fna` file in the directory.

```bash
Usage: ./batch_gc_summary.sh <directory>
```

### fasta_info.sh
Provides basic statistics about a FASTA file: number of sequences and total base count.

```bash
Usage: ./fasta_info.sh <fasta_file>
```

### extract_sequence.sh
Extracts sequences from a FASTA file based on sequence ID matching.

```bash
Usage: ./extract_sequence.sh <fasta_file> <sequence_id>
```

## 🧬 Sample Output

Example output from `batch_gc_summary.sh`:

```
Processing: GCF_009858895.2_genomic.fna
GCF_009858895.2_genomic.fna: 4567382
```

## ✅ Project Features

* Shell scripting for bioinformatics pipeline development
* Text processing using common Unix tools (`grep`, `wc`, `tr`)
* Batch processing of multiple genomic files
* FASTA format parsing and content analysis
* Foundation for more advanced genomic data workflows

## 🔧 Requirements

* Bash shell environment
* Standard Unix text processing tools
* Input files in standard FASTA format
